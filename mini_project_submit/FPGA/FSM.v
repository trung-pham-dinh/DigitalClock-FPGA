module FSM(clk50,clock,K0,K1,K2,K3, trans ,dis_s,dis_m,dis_h ,c1s,c0s, c1m,c0m, c1h,c0h,reset,state7);
	input K0,K1,K2,K3, trans, reset,clock,clk50;
	output reg dis_s,dis_m,dis_h ,c1s, c1m, c1h,c0s,c0m,c0h;
	output [6:0]state7;
	
	
	 reg [3:0] fstate;
    reg [3:0] reg_state;
	 reg [1:0]trig;
	 reg chan_s,chan_m,chan_h;
	 
    parameter idle=0,sec_set=1,min_set=2,hour_set=3;
	 
	 
	 led7_decoder A(1,fstate,state7);
	
	always @(posedge clock)
    begin
        fstate <= reg_state;
    end
	 
	 always @(fstate or reset or trans)
    begin
        if (~reset) begin
            reg_state <= idle;
				
				dis_s <= 0;
				dis_m <= 0;
				dis_h <= 0;
        end
		  else	begin
				case (fstate)
				idle		:	begin
					dis_s <= 0;
					dis_m <= 0;
					dis_h <= 0;
					if(trans)
						reg_state <= sec_set;
					else if(~trans)
						reg_state <= idle;
					else
						reg_state <= idle;
				end
				
				sec_set	:	begin
					dis_s <= 1;
					dis_m <= 0;
					dis_h <= 0;
					if(trans)
						reg_state <= min_set;
					else if(~trans)
						reg_state <= sec_set;
					else
						reg_state <= sec_set;
				end
				
				min_set	:begin
					dis_s <= 0;
					dis_m <= 1;
					dis_h <= 0;
					if(trans)
						reg_state <= hour_set;
					else if(~trans)
						reg_state <= min_set;
					else
						reg_state <= min_set;
				end
				
				hour_set	:	begin
					dis_s <= 0;
					dis_m <= 0;
					dis_h <= 1;
					if(trans)
						reg_state <= idle;
					else if(~trans)
						reg_state <= hour_set;
					else
						reg_state <= hour_set;
				end
				
				default: begin
               dis_s <= 0;
					dis_m <= 0;
					dis_h <= 0;
					reg_state <= idle;
            end
				
				endcase
		  end
	 end
	 
	
	
	always @ (posedge clk50, negedge reset)
	begin
		if(~reset) 
			begin
				trig <= 0; // there are 4 stage to trigger completely the in/decrease 
				//stage 0: set the indicate in/decrease signal and flag chan base on KEY pushing from FPGA
				// second,minute,hour module know to in/deduce base on pushing signal
					c1s<=1; // pushing signal for second
					c1m<=1; // pushing signal for minute
					c1h<=1; // pushing signal for hour
					c0s<=0; // indicate in/decrease for second
					c0m<=0; // indicate in/decrease for minute
					c0h<=0; // indicate in/decrease for hour
					chan_s<=0; // flag to mark that second need to change
					chan_m<=0; // flag to mark that minute need to change
					chan_h<=0; // flag to mark that hour need to change
			end
		else if(~K0 && ~trig)
			begin
				c0s <= 1; // indicate increase
				trig <= 1;
				chan_s<=1;
			end
		
		//********
		else if(~K1 && ~trig)
			begin
				c0m <= 1; // indicate increase
				trig <= 1;
				chan_m<=1;
			end
		
		
		//***********
		else if(~K2 && ~trig)
			begin
				c0h <= 1; // indicate increase
				trig <= 1;
				chan_h<=1;
			end
		
			
		//************
		else if(~K3 && ~trig)
			begin
				c0s <= 0; // indicate decrease
				c0m <= 0; // indicate decrease
				c0h <= 0; // indicate decrease
				trig <= 1;
				chan_s<=1;
				chan_m<=1;
				chan_h<=1;
			end
		
		
		else if(K1 && K0 && K2 && K3)
			begin
				if(trig==1) // stage 1: set low the pusing signal
					begin
						trig <= 2;
						if(chan_s && chan_m && chan_h)
							begin
								c1s<=0; // indicate pusing
								c1m<=0;
								c1h<=0;
							end
						else if(chan_s)
							c1s<=0; // indicate pushing
						else if(chan_m)
							c1m <= 0; // indicate pushing
						else if(chan_h)
							c1h <= 0; // indicate pushing
						
					end
				else if(trig==2) // stage 2: set high the pushing signal
					begin
						trig <= 3;
						c1s<=1;
						c1m<=1;
						c1h<=1;
					end
				else if(trig==3) // stage 3: set low the pushing signal and reset others
					begin
						c0s<=0;
						c0m<=0;
						c0h<=0;
						trig<=0;
						chan_s<=0;
						chan_m<=0;
						chan_h<=0;
					end
			end
		
	end
	
	
	 
endmodule 
module t_second(clk50,control0,control1,equal60,led2,led1,reset,disable_clk,count_dis);
	input clk50,reset,disable_clk;
	input control0,control1;
	output reg equal60;
	reg [5:0]count;
	output reg [5:0]count_dis;
	output [6:0]led2,led1;
	//reg [5:0]count_dis;
	integer count50;
	
	wire [3:0]out1,out2;
	reg enable;
	
	
	
	always @(posedge clk50, negedge reset)
	begin
		if(~reset)
			begin
				count <= 0;
				equal60 <= 0;
				count50 <= 0;
				enable <= 0;
			end
		else if(~control1 && ~enable)
			begin
				enable <= 1;
				if(control0)
					begin
						count <=  count + 1;
						if(count>=60) count <= 0;
					end
				else
					begin
						count <= count - 1;
						if(count==0) count <= 59;
					end
			end
		else if(control1 && enable)
			begin
				enable <= 0;
			end
		else if(~disable_clk)
			begin
							if(count50 > 49 ) // set 49 for simu 
					begin
						count50 <= 0;
						if(count == 59)
							begin
								equal60 <= 1;
								count <= count +1;
							end
						else if(count == 60)
								count <= 1;
						else
							begin
								equal60 <= 0;
								count <= count + 1;
							end
					end
				else count50 <= count50 + 1;
				
			end
	end
	
	always@(count)
	begin
		if(count == 60)
			count_dis <= 0;
		else
			count_dis <= count;
	end
	
	
	
	separate A(count_dis,out1,out2);
	led7_decoder B(1,out1,led1);
	led7_decoder C(1,out2,led2);
endmodule 


module hour(clk50,equal60,control0,control1,led2,led1,reset,disable_hour);
	input reset,clk50,disable_hour;
	input control0,control1;
	input equal60;
	//reg [5:0]count_dis;
	output [6:0]led2,led1;
	reg [5:0]count;
	reg enable,enable1;
	
	wire [3:0]out1,out2;
	
	always @(posedge clk50, negedge reset)
	begin
		if(~reset) 
			begin
				count <= 23;
				enable <= 0;
				enable1 <= 0;
			end
			
		else if(~control1 && ~enable1)
			begin
				enable1 <= 1;
				if(control0)
					begin
						count <=  count + 1;
						if(count>=23) count <= 0;
					end
				else
					begin
						count <= count - 1;
						if(count==0) count <= 23;
					end
			end
			
		else if(control1 && enable1)
			begin
				enable1 <= 0;
			end
			
		else if(equal60 && ~enable && ~disable_hour)
			begin
				enable <= 1;
				if(count == 23)
					count <= 0;
				else if(count<23)
					count <= count + 1;
			end
		else if(~equal60 && enable)
			begin
				enable = 0;
			end
	end 
	
	

	separate A(count,out1,out2);
	led7_decoder B(1,out1,led1);
	led7_decoder C(1,out2,led2);
endmodule  // final complete for FPGA

/*
module hour(clk50,equal60,control0,control1,led2,led1,reset,disable_hour,count);
	input reset,clk50,disable_hour;
	input control0,control1;
	input equal60;
	//reg [5:0]count_dis;
	output [6:0]led2,led1;
	output reg [5:0]count;
	reg enable,enable1;
	
	wire [3:0]out1,out2;
	
	always @(posedge clk50, negedge reset)
	begin
		if(~reset) 
			begin
				count <= 23;
				enable <= 0;
				enable1 <= 0;
			end
			
		else if(~control1 && ~enable1)
			begin
				enable1 <= 1;
				if(control0)
					begin
						count <=  count + 1;
						if(count>=23) count <= 0;
					end
				else
					begin
						count <= count - 1;
						if(count==0) count <= 23;
					end
			end
			
		else if(control1 && enable1)
			begin
				enable1 <= 0;
			end
			
		else if(equal60 && ~enable && ~disable_hour)
			begin
				enable <= 1;
				if(count == 23)
					count <= 0;
				else if(count<23)
					count <= count + 1;
			end
		else if(~equal60 && enable)
			begin
				enable = 0;
			end
	end 
	
	

	separate A(count,out1,out2);
	led7_decoder B(1,out1,led1);
	led7_decoder C(1,out2,led2);
endmodule  */ // for testbench

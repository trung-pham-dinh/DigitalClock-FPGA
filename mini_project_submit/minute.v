

module minute(clk50,control0,control1,equal60_min,led2,led1,reset,equal60,disable_min);
	input reset,clk50,disable_min;
	input control1,control0;
	input equal60;
	output reg equal60_min;
	reg [5:0]count;
	reg [5:0]count_dis;
	output [6:0]led2,led1;
	reg enable,enable1;
	wire [3:0]out1,out2;
	
	always @(posedge clk50, negedge reset)
	begin
		if(~reset) 
			begin
				count <= 59;
				equal60_min <= 0;
				enable <= 0;
				enable1 <= 0;
			end
			
		else if(~control1 && ~enable1)
			begin
				enable1 <= 1;
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
			
		else if(control1 && enable1)
			begin
				enable1 <= 0;
			end
			
		else if(equal60 && ~enable && ~disable_min)
			begin
				enable <= 1;
				if(count == 59)
					begin
						equal60_min <= 1;
						count <= count +1;
					end
				else if(count == 60)
						count <= 1;
				else
					begin
						//equal60_min <= 0;
						count <= count + 1;
					end
			end
		else if(~equal60 && enable)
			begin
				equal60_min <= 0;
				enable = 0;
			end
		
	end
	
	always @(count)
	begin
		if(count == 60)
			count_dis <= 0;
		else
			count_dis <= count;
	end
	
	

	separate A(count_dis,out1,out2);
	led7_decoder B(1,out1,led1);
	led7_decoder C(1,out2,led2);
endmodule   // final complete for FPGA

/*
module minute(clk50,control0,control1,equal60_min,led2,led1,reset,equal60,disable_min,count_dis);
	input reset,clk50,disable_min;
	input control1,control0;
	input equal60;
	output reg equal60_min;
	reg [5:0]count;
	output reg [5:0]count_dis;
	output [6:0]led2,led1;
	reg enable,enable1;
	wire [3:0]out1,out2;
	
	always @(posedge clk50, negedge reset)
	begin
		if(~reset) 
			begin
				count <= 59;
				equal60_min <= 0;
				enable <= 0;
				enable1 <= 0;
			end
			
		else if(~control1 && ~enable1)
			begin
				enable1 <= 1;
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
			
		else if(control1 && enable1)
			begin
				enable1 <= 0;
			end
			
		else if(equal60 && ~enable && ~disable_min)
			begin
				enable <= 1;
				if(count == 59)
					begin
						equal60_min <= 1;
						count <= count +1;
					end
				else if(count == 60)
						count <= 1;
				else
					begin
						//equal60_min <= 0;
						count <= count + 1;
					end
			end
		else if(~equal60 && enable)
			begin
				equal60_min <= 0;
				enable = 0;
			end
		
	end
	
	always @(count)
	begin
		if(count == 60)
			count_dis <= 0;
		else
			count_dis <= count;
	end
	
	

	separate A(count_dis,out1,out2);
	led7_decoder B(1,out1,led1);
	led7_decoder C(1,out2,led2);
endmodule */  // for testbench

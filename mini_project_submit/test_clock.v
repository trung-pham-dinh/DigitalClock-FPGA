module test_clock();
	reg reset,CLOCK_50,clk1,K0,K1,K2,K3,trans;
	wire [6:0]HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
	wire [5:0]count_dis_s,count_dis_m,count_dis_h;
	wire [6:0]state7;
	wire c1s,c0s,c1m,c0m,c1h,c0h;
	//reg c0s,c1s,c0m,c1m,c0h,c1h;
	wire equal60_min,equal60;
	integer i;
	
	
	//combine UUT(CLOCK_50,disable_s,disable_min,disable_hour,c0s,c1s,c0m,c1m,c0h,c1h,reset,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,count_dis_s,count_dis_m,count);
	combine UUT(CLOCK_50,clk1,   K0,K1,K2,K3,trans,reset,  HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,  count_dis_s,count_dis_m,count_dis_h, state7, c1s,c0s,c1m,c0m,c1h,c0h,equal60_min,equal60);
	
	always #1 CLOCK_50 = ~CLOCK_50;
	always #50 clk1 = ~clk1;
	initial
	begin
		// initialize everything
		CLOCK_50 = 0;
		clk1 = 0;
		K0 = 1;
		K1 = 1;
		K2 = 1;
		K3 = 1;
		trans = 0;
		reset = 1;
		
		
		// reset everything
		#5;
		reset = 0;
		#5;
		reset = 1;
		#20;
		
	
		
		// testing set up second
		trans = 1;
		#150;
		trans = 0;
		#150;
		K0 = 0;
		#15;
		K0 = 1;
		#600;
		trans = 1;
		#250;
		trans = 0;
		
		#1000;
		// testing set up minute
		trans = 1;
		#200;
		trans = 0;
		#150;
		K1 = 0;
		#15;
		K1 = 1;
		#600;
		trans = 1;
		#250;
		trans = 0;
		
		#1000;
		// testing set up hour
		trans = 1;
		#300;
		trans = 0;
		#150;
		K2 = 0;
		#15;
		K2 = 1;
		#600;
		trans = 1;
		#100;
		trans = 0;
		
		#1000;
		//testing KEY3
		K3 = 0;
		#15;
		K3 = 1;
		
		
		
		
	end

	initial
	begin
		// testing K3, deduce all three value
	
		
		#7600;
		K3 = 0;
		#15;
		K3 = 1;
		
		// testing the set up minute mode. In this mode, minute stops counting
		trans = 1;
		#200;
		trans = 0;
		
		#5985;
		// testing the set up hour mode. In this mode, hour stops counting
		trans = 1;
		#100;
		trans = 0;
		
		#6100;
		// back to normal mode
		trans = 1;
		#100;
		trans = 0;
		
		#15;
		for(i=0; i<60; i=i+1) // push KEY1 to set the minute to 59 for testing hour
		begin
			#5;
			K1 = 0;
			#5;
			K1 = 1;
		end
		
		
		
			
	end
	
endmodule 
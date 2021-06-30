

module interface(SW,KEY,HEX0,HEX1,LEDR,CLOCK_50,HEX3,HEX2,HEX4,HEX5,HEX7);
	input [17:0]SW;
	input [3:0]KEY;
	input CLOCK_50;
	output [17:0]HEX0,HEX1,LEDR,HEX3,HEX2,HEX4,HEX5,HEX7;
	
	wire equal60,equal60_min,dis_s,dis_m,dis_h ,c1s,c0s, c1m,c0m, c1h,c0h;
	
	assign LEDR[0] = clock;
	assign LEDR[1] = equal60;
	assign LEDR[2] = equal60_min;
	
	second A(CLOCK_50, c0s    ,c1s     ,equal60,HEX1[6:0],HEX0[6:0], SW[0],dis_s);
	//          clk50,control0,control1,equal60,led2     ,led1     ,reset ,disable_clk
	
	minute B(CLOCK_50,c0m     ,c1m     ,equal60_min,HEX3[6:0],HEX2[6:0],SW[0],equal60,dis_m);
	//          clk50,control0,control1,equal60_min,led2     ,led1     ,reset,equal60,disable_min
	hour C(CLOCK_50  ,equal60_min,c0h     ,c1h     ,HEX5[6:0],HEX4[6:0],SW[0],dis_h);
	//          clk50,equal60    ,control0,control1,led2     ,led1     ,reset,disable_hour
	FSM D(CLOCK_50,clock,KEY[0],KEY[1],KEY[2],KEY[3], SW[9] ,dis_s,dis_m,dis_h ,c1s,c0s, c1m,c0m, c1h,c0h,SW[0],HEX7[6:0]);
	//       clk50,clock,K0    ,K1    ,K2    ,K3    , trans ,dis_s,dis_m,dis_h ,c1s,c0s, c1m,c0m, c1h,c0h,reset,led7 state
	
	clock_div E(CLOCK_50, 1, 1, clock);
endmodule


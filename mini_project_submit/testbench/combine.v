module combine(CLOCK_50,clk1,   K0,K1,K2,K3,trans,reset,  HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,  count_dis_s,count_dis_m,count, state7,  c1s,c0s,c1m,c0m,c1h,c0h,equal60_min,equal60);
	input CLOCK_50,clk1,K0,K1,K2,K3, trans,reset;
	//input c0s,c1s,c0m,c1m,c0h,c1h;
	output [6:0]HEX1,HEX0,HEX2,HEX3,HEX4,HEX5; 
	output [5:0]count_dis_s,count_dis_m,count;
	output [6:0]state7;
	output c1s,c0s,c1m,c0m,c1h,c0h;
	//wire equal60_min,equal60;
	output equal60_min,equal60;

	t_second A(CLOCK_50, c0s    ,c1s     ,equal60    ,HEX1[6:0],HEX0[6:0], reset,dis_s,count_dis_s);
	//          clk50,control0,control1,equal60,led2     ,led1     ,reset ,disable_clk
	
	t_minute B(CLOCK_50,c0m     ,c1m     ,equal60_min,HEX3[6:0],HEX2[6:0], reset,equal60,dis_m,count_dis_m);
	
	t_hour C(CLOCK_50    ,equal60_min,c0h,c1h,HEX5[6:0],HEX4[6:0],reset,dis_h,count);
	
	FSM D(CLOCK_50,clk1,K0,K1,K2,K3, trans ,dis_s,dis_m,dis_h ,c1s,c0s, c1m,c0m, c1h,c0h,reset,state7);
endmodule 
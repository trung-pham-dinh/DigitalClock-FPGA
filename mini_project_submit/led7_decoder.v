module led7_decoder(enable, bcd_in, out_7seg); // anode
	output [6:0]out_7seg;
	input enable;
	input [3:0]bcd_in;
	
	assign out_7seg[0] = ~((~bcd_in[2]&~bcd_in[0]) | (bcd_in[2]&bcd_in[0]) | bcd_in[3] | bcd_in[1]) | ~enable;
	assign out_7seg[1] = ~(~bcd_in[2] | (~bcd_in[1]&~bcd_in[0]) | (bcd_in[1]&bcd_in[0])) | ~enable;
	assign out_7seg[2] = ~(~bcd_in[1] | bcd_in[2] | bcd_in[0]) | ~enable;
	assign out_7seg[3] = ~((~bcd_in[2]&~bcd_in[0]) | bcd_in[3] | (bcd_in[2]&~bcd_in[1]&bcd_in[0]) | (bcd_in[1]&~bcd_in[0]) | (~bcd_in[2]&bcd_in[1])) | ~enable;
	assign out_7seg[4] = ~((~bcd_in[2]&~bcd_in[0]) | (bcd_in[1]&~bcd_in[0])) | ~enable;
	assign out_7seg[5] = ~(bcd_in[3] | bcd_in[2]&~bcd_in[0] | bcd_in[2]&~bcd_in[1] | ~bcd_in[1]&~bcd_in[0]) | ~enable;
	assign out_7seg[6] = ~(bcd_in[3] | bcd_in[2]&~bcd_in[1] | ~bcd_in[2]&bcd_in[1] | bcd_in[1]&~bcd_in[0]) | ~enable;
endmodule	
module clock_div(clk, reset, hz_in, hz_out);
	output reg hz_out;
	input [3:0]hz_in;
	input clk,reset;
	integer count;
	
	//assign hz_out = (count > 50000000/hz_in + 1)? 1:0;
	
	always @(posedge clk, negedge reset)
	begin
		if(~reset) begin hz_out = 0 ; count<=0; end
		else
			begin
				if(count > 50000000/(hz_in*2)-1) begin count <= 0; hz_out <= ~hz_out; end
				else count <= count +1;
			end
	end
endmodule 
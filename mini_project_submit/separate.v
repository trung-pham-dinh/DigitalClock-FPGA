module separate(in, out1, out2);
	input [5:0]in;
	output reg [3:0]out1,out2;
	always @ (in)
	begin 
		if(in<=9)
			{out2,out1} = in;
		else if(in<=19)
			{out2,out1} = in+ 6;
		else if(in<=29)
			begin
				out2 = 2;
				out1 = in - 20;
			end
		else if(in<=39)
			begin
				out2 = 3;
				out1 = in-30;
			end
		else if(in<=49)
			begin
				out2 = 4;
				out1 = in-40;
			end
		else if(in<=59)
			begin
				out2 = 5;
				out1 = in-50;
			end
		else if(in<=69)
			begin
				out2 = 6;
				out1 = in-60;
			end
			
	end
endmodule 




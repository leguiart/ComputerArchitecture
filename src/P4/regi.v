module regi(entrada, hab, edo_sig);
	input[3:0] entrada;
	input hab;
	output[3:0] edo_sig;
	reg[3:0] rsalida;
	
	always @(entrada,hab)
	begin
		case(hab)
			1'b0 : rsalida = entrada;
			1'b1 : rsalida = 4'bzzzz;
		endcase
	end
	
	assign edo_sig = rsalida;
endmodule

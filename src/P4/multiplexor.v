module multiplexor(x,y,z,interrupcion,prueba, qseleccionada);
	input x;
	input y;
	input z;
	input interrupcion;
	input[2:0] prueba;
	output qseleccionada;
	reg temporal;
	
	always@(qseleccionada)
	begin
		case(prueba)
			3'b000:
				temporal = x;
			3'b001:
				temporal = y;
			3'b010:
				temporal = z;
			3'b011:
				temporal = interrupcion;
			3'b100:
				temporal = 0; //Qauxiliar
		endcase
	end
	
	assign qseleccionada=temporal;
endmodule  
module logica(vf, qseleccionada, cc);
	input vf;
	input qseleccionada;
	output cc;
	reg temporal;
	
	always@(qseleccionada)
	begin
		temporal = qseleccionada^vf;
	end
	
	assign cc = temporal;
	
endmodule 
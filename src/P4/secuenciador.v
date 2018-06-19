module secuenciador(reloj, reset, cc, microinstruccion, liga, vect, vmap, pl, map_hab, vect_hab, estado_presente);
	input reloj;
	input reset;
	input cc;
	input[1:0] microinstruccion;
	input[3:0] liga;
	input[3:0] vect;
	input[3:0] vmap;
	output pl;
	output map_hab;
	output vect_hab;
	output[3:0] estado_presente;
	reg[3:0] temporal, temporal2;
	reg[0:0] pltemp, maptemp, vecttemp;
	
	always@(posedge reloj)
	begin
		if(reset)
			temporal = 0;
		else if(!reset)
		begin
			temporal2 = estado_presente+1;
			case(microinstruccion)
				2'b00: //Paso continuo
				begin
					temporal=temporal2;
					pltemp = 1;
					maptemp = 1;
					vecttemp = 1;
				end
				2'b01: 
					if(!cc)
					begin
						temporal=liga; //Salto condicional
						pltemp = 1'b0;
						maptemp = 1'b1;
						vecttemp = 1'b1;
					end
					else
					begin
						temporal=temporal2; //Paso continuo
						pltemp = 1'b1;
						maptemp = 1'b1;
						vecttemp = 1'b1;
					end
				2'b10:
				begin
					temporal=vmap; //Salto de transformacion
					pltemp = 1'b1;
					maptemp = 1'b0;
					vecttemp = 1'b1;
				end
				2'b11:
					if(!cc) //Salto por interrupcion
					begin
						temporal=vect;
						pltemp = 1'b1;
						maptemp = 1'b1;
						vecttemp = 1'b0;
					end
					else
					begin
						temporal=temporal2; //Paso continuo
						pltemp = 1'b1;
						maptemp = 1'b1;
						vecttemp = 1'b1;
					end
			endcase;
		end
		else
			temporal=estado_presente;
	end
	
	assign estado_presente=temporal;
	assign pl = pltemp;
	assign map_hab = maptemp;
	assign vect_hab = vecttemp;
endmodule 
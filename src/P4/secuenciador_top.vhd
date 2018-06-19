--Top Entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity secuenciador_top is
    Port ( clkl, x, y, z, interrupcion, reset : in STD_LOGIC;
           reg_int, reg_trans : in STD_LOGIC_VECTOR(3 downto 0);
           salida : out  STD_LOGIC_VECTOR(3 downto 0);
           salida_deco : out STD_LOGIC_VECTOR(6 downto 0));
end secuenciador_top;

architecture arqsecuenciador_top of secuenciador_top is
component regi 
	port(entrada : in STD_LOGIC_VECTOR(3 downto 0);
		hab : in STD_LOGIC;
		edo_sig : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component secuenciador
	port(reloj, reset, cc : in STD_LOGIC;
		microinstruccion : in STD_LOGIC_VECTOR(1 downto 0);
		liga, vect, vmap : in STD_LOGIC_VECTOR(3 downto 0);
	    pl, map_hab, vect_hab : out STD_LOGIC;
		estado_presente : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component logica 
	port(vf, qseleccionada : in STD_LOGIC;
		 cc : out STD_LOGIC);
end component;

component multiplexor 
	port(x, y, z, interrupcion : in STD_LOGIC;
		prueba : in STD_LOGIC_VECTOR(2 downto 0);
		qseleccionada : out STD_LOGIC);
end component;

signal cpresente, sentrada, svect, smap, spl, sliga: STD_LOGIC_VECTOR(3 downto 0); --señales de 4 bits
signal sprueba : STD_LOGIC_VECTOR(2 downto 0);--señales de 3 bits
signal smicroinstruccion : STD_LOGIC_VECTOR(1 downto 0);--señales de 2 bits
signal cdivisor, svect_hab, smap_hab, spl_hab, svf, sqseleccionada, scc  : STD_LOGIC;--señales de 1 bit
begin
u1: entity work.relojlento(arqrelojlento) port map(clkl, cdivisor);
u2: entity work.memoria(arqmemoria) port map(cpresente,prueba=>sprueba, vf=>svf, microinstruccion=>smicroinstruccion, liga=>sliga, salida=>salida);
u3: entity work.deco(arqdeco) port map(cpresente, salida_deco);
u4: regi port map(reg_int, svect_hab, edo_sig=>svect);
u5: regi port map(reg_trans, smap_hab, edo_sig=>smap);
u6: regi port map(sliga, spl_hab, edo_sig=>spl);
u7: multiplexor port map(x, y, z, interrupcion, sprueba, sqseleccionada);
u8: logica port map(svf, sqseleccionada, cc=>scc);
u9: secuenciador port map(cdivisor, reset, scc, smicroinstruccion, spl, svect, smap, spl_hab, smap_hab, svect_hab,cpresente);


end arqsecuenciador_top;
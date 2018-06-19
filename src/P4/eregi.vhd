library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity eregi is
end eregi;

architecture arqregi of eregi is
	component regi 
	port(entrada in STD_LOGIC_VECTOR(3 downto 0);
		hab in STD_LOGIC;
		edo_sig out STD_LOGIC_VECTOR(3 downto 0));
	end component;
signal sentrada, sedo_sig STD_LOGIC_VECTOR(3 downto 0);
signal shab STD_LOGIC;
begin
	u1: regi port map(entrada=>sentrada, hab=>shab, edo_sig=>sedo_sig);
end arqregi;
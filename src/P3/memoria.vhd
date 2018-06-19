library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria is
	Port(estado_presente : in std_logic_vector(3 downto 0);
			prueba : out std_logic_vector(2 downto 0);
			vf : out std_logic;
		microinstruccion : out std_logic_vector(1 downto 0);
			liga : out std_logic_vector(3 downto 0);
			salida : out std_logic_vector(3 downto 0));
end memoria;

architecture arqmemoria of memoria is
signal int : std_logic_vector(13 downto 0);
begin
	process(estado_presente)
	begin
		case estado_presente is
				when "0000" => int <= "--------000110";
				when "0001" => int <= "01010011011000";
				when "0010" => int <= "00100000010100";
				when "0011" => int <= "----0111110001";
				when "0100" => int <= "01111000010011";
				when "0101" => int <= "00010101010000";
				when "0110" => int <= "--------100010";
				when "0111" => int <= "10110100011001";
				when "1000" => int <= "--------000001";
				when "1001" => int <= "----0111111100";
				when "1010" => int <= "01110001010000";
				when "1011" => int <= "----0111111010";
				when "1100" => int <= "0000----010000";
				when "1101" => int <= "0000----010000";
				when "1110" => int <= "0000----010000";
				when "1111" => int <= "0000----010000";
				when others => int <= "00000000000000";
		end case;
		liga <= int(13 downto 10);
		prueba <= int(9 downto 7);
		vf <= int(6);
		microinstruccion <= int(5 downto 4);
		salida <= int(3 downto 0);
	end process;
end arqmemoria;	

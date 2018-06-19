--Top Entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity memoria_top is
    Port ( edo_presente : in  STD_LOGIC_VECTOR(3 downto 0);
           prueba : out std_logic_vector(2 downto 0);
			vf : out std_logic;
			microinstruccion : out std_logic_vector(1 downto 0);
			liga : out std_logic_vector(3 downto 0);
           salida : out  STD_LOGIC_vector(3 downto 0);
           salida_deco : out STD_LOGIC_VECTOR(6 downto 0));
end memoria_top;

architecture arqmemoria_top of memoria_top is
begin
u3: entity work.deco(arqdeco) port map(edo_presente, salida_deco);
u4: entity work.memoria(arqmemoria) port map(edo_presente,prueba, vf, microinstruccion, liga, salida);

end arqmemoria_top;

library ieee;
use ieee.std_logic_1164.all;

entity pract1 is
	port(
		a: in std_logic_vector(1 downto 0);
		b, c: out std_logic
		);
end entity pract1;

architecture arqpract of pract1 is
begin
	with a select
		b <= '1' when "00",
			 '0' when "01",
			 '0' when "10",
			 '1' when "11";
			 
	with a select
		c <= '0' when "00",
			 '1' when "01",
			 '1' when "10",
			 '0' when "11";
end architecture arqpract;
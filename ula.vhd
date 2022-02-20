-- ULA
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.std_logic_unsigned.all;

entity ula is port(
	clk: in std_logic;
	operacao: in std_logic_vector(2 downto 0);
	y: in std_logic_vector(7 downto 0);
	x: in std_logic_vector(7 downto 0);
	saida: out std_logic_vector(7 downto 0)
);
end ula;

architecture comportamento of ula is
begin
	ula_process: process(clk)
	begin
		if clk='1' then
			-- x + y
			case operacao is 
				when "001" =>
					saida<=x+y;
				when "010" =>
					saida<=x and y;
				when "011" => 
					saida<= x or y;
				when "100" =>
					saida<= not x;
				when "101" => 
					saida<= y;
				when others =>
			end case;
		end if;
	end process;
end comportamento;
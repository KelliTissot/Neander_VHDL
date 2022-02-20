-- REGISTRADOR
library IEEE;
use IEEE.std_logic_1164.all;

entity registrador is
	port(
		carga: in std_logic;
		entrada: in std_logic_vector(7 downto 0);
		saida: out std_logic_vector(7 downto 0)
	);
end registrador;

architecture reg of registrador is
begin
	process(carga)
	begin
		if carga = '1' then
			saida <= entrada;
		end if;
	end process;
end reg;
	

library IEEE;
use IEEE.std_logic_1164.all;

entity inc_para is port(
	entrada: in std_logic_vector(3 downto 0);
	para: in std_logic;
	saida: out std_logic_vector(3 downto 0)
);
end inc_para;

architecture comportamento of inc_para is 
begin
	inc_para_process: process(entrada)
	begin 
		if para = '0' then 
			saida <= entrada;
		end if;
	end process;
end comportamento;
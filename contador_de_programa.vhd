library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; --logica de soma
USE ieee.numeric_std.ALL; 

entity contador_de_programa is port(
	incrementa: in std_logic;											-- carrega os dados do barramento			
	zera: in std_logic;													-- entrada de reset
	saida: out std_logic_vector(3 downto 0)
);	-- saida de dados
end contador_de_programa;										--fim da declaraçao da entidade

architecture pc of contador_de_programa is
begin
	counter_process: process(incrementa, zera)
	variable saida_var: std_logic_vector(3 downto 0);
	begin
		if(zera = '1') then
			saida_var:= "0000";
		elsif(incrementa'event and incrementa = '1') then
			if(saida_var>=15) then 
				saida_var:= "0000";
			else 
				saida_var:=saida_var + 1;
			end if;
		end if;
	saida<=saida_var;
end process;
end pc;
-- MEMORIA
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;


entity memoria is port(
	clk: in std_logic;
	endereco: in std_logic_vector(3 downto 0);
	saida: out std_logic_vector(15 downto 0)
);
end memoria;

architecture memoria_arquitecture of memoria is
	type memoria_type is array (0 to 15) of std_logic_vector(15 downto 0);
	signal memoria_state: memoria_type := (
		"0000000000000000",
		"0000010100000010",
		"0000000100000101",
		"0000000100001000",
		"0000001000000101",
		"0000010000000000",
		"0000001000001111",
		"0000001100000100",
		"0000010110101010",
		"0000000101000100",
		"0000000000000000",
		"0000000000000000",
		"0000011000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000"
	);
	signal endereco_signal: std_logic_vector(3 downto 0);
begin 
	mem_process: process(clk)
	begin 
		if clk='1' then
			saida <= memoria_state(to_integer(unsigned(endereco)));
		end if;
	end process;
end memoria_arquitecture;
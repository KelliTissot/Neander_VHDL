-- DECOD E CONTROL

library IEEE;
use IEEE.std_logic_1164.all;

entity controle is port(
	clk: in std_logic;
	reset: in std_logic;
	entrada: in std_logic_vector(7 downto 0);
	incrementa: out std_logic;
	zera: out std_logic;
	para: out std_logic;
	carga: out std_logic;
	selecao_op: out std_logic_vector(2 downto 0)
);
end controle;

architecture comportamento of controle is
	type clk_estado is (AGUARDA_MEM, SEL_OP, CARREGA_REG, INC, HALT, RESETA);
	signal clk_atual: clk_estado := AGUARDA_MEM;
	signal clk_prox: clk_estado := AGUARDA_MEM;
	
begin
	clk_process: process(clk, reset)
	begin
		if reset='1' then
			clk_atual <= RESETA;
		elsif (clk'event and clk='1') then
			case entrada is
				when "00000000" =>
					clk_atual <= INC;
				when "00000001" | "00000010" | "00000011" | "00000100" | "00000101" => 
					clk_atual <= clk_prox;
				when "00000110" =>
					clk_atual <= HALT;	
				when others => 
					clk_atual <= INC;
			end case;
		end if;
	end process;
	
	estado_process: process(clk_atual)
	begin
		case clk_atual is
			when AGUARDA_MEM => 
				incrementa <= '0';
				zera <= '0';
				para <= '0';
				carga <= '0';
				selecao_op <= "000";
				clk_prox <= SEL_OP;
			when SEL_OP =>
				selecao_op <= entrada(2 downto 0);
				incrementa <= '0';
				zera <= '0';
				para <= '0';
				carga <= '0';
				clk_prox <= CARREGA_REG;
			when CARREGA_REG => 
				incrementa <= '0';
				zera <= '0';
				para <= '0';
				carga <= '1';
				selecao_op <= entrada(2 downto 0);
				clk_prox <= INC;
			when INC =>
				incrementa <= '1';
				zera <= '0';
				para <= '0';
				carga <= '0';
				selecao_op <= "000";
				clk_prox <= AGUARDA_MEM;
			when HALT =>
				incrementa <= '0';
				zera <= '0';
				para <= '1';
				carga <= '0';
				selecao_op <= "000";
				clk_prox <= HALT;
			when RESETA =>
				incrementa <= '0';
				zera <= '1';
				para <= '0';
				carga <= '0';
				selecao_op <= "000";
				clk_prox <= AGUARDA_MEM;
		end case;		
	end process;		
end comportamento;
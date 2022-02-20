-- NEANDER 

library IEEE;
use IEEE.std_logic_1164.all;

entity main is port(
	clk: in std_logic;
	reset: in std_logic;
	regOut: out std_logic_vector(7 downto 0)
);
end main;

architecture comportamento of main is
	signal s_clk: std_logic;
	signal s_reset: std_logic;
	signal s_incrementa: std_logic;
	signal s_zera: std_logic;
	signal s_saida_pc: std_logic_vector(3 downto 0);
	
	signal s_mem_out: std_logic_vector(15 downto 0);
	signal s_y: std_logic_vector(7 downto 0);
	signal s_control: std_logic_vector(7 downto 0);
	
	
	signal s_saida_ula: std_logic_vector(7 downto 0);
	signal s_x: std_logic_vector(7 downto 0);
	
	signal s_para: std_logic;
	signal s_carga: std_logic;
	signal s_sel_op: std_logic_vector(2 downto 0);
	signal s_endereco: std_logic_vector(3 downto 0);
	
begin
-- entradas e saidas neander
	s_clk <= clk;
	s_reset <= reset;
	regOut <= s_x;

-- separa sinais da saida da memoria
	s_y <= s_mem_out(7 downto 0);
	s_control <= s_mem_out(15 downto 8);
	
	contador_de_programa1: work.contador_de_programa port map(
		incrementa => s_incrementa,			
		zera => s_zera,
		saida => s_saida_pc
	);
	inc_para1: work.inc_para port map(
		entrada => s_saida_pc,
		para => s_para,
		saida => s_endereco
	);
	memoria1: work.memoria port map(
		clk => s_clk,
		endereco => s_endereco,
		saida => s_mem_out
	);
	ula1: work.ula port map(
		clk => s_clk,
		operacao => s_sel_op,
		y => s_y,
		x => s_x,
		saida => s_saida_ula
	);
	registrador1: work.registrador port map(
		carga => s_carga,
		entrada => s_saida_ula,
		saida => s_x
	);
	controle1: work.controle port map(
		clk => s_clk,
		reset => s_reset,
		entrada => s_control,
		incrementa => s_incrementa, 
		zera => s_zera,
		para => s_para,
		carga => s_carga,
		selecao_op => s_sel_op
	);
	
end comportamento;
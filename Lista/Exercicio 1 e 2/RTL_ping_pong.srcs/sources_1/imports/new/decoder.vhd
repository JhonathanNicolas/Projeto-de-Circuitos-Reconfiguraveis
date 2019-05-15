-- Decoder 7-segments---------------
-- Autor: Jhonathan Nicolas  Matrícula: 160031621
-- Data: 20/04/2019

--Esse código descreve um decoder para um display de 7 segmentos 
-- cuja as duas entradas são os placares dos jogadores ultilizando
-- with select

--Biblioteca padrão
library IEEE;
--Biblioteca para recursos lógicos
use IEEE.STD_LOGIC_1164.ALL;
--entidade do decoder
entity display_7_segmentos is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0); -- entrada para placar do jogador 1
           sw2 : in STD_LOGIC_VECTOR (3 downto 0); -- entrada para placar do jogador 2
           an : out STD_LOGIC_VECTOR (3 downto 0); -- Anodos para mudar os estados on/off dos displays
           clk : in STD_LOGIC;-- Entrada para o clock
           reset : in STD_LOGIC;-- Reset do circuito
           seg : out STD_LOGIC_VECTOR (6 downto 0)-- Saída de dados para os displays
           );
end display_7_segmentos;

--Inicio da Arquitetura
architecture Behavioral of display_7_segmentos is


signal s_score : STD_LOGIC_VECTOR (3 downto 0); -- Sinal para multiplexar os leds
signal s_an : STD_LOGIC_VECTOR (3 downto 0); -- sinal para multiplexar os anodos

begin

-- Estrutura apara multiplexar os dados "score" entre as duas entradas conforme o estado  clock
	with clk select s_score <=  
		sw1 when '1', 
		sw2 when '0',
		"XXXX" when others; 
-- Estrutura para multiplexar os anodos conforme o estado do clock
    with clk select an <=  
		"0111" when '0',
		"1110" when '1',
        "XXXX" when others; 
-- Estrutura para codficar os dados em binario para 7 segmentos em formato hexadecinmal
    with s_score select	seg <=
        "1000000" when "0000", --0
        "1111001" when "0001", --1
        "0100100" when "0010", --2
        "0110000" when "0011", --3
        "0011001" when "0100", --4
        "0010010" when "0101", --5
        "0000010" when "0110", --6
	    "1111000" when "0111", --7
	    "0000000" when "1000", --8
	    "0010000" when "1001", --9
	    "0001000" when "1010", --A
	    "0000011" when "1011", --B
	    "1000110" when "1100", --C
	    "0100001" when "1101", --D
	    "0000110" when "1110", --E
	    "0001110" when "1111", --F
	    "1111111" when others; -- Boa pratrica de descricao de hardware
end Behavioral; -- fim da arquitetura

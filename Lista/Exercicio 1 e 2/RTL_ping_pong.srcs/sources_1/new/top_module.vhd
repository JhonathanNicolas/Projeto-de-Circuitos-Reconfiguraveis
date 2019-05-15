-- Ping pong Leds FSM---------------
-- Autor: Jhonathan Nicolas  Matrícula: 160031621
-- Data: 20/04/2019

-- Esse codigo é o top level/modulo que integra todos os componentes para a descrição do circuito
-- que realiza a lógica do jogo ping pong conforme as regras estabelecidas.

--Biblioteca padrao
library IEEE;
--Pacote para recursos logicos
use IEEE.STD_LOGIC_1164.ALL;
--Pacote para recursos aritmeticos
use IEEE.NUMERIC_STD.ALL;

--entidade do top_module
entity top_module is
    Port ( entA : in STD_LOGIC; -- "raquete" do jogador 1 / mapeada no sw(0) da placa
           entB : in STD_LOGIC;--  "raquete" do jogador 2 / mapeada no sw(15) da placa
           clk : in STD_LOGIC;-- clock 
           reset : in STD_LOGIC;-- reset do circuito
           led : out STD_LOGIC_VECTOR (15 downto 0); -- saida dos leds
           seg : out STD_LOGIC_VECTOR (6 downto 0);-- saida para o display de 7-segmentos
           an : out STD_LOGIC_VECTOR (3 downto 0));-- saida para o controle dos displays
end top_module;

--inicio da aquitetura
architecture Behavioral of top_module is

-----Components-------------------------------------------------------------------------

--divisor de clock---
component clk_div
generic (
  freq : integer
);
port (
  clk     : in  STD_LOGIC;
  reset   : in  STD_LOGIC;
  clk_out : out STD_LOGIC
);
end component clk_div;

--Decoder--
component display_7_segmentos
port (
  sw1   : in  STD_LOGIC_VECTOR (3 downto 0);
  sw2   : in  STD_LOGIC_VECTOR (3 downto 0);
  an    : out STD_LOGIC_VECTOR (3 downto 0);
  clk   : in  STD_LOGIC;
  reset : in  STD_LOGIC;
  seg   : out STD_LOGIC_VECTOR (6 downto 0)
);
end component display_7_segmentos;

--Score_controller/FSM--
component score_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           entA : in STD_LOGIC;
           entB : in STD_LOGIC;
           score1 : out STD_LOGIC_VECTOR (3 downto 0);
           score2 : out STD_LOGIC_VECTOR (3 downto 0);
           reg : out  UNSIGNED (15 downto 0));
end component;
-------------------------------------------------------------------------------------------------------

----signals--------------------------------------------------------------------------------------------
signal sw1   : STD_LOGIC_VECTOR (3 downto 0); -- sinal do placar do jogador 1
signal sw2   : STD_LOGIC_VECTOR (3 downto 0);-- sinal do placar do jogador 2
signal reg_out   : UNSIGNED (15 downto 0);-- sinal dos leds
signal clk_100hz   : STD_LOGIC ; -- sinal para o clock de 100hz/decoders

--- constants-------------------------------------------------------------------------------------------
constant f1hz  : integer := 50000000;
constant f10hz : integer := 5000000;
constant f100hz : integer := 500000;
constant f1khz : integer  := 50000;
constant f10khz : integer  := 5000;
constant f100khz : integer  := 500;
constant f1000khz : integer  := 50;
constant f1mhz : integer  := 5;
---------------------------------------------------------------------------

begin
--Instancia do decoder-----------
display_7_segmentos_0 : display_7_segmentos
port map (
  sw1   => sw1,
  sw2   => sw2,
  an    => an,
  clk   => clk_100hz,
  reset => reset,
  seg   => seg
);

--Instancia do divisor de clock-----------
clk_div100HZ : clk_div
generic map (
  freq => f100hz
)
port map (
  clk     => clk,
  reset   => reset,
  clk_out => clk_100hz
);

--Instancia da FSM-----------
score_controller_i : score_controller
port map (
  clk    => clk,
  reset  => reset,
  entA   => entA,
  entB   => entB,
  score1 => sw1,
  score2 => sw2,
  reg    => reg_out
);

led <= std_logic_vector(reg_out); -- saida led recebe o valor do sinal reg_out



end Behavioral;--fim da arquitetura


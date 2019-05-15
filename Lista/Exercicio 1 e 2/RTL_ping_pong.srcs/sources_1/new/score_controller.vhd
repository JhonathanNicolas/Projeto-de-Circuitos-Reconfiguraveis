-- Score_controller---------------
-- Autor: Jhonathan Nicolas  Matrícula: 160031621
-- Data: 20/04/2019

-- Esse codigo controla por meio de Maquinas de estado finitas Mealy o placar dos jogadores
-- alem das saidas dos leds que e reponsavel pelo dinamismo do jogo

--Biblioteca padrao
library IEEE;
--Pacote para recursos logicos
use IEEE.STD_LOGIC_1164.ALL;
--Pacote para recursos aritmeticos
use IEEE.NUMERIC_STD.ALL;

--entidade do score_controller
entity score_controller is
    Port ( clk : in STD_LOGIC; -- entrada do clock
           reset : in STD_LOGIC; --reset do circuito
           entA : in STD_LOGIC; -- "raquete" do jogador 1 mapeada em um switch
           entB : in STD_LOGIC;-- "raquete" do jogador 2 mapeada em um switch
           score1 : out STD_LOGIC_VECTOR (3 downto 0); -- "Placar" do jogador 1 
           score2 : out STD_LOGIC_VECTOR (3 downto 0);-- "Placar" do jogador 2
           reg : out  UNSIGNED (15 downto 0)); -- saida representando o dinamismo da "bola" mapeada nos leds
end score_controller;

-- inicio da arquitetura
architecture Behavioral of score_controller is

-- Tipos de dados da FSM------------------------------------------------------------------------
type state_score is (win1, win2, playing1, playing2, start1, start2,RES);
-- Win1 = Estado para acionar a logica quando o jogador 1 ganhar
-- Win2 = Estado para acionar a logica quando o jogador 2 ganhar
-- playing1 = Estado para acionar a logica quando o jogador 1 estiver resposavel por rebater a bola
-- playing2 = Estado para acionar a logica quando o jogador 2 estiver resposavel por rebater a bola
-- start1 = Estado para acionar a logica quando o jogador 1 for responsavel por fazer o saque
-- start2 = Estado para acionar a logica quando o jogador 2 for responsavel por fazer o saque
-- RES =  Estado de reset
------------------------------------------------------------------------------------------------

-- Componentes------------------------------------------------------------------------------------

--Divisor de clock
component clk_div
    generic (freq : integer -- Frequencia generica para o divisor
        );
Port ( clk : in STD_LOGIC; -- entrada do clock de 100mhz
       reset : in STD_LOGIC; -- reset do circuito
       clk_out : out STD_LOGIC -- saida do clock dividido
      );
end component;
---------------------------------------------------------------------------------------------------

-----Signals--------------------------------------------------------------------------------------
signal score_state_current : state_score := start1; -- Estado atual da FSM
signal score_state_next : state_score := start1; -- Proximo estado da FSM
signal clk_10hz : STD_LOGIC := '0'; -- Sinal da saida do component divisor de clock para 10hz
signal s_score1 : UNSIGNED (3 downto 0) := (others => '0'); -- Sinal para o placa do jogador 1
signal s_score2 : UNSIGNED (3 downto 0) := (others => '0');-- Sinal para o placa do jogador 2
signal s_reg : UNSIGNED (15 downto 0) := (others => '0'); -- Sinal para a saida nos leds
--------------------------------------------------------------------------------------------------

--Constantes-------------------------------------------------------------------------------------
constant f1hz  : integer := 50000000;
constant f10hz : integer := 5000000;
constant f100hz : integer := 500000;
------------------------------------------------------------------------------------------------

begin

-- Process para controlar a FSM e as saídas(troca de estados)
FSM_score: process(clk_10hz, reset)
begin
    if(reset = '1') then
        score_state_next <= start1;
        s_score1 <= (others => '0');
        s_score2 <= (others => '0');
        s_reg <= "0000000000000001";
    elsif(rising_edge(clk_10hz))then
        case score_state_current is
            when start1 =>
                s_reg <= "0000000000000001";
                if(entA = '1') then
                    score_state_next <= playing1;
                else
                    score_state_next <= start1;
                end if;
            when start2 => 
                s_reg <= "1000000000000000";
                if(entB = '1') then
                    score_state_next <= playing2;
                else
                    score_state_next <= start2;   
                end if;          
            when playing1 =>
               if (( (s_reg(14) = '1') AND (entB = '1') ) OR ((s_reg(15) = '1') AND (entB = '0'))) then
                    score_state_next <= win1;
                elsif((entB = '1') AND (s_reg(15) = '1')) then
                    score_state_next <= playing2;
                else
                    s_reg <= s_reg sll 1;     
                end if;           
            when playing2 =>
               if (( (s_reg(1) = '1') AND (entA = '1') ) OR ((s_reg(0) = '1') AND (entA = '0'))) then
                    score_state_next <= win2;
               elsif((entA = '1') AND (s_reg(0) = '1')) then
                    score_state_next <= playing1;
               else
                    s_reg <= s_reg srl 1;
               end if;
            when win1 =>
                s_score1 <= s_score1 + 1;
                score_state_next <= start1;
                s_reg <= "1000000000000000";
            when win2 =>
                s_score2 <= s_score2 + 1;
                score_state_next <= start2;
                s_reg <= "0000000000000001";
            when others =>
                NULL; 
        end case FSM_score;
    end if;
end process;

--Processo para atualizar a maquina de estados
FSM_refersh: process(clk, reset)
begin
    if(reset = '1') then
        score_state_current <= start1;
    elsif(rising_edge(clk)) then
        score_state_current <= score_state_next;
    end if;
end process FSM_refersh;

--Istanciacao do divisor de clock
clk_div10HZ : clk_div
generic map (
  freq => f10hz
)
port map (
  clk     => clk,
  reset   => reset,
  clk_out => clk_10hz
);


reg <= s_reg; -- a saida recebe o valor do sinal s_reg
score1 <= std_logic_vector(s_score1); -- a saida score1 recebe o valor do sinal s_score1
score2 <= std_logic_vector(s_score2);-- a saida score2 recebe o valor do sinal s_score2

end Behavioral; -- fim da arquitetura

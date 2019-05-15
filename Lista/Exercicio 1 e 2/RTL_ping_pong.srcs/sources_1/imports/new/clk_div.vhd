-- Clock Divider---------------
-- Autor: Jhonathan Nicolas  Matrícula: 160031621
-- Data: 20/04/2019

--Esse código descreve um divisor de clock baseando se um clock master de 100Mhz
-- A frequência e generica em tempo de sintese sendo informada pelo paramentro "freq"

--Biblioteca padrao
library IEEE;
--Pacote para recursos logicos
use IEEE.STD_LOGIC_1164.ALL;
--Pacote para recursos aritmeticos
use IEEE.numeric_std.all;
--entidade do divisor de clock
entity clk_div is
    generic (freq : integer -- Frequencia generica para o divisor
            );
    Port ( clk : in STD_LOGIC; -- entrada do clock de 100mhz
           reset : in STD_LOGIC; -- reset do circuito
           clk_out : out STD_LOGIC -- saida do clock dividido
          );
end clk_div;

--inicio da arquitetura
architecture Behavioral of clk_div is

--signals---------
signal count : integer := 0; -- sinal para o contador
signal s_clk_out : std_logic := '0'; -- sinal para atribuição a saída

begin
-- process para realizar a logica do contador e a inversao de estado conforme a frequencia 
-- definida no parametro de configuracao
clk_div: process(clk, reset)
begin
    if(reset = '1') then -- reset assincrono
        s_clk_out <= '0';
    elsif(rising_edge(clk))then
        if(count = freq) then
            s_clk_out <= not(s_clk_out);
            count <= 0;
        else
            count <= count +1;
        end if;
    end if;
end process clk_div;

clk_out <= s_clk_out; -- atribui o valor do sinal para a saida

end Behavioral; -- fim da arquitetura

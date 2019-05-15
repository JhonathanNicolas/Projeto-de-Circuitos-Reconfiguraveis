--Bibliotecas padrão
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

--package com os tipos de dados
use work.fpupack.all;
use work.entities.all;

--Entidade
entity neoronio is
    Port ( clk : in STD_LOGIC; -- clock do sistema
           reset : in STD_LOGIC;-- resete
           up : in STD_LOGIC;-- botão para a multiplexação dos  sw
           load : in STD_LOGIC; -- foi inserido um botÃ£o load para facilitar a demontraÃ§Ã£o na placa
           down : in STD_LOGIC;--botão para a multiplexação dos leds
           num_i : in STD_LOGIC_VECTOR (15 downto 0);-- numeros de entradas
           num_o : out STD_LOGIC_VECTOR (15 downto 0));-- saidas para os leds
end neoronio;

architecture Behavioral of neoronio is

-- componentes-----------------------------------------------------------------

  component addsubfsm_v6
  port (
    reset      : in  std_logic;
    clk        : in  std_logic;
    op         : in  std_logic;
    op_a       : in  std_logic_vector(FP_WIDTH-1 downto 0);
    op_b       : in  std_logic_vector(FP_WIDTH-1 downto 0);
    start_i    : in  std_logic;
    addsub_out : out std_logic_vector(FP_WIDTH-1 downto 0);
    ready_as   : out std_logic
  );
  end component addsubfsm_v6;

  component multiplierfsm_v2
  port (
    reset     : in  std_logic;
    clk       : in  std_logic;
    op_a      : in  std_logic_vector(FP_WIDTH-1 downto 0);
    op_b      : in  std_logic_vector(FP_WIDTH-1 downto 0);
    start_i   : in  std_logic;
    mul_out   : out std_logic_vector(FP_WIDTH-1 downto 0);
    ready_mul : out std_logic
  );
  end component multiplierfsm_v2;


-- signals para os operadores--------------------------------
  signal op_a       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal s_x       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal x2       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal bx       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal ax2       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal ax2_bx       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal s_y       : std_logic_vector(FP_WIDTH-1 downto 0);
  signal op_b       : std_logic_vector(FP_WIDTH-1 downto 0);
--signals para os multiplicadores----------------------------
  signal start_0m    : std_logic;
  signal start_2m    : std_logic;
  signal ready_0m    : std_logic;
  signal ready_1m    : std_logic;
  signal ready_2m    : std_logic;
--signal para somadores-----------------------------------------
signal ready_0s    : std_logic;
signal ready_1s    : std_logic;
--------------------------------------------------------------
  signal addsub_out : std_logic_vector(FP_WIDTH-1 downto 0);
  signal ready_as   : std_logic;

--constants--------------------------------------------------
  constant A :std_logic_vector(FP_WIDTH-1 downto 0) := "011100000000000011000100100";--A = 16.003
  constant B :std_logic_vector(FP_WIDTH-1 downto 0) := "011100000010100011110101110";--B = 16.160
  constant C :std_logic_vector(FP_WIDTH-1 downto 0) := "011100000011010111000010100";--C = 16.210
-------------------------------------------------------------
begin

-- process para a multiplexação do up do sw
Multiplex_inputs: process (clk, reset)
begin
  if(reset = '1')then
    s_x <= (others => '0');
  elsif(rising_edge(clk))then
      if load = '1' then
        if up = '1' then
          s_x(26 downto 11) <= num_i;
          start_0m <= '0';
        else
          s_x(10 downto 0) <= num_i(15 downto 5);
           start_0m <= '1';
        end if;
      else
        start_0m <= '0';
      end if;
  end if;
end process;
-- process para a multiplexação do up do led
Multiplex_outputs: process (clk, reset)
begin
  if(reset = '1')then
      op_a <= (others => '0');
      op_b <= (others => '0');
  elsif(rising_edge(clk))then
    if down = '1' then
      num_o<= s_y(26 downto 11) ;
    else
      num_o(15 downto 5) <= s_y(10 downto 0) ;
    end if;
  end if;
end process;

--blocos aritiméticos-----------------------------
  addsubfsm_v6_ax2_bx : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '0',
    op_a       => ax2,
    op_b       => bx,
    start_i    => ready_2m,
    addsub_out => ax2_bx,
    ready_as   => ready_0s
  );
  addsubfsm_v6_ax2_bx_c : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '0',
    op_a       => ax2_bx,
    op_b       => C,
    start_i    => ready_0s,
    addsub_out => s_y,
    ready_as   => ready_1s
  );

  multiplierfsm_v2_x2 : multiplierfsm_v2
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => s_x,
    op_b      => s_x,
    start_i   => start_0m,
    mul_out   => x2,
    ready_mul => ready_0m
  );
  multiplierfsm_v2_bx : multiplierfsm_v2
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => s_x,
    op_b      => B,
    start_i   => start_0m,
    mul_out   => bx,
    ready_mul => ready_1m
  );
  multiplierfsm_v2_ax2 : multiplierfsm_v2
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => x2,
    op_b      => A,
    start_i   => ready_0m,
    mul_out   => ax2,
    ready_mul => ready_2m
  );


end Behavioral;

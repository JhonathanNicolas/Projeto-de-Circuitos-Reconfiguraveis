--!
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level is
    Port ( clk : in STD_LOGIC; -- clock do circuito
           reset : in STD_LOGIC; -- reset
           start : in STD_LOGIC;-- start para o inicio dos calculos
           sw : in STD_LOGIC;-- botão para multiplexar os leds entre o MSBs e os LSBs do sinal resultante
           adress: in STD_LOGIC_VECTOR(6 DOWNTO 0); -- enderecamento da ROM
           led : out STD_LOGIC_VECTOR(15 downto 0); -- Leds para mostrar o sinal Xfusao
           dp : out STD_LOGIC;-- flag para informar que os calculos estão prontos
           an : out STD_LOGIC -- para ligar o dp
           );
end top_level;

architecture Behavioral of top_level is

  COMPONENT ROMxir
    PORT (
      a : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      d : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
      clk : IN STD_LOGIC;
      we : IN STD_LOGIC;
      spo : OUT STD_LOGIC_VECTOR(26 DOWNTO 0)
    );
  END COMPONENT;
  COMPONENT ROMxul
    PORT (
      a : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      d : IN STD_LOGIC_VECTOR(26 DOWNTO 0);
      clk : IN STD_LOGIC;
      we : IN STD_LOGIC;
      spo : OUT STD_LOGIC_VECTOR(26 DOWNTO 0)
    );
  END COMPONENT;
  component fusao

  port (
    clk    : in  STD_LOGIC;
    reset  : in  STD_LOGIC;
    xir    : in  STD_LOGIC_VECTOR (26 downto 0);
    xul    : in  STD_LOGIC_VECTOR (26 downto 0);
    xfusao : out STD_LOGIC_VECTOR (26 downto 0);
    start  : in  STD_LOGIC;
    ready  : out STD_LOGIC
  );
  end component fusao;
 
SIGNAL  xir: STD_LOGIC_VECTOR(26 DOWNTO 0);
SIGNAL  xul : STD_LOGIC_VECTOR(26 DOWNTO 0);
SIGNAL  xfusao : STD_LOGIC_VECTOR(26 DOWNTO 0);

begin
an <= '1';
-- Lï¿½gica combinacional para mostrar os valores de xfusao nos leds
with sw select led <=
    xfusao(26 downto 11) when '0',
    (xfusao(10 downto 0) & "00000") when '1',
    (others => 'X') when others;

    fusao_i : fusao
    port map (
      clk    => clk,
      reset  => reset,
      xir    => xir,
      xul    => xul,
      xfusao => xfusao,
      start  => start,
      ready  => dp
    );



ROM_XIR: ROMxir
    PORT MAP (
      a => adress,
      d => (others => '0'),
      clk => clk,
      we => '0',
      spo => xir
    );
ROM_XUL : ROMxul
      PORT MAP (
        a => adress,
        d => (others => '0'),
        clk => clk,
        we => '0',
        spo => xul
      );






end Behavioral;

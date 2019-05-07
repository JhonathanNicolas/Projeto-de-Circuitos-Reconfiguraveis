library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

use work.fpupack.all;
use work.entities.all;



entity fusao is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           xir : in STD_LOGIC_VECTOR (26 downto 0);
           xul : in STD_LOGIC_VECTOR (26 downto 0);
           xfusao : out STD_LOGIC_VECTOR (26 downto 0);
           start : in STD_LOGIC;
           ready : out STD_LOGIC);
end fusao;

architecture Behavioral of fusao is


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

  component divNR
  port (
    reset     : in  std_logic;
    clk       : in  std_logic;
    op_a      : in  std_logic_vector(FP_WIDTH-1 downto 0);
    op_b      : in  std_logic_vector(FP_WIDTH-1 downto 0);
    start_i   : in  std_logic;
    div_out   : out std_logic_vector(FP_WIDTH-1 downto 0);
    ready_div : out std_logic
  );
  end component divNR;

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

signal GK :  STD_LOGIC_VECTOR (26 downto 0);
signal sigK_sigZ:  STD_LOGIC_VECTOR (26 downto 0);
signal GKsigK :  STD_LOGIC_VECTOR (26 downto 0);
signal sigK_GKsigK : STD_LOGIC_VECTOR (26 downto 0);
signal sigKp1 : STD_LOGIC_VECTOR (26 downto 0);
signal sigK : STD_LOGIC_VECTOR (26 downto 0);
signal xir_xul : STD_LOGIC_VECTOR (26 downto 0);
signal GKxir_xul : STD_LOGIC_VECTOR (26 downto 0);

signal ready_sum0: std_logic := '0';
signal ready_sum1: std_logic := '0';
signal ready_sum2: std_logic := '0';
signal ready_sum4: std_logic := '0';

signal ready_div0: std_logic := '0';
signal ready_mul0: std_logic := '0';
signal ready_mul1: std_logic := '0';

constant sigZ0 : STD_LOGIC_VECTOR (26 downto 0) := "001010000000000000000000000"; --sigZ = 0.75
constant sigK0 : STD_LOGIC_VECTOR (26 downto 0) := "000100000000000000000000000"; --sigK = 0.25

begin
inicial: process(clk,reset)
    variable inicial_v :  std_logic:= '1';
begin
  if(reset = '1')then
      sigK <= sigK0;
  elsif rising_edge(clk) then
      if inicial_v = '1' then
        sigK <= sigK0;
        inicial_v := '0';
      else
        sigK <= sigKp1;
      end if;
  end if;

end process;


  multiplierfsm_v2_0 : multiplierfsm_v2
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => GK,
    op_b      => xir_xul,
    start_i   => ready_sum0,
    mul_out   => GKxir_xul,
    ready_mul => ready_mul1
  );
  multiplierfsm_v2_1 : multiplierfsm_v2
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => GK,
    op_b      => sigK,
    start_i   => ready_div0,
    mul_out   => GKsigK,
    ready_mul => ready_mul1
  );
  divNR_0 : divNR
  port map (
    reset     => reset,
    clk       => clk,
    op_a      => sigK,
    op_b      => sigK_sigZ,
    start_i   => ready_sum1,
    div_out   => GK,
    ready_div => ready_div0
  );
  addsubfsm_v6_2 : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '1',
    op_a       => sigK,
    op_b       => GKsigK,
    start_i    => ready_div0,
    addsub_out => sigKp1,
    ready_as   => ready_sum2
  );
  addsubfsm_v6_4 : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '0',
    op_a       => xul,
    op_b       => GKxir_xul,
    start_i    => ready_div0,
    addsub_out => xfusao,
    ready_as   => ready
  );
  addsubfsm_v6_0 : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '1',
    op_a       => xir,
    op_b       => xul,
    start_i    => start,
    addsub_out => xir_xul,
    ready_as   => ready_sum0
  );

  addsubfsm_v6_1 : addsubfsm_v6
  port map (
    reset      => reset,
    clk        => clk,
    op         => '0',
    op_a       => sigK,
    op_b       => sigZ0,
    start_i    => start,
    addsub_out => sigK_sigZ,
    ready_as   => ready_sum1
  );


end Behavioral;

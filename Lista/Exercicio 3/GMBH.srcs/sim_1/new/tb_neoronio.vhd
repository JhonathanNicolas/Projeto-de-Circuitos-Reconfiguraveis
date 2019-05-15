
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
use work.fpupack.all;
use work.entities.all;

entity tb_neuron is
--  Port ( );
end tb_neuron;

architecture Behavioral of tb_neuron is

--FILE input_file  : text OPEN read_mode IS sim_file;
signal reset : std_logic := '0';
signal clk : std_logic := '0';
signal clk2 : std_logic := '0';
signal start : std_logic := '0';
signal up : std_logic := '0';
signal down : std_logic := '0';
signal load : std_logic := '0';
signal ready : std_logic := '0';


signal num_i :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal num_is :   STD_LOGIC_VECTOR (26 downto 0):= (others => '0');
signal num_o :   STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal num_ot :   STD_LOGIC_VECTOR (26 downto 0):= (others => '0');

-- conter for WOMenable
 signal WOMenable : std_logic := '0';
-- signal cnt_ena : integer range 1 to 205 := 1;

--constant num_mult_neuronio : integer := 4;
--subtype saida_mult is std_logic_vector( FP_WIDTH-1 downto 0 );
--type t_mult  is array( 0 to num_mult_neuronio-1 ) of saida_mult;
component neoronio
port (
  clk   : in  STD_LOGIC;
  reset : in  STD_LOGIC;
  up    : in  STD_LOGIC;
  load  : in  STD_LOGIC;
  down  : in  STD_LOGIC;
  num_i : in  STD_LOGIC_VECTOR (15 downto 0);
  num_o : out STD_LOGIC_VECTOR (15 downto 0)
);
end component neoronio;

signal first_start : std_logic := '0';
signal next_start : std_logic := '0';

-- enderecamento das memorias ROM e WOM
signal ROMaddress : std_logic_vector(7 downto 0) := (others=>'0');

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin
   stimulus: process
  begin
  
    -- Put initialisation code here
   -- reset <= '1', '1' after 15 ns, '0' after 25 ns;
        
        -- clock generator
        
        -- cria o start 
        ready <= '1';
        first_start <= '0', '1' after 55 ns, '0' after 65 ns; 
        
 if(start = '1') then
          
        wait for 40ns;
        up <= '1';
        num_i <= num_is(26 downto 11);
        load <= '1';
        wait for 10ns;
        load <= '0';
        up <= '0';
        wait for 40ns;
        num_i <= num_is(10 downto 0) &"00000";
        load <= '1';
        wait for 10ns;

    stop_the_clock <= true;
    wait;
 end if;
  end process;
    -- reset generator
    
  clocking: process
    begin
      while not stop_the_clock loop
        clk <= '0', '1' after clock_period / 2;
        wait for clock_period;
      end loop;
      wait;
    end process;    
  clocking_2: process
    begin
      while not stop_the_clock loop
        clk2 <= '0', '1' after 10*clock_period / 2;
        wait for 10*clock_period;
      end loop;
      wait;
    end process;
    
    
                        
uut : neoronio
    port map (
      clk   => clk,
      reset => reset,
      up    => up,
      load  => load,
      down  => down,
      num_i => num_i,
      num_o => num_o
    );
	

	
    rom_numi: process
    file infile	: text is in "inputs_neurionio.txt"; -- input file declaration
    variable inline : line; -- line number declaration
    variable dataf  : std_logic_vector(FP_WIDTH-1 downto 0); 
    begin

            while (not(endfile(infile))) loop
                wait until rising_edge(clk2);
                    if reset = '1' then
                        NULL;
                    elsif first_start='1' or ready='1' then
                        readline(infile, inline);
                        read(inline,dataf);
                        num_is <= dataf;
                        start <= '1';
                    else
                        start <= '0';
                    end if;

            end loop;
            assert not endfile(infile) report "FIM DA LEITURA" severity warning;
            wait;        
    end process;


    wom_numo : process(clk) 
    variable out_line : line;
    file out_file     : text is out "outputs_neurionio.txt";
    begin
        -- write line to file every clock
        if (rising_edge(clk)) then
            if WOMenable = '1' then
                write (out_line, num_ot);
                writeline (out_file, out_line);
            end if; 
        end if;  
    end process ;

end Behavioral;
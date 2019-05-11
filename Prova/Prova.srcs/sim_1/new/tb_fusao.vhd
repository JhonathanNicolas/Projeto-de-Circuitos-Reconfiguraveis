library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
use work.fpupack.all;


entity tb_fusao is
end tb_fusao;

architecture tb of tb_fusao is

    component fusao
        port (clk    : in std_logic;
              reset  : in std_logic;
              xir    : in std_logic_vector (26 downto 0);
              xul    : in std_logic_vector (26 downto 0);
              xfusao : out std_logic_vector (26 downto 0);
              start  : in std_logic;
              ready  : out std_logic);
    end component;

    signal clk    : std_logic := '0';
    signal reset  : std_logic;
    signal xir    : std_logic_vector (26 downto 0);
    signal xul    : std_logic_vector (26 downto 0);
    signal xfusao : std_logic_vector (26 downto 0);
    signal start  : std_logic;
    signal finish  : std_logic := '0';
    signal sstart  : std_logic;
    signal ready  : std_logic;
    signal sready  : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
    signal first_start : std_logic := '0';
    signal next_start : std_logic := '0';
    signal WOMenable : std_logic := '0';

begin

    dut : fusao
    port map (clk    => clk,
              reset  => reset,
              xir    => xir,
              xul    => xul,
              xfusao => xfusao,
              start  => start,
              ready  => ready);

      -- reset generator
    reset <= '0', '1' after 15 ns, '0' after 25 ns;

    -- clock generator
    clk <= not clk after 5 ns;

    -- cria o start
    first_start <= '0', '1' after 55 ns, '0' after 65 ns;

    WOMenable <= ready;
 rom_xul: process
 file infile    : text is in "Xulbin.txt"; -- input file declaration
 variable inline : line; -- line number declaration
 variable dataf  : std_logic_vector(FP_WIDTH-1 downto 0);

 begin
     while (not endfile(infile)) loop
         wait until rising_edge(clk);
             if first_start='1' or ready='1' then
                 readline(infile, inline);
                 read(inline,dataf);
                 xul <= dataf;
              else
                 xul <= xul;
             end if;
     end loop;
        finish <= '1';
     assert not endfile(infile) report "FIM DA LEITURA" severity warning;
     wait;
 end process;


 rom_xir: process
 file infile    : text is in "Xirbin.txt"; -- input file declaration
 variable inline : line; -- line number declaration
 variable dataf  : std_logic_vector(FP_WIDTH-1 downto 0);
 begin
     while (not endfile(infile)) loop
         wait until rising_edge(clk);
             if first_start='1' or ready='1' then
                 readline(infile, inline);
                 read(inline,dataf);
                 xir <= dataf;
                 start <= '1';
              else
                 xir <= xir;
                 start <= '0';

             end if;
     end loop;
     assert not endfile(infile) report "FIM DA LEITURA" severity warning;
     wait;
 end process;

wom_n1 : process(clk)
    variable out_line : line;
    file out_file     : text is out "Xfusao.txt";
    begin
        -- write line to file every clock
        if (rising_edge(clk)) then
            if WOMenable = '1' and finish = '0'then
                write (out_line, xfusao);
                writeline (out_file, out_line);
            end if;
        end if;
    end process ;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.


configuration cfg_tb_fusao of tb_fusao is
    for tb
    end for;
end cfg_tb_fusao;
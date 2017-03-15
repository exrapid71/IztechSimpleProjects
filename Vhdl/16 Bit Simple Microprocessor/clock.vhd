library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity clock is port(
	clock :			out std_logic;
	reset :			out std_logic);
end clock;

architecture imp of clock is

   signal clk : std_logic := '0';
   constant clk_period : time := 100 ns;
begin
   clk_process :process
        begin

	clk <= '0';
	clock <= clk ;
        wait for clk_period/2;  
        clk <= '1';
	clock <= clk ;
        wait for clk_period/2; 
	reset <= '0';

	
  end process;
end imp;
library ieee;
use ieee.std_logic_1164.all;

entity TestBench is 
end TestBench;

architecture imp of TestBench is

component RegisterFile is 
port(
	Clock: in std_logic; --clock
	WriteEnable: in std_logic; --write enable
	WriteAddress: in std_logic_vector(1 downto 0); --write address
	D:  in std_logic_vector(7 downto 0); --input
	ReadBEnable: in std_logic; --read enable port b
	ReadBAddress: in std_logic_vector(1 downto 0); --read address port b
	A, B: out std_logic_vector(7 downto 0));--output port a & b

end component;

signal Clock : std_logic:= '0';

signal WriteEnable,ReadBEnable : std_logic;
signal D,A,B : std_logic_vector(7 downto 0);
signal WriteAddress,ReadBAddress : std_logic_vector(1 downto 0);

constant clk_period : time := 10 ns;
begin 

RegFileTestBench: RegisterFile port map(Clock,WriteEnable,WriteAddress,D,ReadBEnable,ReadBAddress,A,B);

	clock_process : process
		begin
        	Clock <= '0';
        		wait for clk_period/2;  --for 0.5 ns signal is '0'.
       		Clock <= '1';
       			wait for clk_period/2;
	 end process;



end imp;

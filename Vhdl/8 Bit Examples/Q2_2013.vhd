library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity try is port(


	y : out std_logic
);
end try;

architecture imp of try is 
signal a : std_logic_vector(7 downto 0);
signal x : std_logic;

begin 
	Process(a)
variable b : integer := 1;
	begin 

	a <= "01010101";
	b := 2;
	x <= a(b);

	end Process;
end imp;
	

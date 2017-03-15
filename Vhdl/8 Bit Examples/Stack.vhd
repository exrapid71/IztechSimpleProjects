library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Stack is 
port(
	Clock,Reset : in std_logic;
	Push,Pop : in std_logic;
	Input : in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(7 downto 0)
);
end Stack;

architecture imp of Stack is 

  subtype Reg is std_logic_vector(7 downto 0);
  type RegArray is array(0 to 3) of Reg;
  signal SF : RegArray;

begin 
	Process(Clock)
		variable index : integer :=3;
	begin
		if (Clock'event and Clock = '1') then
			if(Reset = '1') then
        			SF(0) <= (OTHERS => '0');
        			SF(1) <= (OTHERS => '0');
        			SF(2) <= (OTHERS => '0');
        			SF(3) <= (OTHERS => '0');
			elsif(Push = '1') then 
				SF(index) <= Input + '1';
				index := index - 1;
				if(index = -1) then 
					index := 3;
				end if;
			elsif(Pop = '1') then 
				index := index + 1;
				if(index = 3) then 
					index := 0;
				end if;
			Output <= SF(index);
			end if;
		end if;		
	end Process;
end imp;
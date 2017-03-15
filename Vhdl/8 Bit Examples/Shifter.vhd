library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Shifter is port (

 	ShiftSelect: in std_logic_vector(1 downto 0); 
 	F: in std_logic_vector(7 downto 0); 
 	output: out std_logic_vector(7 downto 0)); 
end Shifter;

architecture imp of Shifter is

begin
 	process(ShiftSelect, F)
 	begin
 		case ShiftSelect is
			WHEN "00"   => output <= F;                    -- pass through 
 			WHEN "01"   => output <= F(6 DOWNTO 0) & '0';  -- shift left with 0 
			WHEN "10"   => output <= '0' & F(7 DOWNTO 1);  -- shift right with 0
			WHEN OTHERS => output <= F(0) & F(7 DOWNTO 1); -- rotate right
 		end case;
 	end process;
end imp; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1_top is Port ( 
	   S : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           x0,x1,x2,x3   : in  STD_LOGIC ;     -- inputs
           y   : out STD_LOGIC);                        -- output
end mux_4to1_top;

architecture Behavioral of mux_4to1_top is
begin
with S select
    y <= x0 when "00",
         x1 when "01",
         x2 when "10",
         x3 when "11",
         '0'  when others;
end Behavioral;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity PC is port(
  clk: in std_logic;
  reset:in std_logic;
  load:in std_logic;
  INPUT: in std_logic_vector(15 downto 0);
  OUTPUT:out std_logic_vector(15 downto 0));
end PC;

architecture imp of PC is
   subtype reg is std_logic_vector(15 downto 0);
 signal PC16 :reg="0000000000000000";
 begin
   Process (clk,reset,load)
 begin
 if(clk'event and clk='1') then 
    if(reset='1') then
      PC16 <=(others => '0');
   elsif(load='1') then 
      PC16 <=INPUT;
   end if ;
end if;
end process;
 OUTPUT<=PC8;
end imp;


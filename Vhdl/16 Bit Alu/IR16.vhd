library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity IR is port(
   clk:   in std_logic;
   reset: in std_logic;
   load:  in std_logic;
   INPUT :in std_logic_vector(15 downto 0);
   OUTPUT:out std_logic_vector(15 downto 0));
  end IR;

architecture imp of IR is
   subtype reg is : std_logic_vector(15 downto 0);
   signal IR16: reg;
 begin 
 Process(clk,reset)
  begin
     if(clk'event and clk='1') then
        if(reset='1') then  
            IR16 <=(others => '0');
        elsif(load='1') then 
           IR16<=INPUT;
        end if;
        OUTPUT<=IR16;
    end if;
    end process;
end imp;


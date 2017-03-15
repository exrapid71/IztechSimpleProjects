library ieee;
use ieee.std_logic_1164.all;

entity DataBus is 
port(
   Direction, Enable : in std_logic;
   DataOut, DataIn : inout std_logic_vector(7 downto 0)
);
end databus;

architecture behavioral of DataBus is
begin
    process(Enable, Direction, DataIn, DataOut)
    begin
        if(Enable = '1') then
           if(Direction = '0') then
              DataOut <= DataIn;
           else
              DataIn <= DataOut;
           end if;
        end if;
    end process;
end behavioral;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity databus is port(
	direction, enable : 		in std_logic;
	dataout :					in std_logic_vector(15 downto 0);
	datain : 		 			out std_logic_vector(15 downto 0));
end databus;

architecture structural_databus of databus is
begin
    process(enable, dataout)
    begin
        if(enable = '1') then
           --if(direction = '0') then
				--dataout <= datain;   
          -- else
				datain <= dataout;
          -- end if;
        end if;
    end process;
end structural_databus;

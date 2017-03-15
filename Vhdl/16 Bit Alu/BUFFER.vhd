library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tristate_buffer is port(
	E:	in std_logic;
	D:	in std_logic_vector(15 downto 0);
	Y:	out std_logic_vector(15 downto 0));
end tristate_buffer;

architecture beh of tristate_buffer is
	begin
		process(E,D)
		begin
			if(E='1') THEN
				Y<=D;
			else
				Y<=(OTHERS => 'Z');
			end if;
		end process;
end beh;


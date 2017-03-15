library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ram_256_16 is port(
	cs: in std_logic;
	wr: in std_logic;
	addr: in std_logic_vector(3 downto 0);
	di: in std_logic_vector(15 downto 0);
	do: out std_logic_vector(15 downto 0));
end ram_256_16;

architecture imp of ram_256_16 is
	subtype cell is std_logic_vector(15 downto 0);
	type ram_type is array(0 to 255) of cell;
signal RAM: ram_type;

begin
	process(cs,wr)
		variable ctrl: std_logic_vector(1 downto 0);
		begin
			ctrl := cs&wr;
			case ctrl is
				when "11" =>
				RAM(conv_integer(addr)) <= di;
				do <= di;
				when "10" =>
				do <= RAM(conv_integer(addr));
				when others =>
				do <= (others => 'Z');
			end case;
	end process;
end imp;

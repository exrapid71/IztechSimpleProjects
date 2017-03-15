library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity rom_1024_16 is port(
	cs: in std_logic;
	addr: in std_logic_vector(9 downto 0);
	data: out std_logic_vector(15 downto 0));
end rom_1024_16;

architecture imp of rom_1024_16 is
	subtype cell is std_logic_vector(15 downto 0);
	type rom_type is array(0 to 1) of cell;

	constant ROM: rom_type :=(
		movi & a & "10000010"
		mov & b & a
	);

begin
	process(cs)
		begin
			if(cs='1') then
				data <= ROM(conv_integer(addr));
			else
				data <= (others => 'Z');
			end if;
	end process;
end imp;

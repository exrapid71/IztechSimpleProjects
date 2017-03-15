library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
Library datapathnew;
use datapathnew.opcodes.all;

entity ROM_1024_16 is port ( 
	oe:				in std_logic;
	address : 		in std_logic_vector(15 downto 0);
	data : 			out std_logic_vector(15 downto 0));
end ROM_1024_16;

architecture imp of ROM_1024_16 is

	subtype cell is std_logic_vector(15 downto 0);
	type rom_type is array(0 to 2) of cell;
	
	constant ROM_1024_16: rom_type :=(
		s_movi & A & "10000010",
--		s_mov & B & A & "00000",
--		s_movi & C & "10000010"); -- mov işleminin register file a yazdığını göstermek için.
--		s_nop & "00000000000",
		s_mov & B & A & "00000", 
		s_jmp & "00000000000");
begin
		process(address)
		begin
			if(oe = '1') then
				data <= ROM_1024_16(conv_integer(address));
			else
				data <= (others => 'Z');
			end if;
		end process;
end imp;

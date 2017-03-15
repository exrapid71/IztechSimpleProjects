library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity RAM_1024 is
  port (
    clock   : in  std_logic;-- chip select
    we      : in  std_logic;-- write/ read enable
    address : in  std_logic_vector(2 downto 0);--1024 eldesi için
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0));
end entity RAM_1024;

architecture imp of RAM_1024 is


   subtype cell is std_logic_vector(15 downto 0);
   type ram_type is array(0 to 1023) of cell;
   signal ram : ram_type;
--   type ram_type is array (0 to (2**address'length)-1) of std_logic_vector(datain'range);
--   signal read_address : std_logic_vector(address'range);

begin
   process(clock, we)
   variable ctrl:	std_logic_vector(1 downto 0);
   begin
		ctrl:=clock & we;
		case ctrl is 
			when "11" =>
				ram(conv_integer(address)) <= datain;
				dataout <= datain;
			when "10" =>
				dataout <= ram(conv_integer(address));
			when others =>
				dataout <= (others => 'Z');
		end case;
  end process;

end imp; 



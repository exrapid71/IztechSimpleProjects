library ieee;
use ieee.std_logic_1164.all;

entity Decoder2x4 is 
port(

	A : in std_logic_vector(1 downto 0);
	E : in std_logic;
	Y : out std_logic_vector(3 downto 0)
);
end Decoder2x4;

architecture imp of Decoder2x4 is 
begin 
	process(E,A)
	begin 
		if(E = '0') then
			Y <= (OTHERS => '0');

		else
			case A is
			  when "00"   =>  Y <= "1000";
			  when "01"   =>  Y <= "0100";
			  when "10"   =>  Y <= "0010";
			  when "11"   =>  Y <= "0001";
			  when others => null;
			end case;
		end if;
	end process;
end imp;





library ieee;
use ieee.std_logic_1164.all;

entity AddressBus is 
port(
	Enable : in std_logic;
	A : in std_logic_vector(7 downto 0);
	AdressBusOutput : out std_logic_vector(7 downto 0)
);
end AddressBus;

architecture behavioral of AddressBus is 
begin 
	Process(Enable,A)
	begin
		if(Enable = '1') then 
			AdressBusOutput <= A;
		end if;
	end Process;

end behavioral;

			

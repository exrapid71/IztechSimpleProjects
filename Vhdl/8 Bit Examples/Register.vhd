library ieee;
use ieee.std_logic_1164.all;

entity EightBitRegister is
port (
	Clock,Reset,Load: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end EightBitRegister;

architecture imp of EightBitRegister is

	subtype Reg is std_logic_vector(7 downto 0);
	signal RegIn : Reg;

begin
	Process(Clock,Reset)
	begin
		if (Clock'event and Clock = '1') then
			if(Reset = '1') then 
				RegIn <= (others => '0');

			elsif(Load = '1') then
				RegIn <= D;
		
			end if;
		end if;
	end Process;

	Q <= RegIn;
end imp;

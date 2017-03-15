library ieee;
use ieee.std_logic_1164.all;

entity ProgramCounter is 
port(
	Clock,Reset,Load: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end ProgramCounter;

architecture behavioral of ProgramCounter is 

  subtype Reg is std_logic_vector(7 downto 0);
  signal PC : Reg := "00000000";

begin 
	Process(Clock,Reset)
	begin
		if (Clock'event and Clock = '1') then
			if(Reset = '1') then 
				PC <= (others => '0');

			elsif(Load = '1') then
				PC <= D;
		
			end if;
		end if;
	end Process;

	Q <= PC;
end behavioral;


	

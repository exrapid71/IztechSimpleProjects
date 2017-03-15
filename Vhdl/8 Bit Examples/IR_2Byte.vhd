library ieee;
use ieee.std_logic_1164.all;

entity IR_2Byte is 
port(
	Clock : in std_logic;
	Reset1,Load1 : in std_logic;
	Reset2,Load2 : in std_logic;
	D : in std_logic_vector(7 downto 0);
	Q1,Q2 : out std_logic_vector(7 downto 0)
);
end IR_2Byte;

architecture imp of IR_2Byte is 

component InstructionRegister is 
port(
	Clock,Reset,Load: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end component;

begin 

IR1 : InstructionRegister port map(Clock,Reset1,Load1,D,Q1);
IR2 : InstructionRegister port map(Clock,Reset2,Load2,D,Q2);

end imp;

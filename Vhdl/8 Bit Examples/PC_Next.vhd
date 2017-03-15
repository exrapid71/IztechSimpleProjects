library ieee;
use ieee.std_logic_1164.all;

entity PC_Next is 
port(
	Clock,Reset,Load,jmpMux : in std_logic;
	S : in std_logic_vector(1 downto 0);
	DataBus1_0 : in std_logic_vector(1 downto 0);
	StackIn, InstructionRegisterIn : in std_logic_vector(7 downto 0);
	Q : out std_logic_vector(7 downto 0)
);
end PC_Next;

architecture imp of PC_Next is 

component Mux_4to1_8bit is 
port(
	S : in std_logic_vector(1 downto 0);
	D0,D1,D2,D3 : in std_logic_vector(7 downto 0);
	Y : out std_logic_vector(7 downto 0)
);
end component;

component ProgramCounter is 
port(
	Clock,Reset,Load: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end component;

component EightBitFullAdder is 
port(

	X,Y : in std_logic_vector(7 downto 0);
	C0 : in std_logic;
	F : out std_logic_vector(7 downto 0);
	unsignedOverflow, signedOverflow : out std_logic
);

end component;

signal PCoutFAin,MUXoutPCin,MUXoutFAin,FAoutMUXin,MUXin,unused : std_logic_vector(7 downto 0);
signal sub : std_logic;
signal Mux_2_Select : std_logic_vector(1 downto 0);

begin 

MUXin <= "0000"&DataBus1_0&"11";
sub <= jmpMux and InstructionRegisterIn(7);
Mux_2_Select <= "0"&jmpMux;

PC : ProgramCounter port map(Clock,Reset,Load,MUXoutPCin,PCoutFAin);
FA : EightBitFullAdder port map(PCoutFAin,MUXoutFAin,sub,FAoutMUXin,unused(0),unused(0));
Mux1 : Mux_4to1_8bit port map(Mux_2_Select,"00000010",InstructionRegisterIn,unused,unused,MUXoutFAin);
Mux2 : Mux_4to1_8bit port map(S,MUXin,FAoutMUXin,StackIn,unused,MUXoutPCin);

Q <= PCoutFAin;

end imp;

	
	
	

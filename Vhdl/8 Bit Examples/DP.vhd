library ieee;
use ieee.std_logic_1164.all;

entity DP is port(

	Clock : in std_logic;
	IRLoad,IRReset : in std_logic_vector(1 downto 0);
	PCLoad,PCReset,jmpMux : in std_logic;
	Push,Pop,opFetch,StackReset : in std_logic;
	En1,En2,Direction  : in std_logic;
	WriteEnable,ReadBEnable,ReadAEnable,RegFileReset : in std_logic;
	ASel,SSel : in std_logic_vector(1 downto 0);
	ALUSel : in std_logic_vector(2 downto 0);
	ALUShiftSelect : in  std_logic_vector(1 downto 0);

	DataBusOut : inout  std_logic_vector(7 downto 0);
	AdressBusOutput : out  std_logic_vector(7 downto 0);
	InstructionRegisterOut,ProgramCounterOutput : out  std_logic_vector(7 downto 0);
	Aeq : out std_logic;
	PortA : out  std_logic_vector(7 downto 0);
	PortB : inout  std_logic_vector(7 downto 0)
);

end DP;

architecture imp of DP is 

component IR_2Byte is 
port(
	Clock : in std_logic;
	Reset1,Load1 : in std_logic;
	Reset2,Load2 : in std_logic;
	D : in std_logic_vector(7 downto 0);
	Q1,Q2 : out std_logic_vector(7 downto 0)
);
end component;

component PC_Next is 
port(
	Clock,Reset,Load,jmpMux : in std_logic;
	S : in std_logic_vector(1 downto 0);
	DataBus1_0 : in std_logic_vector(1 downto 0);
	StackIn, InstructionRegisterIn : in std_logic_vector(7 downto 0);
	Q : out std_logic_vector(7 downto 0)
);
end component;

component Stack is 
port(
	Clock,Reset : in std_logic;
	Push,Pop : in std_logic;
	Input : in std_logic_vector(7 downto 0);
	Output : out std_logic_vector(7 downto 0)
);
end component;

component Mux_4to1_8bit is 
port(
	S : in std_logic_vector(1 downto 0);
	D0,D1,D2,D3 : in std_logic_vector(7 downto 0);
	Y : out std_logic_vector(7 downto 0)
);
end component;

component ALU is port(

	S : in std_logic_vector(2 downto 0); --Select
	A : in std_logic_vector(7 downto 0); --First operand
	B : in std_logic_vector(7 downto 0); --Second operand
	F : inout std_logic_vector(7 downto 0); --Output
	ShiftSelect : in  std_logic_vector(1 downto 0) --Select bit for shifter
);
	
end component;

component AddressBus is 
port(
	Enable : in std_logic;
	A : in std_logic_vector(7 downto 0);
	AdressBusOutput : out std_logic_vector(7 downto 0)
);
end component;

component DataBus is 
port(
   Direction, Enable : in std_logic;
   DataOut, DataIn : inout std_logic_vector(7 downto 0)
);
end component;

component RegisterFile is 
port(
	Clock,Reset : in std_logic; --clock,reset
	WriteEnable: in std_logic; --write enable
	WriteAddress: in std_logic_vector(1 downto 0); --write address
	D:  in std_logic_vector(7 downto 0); --input
	ReadBEnable,ReadAEnable: in std_logic; --read enable port b,port a
	ReadBAddress: in std_logic_vector(1 downto 0); --read address port b

	A, B,Acc: out std_logic_vector(7 downto 0) --output port a & b
);

end component;

Signal WriteAddress,ReadBAddress : std_logic_vector(1 downto 0);
Signal IR7_0, PortAoutADDBUSin,PortBoutDATABUSin,MUXoutALUin,ALUoutREGFILEin,Accumulator,DataOut : std_logic_vector(7 downto 0);
Signal DataOut1_0 : std_logic_vector(1 downto 0);
Signal STACKoutPCin,PCNEXToutSTACKin : std_logic_vector(7 downto 0);
begin 

MUX_Comp3 : Mux_4to1_8bit port map(ASel,PortBoutDATABUSin,"00000000",IR7_0,PortAoutADDBUSin,MUXoutALUin);

ALU_Comp : ALU port map(ALUSel,MUXoutALUin,PortBoutDATABUSin,ALUoutREGFILEin,ALUShiftSelect);

REGFILE_Comp : RegisterFile port map(Clock,RegFileReset,WriteEnable,WriteAddress,ALUoutREGFILEin,ReadBEnable,ReadAEnable,ReadBAddress,PortAoutADDBUSin,PortBoutDATABUSin,Accumulator);

PortA <= PortAoutADDBUSin;
PortB <= PortBoutDATABUSin;

AddBus_Comp : AddressBus port map(En1,PortAoutADDBUSin,AdressBusOutput);
DataBus_Comp : DataBus port map(Direction,En2,DataOut,PortBoutDATABUSin);

DataBusOut <= DataOut;

PCNext_Comp : PC_Next port map(Clock,PCReset,PCLoad,jmpMux,SSel,DataOut1_0,STACKoutPCin,IR7_0,PCNEXToutSTACKin);

ProgramCounterOutput <= PCNEXToutSTACKin;

Stack_Comp : Stack port map(Clock,StackReset,Push,Pop,PCNEXToutSTACKin,STACKoutPCin);

end imp;

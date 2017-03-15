library ieee;
use ieee.std_logic_1164.all;

entity RegisterFile is 
port(
	Clock: in std_logic; --clock
	WriteEnable: in std_logic; --write enable
	WriteAddress: in std_logic_vector(1 downto 0); --write address
	D:  in std_logic_vector(7 downto 0); --input
	ReadBEnable,ReadAEnable: in std_logic; --read enable ports a & b
	ReadBAddress: in std_logic_vector(1 downto 0); --read address port a & b
	A, B,Acc: out std_logic_vector(7 downto 0));--output port a & b

end RegisterFile;

architecture imp of RegisterFile is

component Decoder2x4 is 
port(

	A : in std_logic_vector(1 downto 0);
	E : in std_logic;
	Y : out std_logic_vector(3 downto 0)
);
end component;

component EightBitRegister is
port (
	Clock,Reset,Load: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0)
);
end component;

component AndGate is 
port(

	I1,I2 : in std_logic;
	O : out std_logic
);
end component;

component OrGate is 
port(

	I1,I2,I3,I4 : in std_logic_vector(7 downto 0);
	O : out std_logic_vector(7 downto 0)
);
end component;

signal YWrite,YARead,YBRead : std_logic_vector(3 downto 0);
signal QAcc,Q0,Q1,Q2,Q3,A0,A1,A2,A3,B0,B1,B2,B3 : std_logic_vector(7 downto 0);
signal ReadAAddress : std_logic_vector(1 downto 0);



begin

DecoderWrite : Decoder2x4 port map(WriteAddress,WriteEnable,YWrite);

RegisterAcc : EightBitRegister port map(Clock,'0','1',D,QAcc);
Register0 : EightBitRegister port map(Clock,'0',YWrite(0),D,Q0);
Register1 : EightBitRegister port map(Clock,'0',YWrite(1),D,Q1);
Register2 : EightBitRegister port map(Clock,'0',YWrite(2),D,Q2);
Register3 : EightBitRegister port map(Clock,'0',YWrite(3),D,Q3);

Acc <= QAcc;

ReadAAddress <= WriteAddress;


DecoderReadA : Decoder2x4 port map(ReadAAddress,ReadAEnable,YARead);
DecoderReadB : Decoder2x4 port map(ReadBAddress,ReadBEnable,YBRead);



--Register0--
AndA00 : AndGate port map(YARead(0),Q0(0),A0(0));
AndA10 : AndGate port map(YARead(0),Q0(1),A0(1));
AndA20 : AndGate port map(YARead(0),Q0(2),A0(2));
AndA30 : AndGate port map(YARead(0),Q0(3),A0(3));
AndA40 : AndGate port map(YARead(0),Q0(4),A0(4));
AndA50 : AndGate port map(YARead(0),Q0(5),A0(5));
AndA60 : AndGate port map(YARead(0),Q0(6),A0(6));
AndA70 : AndGate port map(YARead(0),Q0(7),A0(7));

AndB00 : AndGate port map(YBRead(0),Q0(0),B0(0));
AndB10 : AndGate port map(YBRead(0),Q0(1),B0(1));
AndB20 : AndGate port map(YBRead(0),Q0(2),B0(2));
AndB30 : AndGate port map(YBRead(0),Q0(3),B0(3));
AndB40 : AndGate port map(YBRead(0),Q0(4),B0(4));
AndB50 : AndGate port map(YBRead(0),Q0(5),B0(5));
AndB60 : AndGate port map(YBRead(0),Q0(6),B0(6));
AndB70 : AndGate port map(YBRead(0),Q0(7),B0(7));


--Register1--
AndA01 : AndGate port map(YARead(1),Q1(0),A1(0));
AndA11 : AndGate port map(YARead(1),Q1(1),A1(1));
AndA21 : AndGate port map(YARead(1),Q1(2),A1(2));
AndA31 : AndGate port map(YARead(1),Q1(3),A1(3));
AndA41 : AndGate port map(YARead(1),Q1(4),A1(4));
AndA51 : AndGate port map(YARead(1),Q1(5),A1(5));
AndA61 : AndGate port map(YARead(1),Q1(6),A1(6));
AndA71 : AndGate port map(YARead(1),Q1(7),A1(7));

AndB01 : AndGate port map(YBRead(1),Q1(0),B1(0));
AndB11 : AndGate port map(YBRead(1),Q1(1),B1(1));
AndB21 : AndGate port map(YBRead(1),Q1(2),B1(2));
AndB31 : AndGate port map(YBRead(1),Q1(3),B1(3));
AndB41 : AndGate port map(YBRead(1),Q1(4),B1(4));
AndB51 : AndGate port map(YBRead(1),Q1(5),B1(5));
AndB61 : AndGate port map(YBRead(1),Q1(6),B1(6));
AndB71 : AndGate port map(YBRead(1),Q1(7),B1(7));

--Register2--
AndA02 : AndGate port map(YARead(2),Q2(0),A2(0));
AndA12 : AndGate port map(YARead(2),Q2(1),A2(1));
AndA22 : AndGate port map(YARead(2),Q2(2),A2(2));
AndA32 : AndGate port map(YARead(2),Q2(3),A2(3));
AndA42 : AndGate port map(YARead(2),Q2(4),A2(4));
AndA52 : AndGate port map(YARead(2),Q2(5),A2(5));
AndA62 : AndGate port map(YARead(2),Q2(6),A2(6));
AndA72 : AndGate port map(YARead(2),Q2(7),A2(7));

AndB02 : AndGate port map(YBRead(2),Q2(0),B2(0));
AndB12 : AndGate port map(YBRead(2),Q2(1),B2(1));
AndB22 : AndGate port map(YBRead(2),Q2(2),B2(2));
AndB32 : AndGate port map(YBRead(2),Q2(3),B2(3));
AndB42 : AndGate port map(YBRead(2),Q2(4),B2(4));
AndB52 : AndGate port map(YBRead(2),Q2(5),B2(5));
AndB62 : AndGate port map(YBRead(2),Q2(6),B2(6));
AndB72 : AndGate port map(YBRead(2),Q2(7),B2(7));


--Register3--
AndA03 : AndGate port map(YARead(3),Q3(0),A3(0));
AndA13 : AndGate port map(YARead(3),Q3(1),A3(1));
AndA23 : AndGate port map(YARead(3),Q3(2),A3(2));
AndA33 : AndGate port map(YARead(3),Q3(3),A3(3));
AndA43 : AndGate port map(YARead(3),Q3(4),A3(4));
AndA53 : AndGate port map(YARead(3),Q3(5),A3(5));
AndA63 : AndGate port map(YARead(3),Q3(6),A3(6));
AndA73 : AndGate port map(YARead(3),Q3(7),A3(7));

AndB03 : AndGate port map(YBRead(3),Q3(0),B3(0));
AndB13 : AndGate port map(YBRead(3),Q3(1),B3(1));
AndB23 : AndGate port map(YBRead(3),Q3(2),B3(2));
AndB33 : AndGate port map(YBRead(3),Q3(3),B3(3));
AndB43 : AndGate port map(YBRead(3),Q3(4),B3(4));
AndB53 : AndGate port map(YBRead(3),Q3(5),B3(5));
AndB63 : AndGate port map(YBRead(3),Q3(6),B3(6));
AndB73 : AndGate port map(YBRead(3),Q3(7),B3(7));

portA : OrGate port map(A0,A1,A2,A3,A);
portB : OrGate port map(B0,B1,B2,B3,B);

end imp;











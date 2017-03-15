library ieee;
use ieee.std_logic_1164.all;

entity ALU is port(

	S : in std_logic_vector(2 downto 0); --Select
	A : in std_logic_vector(7 downto 0); --First operand
	B : in std_logic_vector(7 downto 0); --Second operand
	F : inout std_logic_vector(7 downto 0); --Output
	ShiftSelect : in  std_logic_vector(1 downto 0) --Select bit for shifter
);
	
end ALU;

architecture imp of ALU is

component EightBitLE is port(

    S: in std_logic_vector(2 downto 0); --Select
    A,B: in std_logic_vector(7 downto 0); -- 2 operands of Logic Extender
    X: out std_logic_vector (7 downto 0)); --output of LE, first operand of Full Adder

end component;

component EightBitAE is port(

    S: in std_logic_vector(2 downto 0); --Select
    B: in std_logic_vector(7 downto 0); -- operand of Arithmetic Extender
   	Y: out std_logic_vector (7 downto 0)); -- output of AE, second operand of Full Adder

end component;

component EightBitFullAdder is 
port(

	X,Y : in std_logic_vector(7 downto 0); -- operands of FA,ouputs of LE and AE
	C0 : in std_logic;                     -- input carry bit of FA, output of Carry Extender
	F : out std_logic_vector(7 downto 0);  -- output of FA
	unsignedOverflow, signedOverflow : out std_logic -- overflow bits
);

end component;

component CarryExtender is port(

	S : in std_logic_vector(2 downto 0); --Select
	C0 : out std_logic);                 --output of CE, input carry bit of FA
end component;

component Shifter is port (

 	ShiftSelect: in std_logic_vector(1 downto 0);  --Select
 	F: in std_logic_vector(7 downto 0);            -- input of Shifter, output of ALU
 	output: out std_logic_vector(7 downto 0));     -- shifted output
END component;

signal C0, unsignedOverflow, signedOverflow : std_logic;
signal X, Y,ShiftOutput : std_logic_vector(7 downto 0); 

begin

ALU1  : CarryExtender port map(S,C0); --according to select bits C0 is calculated
ALU2  : EightBitLE port map(S,A,B,X); --according to select bits first operand of FA is calculated
ALU3  : EightBitAE port map(S,B,Y);   --according to select bits second operand of FA is calculated
ALU4  : EightBitFullAdder port map(X,Y,C0,F,unsignedOverflow,signedOverflow); --according to X,Y and C0 output and overflow bits are calculated
Shift : Shifter port map(ShiftSelect,F,ShiftOutput); --according to select bits and output of ALU shifted output is calculated
end imp;




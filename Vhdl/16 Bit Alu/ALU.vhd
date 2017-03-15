library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is port(
	S: in std_logic_vector(4 downto 0);
	A,B : in std_logic_vector( 15 downto 0);
	F: out std_logic_vector(15 downto 0);
	unsigned_overflow : out std_logic;
	signed_overflow :out std_logic;
	carry : out std_logic;
	zero :out std_logic);
end ALU ;

architecture imp of ALu is
	component LE16 is port(
		S:  in std_logic_vector(2 downto 0) ;
		A,B : in std_logic_vector(15 downto 0);
		X:out std_logic_vector(15 downto 0));
	end component;

	component AE16 is port (
		S:  in std_logic_vector(2 downto 0);
		A,B: in std_logic_vector(15 downto 0);
		Y : out std_logic_vector(15 downto 0));
	end component;

	component ADDSUB16 is port(
		A: in std_logic_vector( 15 downto 0 );
		B:in std_logic_vector(15 downto 0);
		F:out std_logic_vector(15 downto 0);
		carryIn :in std_logic;
		unsigned_overflow : out std_logic;
		signed_overflow: out std_logic);
	end component;

	component SHIFTER16 is port(
		S : in std_logic_vector(1 downto 0 );
		A:in std_logic_vector(15 downto 0);
		Y : out std_logic_vector(15 downto 0);
		carryOut : out std_logic;
		zero : out std_logic);
	end component;

	signal X,Y,ShiftInput: std_logic_vector(15 downto 0);
	signal c0 : std_logic;

	begin
		CarryExtender_ALU: c0<=(S(0) xor S(1)) and S(2);
		LogicExtender_ALU: LE16 port map(S(2 downto 0),A,B,X);
		ArithmeticExtender_ALU :AE16 port map(S(2 downto 0),A,B,Y);
		AddSub_ALU: ADDSUB16 port map(X,Y,ShiftInput,c0,unsigned_overflow,signed_overflow);
		Shifter_ALU :SHIFTER16 port map(S(4 downto 3),ShiftInput,F,carry,zero);
end imp;




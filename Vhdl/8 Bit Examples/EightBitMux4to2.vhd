library ieee;
use ieee.std_logic_1164.all;

entity EightBitMux4to2 is 
port(

	I1,I2,I3,I4 : in std_logic_vector(7 downto 0);
	SelectA,SelectB : in std_logic_vector(3 downto 0); 
	A,B : out std_logic_vector(7 downto 0)
);
end EightBitMux4to2;

architecture imp of  EightBitMux4to2 is

component Mux4to2 is 
port(

	I1,I2,I3,I4 : in std_logic;
	SelectA : in std_logic_vector(3 downto 0);
	SelectB : in std_logic_vector(3 downto 0);
	A,B : out std_logic
);
end component;

begin 

U0 : Mux4to2 port map(I1(0),I2(0),I3(0),I4(0),SelectA,SelectB,A(0),B(0));
U1 : Mux4to2 port map(I1(1),I2(1),I3(1),I4(1),SelectA,SelectB,A(1),B(1));
U2 : Mux4to2 port map(I1(2),I2(2),I3(2),I4(2),SelectA,SelectB,A(2),B(2));
U3 : Mux4to2 port map(I1(3),I2(3),I3(3),I4(3),SelectA,SelectB,A(3),B(3));
U4 : Mux4to2 port map(I1(4),I2(4),I3(4),I4(4),SelectA,SelectB,A(4),B(4));
U5 : Mux4to2 port map(I1(5),I2(5),I3(5),I4(5),SelectA,SelectB,A(5),B(5));
U6 : Mux4to2 port map(I1(6),I2(6),I3(6),I4(6),SelectA,SelectB,A(6),B(6));
U7 : Mux4to2 port map(I1(7),I2(7),I3(7),I4(7),SelectA,SelectB,A(7),B(7));

end imp;

	
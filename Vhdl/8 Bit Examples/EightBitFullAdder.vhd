library ieee;
use ieee.std_logic_1164.all;

entity EightBitFullAdder is 
port(

	X,Y : in std_logic_vector(7 downto 0);
	C0 : in std_logic;
	F : out std_logic_vector(7 downto 0);
	unsignedOverflow, signedOverflow : out std_logic
);

end EightBitFullAdder;


architecture imp of EightBitFullAdder is

signal C : std_logic_vector(7 downto 1);

component FullAdder
port(
	X,Y : in std_logic;
	C0 : in std_logic;
	carryOut : out std_logic;
	F : out std_logic
);
end component;

begin 

Out0 : FullAdder port map(X(0),Y(0),C0,  C(1),F(0));
Out1 : FullAdder port map(X(1),Y(1),C(1),C(2),F(1));
Out2 : FullAdder port map(X(2),Y(2),C(2),C(3),F(2));
Out3 : FullAdder port map(X(3),Y(3),C(3),C(4),F(3));
Out4 : FullAdder port map(X(4),Y(4),C(4),C(5),F(4));
Out5 : FullAdder port map(X(5),Y(5),C(5),C(6),F(5));
Out6 : FullAdder port map(X(6),Y(6),C(6),C(7),F(6));
Out7 : FullAdder port map(X(7),Y(7),C(7),unsignedOverflow,F(7));
signedOverflow <= C(7) xor C(6);

end imp;



library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
port(

	C0 : in std_logic;
	carryOut : out std_logic;

	X,Y : in std_logic;
	F :  out std_logic
);

end FullAdder;

architecture imp of FullAdder is
begin 

	F <= (X xor ( Y xor C0));

	carryOut <= ((Y and C0) or ( X and C0) or ( X and Y));

end imp;

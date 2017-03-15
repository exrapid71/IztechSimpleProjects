library ieee;
use ieee.std_logic_1164.all;


entity Mux4to2 is 
port(

	I1,I2,I3,I4 : in std_logic;
	SelectA : in std_logic_vector(3 downto 0);
	SelectB : in std_logic_vector(3 downto 0);
	A,B : out std_logic
);
end Mux4to2;

architecture imp of Mux4to2 is
begin 
	A <= (I1 and SelectA(0)) or (I2 and SelectA(1)) or (I3 and SelectA(2)) or (I4 and SelectA(3));
	B <= (I1 and SelectB(0)) or (I2 and SelectB(1)) or (I3 and SelectB(2)) or (I4 and SelectB(3));
end imp;


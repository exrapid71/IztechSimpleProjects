library ieee;
use ieee.std_logic_1164.all;

entity AndGate is 
port(

	I1,I2 : in std_logic;
	O : out std_logic
);
end AndGate;

architecture imp of AndGate is
begin 
	O <= I1 and I2;
end imp;

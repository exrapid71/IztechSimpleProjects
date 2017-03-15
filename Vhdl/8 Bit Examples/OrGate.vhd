library ieee;
use ieee.std_logic_1164.all;

entity OrGate is 
port(

	I1,I2,I3,I4 : in std_logic_vector(7 downto 0);
	O : out std_logic_vector(7 downto 0)
);
end OrGate;

architecture imp of OrGate is 
begin 
	O <= I1 or I2 or I3 or I4;
end imp;

library ieee;
use ieee.std_logic_1164.all;


entity CarryExtender is port(

	S : in std_logic_vector(2 downto 0);
	C0 : out std_logic);
end CarryExtender;

architecture imp of CarryExtender is

begin
	C0 <= ( S(2) and ( S(0) xor S(1) ) );
end imp;

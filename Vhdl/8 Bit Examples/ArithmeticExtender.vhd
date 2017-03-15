library ieee;
use ieee.std_logic_1164.all;

entity ArithmeticExtender is port(

	S : in std_logic_vector(2 downto 0);
	B : in std_logic;
	Y : out std_logic);
end ArithmeticExtender;

architecture imp of ArithmeticExtender is
begin
	process(S,B)
	begin
		case S is
			when "100" => Y <= B;     --addition
			when "101" => Y <= not B; --subtraction
			when "110" => Y <= '0';   --increment
			when "111" => Y <= '1';   --decrement
			when others => Y <= '0';  --logical operations
		end case;
	end process;
end imp; 


	--Y <= ( S(2) and S(0) and (S(1) or (not B) ) ) or ( S(2) and  (not S(1)) and (not S(0)) and B);
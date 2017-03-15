library ieee;
use ieee.std_logic_1164.all;


entity LogicExtender is port(
		
	S  : in std_logic_vector(2 downto 0);
	A,B: in std_logic;
	X : out std_logic);

end LogicExtender;


architecture imp of LogicExtender is

begin
	process(S,A,B)
	begin
		case S is
			when "000" => X <= A;      --pass through
			when "001" => X <= A and B;--AND
			when "010" => X <= A or B; --OR
			when "011" => X <= not A;  --NOT
			when others => X<= A;      --Arithmetic Operations
		end case;
	end process;
end imp; 



	--X <= (S(2) and A) or ((not S(0)) and A) or ((not S(1)) and A and B) or ((not S(2)) and S(1) and (not A) and (B or S(0)));
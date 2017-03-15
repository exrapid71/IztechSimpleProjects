library ieee;
use ieee.std_logic_1164.all;

entity Mux_4to1_8bit is 
port(
	S : in std_logic_vector(1 downto 0);
	D0,D1,D2,D3 : in std_logic_vector(7 downto 0);
	Y : out std_logic_vector(7 downto 0)
);
end Mux_4to1_8bit;

architecture imp of Mux_4to1_8bit is 
begin 
	Process(S,D0,D1,D2,D3)
	begin 
		Case S is
			when "00" => Y <= D0;
			when "01" => Y <= D1;
			when "10" => Y <= D2;
			when "11" => Y <= D3;
			when others => Y <= (others => 'X');
		end Case;
	end Process;
end imp;

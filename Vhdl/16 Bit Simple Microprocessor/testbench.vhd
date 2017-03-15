library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is port(
	adresbusout :				out std_logic_vector(15 downto 0);
	databusout :				out std_logic_vector(15 downto 0));
end testbench;

architecture imp of testbench is
	
	signal clockSig :			std_logic;
	signal resetSig :			std_logic;
	signal opfetchSig :			std_logic;
	signal addressSig :			std_logic_vector(15 downto 0);
	signal dataSig :			std_logic_vector(15 downto 0);
		
	component uPabs3 is port(
		clk :					in std_logic;
		rst :					in std_logic;
		opfetch :				out std_logic;
		A :						out std_logic_vector(15 downto 0);
		D :						in std_logic_vector(15 downto 0));
	end component;
	
	component ROM_1024_16 is port ( 
		oe:						in std_logic;
		address : 				in std_logic_vector(15 downto 0);
		data : 					inout std_logic_vector(15 downto 0));
	end component;
	
	component clock is port(
		clock :					out std_logic;
		reset :					out std_logic);
	end component;
	
	component RAM_1024 is port(
		clock   : in  std_logic;-- chip select
    		we      : in  std_logic;-- write/ read enable
    		address : in  std_logic_vector(2 downto 0);
    		datain  : in  std_logic_vector(15 downto 0);
    		dataout : out std_logic_vector(15 downto 0));
	end component;
	
begin
	ROM : ROM_1024_16 port map(oe=>opfetchSig, address=>addressSig, data=>dataSig);
	C_UPABS3 : uPabs3 port map(clk=>clockSig, rst=>resetSig, opfetch=>opfetchSig, A=>addressSig, D=>dataSig);
	C_CLOCK : clock port map(clock=>clockSig, reset=>resetSig);
	RAM : RAM_1024 port map(clock=>clockSig,we=>opfetchSig,address=>dataSig(10 downto 8), datain=>dataSig,  dataout=>dataSig );
	adresbusout <= addressSig;
	databusout <=dataSig;
end imp;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity dataPath is port(
	clk : 					in std_logic;
	reset : 				in std_logic;
	WR: 					in std_logic;
	RD: 					in std_logic;
	den1: 					in std_logic;
	den2: 					in std_logic;
	aen: 					in std_logic;
	pcen: 					in std_logic;
	SPload: 				in std_logic;
	PCload : 				in std_logic;
	IRload : 				in std_logic;
	Psel : 					in std_logic_vector(1 downto 0);
	Ssel : 					in std_logic_vector(1 downto 0);
	ALUsel : 				in std_logic_vector (4 downto 0);
	Rsel : 					in std_logic_vector(1 downto 0);
	sub2: 					in std_logic;
	jmpMux : 				in std_logic;
	rbe : 				  	in std_logic;
	rae : 				 	in std_logic;
	we : 					in std_logic;
	
	zero: 				  	out std_logic;
	outDatabus: 			in std_logic_vector(15 downto 0);
	IRoutput: 				out std_logic_vector (4 downto 0);
	outAddressBus: 			out std_logic_vector(15 downto 0)
);
end dataPath;

architecture struct of dataPath is
-----------------SIGNALS-------------------
signal mux1 : 				std_logic_vector (15 downto 0);
signal mux2 :				std_logic_vector (15 downto 0); 
signal mux3 : 				std_logic_vector (15 downto 0);
signal mux4 : 				std_logic_vector (15 downto 0);
signal pcSignal : 			std_logic_vector (15 downto 0);
signal stackPSignal : 		std_logic_vector (15 downto 0);
signal addSubSignal : 		std_logic_vector (15 downto 0);
signal irSignal : 			std_logic_vector (15 downto 0);
signal aluSignal : 			std_logic_vector (15 downto 0);
signal portA : 				std_logic_vector (15 downto 0);
signal portB : 				std_logic_vector (15 downto 0);
signal mux02in : 			std_logic_vector (15 downto 0);
signal dataSignal :			std_logic_vector (15 downto 0);

--signal mux02S :				std_logic_vector (1 downto 0);
signal wa : 				std_logic_vector (2 downto 0);
signal raa: 				std_logic_vector (2 downto 0);
signal rba: 				std_logic_vector (2 downto 0);

signal mux03S :      		std_logic_vector (15 downto 0);
signal signed_overflow : 	std_logic;
signal unsigned_overflow :  std_logic;
signal carry :	 			std_logic;
signal subSignal : 			std_logic;
------------- RegisterFile ---------------
component regfile is port(
   clk:            			in std_logic;
   reset:          			in std_logic;      
   we:             			in std_logic;
   WA:             			in std_logic_vector(2 downto 0);
   D:              			in std_logic_vector(15 downto 0);
   rbe:            			in std_logic;
   rae:            			in std_logic;
   RAA:           			in std_logic_vector(2 downto 0);
   RBA:            			in std_logic_vector(2 downto 0);
   portA:          			out std_logic_vector(15 downto 0);
   portB:          			out std_logic_vector(15 downto 0));
end component;
--------ALU---------
component ALU is port (
    S:                   	in std_logic_vector(4 downto 0);
    A, B:                	in std_logic_vector(15 downto 0);
    F:                   	out std_logic_vector(15 downto 0);
    unsigned_overflow:  	out std_logic;
    signed_overflow:    	out std_logic;
    carry:               	out std_logic;
    zero:              		out std_logic);
end component;
-------------16_bit_mux4------------------
component mux4_16bit is port(
    S : 					in std_logic_vector(1 downto 0);
    x0,x1,x2,x3 : 			in std_logic_vector (15 downto 0);
    y :				 		out std_logic_vector (15 downto 0));
end component;
---------ProgramCounter------------------
component PC is port(
    clk : 					in std_logic;
    reset : 				in std_logic;
    load : 					in std_logic;
    INPUT : 				in std_logic_vector (15 downto 0);
    OUTPUT : 				out std_logic_vector (15 downto 0));
end component;
-----------InstructionRegister-------------
component IR_16bit is port(
	clk : 					in std_logic;
	reset : 				in std_logic;
	load : 					in std_logic;
	INPUT : 				in std_logic_vector (15 downto 0);
	OUTPUT : 				out std_logic_vector (15 downto 0));
end component;
---------------StackPointer-------------
component SP is port(
	clk : 					in std_logic;
	reset : 				in std_logic;
	SPload : 				in std_logic;
	INPUT : 				in std_logic_vector (15 downto 0);
	OUTPUT : 				out std_logic_vector (15 downto 0));
end component;
---------------ADDSUB-------------------
component addsub16 is port(
	A:						in std_logic_vector(15 downto 0);
	B:						in std_logic_vector(15 downto 0);
	F:						out std_logic_vector(15 downto 0);
	carryIn:				in std_logic;
	unsigned_overflow:		out std_logic;
	signed_overflow:		out std_logic);
end component;
------------BUFFER----------------------
component buf is port(
	clk,reset: 				in std_logic;
	input : 				in std_logic_vector (15 downto 0);
	output: 				out std_logic_vector(15 downto 0);
	enable: 				in std_logic);
end component;
------------ADRRESS-BUS----------------------
component adressbus is port(
   enable : 				in std_logic;
   input : 					in std_logic_vector(15 downto 0);
   output : 				out std_logic_vector(15 downto 0));
end component;
------------DATA-BUS----------------------
component databus is port(
	direction, enable : 	in std_logic;
	dataout :				in std_logic_vector(15 downto 0);
	datain : 				out std_logic_vector(15 downto 0));
end component;
-----------END OF COMPONENTS----------------
begin
-----------------------------------------------------------------------------------------------------------
subSignal <= jmpMux;
mux02in <= "000000" & irSignal(9 downto 0);
--mux02S <= '0' & jmpMux;
MUX01: mux4_16bit port map(S=>Psel,x0=>"ZZZZZZZZZZZZZZZZ",x1=>outDatabus,x2=>addSubSignal,x3=>"XXXXXXXXXXXXXXXX" ,y=>mux1);
PCounter: PC port map(clk=>clk,reset=>reset,load=>PCload,INPUT=>mux1,OUTPUT=>pcSignal);
ADDSUB: addsub16 port map(carryIn=>subSignal, A=>pcSignal, B=>mux2, unsigned_overflow=>unsigned_overflow, signed_overflow=>signed_overflow, F=>addsubSignal);
MUX02 : mux4_16bit port map(S=>"00", x0=>"0000000000000001", x1=>mux02in, x2=>"XXXXXXXXXXXXXXXX",x3=>"XXXXXXXXXXXXXXXX",y=>mux2);
IRes : IR_16bit port map(clk=>clk,reset=>reset,load=>IRload,INPUT=>outDatabus,OUTPUT=>irSignal);
SPointer : SP port map(clk=>clk, reset=>reset, SPload=>SPload, INPUT=>addsubSignal, OUTPUT=>stackPSignal);
------------------------------------------------------------------------------------------------------------
wa <= irSignal(10 downto 8);
raa <= irSignal(7 downto 5);
mux03S <= "00000000" & irSignal(7 downto 0);
MUX03 : mux4_16bit port map(S=>Rsel,x0=>mux03S,x1=>"0000000000000000",x2=>portA,x3=>"XXXXXXXXXXXXXXXX",y=>mux3);
C_ALU : ALU port map(S=>ALUsel,A=>mux3,B=>outDatabus,signed_overflow=>signed_overflow,unsigned_overflow=>unsigned_overflow,carry=>carry,zero=>zero, F=>aluSignal);
REGISTERFILE : regfile port map(clk=>clk, reset=>reset, D=>aluSignal,WE=>we,WA=>wa,RAA=>raa,RAE=>rae,RBE=>rbe,RBA=>irSignal(4 downto 2),portA=>portA,portB=>portB);
MUX04 : mux4_16bit port map(S=>Ssel,x0=>portA,x1=>pcSignal,x2=>stackPSignal,x3=>"XXXXXXXXXXXXXXXX",y=>mux4);
ADDRESSBUS : adressbus port map(enable=>aen, input=>mux4, output=>outAddressBus);
--ADDRESSBUS2 : adressbus port map(enable=>pcen, input=>pcSignal, output=>outDatabus);
C_DATABUS : databus port map(direction=>den1, enable=>den2, dataout=>outDatabus, datain=>dataSignal);
IRoutput <= irSignal(15 downto 11);
------------------------------------------
end struct;
 
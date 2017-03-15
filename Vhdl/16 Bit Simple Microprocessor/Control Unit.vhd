library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity controller is port(
	clk:		in std_logic;
	rst:		in std_logic;
	zero:		in std_logic;
	IR:			in std_logic_vector(4 downto 0);
	
	ALUsel:		out std_logic_vector (4 downto 0);
	Ssel:		out std_logic_vector (1 downto 0);
	Rsel:		out std_logic_vector (1 downto 0);
	Psel:		out std_logic_vector (1 downto 0);
	aen:		out std_logic;
	den1:		out std_logic;
	den2:		out std_logic;
	pcen:		out std_logic;
	opfetch:	out std_logic;
	PCload:		out std_logic;
	SPload:		out std_logic;
	IRload:		out std_logic;
	wR:			out std_logic;
	RD:			out std_logic;
	jmpMux:		out std_logic;
	Sub2:		out std_logic;
	rbe:		out std_logic;
	rae:		out std_logic;
	we:			out std_logic);
end controller;

architecture imp of controller is
	type state_type is(
		s_start,
		s_fetch,
		s_decode,
		s_mov,
		s_add,
		s_sub,
		s_and,
		s_or,
		s_not,
		s_inc,
		s_dec,
		s_sr,
		s_sl,
		s_rr,
		s_clear,
		s_jmp,
		s_jz,
		s_jnz,
		s_call,
		s_ret,
		s_nop,
		s_halt,
		s_push,
		s_pop,
		s_write,
		s_read,
		s_movi,
		s_wait1,
		s_wait2,
		s_wait3);
	   
	signal state: state_type := s_start;
begin
	next_state_logic: process(rst, clk)
	begin
		if(rst='1') then
			state <= s_start;
		elsif(clk'event and clk ='1') then
			case state is
				when s_start => state <= s_fetch;
				when s_fetch => state <= s_decode;
				when s_decode =>
					case IR is
					when "00000" => state <= s_mov;    
                        when "00001" => state <= s_add;
                        when "00010" => state <= s_sub;
                        when "00011" => state <= s_and;
                        when "00100" => state <= s_or;
                        when "00101" => state <= s_not;
                        when "00110" => state <= s_inc;
                        when "00111" => state <= s_dec;
                        when "01000" => state <= s_sr;
                        when "01001" => state <= s_sl;
                        when "01010" => state <= s_rr;
                        when "01011" => state <= s_clear;
                        when "01100" => state <= s_jmp;
                        			when "01101" => state <= s_jz;
                        			when "01110" => state <= s_jnz;
                        			when "01111" => state <= s_call;
                        			when "10000" => state <= s_ret;
                       		 		when "10001" => state <= s_nop;
                        			when "10010" => state <= s_halt;
                        			when "10011" => state <= s_push;
                        			when "10100" => state <= s_pop;
                        			when "10101" => state <= s_write;
                   				when "10110" => state <= s_read;
                       				when "10111" => state <= s_movi;
						when others => state <= s_start;
					end case;
				when others => state <= s_fetch;
			end case;
		end if;
	end process;

	output_logic: Process(state) 
	begin
		case state is
			when s_mov => 
				IRload <= '0';
				jmpMux <= '1';
				opfetch <= '1';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "10";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '1';
				RD <= '1';
				Sub2 <= '0';
				rbe <= '0';
				rae <= '1';
				we <= '1';
			when s_movi => 
				IRload <= '0';
				jmpMux <= '1';
				opfetch <= '1';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "00";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '1';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '0';
				rae <= '0';
				we <= '1';
			when s_fetch => 
				IRload <= '1';
				jmpMux <= '0';
				opfetch <= '1';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "00";
				Psel <= "10";
				aen <= '1';
				den1 <= '1';
				den2 <= '1';
				pcen <= '0';
				PCload <= '1';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
			when s_jmp =>
				IRload <= '0';
				jmpMux <= '1';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "00";
				Rsel <= "10";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '1';
				pcen <= '1';
				PCload <= '1';
				SPload <= '0';
				wR <= '1';
				RD <= '1';
				Sub2 <= '0';
				rbe <= '0';
				rae <= '1';
				we <= '1';
			when s_nop =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
			
			when s_add =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_sub =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_and =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_or =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_not =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_inc =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_dec =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_sr =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_sl =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
				when s_rr =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_clear =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_jz =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_jnz =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_call =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_ret =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_halt =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_push =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_pop =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_write =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';				
				when s_read =>
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "01";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '1';
				rae <= '0';
				we <= '0';
			
			when others => 
				IRload <= '0';
				jmpMux <= '0';
				opfetch <= '0';
				ALUsel <= "00000";
				Ssel <= "00";
				Rsel <= "01";
				Psel <= "10";
				aen <= '0';
				den1 <= '0';
				den2 <= '0';
				pcen <= '0';
				PCload <= '0';
				SPload <= '0';
				wR <= '0';
				RD <= '0';
				Sub2 <= '0';
				rbe <= '0';
				rae <= '0';
				we <= '0';
			end case;
	end process;
end imp;
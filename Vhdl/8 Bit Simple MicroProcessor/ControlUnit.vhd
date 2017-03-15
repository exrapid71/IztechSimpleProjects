LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE IEEE.STD_LOGIC_ARITH.ALL;
  USE IEEE.STD_LOGIC_UNSIGNED.ALL;
  USE IEEE.NUMERIC_STD.ALL;
  
ENTITY CONTROL_UNIT IS PORT(
  Cclk, Creset, CAeq, Cint : IN STD_LOGIC;
  CIR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  Cwr, Crd, CintA, Cpush, Cpop, CPCLoad, CDir, CjmpMux, CopFetch, Cwe, Crbe : OUT STD_LOGIC;
  CALUSel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
  CAsel, CSsel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
  CIRLoad, CEn : OUT STD_LOGIC_VECTOR(1 TO 2));
END CONTROL_UNIT;

ARCHITECTURE BEHAVIORAL_CONTROL_UNIT OF CONTROL_UNIT IS
  
  TYPE STATE_TYPE IS(
    S_START,
    S_FETCH1,
    S_DEC1,
    S_FETCH2,
    S_MOV,
    S_STA,
    S_LDA,
    S_ADDA,
    S_SUBA,
    S_INC,
    S_MOVI,
    S_JNZ,
    S_JMP,
    S_CALL,
    S_NOP,
    S_RET,
    S_NOT,
    S_ORA,
    S_ANDA,
    S_DEC
    );
    
  SIGNAL state    : STATE_TYPE := S_START;
	SIGNAL clkCount : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
  PROCESS(Creset, Cclk) --Next state process.
    BEGIN
      IF(Creset = '1') THEN
        state <= S_START;
        clkCount <= "00000000";
      ELSIF(Cclk'EVENT AND Cclk = '1') THEN
        clkCount <= clkCount + 1;
        CASE state IS
          WHEN S_START => state <= S_FETCH1;
          WHEN S_FETCH1 => state <= S_DEC1;
          WHEN S_DEC1 => 
            CASE CIR(7 DOWNTO 4) IS
              WHEN "0000" => state <= S_FETCH2;
              WHEN "0001" => state <= S_NOP;
              WHEN "0010" => state <= S_LDA;
              WHEN "0011" => state <= S_DEC;
              WHEN "0100" => state <= S_ADDA;
              WHEN "0101" => state <= S_FETCH2;
              WHEN "0110" => state <= S_FETCH2;
              WHEN "0111" => state <= S_ANDA;
              WHEN "1000" => state <= S_INC;
              WHEN "1001" => state <= S_ORA;
              WHEN "1010" => state <= S_RET;
              WHEN "1011" => state <= S_NOT;
              WHEN "1100" => state <= S_STA;
              WHEN "1101" => state <= S_SUBA;
              WHEN "1110" => state <= S_FETCH2;
              WHEN "1111" => state <= S_MOV;
              WHEN OTHERS => state <= S_FETCH1;
            END CASE;
          WHEN S_FETCH2 =>
            CASE CIR(7 DOWNTO 4) IS
              WHEN "0101" => state <= S_MOVI;
              WHEN "0000" => state <= S_JNZ;
              WHEN "0110" => state <= S_CALL;
              WHEN "1110" => state <= S_JMP;
              WHEN OTHERS => state <= S_FETCH1;
            END CASE;
          WHEN OTHERS => state <= S_FETCH1;
        END CASE;
      END IF;
  END PROCESS;
    
  PROCESS(STATE) --Output logic.
  BEGIN
      CASE state IS
        WHEN S_START => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "XXXXX";
          CAsel <= "XX";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_FETCH1 => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '1';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '1';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "XXXXX";
          CAsel <= "XX";
          CSsel <= "01";
          CIRLoad <= "10";
          CEn <= "11";
        WHEN S_DEC1 => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "XXXXX";
          CAsel <= "XX";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_FETCH2 => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '1';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '1';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "XXXXX";
          CAsel <= "XX";
          CSsel <= "01";
          CIRLoad <= "01";
          CEn <= "11";
        WHEN S_MOV => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "XX";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_STA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_LDA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_ADDA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00100";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_SUBA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00101";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_INC => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00110";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_MOVI => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "10";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_JNZ => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= CAeq;
          CDir <= '0';
          CjmpMux <= '1';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_JMP => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '1';
          CDir <= '0';
          CjmpMux <= '1';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_CALL => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '1';
          Cpop <= '0';
          CPCLoad <= '1';
          CDir <= '0';
          CjmpMux <= '1';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_NOP => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "01";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_RET => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '1';
          CPCLoad <= '1';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "00000";
          CAsel <= "00";
          CSsel <= "10";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_NOT => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00011";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_ORA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00010";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_ANDA => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00001";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN S_DEC => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '1';
          Crbe <= '1';
          CALUSel <= "00111";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
        WHEN OTHERS => 
          Cwr <= '0';
          Crd <= '0';
          CintA <= 'X';
          Cpush <= '0';
          Cpop <= '0';
          CPCLoad <= '0';
          CDir <= '0';
          CjmpMux <= '0';
          CopFetch <= '0';
          Cwe <= '0';
          Crbe <= '1';
          CALUSel <= "XXXXX";
          CAsel <= "00";
          CSsel <= "01";
          CIRLoad <= "00";
          CEn <= "11";
      END CASE;
  END PROCESS;
END BEHAVIORAL_CONTROL_UNIT;

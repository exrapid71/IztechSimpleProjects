LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  
ENTITY PROGRAM_COUNTER IS PORT(
    load : IN STD_LOGIC;
    reset  : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    inputPC : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    outputPC : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END PROGRAM_COUNTER;

ARCHITECTURE STRUCTURAL_PROGRAM_COUNTER OF PROGRAM_COUNTER IS
  COMPONENT REGISTER_8BIT IS PORT(
    input  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  SUBTYPE reg IS STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL regIn : reg := "00000000";
BEGIN
  PROCESS(clk, reset, load)
    BEGIN      
      
      IF(clk'EVENT AND clk = '1') THEN
      
        IF(reset = '1') THEN
          regIn <= (OTHERS => '0');
        ELSIF(load = '1') THEN
          regIn <= inputPC;
        END IF; --Reset control     
        
      END IF; --Clock control
    END PROCESS;
    
 U0 : REGISTER_8BIT PORT MAP(regIn, outputPC);
  
END STRUCTURAL_PROGRAM_COUNTER;
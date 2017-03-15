LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFTER IS PORT(
  sel           :   IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  input         :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  output        :   OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  carryOut, zer :   OUT STD_LOGIC);
END SHIFTER;

ARCHITECTURE SHIFTER_STRUCTURAL OF SHIFTER IS
BEGIN
    PROCESS(sel, input)
    BEGIN
      
       IF(input = "00000000") THEN
           zer <= '0';
       ELSE
           zer <= '1';
       END IF;
      
       IF(sel = "00") THEN  --Maintain the value of input
          output <= input;
          carryOut <= '0';
       ELSIF(sel = "01") THEN  --Shift left and fill with 0
          carryOut <= input(7);
          output(7 DOWNTO 1) <= input(6 DOWNTO 0);
          output(0) <= '0';
       ELSIF(sel = "10") THEN  --Shift right and fill with 0
          carryOut <= input(0);
          output(6 DOWNTO 0) <= input(7 DOWNTO 1);
          output(7) <= '0';
       ELSE  --Rotate right
          output(7) <= input(0);
          output(6 DOWNTO 0) <= input(7 DOWNTO 1);
          carryOut <= '0';
       END IF;
    END PROCESS;
END SHIFTER_STRUCTURAL;
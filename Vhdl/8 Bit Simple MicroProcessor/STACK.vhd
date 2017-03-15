LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE IEEE.STD_LOGIC_ARITH.ALL;
  USE IEEE.STD_LOGIC_UNSIGNED.ALL;
  USE IEEE.NUMERIC_STD.ALL;

ENTITY STACK IS PORT(
  clk       : IN STD_LOGIC;
  push      : IN STD_LOGIC;
  pop       : IN STD_LOGIC;
  reset     : IN STD_LOGIC;
  inputST   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  outputST  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END STACK;

ARCHITECTURE STRUCTURAL_STACK OF STACK IS
  --COMPONENT REGISTER_8BIT IS PORT(
  --input  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  --output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  --END COMPONENT;
  SUBTYPE reg IS STD_LOGIC_VECTOR(7 DOWNTO 0);
  TYPE regArray IS ARRAY(0 TO 3) OF reg;
  SIGNAL SF : regArray;
BEGIN
  PROCESS(clk)
    VARIABLE index : INTEGER := 3;
  BEGIN
    IF(clk'EVENT AND clk = '1') THEN
      IF(reset = '1') THEN
        SF(0) <= (OTHERS => '0');
        SF(1) <= (OTHERS => '0');
        SF(2) <= (OTHERS => '0');
        SF(3) <= (OTHERS => '0');
      ELSIF(push = '1') THEN
        SF(index) <= inputST + '1';
        index := index - 1;
        IF(index = -1) THEN
          index := 3;
        END IF;
      ELSIF(pop = '1') THEN
        index := index + 1;
        IF(index = 3) THEN
          index := 0;
        END IF;
        outputST <= SF(index);
      END IF;
    END IF;
  END PROCESS;
END STRUCTURAL_STACK;
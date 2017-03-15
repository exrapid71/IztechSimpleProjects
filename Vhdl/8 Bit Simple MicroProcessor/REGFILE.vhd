LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE IEEE.STD_LOGIC_ARITH.ALL;
  USE IEEE.STD_LOGIC_UNSIGNED.ALL;
  USE IEEE.NUMERIC_STD.ALL;
  
ENTITY REGFILE IS PORT(
  clk, rbe, reset, we : IN STD_LOGIC;
  wa, RBA             : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  d                   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  portA, portB        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END REGFILE;

ARCHITECTURE STRUCTURAL_REGFILE OF REGFILE IS
  SUBTYPE reg IS STD_LOGIC_VECTOR(7 DOWNTO 0);
  TYPE regArray IS ARRAY(0 TO 3) OF reg;
  SIGNAL RF : regArray;
  
BEGIN
  PROCESS(clk,reset)
  BEGIN
    IF(clk'EVENT AND clk = '1') THEN
      IF(reset = '1') THEN
        RF(0) <= (OTHERS => '0');
        RF(1) <= (OTHERS => '0');
        RF(2) <= (OTHERS => '0');
        RF(3) <= (OTHERS => '0');
      ELSIF(we = '1') THEN
        RF(conv_integer(wa)) <= D;
      END IF;
    END IF;
  END PROCESS;
  
  PROCESS(rbe, rba)
  BEGIN
    IF(rbe = '1') THEN
      portB <= RF(conv_integer(rba));
    ELSE
      portB <= (OTHERS => 'X');
    END IF;
  END PROCESS;
  
  portA <= RF(0);
END STRUCTURAL_REGFILE;
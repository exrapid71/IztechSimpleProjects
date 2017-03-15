LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;

ENTITY IR IS PORT(
  clk      : IN STD_LOGIC;
  irLoad   : IN STD_LOGIC;
  irReset  : IN STD_LOGIC;
  inputIR  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  outputIR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));  
END IR;

ARCHITECTURE STRUCTURAL_IR OF IR IS

  COMPONENT REGISTER_8BIT IS PORT(
    input  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;

  SIGNAL irIn : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

PROCESS(clk)
BEGIN
  IF(clk'EVENT AND clk = '1') THEN
    IF(irReset = '1') THEN
      irIn <= (OTHERS => '0');
    ELSIF(irLoad = '1') THEN
      irIn <= inputIR;
    END IF;
  END IF;
END PROCESS;

U0 : REGISTER_8BIT PORT MAP(irIn, outputIR);

END STRUCTURAL_IR;
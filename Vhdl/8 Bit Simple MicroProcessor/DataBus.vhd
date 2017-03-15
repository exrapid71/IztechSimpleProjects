LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DATABUS IS PORT(
   direction, enable : IN STD_LOGIC;
   dataOut, dataIn : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END DATABUS;

ARCHITECTURE STRUCTURAL_DATABUS OF DATABUS IS
BEGIN
    PROCESS(enable, direction, dataIn, dataOut)
    BEGIN
        IF(enable = '1') THEN
           IF(direction = '0') THEN
              dataOut <= dataIn;
           ELSE
              dataIn <= dataOut;
           END IF;
        END IF;
    END PROCESS;
END STRUCTURAL_DATABUS;

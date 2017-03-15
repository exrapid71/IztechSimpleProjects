LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX IS PORT(
  sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  x0,x1,x2,x3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END MUX;

ARCHITECTURE MUX_STRUCTURAL OF MUX IS
    BEGIN
        PROCESS(sel, x0, x1, x2, x3)
        BEGIN
           CASE sel IS
              WHEN "00" => y <= x0;
              WHEN "01" => y <= x1;
              WHEN "10" => y <= x2;
              WHEN OTHERS => y <= x3;   
           END CASE;   
        END PROCESS;
    END MUX_STRUCTURAL;
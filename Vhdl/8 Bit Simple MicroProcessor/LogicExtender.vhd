LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY L_EXTENDER IS PORT(
      s   :   IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      a,b :   IN STD_LOGIC;
      x   :  OUT STD_LOGIC);
END L_EXTENDER;

ARCHITECTURE L_EXTENDER_STRUCTURAL OF L_EXTENDER IS
BEGIN
    PROCESS(s,a,b)
        BEGIN
            CASE s IS
                WHEN "001" => x <= a AND b;
                WHEN "010" => x <= a OR b;
                WHEN "011" => x <= NOT a; 
                WHEN OTHERS => x <= a;
            END CASE;
        END PROCESS;
END L_EXTENDER_STRUCTURAL;

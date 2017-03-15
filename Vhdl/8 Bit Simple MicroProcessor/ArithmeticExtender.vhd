LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY A_EXTENDER IS PORT(
      s   :   IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      b   :   IN STD_LOGIC;
      y   :   OUT STD_LOGIC);
END A_EXTENDER;

ARCHITECTURE A_EXTENDER_STRUCTURAL OF A_EXTENDER IS
BEGIN
    PROCESS(s,b)
        BEGIN
            CASE s IS
                WHEN "100" => y <= b;
                WHEN "101" => y <= NOT b;            
                WHEN "111" => y <= '1';
                WHEN OTHERS => y <= '0';
            END CASE;
        END PROCESS;
END A_EXTENDER_STRUCTURAL;
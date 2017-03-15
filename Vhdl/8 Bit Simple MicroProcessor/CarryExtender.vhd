LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY C_EXTENDER IS PORT(
      s   :   IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      c   :   OUT STD_LOGIC);
END C_EXTENDER;

ARCHITECTURE C_EXTENDER_STRUCTURAL OF C_EXTENDER IS
BEGIN
    PROCESS(s)
        BEGIN
            IF ((s = "101") OR (s = "110")) THEN
                c <= '1';
            ELSE
                c <= '0';
            END IF;
        END PROCESS;
END C_EXTENDER_STRUCTURAL;

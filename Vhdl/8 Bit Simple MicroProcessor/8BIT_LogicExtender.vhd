LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY L_EXTENDER_8BIT IS PORT(
      s   :   IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      a,b :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      x   :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END L_EXTENDER_8BIT;

ARCHITECTURE L_EXTENDER_8BIT_STRUCTURAL OF L_EXTENDER_8BIT IS
    COMPONENT L_EXTENDER IS PORT(
           s   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
           a,b : IN STD_LOGIC;
           x   : OUT STD_LOGIC);
    END COMPONENT;
BEGIN
    U0 : L_EXTENDER PORT MAP(s, a(0), b(0), x(0));
    U1 : L_EXTENDER PORT MAP(s, a(1), b(1), x(1));
    U2 : L_EXTENDER PORT MAP(s, a(2), b(2), x(2));
    U3 : L_EXTENDER PORT MAP(s, a(3), b(3), x(3));
    U4 : L_EXTENDER PORT MAP(s, a(4), b(4), x(4));
    U5 : L_EXTENDER PORT MAP(s, a(5), b(5), x(5));
    U6 : L_EXTENDER PORT MAP(s, a(6), b(6), x(6));
    U7 : L_EXTENDER PORT MAP(s, a(7), b(7), x(7));    
END L_EXTENDER_8BIT_STRUCTURAL;

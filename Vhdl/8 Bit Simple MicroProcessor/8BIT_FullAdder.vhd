LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FA_8BIT IS PORT(
      x0, y0    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cin       :   IN STD_LOGIC;
      f         :   OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      unsignedOverflow, signedOverflow :   OUT STD_LOGIC);
END FA_8BIT;

ARCHITECTURE FA_8BIT_STRUCTURAL OF FA_8BIT IS
    SIGNAL C : STD_LOGIC_VECTOR(7 DOWNTO 1);
    COMPONENT FA IS PORT(
         x0,y0,cin :    IN STD_LOGIC;
         cout,res  :    OUT STD_LOGIC);
    END COMPONENT;
BEGIN
      U0 : FA PORT MAP(x0(0), y0(0), cin , C(1), f(0));
      U1 : FA PORT MAP(x0(1), y0(1), C(1), C(2), f(1));
      U2 : FA PORT MAP(x0(2), y0(2), C(2), C(3), f(2));
      U3 : FA PORT MAP(x0(3), y0(3), C(3), C(4), f(3));
      U4 : FA PORT MAP(x0(4), y0(4), C(4), C(5), f(4));
      U5 : FA PORT MAP(x0(5), y0(5), C(5), C(6), f(5));
      U6 : FA PORT MAP(x0(6), y0(6), C(6), C(7), f(6));
      U7 : FA PORT MAP(x0(7), y0(7), C(7), unsignedOverflow, f(7));
      signedOverflow <= c(7) XOR c(6);
END FA_8BIT_STRUCTURAL;

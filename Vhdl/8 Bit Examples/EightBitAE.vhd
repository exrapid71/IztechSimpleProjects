Library ieee;
use ieee.std_Logic_1164.all;

entity EightBitAE is port(

    	S: in std_logic_vector(2 downto 0);
    	B: in std_logic_vector(7 downto 0);
   	Y: out std_logic_vector (7 downto 0));

end EightBitAE;

architecture imp of EightBitAE is 

    component ArithmeticExtender is port (

        S : in std_logic_vector(2 downto 0);
        B : in std_logic;
        Y : out std_logic);
    end component;

begin 
Out0: ArithmeticExtender port map(S,B(0),Y(0));
Out1: ArithmeticExtender port map(S,B(1),Y(1));
Out2: ArithmeticExtender port map(S,B(2),Y(2));
Out3: ArithmeticExtender port map(S,B(3),Y(3));
Out4: ArithmeticExtender port map(S,B(4),Y(4));
Out5: ArithmeticExtender port map(S,B(5),Y(5));
Out6: ArithmeticExtender port map(S,B(6),Y(6));
Out7: ArithmeticExtender port map(S,B(7),Y(7));
end imp;

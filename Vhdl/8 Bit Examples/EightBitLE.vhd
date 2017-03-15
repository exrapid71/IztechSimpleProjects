library ieee;
use ieee.std_logic_1164.all;

entity EightBitLE is port(

    S: in std_logic_vector(2 downto 0);
    A,B: in std_logic_vector(7 downto 0);
    X: out std_logic_vector (7 downto 0));

end EightBitLE;

architecture imp of EightBitLE is 

    component LogicExtender is port (

        S : in std_logic_vector(2 downto 0);
        A,B: in std_logic;
        X: out std_logic);
    end component;

begin 
 Out0: LogicExtender port map(S,A(0),B(0),X(0));
 Out1: LogicExtender port map(S,A(1),B(1),X(1));
 Out2: LogicExtender port map(S,A(2),B(2),X(2));
 Out3: LogicExtender port map(S,A(3),B(3),X(3));
 Out4: LogicExtender port map(S,A(4),B(4),X(4));
 Out5: LogicExtender port map(S,A(5),B(5),X(5));
 Out6: LogicExtender port map(S,A(6),B(6),X(6));
 Out7: LogicExtender port map(S,A(7),B(7),X(7));
end imp;


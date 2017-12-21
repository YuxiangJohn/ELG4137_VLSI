library IEEE ;
use IEEE.std_logic_1164.all ;

entity FULL_ADDER8 is 

port (A,B: in std_logic_vector(7 downto 0);
       Cin : in std_logic;
		 Cout : out std_logic;
      Sum : out std_logic_vector(7 downto 0));
end FULL_ADDER8;
architecture structure_view of FULL_ADDER8 is 

component FULL_ADDER
port (A,B,Cin : in std_logic;
 Sum, Cout: out std_logic);
end component;

signal C: std_logic_vector(6 downto 0);
begin
FA0:FULL_ADDER port map(A(0),B(0),Cin,Sum(0),C(0));
FA1:FULL_ADDER port map(A(1),B(1),C(0),Sum(1),C(1));
FA2:FULL_ADDER port map(A(2),B(2),C(1),Sum(2),C(2));
FA3:FULL_ADDER port map(A(3),B(3),C(2),Sum(3),C(3));
FA4:FULL_ADDER port map(A(4),B(4),C(3),Sum(4),C(4));
FA5:FULL_ADDER port map(A(5),B(5),C(4),Sum(5),C(5));
FA6:FULL_ADDER port map(A(6),B(6),C(5),Sum(6),C(6));
FA7:FULL_ADDER port map(A(7),B(7),C(6),Sum(7),Cout);
end structure_view;
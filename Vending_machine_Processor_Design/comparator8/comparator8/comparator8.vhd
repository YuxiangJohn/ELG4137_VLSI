library IEEE;

use IEEE.std_logic_1164.all;

entity comparator8 is

 port(A,B : in std_logic_vector(7 downto 0); 
     

  Cout,Dout,equal: out std_logic);

end comparator8;

architecture behavioral of comparator8 is

component comparator1
port(A,B,Ci,Di : in std_logic; 
 
  Cout,Dout,equal: out std_logic);

end component;

signal ground1,ground2:std_logic;
signal C,D:std_logic_vector(6 downto 0);
begin


--ground1<=0;
--ground2<=0;
G1:comparator1 port map(A(7),B(7),'0','0',C(6),D(6));
G2:comparator1 port map(A(6),B(6),C(6),D(6),C(5),D(5));
G3:comparator1 port map(A(5),B(5),C(5),D(5),C(4),D(4));
G4:comparator1 port map(A(4),B(4),C(4),D(4),C(3),D(3));
G5:comparator1 port map(A(3),B(3),C(3),D(3),C(2),D(2));
G6:comparator1 port map(A(2),B(2),C(2),D(2),C(1),D(1));
G7:comparator1 port map(A(1),B(1),C(1),D(1),C(0),D(0));
G8:comparator1 port map(A(0),B(0),C(0),D(0),Cout,Dout,equal);
end behavioral;
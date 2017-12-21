library IEEE;

use IEEE.std_logic_1164.all;

entity comparator1 is

 port(A,B,Ci,Di : in std_logic; 
 
  Cout,Dout,equal: out std_logic);

end comparator1;
library IEEE;

use IEEE.std_logic_1164.all;

--entity not_gate is

 --port(I : in std_logic; O : out std_logic);

--end not_gate;

--architecture behavioral of not_gate is

--begin

 --O <= not(I) after 10 ns;

--end behavioral;

library IEEE ;

use IEEE.std_logic_1164.all ;

--entity and_gate is

 --port(I1, I2:in std_logic;

 --O:out std_logic);

--end and_gate;

--architecture behavioral of and_gate is

-- begin
--
 --O <= (I1 and I2) after 10 ns;

--end behavioral;

--library IEEE ;

--use IEEE.std_logic_1164.all ;

--entity or_gate is

 --port(I1, I2:in std_logic;

 --O:out std_logic);

--end or_gate;

--architecture behavioral of or_gate is

 --begin

 --O <= (I1 or I2) after 10 ns;

--end behavioral;

library IEEE ;

use IEEE.std_logic_1164.all ;

--entity exor_gate is

 --port(I1, I2:in std_logic;

 --O:out std_logic);

--end exor_gate;

--architecture behavioral of exor_gate is

 --begin

 --O <= (I1 xor I2) after 10 ns;

--end behavioral;


architecture behavioral of comparator1 is

component not_gate
port(I : in std_logic; O : out std_logic);
end component;

component and_gate
port(I1,I2 : in std_logic; O : out std_logic);
end component;

component exor_gate
port(I1,I2 : in std_logic; O : out std_logic);
end component;
signal An,And1,Cn,And2,Dn,And3,NAND1,NAND2,Bn,And4,And5,And6,NAND3,NAND4,Dm,Cm,y: std_logic;
begin 
NO0:not_gate port map(A,An);
NO1:not_gate port map(Ci,Cn);
NO2:not_gate port map(Di,Dn);
AN0:and_gate port map(B,An,And1);
AN1:and_gate port map(Cn,And1,And2);
AN2:and_gate port map(And2,Dn,And3);
NO3:not_gate port map(And3,NAND1);
AN3:and_gate port map(Dn,NAND1,NAND2);
NO4:not_gate port map(NAND2,Dm);

Dout<=Dm;

NO5:not_gate port map(B,Bn);
AN4:and_gate port map(A,Bn,And4);
AN5:and_gate port map(And4,Dn,And5);
AN6:and_gate port map(And5,Cn,And6);
NO6:not_gate port map(And6,NAND3);
AN7:and_gate port map(Cn,NAND3,NAND4);
NO7:not_gate port map(NAND4,Cm); 

Cout<=Cm;

XO:exor_gate port map(Cm,Dm,y);
NO8:not_gate port map(y,equal);

end behavioral;

library IEEE ;
use IEEE.std_logic_1164.all ;

entity FULL_ADDER is 

port (A,B,Cin : in std_logic;

 Sum,Cout : out std_logic);

end FULL_ADDER;

architecture structure_view of FULL_ADDER is 

component half_adder_struct

port (A,B : in std_logic;

 Sum, Carry: out std_logic);

end component;

component or_gate 

port(I1,I2 : in std_logic; O : out std_logic);

end component;

signal Y0, Z0, Z1 : std_logic;

begin 

HA0: half_adder_struct port map(A,B,Y0,Z0);

HA1: half_adder_struct port map(Cin,Y0,Sum,Z1);

OG: or_gate port map (Z0, Z1, Cout);

end structure_view;


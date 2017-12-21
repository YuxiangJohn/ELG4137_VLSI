library IEEE;

use IEEE.std_logic_1164.all;
entity and_gate is

 port(I1, I2:in std_logic;

 O:out std_logic);

end and_gate;

architecture behavioral of and_gate is

 begin

 O <= (I1 and I2) after 10 ns;

end behavioral;
library IEEE;

use IEEE.std_logic_1164.all;

entity not_gate is

 port(I : in std_logic; O : out std_logic);

end not_gate;

architecture behavioral of not_gate is

begin

 O <= not(I) after 10 ns;

end behavioral;

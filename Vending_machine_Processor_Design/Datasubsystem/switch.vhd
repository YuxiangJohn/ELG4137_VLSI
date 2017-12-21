library IEEE;
use IEEE.std_logic_1164.all;

entity switch is

 port(I : in std_logic; 
 clk : in std_logic;
 O : out std_logic);
end switch;

architecture behavioral of switch is

begin
process(clk,I)
begin
if clk='1' then
O<=I after 10 ns;
end if; 
end process;
end behavioral;
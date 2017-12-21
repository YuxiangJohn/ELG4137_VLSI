library IEEE;
use IEEE.std_logic_1164.all;

entity invertor_clk is

 port(I : in std_logic; 
 clk : in std_logic;
 O : out std_logic);
end invertor_clk;

architecture behavioral of invertor_clk is
begin
process(clk,I)
begin
if clk='1' then
O<=not(I) after 10 ns;
else O<='0';
end if; 
end process;
end behavioral;
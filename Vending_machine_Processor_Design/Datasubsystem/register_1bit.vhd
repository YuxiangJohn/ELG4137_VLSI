library ieee;
use ieee.std_logic_1164.all;
entity register_1bit is
port (
	input: in std_logic;
	clk: in std_logic;
	rst: in std_logic;
	Q: out std_logic;
	Q_bar: out std_logic);
end register_1bit;
architecture bhv of register_1bit is
begin
process(clk)
begin
	if (clk'event and clk='1')
	then 
		if rst='1'
		then
			Q <= '0';
			Q_bar <= '1';
		else 
			Q <= input;
			Q_bar <= not (input);
		end if; 
	else end if;
end process;
end bhv;
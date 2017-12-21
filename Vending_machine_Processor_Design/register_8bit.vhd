library IEEE;
use IEEE.std_logic_1164.all;

entity register_8bit is

 port(I : in std_logic_vector(7 downto 0); 
 clk : in std_logic;
 reset : in std_logic;
 Q : out std_logic_vector(7 downto 0);
 Q_bar : out std_logic_vector(7 downto 0));
end register_8bit;

architecture structure_view of register_8bit is
component register_1bit
port (
	input: in std_logic;
	clk: in std_logic;
	rst: in std_logic;
	Q: out std_logic;
	Q_bar: out std_logic);
 end component;
 
 begin
 R0: register_1bit port map(I(0),clk,reset,Q(0),Q_bar(0));
 R1: register_1bit port map(I(1),clk,reset,Q(1),Q_bar(1));
 R2: register_1bit port map(I(2),clk,reset,Q(2),Q_bar(2));
 R3: register_1bit port map(I(3),clk,reset,Q(3),Q_bar(3));
 R4: register_1bit port map(I(4),clk,reset,Q(4),Q_bar(4));
 R5: register_1bit port map(I(5),clk,reset,Q(5),Q_bar(5));
 R6: register_1bit port map(I(6),clk,reset,Q(6),Q_bar(6));
 R7: register_1bit port map(I(7),clk,reset,Q(7),Q_bar(7));
 end structure_view;

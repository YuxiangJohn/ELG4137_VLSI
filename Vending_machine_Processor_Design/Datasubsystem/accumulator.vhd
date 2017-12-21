library IEEE ;
use IEEE.std_logic_1164.all ;

entity accumulator is 

port (data_in: in std_logic_vector(7 downto 0);
       clk : in std_logic;
		 reset : in std_logic;
      data_out : out std_logic_vector(7 downto 0));
end accumulator;
architecture structure_view of accumulator is 

component FULL_ADDER8
port (A,B: in std_logic_vector(7 downto 0);
       Cin : in std_logic;
		 Cout : out std_logic;
      Sum : out std_logic_vector(7 downto 0));
end component;
component register_8bit
port(I : in std_logic_vector(7 downto 0); 
 clk : in std_logic;
 reset : in std_logic;
 Q : out std_logic_vector(7 downto 0);
 Q_bar : out std_logic_vector(7 downto 0));
 end component;
 
signal data1,data_bar1,sum1:std_logic_vector(7 downto 0);
signal co:std_logic;
 
begin

A:FULL_ADDER8 port map(data_in, data1,'0',co,sum1);

R:register_8bit port map(sum1,clk,reset,data1,data_bar1);

data_out<=data1;

end structure_view;
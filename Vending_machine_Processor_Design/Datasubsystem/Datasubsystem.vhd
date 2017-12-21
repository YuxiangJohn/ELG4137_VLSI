library ieee;
use ieee.std_logic_1164.all;

entity Datasubsystem is 
port(  clk : in std_logic;
       C : in std_logic;
		 V : in std_logic_vector(7 downto 0);
		 S0: in std_logic_vector(7 downto 0);
		 S1: in std_logic_vector(7 downto 0);
		 choice : in std_logic;
		 reset : in std_logic;
		 
		 P : out std_logic_vector(7 downto 0);
		 E : out std_logic_vector(7 downto 0);
		 D : out std_logic_vector(1 downto 0);
		 COOOO,EQQQQ: out std_logic
);
end Datasubsystem;

architecture generalized of Datasubsystem is

component FULL_ADDER8
port (A,B: in std_logic_vector(7 downto 0);
       Cin : in std_logic;
		 Cout : out std_logic;
      Sum : out std_logic_vector(7 downto 0));
end component;

component register_1bit
port (
	input: in std_logic;
	clk: in std_logic;
	rst: in std_logic;
	Q: out std_logic;
	Q_bar: out std_logic);
 end component;

 component register_8bit
port(I : in std_logic_vector(7 downto 0); 
 clk : in std_logic;
 reset : in std_logic;
 Q : out std_logic_vector(7 downto 0);
 Q_bar : out std_logic_vector(7 downto 0));
 end component;

 component comparator8
port (A,B: in std_logic_vector(7 downto 0);
		 Cout,Dout,equal : out std_logic
      );
end component;

component accumulator
port (data_in: in std_logic_vector(7 downto 0);
       clk : in std_logic;
		 reset : in std_logic;
      data_out : out std_logic_vector(7 downto 0));
end component;

component mux is
port(
choice,clk:in std_logic;
S0,S1:in std_logic_vector(7 downto 0);
S:out std_logic_vector(7 downto 0)
);
end component;



signal M_c,sub_c,ACC_c,adder_c,resetR,Cout,Cout1,cho,CO,DO,EQ,AO:std_logic;
signal sum,sub,Q,Q2,Q_bar,Q2_bar,S,SN,QR,QR_bar,Q3_bar,SO:std_logic_vector ( 7 downto 0);
begin
A1: FULL_ADDER8 port map(V,QR,'0',Cout,sum);
P<=Q;
R:  register_8bit port map(sum,clk,ACC_c,QR,QR_bar);          ------register in accumulator
R1: register_8bit port map(sum,clk,adder_c,Q,Q_bar);          ------register control adder output
CP: comparator8 port map(Q,Q2,CO,DO,EQ);--Q=adder output Q2=S CO=Qda, DO=Q2da
M: mux port map(choice,clk,S0,S1,S);
R2: register_8bit port map(S,clk,M_c,Q2,Q2_bar);          ------mux output control
--SN<=not(S);
A3: FULL_ADDER8 port map(Q2_bar,"00000001",'0',AO,SO);
A2: FULL_ADDER8 port map(SO,Q,'0',Cout1,sub);
R3: register_8bit port map(sub,clk,sub_c,E,Q3_bar);          -----substrate output control
--R4: register_1bit port map(choice,clk,'0',cho); -----choice input control
       COOOO<=CO;
		 EQQQQ<=EQ;

end generalized;




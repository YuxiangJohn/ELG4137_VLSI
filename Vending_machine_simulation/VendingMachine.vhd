library ieee;
use ieee.std_logic_1164.all;

entity VendingMachine is 
port(  clk : in std_logic;
       C : in std_logic;
		 V : in std_logic_vector(7 downto 0);
		 S0: in std_logic_vector(7 downto 0);
		 S1: in std_logic_vector(7 downto 0);
		 choice : in std_logic;
		 reset : in std_logic;
		 
		 COOOO: out std_logic;
		 EQQQQ: out std_logic;
		 o : out std_logic_vector(2 downto 0);
		 P : out std_logic_vector(7 downto 0);
		 E : out std_logic_vector(7 downto 0);
		 D : out std_logic_vector(1 downto 0)
);
end VendingMachine;

architecture generalized of VendingMachine is
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
type stateT is (init,waiting,add,subtract);
	 signal state: stateT :=init;
signal M_c,sub_c,ACC_c,adder_c,resetR,Cout,Cout1,cho,CO,DO,EQ,AO:std_logic;
signal sum,sub,Q,Q2,Q_bar,Q2_bar,S,SN,QR,QR_bar,Q3_bar,SO:std_logic_vector ( 7 downto 0);
begin
------------------------------data path-----------------------------------------------------------------------------

A1: FULL_ADDER8 port map(V,QR,'0',Cout,sum);                  ----adder of accumulator                                     
R:  register_8bit port map(sum,clk,ACC_c,QR,QR_bar);          ------register in accumulator
R1: register_8bit port map(sum,clk,adder_c,Q,Q_bar);          ------register control adder output
CP: comparator8 port map(Q,Q2,CO,DO,EQ);                      ------compare
M: mux port map(choice,clk,S0,S1,S);                          ------mux
R2: register_8bit port map(S,clk,M_c,Q2,Q2_bar);              ------mux output control
A3: FULL_ADDER8 port map(Q2_bar,"00000001",'0',AO,SO);        ------subtract(add"00000001")
A2: FULL_ADDER8 port map(SO,Q,'0',Cout1,sub);                  ------subtract (add)         --qu fa jia yi
R3: register_8bit port map(sub,clk,sub_c,E,Q3_bar);          -----substrate output control
       P<=Q;
       COOOO<=CO;  ---- to see which is bigger
		 EQQQQ<=EQ;  ---- to see if they are equal

---------------------------control subsystem------------------------------------------------------------------------	 
process(clk)
begin
	   if(clk='1')then
		  case state is
		     when init =>                             --------000 (initial)
			  --M_c<='1';sub_c<='1'; adder_c<='1';
			    if(reset='0') then 
				 state<= waiting; o <="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';   ------jump to waiting
				 else state <=init; o <="000" ;M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';------jump to intial
				 end if;
			  
			  when waiting =>                          --------001 (waiting)
			
			  if(reset='0') then
			     if(C='1') then
			      state <= add;o<="010";M_c<='0';sub_c<='1'; adder_c<='0';ACC_c<='0';
					else state <= waiting;o<="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';------jump to waiting
					end if;
			
				else state <= init;o<="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';------jump to initial
				end if;	
				
			  when add =>                              -------010 (add)
			   
			  if(reset='0') then
			     if (CO='1' or EQ='1') then
				  state <= subtract;o<="011";M_c<='0';sub_c<='0'; adder_c<='0';ACC_c<='1';------jump to subtract
				  if(choice='0') then
				D<="01";
				else D<="10";
				end if;
				end if;
				else state <= init;o<="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';D<="00";------jump to initial
				
				end if;	
				  
			  when subtract =>                      -----------011 (subtract)
			  
			  if(reset='0') then
				if(choice='0') then
				D<="01";
				else D<="10";
				end if;
				state<= waiting;o<="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';D<="00";  -------jump to waiting
				else state <= init;o <="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';D<="00";-----jump to initial
				end if;
		 
		 
			end case;
			end if;
		end process;
		

end generalized;
library ieee;
use ieee.std_logic_1164.all;

entity statecontroller is 
port( 
clk : in std_logic;
choice: in std_logic;
reset : in std_logic;
C: in std_logic;
CO,EQ : in std_logic;
S: in std_logic_vector(7 downto 0);
 M_c,sub_c,adder_c,ACC_c: out std_logic;
 D: out std_logic_vector(1 downto 0);
o : out std_logic_vector(2 downto 0)
);
end statecontroller;

architecture generalized of statecontroller is
type stateT is (init,waiting,add,subtract);
	 signal state: stateT :=init;
	 
	 signal resetR,Cout,Cout1,cho,DO,AO:std_logic;
signal sum,sub,Q,Q2,Q_bar,Q2_bar,SN,QR,QR_bar,Q3_bar,SO:std_logic_vector ( 7 downto 0);
begin 
process(clk)
begin
	   if(clk='1')then
		  case state is
		     when init =>                             --------000 (initial)
			  --M_c<='1';sub_c<='1'; adder_c<='1';
			    if(reset='0') then 
				 state<= waiting; o <="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';
				 else state <=init; o <="000" ;M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';
				 end if;
			  
			  when waiting =>                          --------001 (waiting)
			
			  if(reset='0') then
			     if(C='1') then
			      state <= add;o<="010";M_c<='0';sub_c<='1'; adder_c<='0';ACC_c<='0';
					else state <= waiting;o<="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';
					end if;
			
				else state <= init;o<="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';
				end if;	
				
			  when add =>                              -------010 (add)
			   
			  if(reset='0') then
			     if (CO='1' or EQ='1') then
				  state <= subtract;o<="011";M_c<='0';sub_c<='0'; adder_c<='0';ACC_c<='1';
				  if(choice='0') then
				D<="01";
				else D<="10";
				end if;--D<="00";
				  --else if (C='0') then state <= waiting;o<="001";M_c<='0';sub_c<='1'; adder_c<='1';
				  --end if;
				end if;
				else state <= init;o<="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';D<="00";
				
				end if;	
				  
			  when subtract =>                      -----------011 (subtract)
			  
			if(reset='0') then
				if(choice='0') then
				D<="01";
				else D<="10";
				end if;
				state<= waiting;o<="001";M_c<='0';sub_c<='1'; adder_c<='1';ACC_c<='0';D<="00";
				else state <= init;o <="000";M_c<='1';sub_c<='1'; adder_c<='1';ACC_c<='1';D<="00";
				end if;
		 
		 
			end case;
			end if;
		end process;
end generalized;
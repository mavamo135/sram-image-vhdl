-------------------------------------------------------------------------------
--
-- Title       : VS
-- Design      : Vertical Synchronization
-- Author      : Maximiliano Valencia Moctezuma
-- Company     : Universidad Autonoma de Queretaro
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Electronica_Avanzada_2\Up_Down_Counter_Synchronous_Clear\Up_Down_Counter_Synchronous_Clear\Up_Down_Counter_Synchronous_Clear\src\Up_Down_Counter_Synchronous_Clear.vhd
-- Generated   : Tue Aug  4 16:51:42 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;   

entity VS is
	port(
		CLK		:in std_logic:='U';
		ARST	:in std_logic:='U';
		VS		:out std_logic:='0';
		ENVS	:out std_logic:='0'
		);	   
end VS;	 

architecture structural of VS is	 
	signal COMP_PW:std_logic:='0';	
	signal COMP_BP:std_logic:='0';	
	signal COMP_DIS:std_logic:='0';	
	signal COMP_FP:std_logic:='0';	  
	signal OPC1:std_logic_vector(1 downto 0):=(others=>'0');
	signal OPC2:std_logic_vector(1 downto 0):=(others=>'0');
	signal OPC3:std_logic_vector(1 downto 0):=(others=>'0');
	signal OPC4:std_logic_vector(1 downto 0):=(others=>'0');
	signal Q1:std_logic_vector(11 downto 0):=(others=>'0');
	signal Q2:std_logic_vector(15 downto 0):=(others=>'0');
	signal Q3:std_logic_vector(19 downto 0):=(others=>'0');
	signal Q4:std_logic_vector(15 downto 0):=(others=>'0');
begin
	
	U0:entity work.FSM_VS port map(CLK,ARST,COMP_PW,COMP_BP,COMP_DIS,COMP_FP,VS,ENVS,OPC1,OPC2,OPC3,OPC4);
	U1:entity work.Up_Counter_Synchronous_Clear generic map(12) port map(CLK,ARST,OPC1,Q1);
	U2:entity work.Up_Counter_Synchronous_Clear generic map(16) port map(CLK,ARST,OPC2,Q2);
	U3:entity work.Up_Counter_Synchronous_Clear generic map(20) port map(CLK,ARST,OPC3,Q3);
	U4:entity work.Up_Counter_Synchronous_Clear generic map(16) port map(CLK,ARST,OPC4,Q4);
	U5:entity work.Comparator generic map(12) port map(Q1,"011000111111",COMP_PW);
	U6:entity work.Comparator generic map(16) port map(Q2,"0101101010011111",COMP_BP);
	U7:entity work.Comparator generic map(20) port map(Q3,"01011101101111111111",COMP_DIS);
	U8:entity work.Comparator generic map(16) port map(Q4,"0001111100111111",COMP_FP);

end structural;				 


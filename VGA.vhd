-------------------------------------------------------------------------------
--
-- Title       : VGA
-- Design      : VGA
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

entity VGA is
	generic(
		N:integer:=10
		);
	port(
		CLK		:in std_logic:='U';
		ARST	:in std_logic:='U';
		H		:in std_logic:='0';
		VGA_CLK	:out std_logic:='0';
		VGA_BLANK:out std_logic:='0';
		VGA_HS	:out std_logic:='0';
		VGA_VS	:out std_logic:='0';
		VGA_SYNC:out std_logic:='0';
		VGA_ENHS:out std_logic:='0';
		VGA_ENVS:out std_logic:='0';
		R		:out std_logic_vector(N-1 downto 0):=(others=>'0');
		G		:out std_logic_vector(N-1 downto 0):=(others=>'0');
		B		:out std_logic_vector(N-1 downto 0):=(others=>'0')
		);	   
end VGA;	 

architecture structural of VGA is	 
	signal CLK1:std_logic:='0';
	signal ENHS:std_logic:='0';	
	signal ENVS:std_logic:='0';	
	signal FEHS:std_logic:='0';	
	signal OPC:std_logic_vector(1 downto 0):=(others=>'0');
	signal QH:std_logic_vector(11 downto 0):=(others=>'0');
	signal QV:std_logic_vector(11 downto 0):=(others=>'0');
begin
	
	U0:entity work.Frequency_Divider generic map(2) port map(CLK,ARST,"01",CLK1);
	U1:entity work.HS generic map(12) port map(CLK1,ARST,VGA_HS,ENHS,QH);
	U2:entity work.VS port map(CLK1,ARST,VGA_VS,ENVS);
	U3:entity work.Falling_Edge_Detector port map(CLK1,ARST,ENHS,FEHS);
	U4:entity work.OPC_Gen port map(FEHS,ENVS,OPC);
	U5:entity work.Up_Counter_Synchronous_Clear generic map(12) port map(CLK1,ARST,OPC,QV);
	U7:entity work.RGB generic map(10) port map(CLK1,H,ENHS,ENVS,R,G,B);

	VGA_BLANK <= ENHS and ENVS;
	VGA_SYNC <= '0';
	VGA_CLK <= CLK1;
	VGA_ENHS <= ENHS;
	VGA_ENVS <= ENVS;

end structural;				 


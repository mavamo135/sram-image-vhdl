-------------------------------------------------------------------------------
--
-- Title       : TOP
-- Design      : TOP
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

entity TOP is
	generic(
		N:integer:=10
		);
	port(
		CLK			:in std_logic:='U';
		ARST		:in std_logic:='U';
		RX			:in std_logic:='U';
		LED			:out std_logic:='0';
		VGA_CLK		:out std_logic:='0';
		VGA_BLANK	:out std_logic:='0';
		VGA_HS		:out std_logic:='0';
		VGA_VS		:out std_logic:='0';
		VGA_SYNC	:out std_logic:='0';
		R			:out std_logic_vector(N-1 downto 0):=(others=>'0');
		G			:out std_logic_vector(N-1 downto 0):=(others=>'0');
		B			:out std_logic_vector(N-1 downto 0):=(others=>'0');
		SRAM_DQ 	:inout std_logic_vector(15 downto 0):=(others=>'U');
		SRAM_ADDR	:out   std_logic_vector(17 downto 0):=(others=>'0');
		SRAM_CE		:out   std_logic:='0';
		SRAM_UB		:out   std_logic:='0';
		SRAM_LB		:out   std_logic:='0';
		SRAM_WE		:out   std_logic:='0';
		SRAM_OE		:out   std_logic:='0'	
	);	   
end TOP;	

architecture structural of TOP is
	 signal TX		:std_logic:='0'; 
	 signal EOTR	:std_logic:='0';
	 signal EOTT	:std_logic:='0'; 
	 signal RE_EOTR	:std_logic:='0';
	 signal COMP1	:std_logic:='0';
	 signal COMP2	:std_logic:='0';
	 signal MUX1	:std_logic:='0';
	 signal WR  	:std_logic:='0';
	 signal CLKVGA  :std_logic:='0';
	 signal CLKVGA_RE:std_logic:='0';
	 signal ENHS    :std_logic:='0';
	 signal ENVS	:std_logic:='0';
	 signal RE_CLKVGA:std_logic:='0';
	 signal BINO	:std_logic:='0';
	 signal OPC1	:std_logic_vector(1 downto 0):=(others=>'0');
	 signal OPC2	:std_logic_vector(1 downto 0):=(others=>'0');
	 signal OPC3	:std_logic_vector(1 downto 0):=(others=>'0');
	 signal DATRX	:std_logic_vector(7 downto 0):=(others=>'0');
	 signal Q1		:std_logic_vector(17 downto 0):=(others=>'0');
	 signal Q2		:std_logic_vector(3 downto 0):=(others=>'0');
	 signal Q3		:std_logic_vector(17 downto 0):=(others=>'0');
	 signal BIN		:std_logic_vector(15 downto 0):=(others=>'0');
	 signal DATA	:std_logic_vector(7 downto 0):=(others=>'0');
	 signal ADDR	:std_logic_vector(17 downto 0):=(others=>'0');
	 signal DATA_READ:std_logic_vector(15 downto 0):=(others=>'0');
begin

	U0:entity work.UART generic map(8) port map(CLK,ARST,RX,'1',(others=>'0'),TX,EOTR,EOTT,DATRX);
	U1:entity work.Rising_Edge_Detector port map(CLK,ARST,EOTR,RE_EOTR);
	U2:entity work.Hold_Register generic map(8) port map(CLK,ARST,RE_EOTR,DATRX,DATA);
	U3:entity work.Comparator generic map(18) port map(Q1,"001001011000000000",COMP1);
	U4:entity work.OPC_Gen port map(RE_EOTR,not(COMP1),OPC1);
	U5:entity work.Up_Counter_Synchronous_Clear generic map(18) port map(CLK,ARST,OPC1,Q1);
	U6:entity work.FF_JK port map(CLK,ARST,MUX1,MUX1,WR);
	U7:entity work.MUX1 port map(COMP1,'0',WR,MUX1);
	U8:entity work.MUX2 generic map(18) port map(Q1,Q3,WR,ADDR);
	U10:entity work.Rising_Edge_Detector port map(CLK,ARST,CLKVGA,RE_CLKVGA);
	U11:entity work.Comparator generic map(4) port map(Q2,"1000",COMP2);
	U12:entity work.OPC_Gen port map(RE_CLKVGA and ENHS,not(COMP2),OPC2);
	U13:entity work.Up_Counter_Synchronous_Clear generic map(4) port map(CLK,ARST,OPC2,Q2);
	U14:entity work.OPC_Gen port map(COMP2 and ENHS,ENVS,OPC3);
	U15:entity work.Up_Counter_Synchronous_Clear generic map(18) port map(CLK,ARST,OPC3,Q3);
	U16:entity work.SRAM port map("00000000" & DATA,ADDR,WR,SRAM_DQ,SRAM_ADDR,SRAM_CE,SRAM_UB,SRAM_LB,SRAM_WE,SRAM_OE,DATA_READ);
	U17:entity work.MUX3 generic map(8) port map(DATA_READ(7 downto 0),Q2,BINO);
	U18:entity work.VGA generic map(10) port map(CLK,ARST,BINO,VGA_CLK,VGA_BLANK,VGA_HS,VGA_VS,VGA_SYNC,ENHS,ENVS,R,G,B);
	U19:entity work.Frequency_Divider generic map(2) port map(CLK,ARST,"01",CLKVGA);
	
	LED <= WR;

end structural;				 


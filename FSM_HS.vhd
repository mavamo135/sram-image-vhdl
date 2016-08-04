-------------------------------------------------------------------------------
--
-- Title       : FSM_HS
-- Design      : Finite State Machine Horizontal Synchronization
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
-- Description : Finite State Machine
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Up_Down_Counter_Synchronous_Clear} architecture {Counter}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_HS is
	port( 
		CLK		:in	std_logic:='U';
		ARST	:in	std_logic:='U';
		COMP_PW	:in	std_logic:='U';
		COMP_BP	:in	std_logic:='U';
		COMP_DIS:in std_logic:='U';
		COMP_FP	:in std_logic:='U';	
		HS		:out std_logic:='0';
		ENHS	:out std_logic:='0';
		OPC1	:out std_logic_vector(1 downto 0):=(others=>'0');	
		OPC2	:out std_logic_vector(1 downto 0):=(others=>'0');	
		OPC3	:out std_logic_vector(1 downto 0):=(others=>'0');	
		OPC4	:out std_logic_vector(1 downto 0):=(others=>'0')
		);
end FSM_HS;

architecture Finite_State_Machine of FSM_HS is
	signal Qn:std_logic_vector(1 downto 0):=(others=>'0'); 
	signal Qp:std_logic_vector(1 downto 0):=(others=>'0');   
begin
	
	P1:process(Qp,COMP_PW,COMP_BP,COMP_DIS,COMP_FP)
	begin
		case Qp is
			when "00" =>
				HS	 <= '0';
				ENHS <= '0';
				OPC1 <= "01";	
				OPC2 <= "00";
				OPC3 <= "00";
				OPC4 <= "11";
				if (COMP_PW='1') then
					Qn <= "01";	
				else
					Qn <= Qp;
				end if;
			when "01" => 
				HS	 <= '1';
				ENHS <= '0';
				OPC1 <= "11";	
				OPC2 <= "01";
				OPC3 <= "00";
				OPC4 <= "00";
				if (COMP_BP='1') then
					Qn <= "10";	
				else
					Qn <= Qp;
				end if;
			when "10" =>  
				HS	 <= '1';
				ENHS <= '1';
				OPC1 <= "00";	
				OPC2 <= "11";
				OPC3 <= "01";
				OPC4 <= "00";
				if (COMP_DIS='1') then
					Qn <= "11";	
				else
					Qn <= Qp;
				end if;	
			when others =>  
				HS	 <= '1';
				ENHS <= '0';
				OPC1 <= "00";	
				OPC2 <= "00";
				OPC3 <= "11";
				OPC4 <= "01";
				if (COMP_FP='1') then
					Qn <= "00";	
				else
					Qn <= Qp;
				end if;
		end case;
	end process P1;  
	
	P2:process(CLK,ARST)
	begin
		if (ARST='0') then
			Qp <= (others=>'0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process P2;  	
	
end Finite_State_Machine;

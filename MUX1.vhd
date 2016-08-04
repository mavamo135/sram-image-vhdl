-------------------------------------------------------------------------------
--
-- Title       : MUX
-- Design      : MUX
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

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Up_Down_Counter_Synchronous_Clear} architecture {Counter}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX1 is
	port(
		D1 	:in std_logic:='U';
		D2 	:in std_logic:='U';
		OPC	:in std_logic:='U';
		Q	:out std_logic:='0'
		);
end MUX1;
																   
architecture Multiplexer of MUX1 is  
begin
	
	M:process(OPC,D1,D2)
	begin
		if (OPC='0') then
			Q <= D1;
		else
			Q <= D2;
		end if;
	end process M;  
	
	
end Multiplexer;

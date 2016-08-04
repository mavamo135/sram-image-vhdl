-------------------------------------------------------------------------------
--
-- Title       : OPC_Gen
-- Design      : OPC_Gen
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

entity OPC_Gen is
	port(
		OPC		:in std_logic:='U';
		Q		:in std_logic:='U';
		OPC1	:out std_logic_vector(1 downto 0):=(others=>'0')
		);	   
end OPC_Gen;	 

architecture behavioral of OPC_Gen is
begin
	
	process(OPC,Q)
	begin
		if (Q='0') then
			OPC1 <= "11";
		else
			if (OPC='1') then
				OPC1 <= "01";
			else
				OPC1 <= "00";
			end if;
		end if;
	end process;
	
end behavioral;
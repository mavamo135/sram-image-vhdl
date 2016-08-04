-------------------------------------------------------------------------------
--
-- Title       : RGB
-- Design      : RGB
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

entity RGB is
	generic(
		N:integer:=10
		);
	port(
		CLK :in std_logic:='U';
		COMP:in std_logic:='U';
		ENHS:in std_logic:='U';
		ENVS:in std_logic:='U';
		R	:out std_logic_vector(N-1 downto 0):=(others=>'0');
		G	:out std_logic_vector(N-1 downto 0):=(others=>'0');
		B	:out std_logic_vector(N-1 downto 0):=(others=>'0')	
		);	   
end RGB;	 

architecture Comp of RGB is
begin
	
	process(CLK,COMP,ENHS,ENVS)
	begin
	if (CLK'event and CLK='1') then
		if (ENHS='1' and ENVS='1' and COMP='1') then
				R <= (others=>'1');
				G <= (others=>'1');
				B <= (others=>'1');
			else
				R <= (others=>'0');
				G <= (others=>'0');
				B <= (others=>'0');
		end if;
	end if;
	end process;
	
end Comp;



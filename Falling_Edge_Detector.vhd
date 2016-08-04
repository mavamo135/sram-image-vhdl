--By Ing. Fortino Mendoza Mondragón 		 Date:18/08/2011
--E-Mail: fmm_haalk_ab@hotmail.com			 Rev 1.0		
--Description: Falling edge detector 
--Note:	Synchronous reset

library ieee ;
use ieee.std_logic_1164.all;

entity Falling_Edge_Detector is			      --Simplified Rising Edge Detector
	port ( 			  
		CLK : in STD_LOGIC:='U';	  --Clock signal
		ARST: in STD_LOGIC:='U';	  --Reset signal
		X   : in std_logic:='U';	  --Input Signal
		Y   : out std_logic     	  --Pulse 
		);
end Falling_Edge_Detector;

architecture RTL_Falling_Edge_Detector of Falling_Edge_Detector is	
	signal Q : std_logic:='0';
begin
	
	FF_D:process(ARST,CLK)
	begin
		if ARST='0' then
			Q<='0';
		elsif rising_edge(CLK) then
			Q<=X;
		end if;
	end process FF_D;  
	
	Y<= (Q) AND  (NOT X);	
	
end RTL_Falling_Edge_Detector; 
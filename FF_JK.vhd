library ieee; 
use ieee.std_logic_1164.all;

entity FF_JK is
port(
	CLK	:in	std_logic:='U';
	ARST:in std_logic:='U';
	J	:in std_logic:='U';
	K	:in	std_logic:='U';
	Q	:out std_logic:='0'
	);
end FF_JK;

architecture behavioral of FF_JK is
	signal Qi:std_logic:='0';
begin

	process(CLK,ARST,J,K,Qi)
	begin
		if (ARST='0') then
			Qi <= '0';
		elsif (CLK'event and CLK='1') then
			if (J='0' and K='0') then
				Qi <= Qi;
			elsif (J='1' and K='0') then
				Qi <= '1';
			elsif (J='0' and K='1') then
				Qi <= '0';
			else
				Qi <= not(Qi);
			end if;
		end if;
		Q <= Qi;
	end process;

end behavioral;
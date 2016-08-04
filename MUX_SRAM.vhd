library ieee;
use ieee.std_logic_1164.all;

entity MUX_SRAM is
generic(
	N:integer:=8
	);
port(
	A 	:in std_logic_vector(N-1 downto 0):=(others=>'U');
	OPC	:in std_logic:='U';
	C 	:out std_logic_vector(N-1 downto 0):=(others=>'0')
	);
end MUX_SRAM;

architecture Behavioral of MUX_SRAM is
begin
	
	process(OPC,A)
	begin
		if (OPC='0') then
			C <= A;
		else
			C <= (others=>'Z');
		end if;
	end process;

end Behavioral;
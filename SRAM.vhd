library ieee;
use ieee.std_logic_1164.all;

entity SRAM is
port(
	DATA		:in    std_logic_vector(15 downto 0):=(others=>'0');
	ADDR		:in    std_logic_vector(17 downto 0):=(others=>'0');
	WR			:in    std_logic:='0';
	SRAM_DQ 	:inout std_logic_vector(15 downto 0):=(others=>'U');
	SRAM_ADDR	:out   std_logic_vector(17 downto 0):=(others=>'0');
	SRAM_CE		:out   std_logic:='0';
	SRAM_UB		:out   std_logic:='0';
	SRAM_LB		:out   std_logic:='0';
	SRAM_WE		:out   std_logic:='0';
	SRAM_OE		:out   std_logic:='0';
	DATA_READ	:out   std_logic_vector(15 downto 0):=(others=>'0')
	);
end SRAM;

architecture Structural of SRAM is
	signal DATAI :std_logic_vector(15 downto 0):=(others=>'0');
	signal output:std_logic_vector(15 downto 0):=(others=>'0');
begin	
    SRAM_ADDR <= ADDR;
    U0:entity work.MUX_SRAM generic map(16) port map(DATA,WR,DATAI);
	SRAM_DQ   <= DATAI;
	output 	  <= SRAM_DQ;
    DATA_READ <= output;
    SRAM_WE   <= WR;
	SRAM_CE   <= '0';
	SRAM_UB   <= '0';
	SRAM_LB   <= '0';
	SRAM_OE   <= '0';
end Structural;
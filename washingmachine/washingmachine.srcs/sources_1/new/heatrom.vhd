--rom memory with input, output and chip select
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity heatrom is
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           cs_rom : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end heatrom;

architecture Behavioral of heatrom is

begin
process(input,cs_rom)
begin
if cs_rom='1' then
	case input is
		when "00"=> output<="00011110";
		when "01"=> output<="00110010";
		when "10"=> output<="01011010";
		when "11"=> output<="10010110";
		when others=> output<="ZZZZZZZZ";
	end case;
end if;
end process;

end Behavioral;
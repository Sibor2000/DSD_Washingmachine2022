--mux 8:1 blinker archblinker
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux8to1 is
    Port ( blinker : in  STD_LOGIC_VECTOR (7 downto 0);
           archblinker : out  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  enable : in std_logic);
end mux8to1;

architecture Behavioral of mux8to1 is

begin
process(blinker,sel,enable)
begin
if enable = '1' then
	case sel is
		when "000"=>archblinker<=blinker(0);
		when "001"=>archblinker<=blinker(1);
		when "010"=>archblinker<=blinker(2);
		when "011"=>archblinker<=blinker(3);
		when "100"=>archblinker<=blinker(4);
		when "101"=>archblinker<=blinker(5);
		when "110"=>archblinker<=blinker(6);
		when "111"=>archblinker<=blinker(7);
		when others=>archblinker<='Z';
	end case;
else
archblinker<='Z';
end if;
end process;
end Behavioral;
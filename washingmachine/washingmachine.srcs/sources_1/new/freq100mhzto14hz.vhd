--100mhz to 14 hz
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity freq100mhzto14hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk14Hz : out  STD_LOGIC);
end freq100mhzto14hz;

architecture Behavioral of freq100mhzto14hz is

signal count : integer :=0;
signal b : std_logic :='0';

begin

process(clk100Mhz)
begin
if(rising_edge(clk100Mhz))then
count<=count+1;
if(count = 3571429-1)then
b<= not b;
count<=0;
end if;
end if;
clk14Hz<=b;
end process;

end Behavioral;

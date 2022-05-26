--100mhz to 2 hz
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity freq100mhzto2hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk2Hz : out  STD_LOGIC);
end freq100mhzto2hz;

architecture Behavioral of freq100mhzto2hz is

signal count : integer :=0;
signal b : std_logic :='0';

begin

process(clk100Mhz)
begin
if(rising_edge(clk100Mhz))then
count<=count+1;
if(count = 25000000-1)then
b<= not b;
count<=0;
end if;
end if;
clk2Hz<=b;
end process;

end Behavioral;
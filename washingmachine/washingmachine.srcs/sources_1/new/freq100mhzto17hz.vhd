--100mhz to 17 hz
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity freq100mhzto17hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk17Hz : out  STD_LOGIC);
end freq100mhzto17hz;

architecture Behavioral of freq100mhzto17hz is

signal count : integer :=0;
signal b : std_logic :='0';

begin

process(clk100Mhz)
begin
if(rising_edge(clk100Mhz))then
count<=count+1;
if(count = 2941177-1)then
b<= not b;
count<=0;
end if;
end if;
clk17Hz<=b;
end process;

end Behavioral;

--clk divider de la 1 secunda la 1 minut
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity minutes is
    Port ( clk1Hz : in  STD_LOGIC;
           clk1min : out  STD_LOGIC);
end minutes;

architecture Behavioral of minutes is

signal count : integer :=0;
signal b : std_logic :='0';
begin
process(clk1Hz)
begin
if (rising_edge(clk1Hz)) then
count<=count+1;
if(count = 60-1) then
b<= not b;
count<=0;
end if;
end if;
clk1min<=b;
end process;

end Behavioral;

--semnal de ceas de la 100Mhz la 1 Hz

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity seconds is
port (clk100Mhz : in std_logic;
       clk1Hz : out std_logic
     );
end seconds;

architecture Behavioral of seconds is

signal count : integer :=0;
signal b : std_logic :='0';
begin
process(clk100Mhz) 
begin
if(rising_edge(clk100Mhz)) then
count <=count+1;
if(count = 50000000-1) then
b <= not b;
count <=0;
end if;
end if;
clk1Hz<=b;
end process;
end;
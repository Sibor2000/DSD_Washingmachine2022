--mux 2:1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2to1 is
    Port ( i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end mux2to1;

architecture Behavioral of mux2to1 is

begin
process(i0,i1,sel)
begin
if sel='1' then
output<=i1;
else
output<=i0;
end if;
end process;
end Behavioral;
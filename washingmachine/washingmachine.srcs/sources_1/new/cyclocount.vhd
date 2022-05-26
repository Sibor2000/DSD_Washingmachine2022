--counter special 5 to 0
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity cyclocount is
    Port ( clk : in  STD_LOGIC;
           cyclestart : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           pl: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           ple: in STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           pulse: out STD_logic);
end cyclocount;

architecture Behavioral of cyclocount is
signal v : std_logic_vector(3 downto 0);
begin
process(clk,ple) is
	begin
	if (clk'event and clk='1' and ple='1') then
	if(v="0000") then
	v<=cyclestart;
	pulse<='1';
	else 
	v<=v-1;
	pulse<='0';
	end if;
	end if;
	end process;
	
process(ple) is
begin
if (ple'event and ple='1') then
v<=pl;
end if;
end process;
q<=v;

end Behavioral;
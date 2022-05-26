--counter special 9 to 0
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity countdown9to0 is
    Port ( clk : in  STD_LOGIC;
           pl : in  STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";
			  start: in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  start2 : in std_logic_vector (3 downto 0);
			  enableStart2 : in std_logic;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           down: out std_logic);
end countdown9to0;

architecture Behavioral of countdown9to0 is
signal v : std_logic_vector(3 downto 0):=start;
begin
process(clk,pl,start,start2,enableStart2)
	begin
	if(v="0000")then
		v<=pl;
	elsif(clk'event and clk='1')then
		v<=v-1;
	end if;
	if (enableStart2 = '1' and enableStart2'event) then
		v<=start2;
	end if;
	end process;
q<=v;

end Behavioral;
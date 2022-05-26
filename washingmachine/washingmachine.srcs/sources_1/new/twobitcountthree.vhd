
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twobincountthree is
    Port ( loader : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           pl : in STD_LOGIC);
end twobincountthree;

architecture Behavioral of twobincountthree is
signal  tempq: STD_LOGIC_VECTOR(1 downto 0);
begin

process (pl,clk,rst) is
begin
if (rst='1') then
tempq<="00";
elsif (pl='1') then
if(loader="11") then
tempq<="00";
else
tempq<=loader;
end if;
elsif (ce='1' and clk'event and clk='1') then
if(tempq="00") then
tempq<="01";
elsif(tempq="01") then
tempq<="10";
elsif(tempq="10") then
tempq<="00";
end if;
end if;
q<=tempq;
end process;

end Behavioral;

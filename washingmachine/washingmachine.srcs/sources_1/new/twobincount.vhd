----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2022 09:31:01 PM
-- Design Name: 
-- Module Name: twobincount - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity twobincount is
    Port ( loader : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           pl : in STD_LOGIC);
end twobincount;

architecture Behavioral of twobincount is
signal  tempq: STD_LOGIC_VECTOR(1 downto 0);
begin

process (pl,clk,rst) is
begin
if (rst='1') then
tempq<="00";
elsif (pl='1') then
tempq<=loader;
elsif (ce='1' and clk'event and clk='1') then
if(tempq="00") then
tempq<="01";
elsif(tempq="01") then
tempq<="10";
elsif(tempq="10") then
tempq<="11";
elsif(tempq="11") then
tempq<="00";
end if;
end if;
q<=tempq;
end process;

end Behavioral;

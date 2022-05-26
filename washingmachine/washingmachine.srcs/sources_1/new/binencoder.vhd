----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2022 05:22:03 PM
-- Design Name: 
-- Module Name: binencoder - Behavioral
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

entity binencoder is
    Port ( hot : in STD_LOGIC_VECTOR (7 downto 0);
           bin : out STD_LOGIC_VECTOR (2 downto 0));
end binencoder;

architecture Behavioral of binencoder is
signal bined: STD_LOGIC_vector(2 downto 0);
begin

process (hot)
begin
if (hot(7) = '1') then
bined<="111";
elsif (hot(6) = '1') then
bined<="110";
elsif (hot(5) = '1') then
bined<="101";
elsif (hot(4) = '1') then
bined<="100";
elsif (hot(3) = '1') then
bined<="011";
elsif (hot(2) = '1') then
bined<="010";
elsif (hot(1) = '1') then
bined<="001";
else
bined<="000";
end if;
end process;

bin<=bined;

end Behavioral;

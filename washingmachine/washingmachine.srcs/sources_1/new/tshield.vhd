----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2022 08:09:39 PM
-- Design Name: 
-- Module Name: tshield - Behavioral
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

entity tshield is
    Port ( bp : in STD_LOGIC;
           romq : in STD_LOGIC;
           s : out STD_LOGIC;
           r : out STD_LOGIC);
end tshield;

architecture Behavioral of tshield is

begin

process(bp) is
begin

if (bp='1' and romq='0')then
s<='0';
r<='1';
elsif(bp='1' and romq='1') then
s<='1';
r<='0';
else
s<='0';
r<='0';
end if;

end process;

end Behavioral;

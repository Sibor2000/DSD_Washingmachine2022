----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2022 02:57:15 PM
-- Design Name: 
-- Module Name: washcyclereg - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity washcyclereg is
    Port ( clk : in STD_LOGIC;
           robreg : in STD_LOGIC_VECTOR (5 downto 0);
           start : in STD_LOGIC;
           hot : out STD_LOGIC_VECTOR (0 TO 18));
end washcyclereg;

architecture Behavioral of washcyclereg is
signal driver: std_logic_vector(0 TO 18);
begin

process(clk,start) is
begin
if(clk'event and clk='1' and start='1') then
driver <= '0'&driver(0 to 17);
end if;
end process;

process(start) is
begin
if(start'event and start='1') then
if (robreg(1)='0') then
driver<="1000000000000000000";
else
driver<="0000100000000000000";
end if;
end if;
end process;

end Behavioral;

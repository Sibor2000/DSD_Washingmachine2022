----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2022 09:25:29 PM
-- Design Name: 
-- Module Name: asyncrom - Behavioral
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

entity asyncrom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data_output : out STD_LOGIC_VECTOR (5 downto 0));
end asyncrom;

architecture Behavioral of asyncrom is

begin
p1: process (address) is
begin
    if(address="000") then
            data_output <= "001000";
        elsif(address="001") then
                data_output <= "100000";
        elsif(address="010") then
                data_output <= "010101";
        elsif(address="011") then
			data_output <= "010110";
		elsif(address="100") then
               data_output <= "111001";
        end if;

end process p1;

end Behavioral;

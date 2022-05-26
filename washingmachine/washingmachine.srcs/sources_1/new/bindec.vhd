----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 08:23:24 PM
-- Design Name: 
-- Module Name: bindec - Behavioral
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

entity bindec is
    Port ( binar : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0));
end bindec;

architecture Behavioral of bindec is

begin

process(binar) is
begin
if(binar="00") then q<="0001";
elsif (binar="01") then q<="0010";
elsif (binar="10") then q<="0100";
elsif (binar="11") then q<="1000";
end if;
end process;

end Behavioral;

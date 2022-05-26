----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 10:35:48 PM
-- Design Name: 
-- Module Name: radiator - Behavioral
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

entity radiator is
    Port ( start : in STD_LOGIC;
           endr : out STD_LOGIC;
           rad : out STD_LOGIC;
           clk : in STD_LOGIC;
           target: in STD_LOGIC_VECTOR(7 downto 0));
end radiator;

architecture Behavioral of radiator is

begin

process(start,clk) is
variable counter: integer;
begin

if (start='0') then 
counter:=0;
rad<='0';
endr<='0';
elsif (start = '1' and clk'event and clk='1')then

if(counter < to_integer(unsigned(target))) then
counter:=counter+1;
rad<='1';
endr<='0';
elsif (counter >=to_integer(unsigned(target))) then
counter:=0;
endr<='1';
rad<='0';
end if;
end if;

end process;

end Behavioral;

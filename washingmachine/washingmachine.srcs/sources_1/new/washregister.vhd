----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2022 04:01:43 PM
-- Design Name: 
-- Module Name: washregister - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity washregister is
Port (
d: in STD_LOGIC_VECTOR (5 downto 0);
load: in STD_LOGIC;
q: out STD_LOGIC_VECTOR (5 downto 0);
clock: IN std_LOGIC

);
end washregister;

architecture Behavioral of washregister is
    SIGNAL TMP: STD_LOGIC_VECTOR(5 DOWNTO 0);

BEGIN

PROCESS(CLOCK) IS
BEGIN
if(rising_edge(clock) AND LOAD='1') then
TMP <= D;
END IF;

END PROCESS;

Q <= TMP;

end Behavioral;

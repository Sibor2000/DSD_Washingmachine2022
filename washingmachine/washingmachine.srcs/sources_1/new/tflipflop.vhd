----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2022 04:38:52 PM
-- Design Name: 
-- Module Name: tflipflop - Behavioral
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

entity tflipflop is
    Port ( clock : in STD_LOGIC;
           t : in STD_LOGIC;
           qpoz : out STD_LOGIC;
           qneg : out STD_LOGIC;
           setfun : in STD_LOGIC;
           resetfun : in STD_LOGIC);
end tflipflop;

architecture Behavioral of tflipflop is
signal q: std_logic;
begin

process(clock,setfun,resetfun) is
begin

if (setfun='1' and resetfun ='0') then
q<='1';
elsif(setfun='0' and resetfun ='1') then
q<='0';
elsif (rising_edge(clock) and setfun='0' and resetfun='0' and t='1') then
q<=not(q);
end if;

end process;

qpoz<=q;
qneg<=not(q);

end Behavioral;

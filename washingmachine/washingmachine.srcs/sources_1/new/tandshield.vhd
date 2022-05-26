----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2022 10:59:27 PM
-- Design Name: 
-- Module Name: tandshield - Behavioral
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

entity tandshield is
    Port ( ein : in STD_LOGIC;
           bepe : in STD_LOGIC;
           te : in STD_LOGIC;
           clek : in STD_LOGIC;
           qp : out STD_LOGIC;
           qn : out STD_LOGIC);
end tandshield;

architecture Behavioral of tandshield is
component tflipflop is
    Port ( clock : in STD_LOGIC;
           t : in STD_LOGIC;
           qpoz : out STD_LOGIC;
           qneg : out STD_LOGIC;
           setfun : in STD_LOGIC;
           resetfun : in STD_LOGIC);
end component tflipflop;
component tshield is
    Port ( bp : in STD_LOGIC;
           romq : in STD_LOGIC;
           s : out STD_LOGIC;
           r : out STD_LOGIC);
end component tshield;
signal esi: STD_LOGIC;
signal eri:STD_LOGIC;
begin

c1: tflipflop port map (clek,te,qp,qn,esi,eri);
c2: tshield port map (bepe,ein,esi,eri);


end Behavioral;

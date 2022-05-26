----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2022 09:52:28 PM
-- Design Name: 
-- Module Name: romandenc - Behavioral
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

entity romandenc is
    Port ( but : in STD_LOGIC_VECTOR (4 downto 0);
           bp : out STD_LOGIC;
           q : out STD_LOGIC_VECTOR (5 downto 0));
end romandenc;

architecture Behavioral of romandenc is

component asyncrom is
Port ( 
address : in STD_LOGIC_VECTOR (2 downto 0);
       data_output : out STD_LOGIC_VECTOR (5 downto 0)
);
end component;

component binencoder is
Port
(hot : in STD_LOGIC_VECTOR (7 downto 0);
           bin : out STD_LOGIC_VECTOR (2 downto 0)
);
end component;
signal mybus: STD_LOGIC_VECTOR(2 downto 0);
signal buthelp: STD_LOGIC_VECTOR(7 downto 0);
begin

process (but) is
variable isbp: STD_LOGIC;
begin

isbp :='1';
if (but(4)='1') then
elsif (but(3)='1') then
elsif (but(2)='1') then
elsif (but(1)='1') then
elsif (but(0)='1') then
else isbp:='0';

end if;
bp<=isbp;
end process;
buthelp<="000"&but;
C1: binencoder port map
(buthelp,mybus
);

c2: asyncrom port map
(mybus,q
);

end Behavioral;

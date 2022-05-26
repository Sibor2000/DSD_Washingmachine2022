----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 08:52:13 PM
-- Design Name: 
-- Module Name: RobertComp - Behavioral
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

entity RobertComp is
    Port ( CLK: in STD_LOGIC;
           LQW : in STD_LOGIC;
           LS : in STD_LOGIC;
           LDK : in STD_LOGIC;
           LDR : in STD_LOGIC;
           LAA : in STD_LOGIC;
           TMP : in STD_LOGIC;
           SPED : in STD_LOGIC;
           PRWSH : in STD_LOGIC;
           RNS : in STD_LOGIC;
           STRT : in STD_LOGIC;
           ISDC : in STD_LOGIC;
           MIHNEADONE : in STD_LOGIC;
           MIHNEAQ : out STD_LOGIC_VECTOR (5 downto 0);
           DOORLOCK : out STD_LOGIC;
           LD30 : out STD_LOGIC;
           LD40 : out STD_LOGIC;
           LD60 : out STD_LOGIC;
           LD90 : out STD_LOGIC;
           LD800 : out STD_LOGIC;
           LD1000 : out STD_LOGIC;
           LD1200 : out STD_LOGIC;
           LDPW : out STD_LOGIC;
           LDRNS : out STD_LOGIC);
end RobertComp;

architecture Behavioral of RobertComp is

component romandenc is
Port ( but : in STD_LOGIC_VECTOR (4 downto 0);
           bp : out STD_LOGIC;
           q : out STD_LOGIC_VECTOR (5 downto 0));
end component romandenc;

component bindec is
    Port ( binar : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component bindec;

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

component twobincount is
    Port ( loader : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           pl : in STD_LOGIC);
end component twobincount;

component twobincountthree is
    Port ( loader : in STD_LOGIC_VECTOR (1 downto 0);
           q : out STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           pl : in STD_LOGIC);
end component twobincountthree;

component washregister is
Port (
d: in STD_LOGIC_VECTOR (5 downto 0);
load: in STD_LOGIC;
q: out STD_LOGIC_VECTOR (5 downto 0);
clock: IN std_LOGIC

);
end component washregister;

signal tshieldcon1: STD_LOGIC_VECTOR(1 downto 0);
signal tshieldcon0: STD_LOGIC_VECTOR(1 downto 0);
signal preloadbut: STD_LOGIC_VECTOR(4 downto 0);
signal preloadbutpres: STD_LOGIC;
signal romexit: STD_LOGIC_VECTOR(5 downto 0);
signal statuspoz: STD_LOGIC;
signal statusneg: STD_LOGIC;
signal prewashpoz: STD_LOGIC;
signal prewashneg: STD_LOGIC;
signal rinsepoz: STD_LOGIC;
signal rinseneg: STD_LOGIC;
signal rom23: STD_LOGIC_VECTOR(1 downto 0);
signal rom45: STD_LOGIC_VECTOR(1 downto 0);
signal tempexit: STD_LOGIC_VECTOR(1 downto 0);
signal spedexit: STD_LOGIC_VECTOR(1 downto 0);
signal regentry: STD_LOGIC_VECTOR(5 downto 0);
signal statusclock: STD_LOGIC;
signal templed: STD_LOGIC_VECTOR(3 downto 0);
signal spedled: STD_LOGIC_VECTOR(3 downto 0);

signal eff_pl0: STD_LOGIC;
signal eff_pl1: STD_LOGIC;
signal eff_pl2: STD_LOGIC;
signal eff_pl3: STD_LOGIC;
signal eff_pl4: STD_LOGIC;
signal eff_pl5: STD_LOGIC;
signal eff_sped: STD_LOGIC;
signal eff_tmp: STD_LOGIC;
signal eff_prwsh: STD_LOGIC;
signal eff_rns: STD_LOGIC;
 

begin

eff_pl0 <= LQW and statusneg;
eff_pl1 <= LS and statusneg;
eff_pl2 <= LDK and statusneg;
eff_pl3 <= LDR and statusneg;
eff_pl4 <= LAA and statusneg;
eff_sped <= SPED;
eff_tmp <= TMP;
eff_prwsh <= PRWSH;
eff_rns <= RNS;

statusclock<=MIHNEADONE or (STRT and ISDC and statusneg);
preloadbut<= eff_pl4&eff_pl3&eff_pl2&eff_pl1&eff_pl0;
rom23<=romexit(3)&romexit(2);
rom45<=romexit(5)&romexit(4);
regentry<=tempexit&spedexit&prewashpoz&rinsepoz;

RNE: romandenc port map(preloadbut,preloadbutpres,romexit);
PWS: tshield port map(preloadbutpres,romexit(1),tshieldcon1(1),tshieldcon1(0));
RNSS: tshield port map(preloadbutpres,romexit(0),tshieldcon0(1),tshieldcon0(0));
PWT: tflipflop port map(eff_prwsh,statusneg,prewashpoz,prewashneg,tshieldcon1(1),tshieldcon1(0));
RNST: tflipflop port map(eff_rns,statusneg,rinsepoz,rinseneg,tshieldcon0(1),tshieldcon0(0));

TMPCNT: twobincount port map(rom45,tempexit,eff_tmp,'0',statusneg,preloadbutpres);
SPDCNT: twobincountthree port map(rom23,spedexit,eff_sped,'0',statusneg,preloadbutpres);

WSHREG: washregister port map(regentry,'1',MIHNEAQ,clk);

STATUST: tflipflop port map(statusclock,'1',statuspoz,statusneg,'0','0');

tmpled: bindec port map (tempexit,templed);
spdled: bindec port map (spedexit,spedled);

ld30<=templed(0);
ld40<=templed(1);
ld60<=templed(2);
ld90<=templed(3);

ld800<=spedled(0);
ld1000<=spedled(1);
ld1200<=spedled(2);

ldpw<=prewashpoz;
ldrns<=rinsepoz;

DOORLOCK<=statuspoz;

end Behavioral;

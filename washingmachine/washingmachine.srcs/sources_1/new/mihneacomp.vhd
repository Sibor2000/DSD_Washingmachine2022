----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2022 03:44:25 PM
-- Design Name: 
-- Module Name: mihneacomp - Behavioral
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

entity mihneacomp is
    Port ( robreg : in STD_LOGIC_VECTOR (5 downto 0);
           enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           mihdone : out STD_LOGIC;
           heat : out STD_LOGIC;
           wl : out STD_LOGIC;
           wd : out STD_LOGIC;
           rot : out STD_LOGIC);
end mihneacomp;

architecture Behavioral of mihneacomp is

component countdown5to0 is
    Port ( clk : in  STD_LOGIC;
           pl : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
			  start: in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  start2 : in std_logic_vector (3 downto 0);
			  enableStart2 : in std_logic;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           down: out std_logic);
end component;

component countdown9to0 is
    Port ( clk : in  STD_LOGIC;
           pl : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
			  start: in STD_LOGIC_VECTOR(3 DOWNTO 0);
			  start2 : in std_logic_vector (3 downto 0);
			  enableStart2 : in std_logic;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           down: out std_logic);
end component;

component seconds is
port (clk100Mhz : in std_logic;
       clk1Hz : out std_logic
     );
end component;

component minutes is
    Port ( clk1Hz : in  STD_LOGIC;
           clk1min : out  STD_LOGIC);
end component;

component mux2to1 is
    Port ( i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component radiator is
    Port ( start : in STD_LOGIC;
           endr : out STD_LOGIC;
           rad : out STD_LOGIC;
           clk : in STD_LOGIC;
           target: in STD_LOGIC_VECTOR(7 downto 0));
end component;

component washcyclereg is
    Port ( clk : in STD_LOGIC;
           robreg : in STD_LOGIC_VECTOR (5 downto 0);
           start : in STD_LOGIC;
           hot : out STD_LOGIC_VECTOR (0 TO 18));
end component;

component freq100mhzto2hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk2Hz : out  STD_LOGIC);
end component;

component heatrom is
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           cs_rom : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component cyclocount is
    Port ( clk : in  STD_LOGIC;
           cyclestart : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           pl: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           ple: in STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           pulse: out STD_logic);
end component;

component timerom is
    Port ( inputRobert : in  STD_LOGIC_VECTOR (5 downto 0);
           cs_rom : in  STD_LOGIC;
           output1 : out  STD_LOGIC_VECTOR (3 downto 0);
           output0 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux8to1 is
    Port ( blinker : in  STD_LOGIC_VECTOR (7 downto 0);
           archblinker : out  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  enable : in std_logic);
end component;

component freq100mhzto14hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk14Hz : out  STD_LOGIC);
end component;

component freq100mhzto17hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk17Hz : out  STD_LOGIC);
end component;

component freq100mhzto20hz is
    Port ( clk100Mhz : in  STD_LOGIC;
           clk20Hz : out  STD_LOGIC);
end component;

signal einsec: STD_logic;
signal einmin: STD_logic;

signal zweisec: STD_logic;
signal vierzehnsec: STD_logic;
signal siebzehnsec: STD_logic;
signal zwanzigsec: STD_logic;

signal driveclock: std_logic;
signal hottie : STD_LOGIC_VECTOR (0 TO 18);
signal tenminengine: std_logic;
signal twentyminengine: std_logic;
signal tmpwl: std_logic;
signal tmpwd: std_logic;
signal endwl: std_logic;
signal endwd: std_logic;
signal startwl: std_logic;
signal startwd: std_logic;
signal tmpr10:std_logic;
signal tmpr20:std_logic;
signal endr10:std_logic;
signal endr20:std_logic;
signal start10:std_logic;
signal start20:std_logic;
signal startheat:std_logic;
signal tmpheat:std_logic;
signal endheat:std_logic;
signal startdelay:std_logic;
signal tmpdelay:std_logic;
signal enddelay:std_logic;

signal rotdrive:std_logic;

signal incomrom:std_logic_vector(7 downto 0);

signal secrsecl:std_logic;
signal seclminr:std_logic;
signal minrminl:std_logic;

signal secle : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal secre : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal minle : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal minre : STD_LOGIC_VECTOR(3 DOWNTO 0);

signal romminle : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal romminre : STD_LOGIC_VECTOR(3 DOWNTO 0);

signal pulseentry : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal pulseexit : STD_LOGIC;
signal pulseselect : STD_LOGIC_vector(1 downto 0);

begin

startwl<=hottie(0) or hottie(4) or hottie(8) or hottie(11) or hottie(14);
startwd<=hottie(3) or hottie(7) or hottie(10) or hottie(13) or hottie(16);
start10<=hottie(2) or hottie(9) or hottie(12) or hottie(15);
start20<=hottie(6);
startheat<=hottie(1) or hottie(5);

driveclock<=(endheat or endr20 or endr10 or endwd or endwl) and (not(hottie(14)and robreg(1)));

pulseentry<="0"&zwanzigsec&siebzehnsec&vierzehnsec&zweisec&zweisec&einsec&einsec;

brain: washcyclereg port map(driveclock,robreg,enable,hottie);

tosec: seconds port map(clk,einsec);
tomin: minutes port map(einsec,einmin);
totwosec: freq100mhzto2hz port map(clk,zweisec);

waterload: radiator port map(startwl,endwl,tmpwl,einsec,"00000010");
waterdisp: radiator port map(startwd,endwd,tmpwd,einsec,"00000010");
r10: radiator port map(start10,endr10,tmpr10,einmin,"00001010");
r20: radiator port map(start20,endr20,tmpr20,einmin,"00010100");
heater:radiator port map(startheat,endheat,tmpheat,einsec,incomrom);

muxi:mux2to1 port map(hottie(17),hottie(14),robreg(1),startdelay);
delayer: radiator port map(startdelay,enddelay,tmpdelay,einsec,"00111100");

warmrom: heatrom port map (robreg(5 downto 4),'1',incomrom);

minl: cyclocount port map(minrminl,"1001",romminle,enable,minle,open);
minr: cyclocount port map(seclminr,"1001",romminre,enable,minre,minrminl);
secl: cyclocount port map(secrsecl,"0101","0000",enable,secle,seclminr);
secr: cyclocount port map(einsec,"1001","0000",enable,secre,secrsecl);

timrom: timerom port map(robreg,'1',romminle,romminre);

fourten:freq100mhzto14hz port map (clk,vierzehnsec);
seventen:freq100mhzto17hz port map (clk,siebzehnsec);
tenten:freq100mhzto20hz port map (clk,zwanzigsec);

blinkmux: mux8to1 port map (pulseentry,pulseexit,pulseselect,'1');

mihdone<=enddelay;
heat<=tmpheat and not(startdelay);
wl<=tmpwl and not(startdelay);
wd<=tmpwd and not(startdelay);
rot<=rotdrive and not(startdelay);

end Behavioral;

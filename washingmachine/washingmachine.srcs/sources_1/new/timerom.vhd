----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2022 07:14:47 PM
-- Design Name: 
-- Module Name: timerom - Behavioral
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
--rom cu inputRobert
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity timerom is
    Port ( inputRobert : in  STD_LOGIC_VECTOR (5 downto 0);
           cs_rom : in  STD_LOGIC;
           output1 : out  STD_LOGIC_VECTOR (3 downto 0);
           output0 : out  STD_LOGIC_VECTOR (3 downto 0));
end timerom;

architecture Behavioral of timerom is

begin
process(cs_rom,inputRobert)
begin
	if(cs_rom='1')then
		case inputRobert is
			when "000000"=> output1<="0100"; output0<="0000";
			when "000100"=> output1<="0100"; output0<="0000";
			when "001000"=> output1<="0100"; output0<="0000";
			
			when "000001"=> output1<="0101"; output0<="0000";
			when "000101"=> output1<="0101"; output0<="0000";
			when "001001"=> output1<="0101"; output0<="0000";
			
			when "000010"=> output1<="0101"; output0<="0001";
			when "000110"=> output1<="0101"; output0<="0001";
			when "001010"=> output1<="0101"; output0<="0001";
			
			when "000011"=> output1<="0110"; output0<="0001";
			when "000111"=> output1<="0110"; output0<="0001";
			when "001011"=> output1<="0110"; output0<="0001";
			
			
			
			when "010000"=> output1<="0100"; output0<="0000";
			when "010100"=> output1<="0100"; output0<="0000";
			when "011000"=> output1<="0100"; output0<="0000";
			
			when "010001"=> output1<="0101"; output0<="0001";
			when "010101"=> output1<="0101"; output0<="0001";
			when "011001"=> output1<="0101"; output0<="0001";
			
			when "010010"=> output1<="0101"; output0<="0001";
			when "010110"=> output1<="0101"; output0<="0001";
			when "011010"=> output1<="0101"; output0<="0001";
			
			when "010011"=> output1<="0110"; output0<="0001";
			when "010111"=> output1<="0110"; output0<="0001";
			when "011011"=> output1<="0110"; output0<="0001";
			
			
			
			when "100000"=> output1<="0100"; output0<="0001";
			when "100100"=> output1<="0100"; output0<="0001";
			when "101000"=> output1<="0100"; output0<="0001";
			
			when "100001"=> output1<="0101"; output0<="0001";
			when "100101"=> output1<="0101"; output0<="0001";
			when "101001"=> output1<="0101"; output0<="0001";
			
			when "100010"=> output1<="0101"; output0<="0011";
			when "100110"=> output1<="0101"; output0<="0011";
			when "101010"=> output1<="0101"; output0<="0011";
			
			when "100011"=> output1<="0110"; output0<="0011";
			when "100111"=> output1<="0110"; output0<="0011";
			when "101011"=> output1<="0110"; output0<="0011";
			
			
			
			when "110000"=> output1<="0100"; output0<="0010";
			when "110100"=> output1<="0100"; output0<="0010";
			when "111000"=> output1<="0100"; output0<="0010";
			
			when "110001"=> output1<="0101"; output0<="0010";
			when "110101"=> output1<="0101"; output0<="0010";
			when "111001"=> output1<="0101"; output0<="0010";
			
			when "110010"=> output1<="0101"; output0<="0101";
			when "110110"=> output1<="0101"; output0<="0101";
			when "111010"=> output1<="0101"; output0<="0101";
			
			when "110011"=> output1<="0110"; output0<="0101";
			when "110111"=> output1<="0110"; output0<="0101";
			when "111011"=> output1<="0110"; output0<="0101";

			when others=> output1<="ZZZZ"; output0<="ZZZZ";
			end case;
			else
			output1<="ZZZZ"; 
			output0<="ZZZZ";
			end if;
			end process;
end Behavioral;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timerom is
--  Port ( );
end timerom;

architecture Behavioral of timerom is

begin


end Behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
 
entity rom is
generic(
    address_length: natural := 3;
    data_length: natural := 6
);
port(
    clock: in std_logic;
    address: in std_logic_vector((address_length - 1) downto 0);
    data_output: out std_logic_vector ((data_length - 1) downto 0)
);
end rom;
 
architecture arch of rom is
 
begin
 
process(clock) is
begin
    if(rising_edge(clock)) then
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
    end if;
end process;
 
end arch;
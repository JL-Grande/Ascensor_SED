library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity motor_puerta is
    Port ( nivel : in  STD_LOGIC;
           accionar_puerta : in  STD_LOGIC;
           actuador_puerta : out  STD_LOGIC);
end motor_puerta;

architecture Behavioral of motor_puerta is

begin
	motor_puerta:process
	begin
		if (nivel='1' AND accionar_puerta='1') then
			actuador_puerta <= '1';
		elsif (nivel='0' OR accionar_puerta='0') then
			actuador_puerta <= '0';
		end if;
	end process;
end Behavioral;
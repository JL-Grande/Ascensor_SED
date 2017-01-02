library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity motor_puerta is
    Port ( celula : in  STD_LOGIC;
           accionar_puerta : in  STD_LOGIC;
           actuador_puerta : out  STD_LOGIC);
end motor_puerta;

architecture Behavioral of motor_puerta is

begin
	motor_puerta:process
	begin
		if (celula='1' AND accionar_puerta='1') then --Si hay obstaculo entonces la puerta se abrira.
			actuador_puerta <= '1';
		elsif (celula='0' OR accionar_puerta='0') then
			actuador_puerta <= '0';
		end if;
	end process;
end Behavioral;
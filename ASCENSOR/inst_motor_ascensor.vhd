library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity motor_ascensor is
    Port ( accionar_ascensor : in  STD_LOGIC;
           actuador_motor_subir : out  STD_LOGIC;
           actuador_motor_bajar : out  STD_LOGIC);
end motor_ascensor;

architecture Behavioral of motor_ascensor is

begin
	motor_ascensor:process
	begin
		if accionar_ascensor='1' then
			actuador_motor_subir <= '1';
		elsif accionar_ascensor='0' then
			actuador_motor_bajar <= '0';
		end if;
	end process;
end Behavioral;


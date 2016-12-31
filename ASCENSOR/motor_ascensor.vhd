
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity motor_ascensor is
	PORT(
		accionar_bajar: in  STD_LOGIC;
		accionar_subir: in  STD_LOGIC;
		motor_subir: out  STD_LOGIC;
		motor_bajar: out  STD_LOGIC
	);
end motor_ascensor;

architecture Behavioral of motor_ascensor is

begin
	motor_ascensor:process
	begin
		if (accionar_subir ='1') then 
			motor_subir <= '1';
		else motor_subir <= '0';
		end if;
		
		if (accionar_bajar ='1') then 
			motor_bajar <= '1';
		else motor_bajar <= '0';
		end if;
		
	end process;
end Behavioral;


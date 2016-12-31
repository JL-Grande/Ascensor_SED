LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_motor_ascensor IS
END tb_motor_ascensor;
 
ARCHITECTURE behavior OF tb_motor_ascensor IS 
 
    COMPONENT motor_ascensor
    PORT(
         accionar_bajar : IN  std_logic;
         accionar_subir : IN  std_logic;
         motor_subir : OUT  std_logic;
         motor_bajar : OUT  std_logic
        );
    END COMPONENT;
    
   signal accionar_bajar : std_logic := '0';
   signal accionar_subir : std_logic := '0';

 	signal motor_subir : std_logic;
   signal motor_bajar : std_logic;
     
BEGIN
 
	uut: motor_ascensor PORT MAP (
          accionar_bajar => accionar_bajar,
          accionar_subir => accionar_subir,
          motor_subir => motor_subir,
          motor_bajar => motor_bajar
        );
		  
		  
	-- Stimulus process
   stim_proc: process
   begin		
		accionar_bajar <= '0';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		motor_bajar <= '0';
		motor_subir <= '0';
		WAIT FOR 20 ns;
		
		accionar_bajar <= '0';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		motor_bajar <= '1';
		motor_subir <= '1';
		WAIT FOR 20 ns;
		
		accionar_bajar <= '1';
		accionar_subir<= '1';
		WAIT FOR 5 ns;
		
		motor_bajar <= '1';
		motor_subir <= '1';
		WAIT FOR 20 ns;
		
		accionar_bajar <= '1';
		accionar_subir<= '1';
		WAIT FOR 5 ns;
		
		motor_bajar <= '0';
		motor_subir <= '0';
		WAIT FOR 20 ns;
		
		accionar_bajar <= '0';
		accionar_subir<= '0';
		WAIT FOR 5 ns;
		
		motor_bajar <= '0';
		motor_subir <= '0';
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;


END;

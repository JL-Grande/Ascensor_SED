LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_motor_ascensor IS
END tb_motor_ascensor;
 
ARCHITECTURE behavior OF tb_motor_ascensor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_ascensor
    PORT(
         accionar_ascensor : IN  std_logic;
         actuador_motor_subir : OUT  std_logic;
         actuador_motor_bajar : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal accionar_ascensor : std_logic := '0';

 	--Outputs
   signal actuador_motor_subir : std_logic;
   signal actuador_motor_bajar : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_ascensor PORT MAP (
          accionar_ascensor => accionar_ascensor,
          actuador_motor_subir => actuador_motor_subir,
          actuador_motor_bajar => actuador_motor_bajar
        );
   -- Stimulus process
   stim_proc: process
   begin			
      WAIT FOR 5 ns;
		accionar_ascensor <= '0';
		WAIT FOR 20 ns;
		accionar_ascensor <= '1';
		WAIT FOR 20 ns;

      ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;

END;

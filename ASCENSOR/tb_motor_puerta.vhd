LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_motor_puerta IS
END tb_motor_puerta;
 
ARCHITECTURE behavior OF tb_motor_puerta IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_puerta
    PORT(
         celula : IN  std_logic;
         accionar_puerta : IN  std_logic;
         actuador_puerta : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal celula : std_logic := '0';
   signal accionar_puerta : std_logic := '0';

 	--Outputs
   signal actuador_puerta : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_puerta PORT MAP (
          celula => celula,
          accionar_puerta => accionar_puerta,
          actuador_puerta => actuador_puerta
        );

   -- Stimulus process
   stim_proc: process
   begin		
		celula <= '0';
		WAIT FOR 5 ns;
		accionar_puerta <= '0';
		WAIT FOR 20 ns;
		celula <= '0';
		WAIT FOR 5 ns;
		accionar_puerta <= '1';
		WAIT FOR 20 ns;
		celula <= '1';
		WAIT FOR 5 ns;
		accionar_puerta <= '1';
		WAIT FOR 20 ns;
		celula <= '1';
		WAIT FOR 5 ns;
		accionar_puerta <= '0';
		WAIT FOR 20 ns;
		celula <= '0';
		WAIT FOR 5 ns;
		accionar_puerta <= '0';
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;

END;

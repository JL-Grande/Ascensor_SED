LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_traductor_3a2 IS
END tb_traductor_3a2;
 
ARCHITECTURE behavior OF tb_traductor_3a2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traductor_3a2
    PORT(
         vector_IN : IN  std_logic_vector(2 downto 0);
         vector_OUT : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal vector_IN : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal vector_OUT : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traductor_3a2 PORT MAP (
          vector_IN => vector_IN,
          vector_OUT => vector_OUT
        );
 

   -- Stimulus process
   stim_proc: process
   begin		

	vector_IN <= "000";
	WAIT FOR 10 ns;
	vector_IN <= "010";
	WAIT FOR 10 ns;
	vector_IN <= "001";
	WAIT FOR 10 ns;
	vector_IN <= "101";
	WAIT FOR 10 ns;
	vector_IN <= "100";
	WAIT FOR 10 ns;
	vector_IN <= "011";
	WAIT FOR 10 ns;
	vector_IN <= "110";
	WAIT FOR 10 ns;
	ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
		
   end process;

END;

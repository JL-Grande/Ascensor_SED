LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_traductor_3a2 IS
END tb_traductor_3a2;
 
ARCHITECTURE behavior OF tb_traductor_3a2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traductor_3a2
    PORT(
         clk : IN  std_logic;
         vector_IN : IN  std_logic_vector(2 downto 0);
         vector_OUT : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal vector_IN : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal vector_OUT : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traductor_3a2 PORT MAP (
          clk => clk,
          vector_IN => vector_IN,
          vector_OUT => vector_OUT
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	
	WAIT FOR 2 ns;
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

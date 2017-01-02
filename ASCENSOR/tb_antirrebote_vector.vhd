
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_antirrebote_vector IS
END tb_antirrebote_vector;
 
ARCHITECTURE behavior OF tb_antirrebote_vector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirrebote_vector
    PORT(
         CLK : IN  std_logic;
         vector_IN : IN  std_logic_vector(3 downto 0);
         vector_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal vector_IN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal vector_OUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirrebote_vector PORT MAP (
          CLK => CLK,
          vector_IN => vector_IN,
          vector_OUT => vector_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	vector_IN <= "0000";
	WAIT FOR 40 ns;
	vector_IN <= "0100";
	WAIT FOR 55 ns;
	vector_IN <= "0010";
	WAIT FOR 2 ns;
	vector_IN <= "0101";
	WAIT FOR 50 ns;
	vector_IN <= "1000";
	WAIT FOR 4 ns;
	vector_IN <= "0110";
	WAIT FOR 2 ns;
	vector_IN <= "1001";
	WAIT FOR 3 ns;
	vector_IN <= "0010";
	WAIT FOR 20 ns;
	vector_IN <= "1101";
	WAIT FOR 50 ns;
	ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;

END;

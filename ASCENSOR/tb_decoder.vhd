
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         code : IN  std_logic_vector(1 downto 0);
         led : OUT  std_logic_vector(6 downto 0);
         dig_ctrl : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal code : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(6 downto 0);
   signal dig_ctrl : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          code => code,
          led => led,
          dig_ctrl => dig_ctrl
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		
		code <= "00";
		WAIT FOR 20 ns;
		code <= "01";
		WAIT FOR 20 ns;
		code <= "10";
		WAIT FOR 20 ns;
		code <= "11";
		WAIT FOR 20 ns;
		code <= "01";
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
   end process;

END;

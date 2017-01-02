LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_gestor_display IS
END tb_gestor_display;
 
ARCHITECTURE behavior OF tb_gestor_display IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gestor_display
    PORT(
         CLK : IN  std_logic;
         piso_now_3 : IN  std_logic_vector(2 downto 0);
         piso_obj_3 : IN  std_logic_vector(2 downto 0);
         piso_seleccionado : OUT  std_logic_vector(1 downto 0);
         piso_actual : OUT  std_logic_vector(1 downto 0);
         accion : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal piso_now_3 : std_logic_vector(2 downto 0) := (others => '0');
   signal piso_obj_3 : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal piso_seleccionado : std_logic_vector(1 downto 0);
   signal piso_actual : std_logic_vector(1 downto 0);
   signal accion : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gestor_display PORT MAP (
          CLK => CLK,
          piso_now_3 => piso_now_3,
          piso_obj_3 => piso_obj_3,
          piso_seleccionado => piso_seleccionado,
          piso_actual => piso_actual,
          accion => accion
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
	
      WAIT FOR 5 ns;
		piso_now_3 <= "001";
		piso_obj_3 <= "011";
		WAIT FOR 20 ns;
		piso_now_3 <= "010";
		WAIT FOR 20 ns;
		piso_now_3 <= "011";
		WAIT FOR 20 ns;
		piso_obj_3 <= "100";
		WAIT FOR 20 ns;
		piso_now_3 <= "100";
		WAIT FOR 20 ns;
		piso_obj_3 <= "010";
		WAIT FOR 20 ns;
		piso_now_3 <= "011";
		WAIT FOR 20 ns;
		piso_now_3 <= "000";
		WAIT FOR 20 ns;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
			
   end process;

END;

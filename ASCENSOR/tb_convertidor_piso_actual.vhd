LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_convertidor_piso_actual IS
END tb_convertidor_piso_actual;
 
ARCHITECTURE behavior OF tb_convertidor_piso_actual IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT convertidor_piso_actual
    PORT(
         piso_actual : IN  std_logic_vector(3 downto 0);
         boton_seleccionado : IN  std_logic_vector(3 downto 0);
         piso_actual_convertido : OUT  std_logic_vector(2 downto 0);
         boton_seleccionado_convertido : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal piso_actual : std_logic_vector(3 downto 0) := (others => '0');
   signal boton_seleccionado : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal piso_actual_convertido : std_logic_vector(2 downto 0);
   signal boton_seleccionado_convertido : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: convertidor_piso_actual PORT MAP (
          piso_actual => piso_actual,
          boton_seleccionado => boton_seleccionado,
          piso_actual_convertido => piso_actual_convertido,
          boton_seleccionado_convertido => boton_seleccionado_convertido
        );


   -- Stimulus process
   stim_proc: process
   begin		

      -- insert stimulus here 

      wait;
   end process;

END;

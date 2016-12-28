
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_convertidor_piso_actual IS
END tb_convertidor_piso_actual;
 
ARCHITECTURE behavior OF tb_convertidor_piso_actual IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT convertidor_piso_actual
    PORT(
         piso_actual: IN std_logic_vector(3 DOWNTO 0);
			boton_seleccionado: IN std_logic_vector(3 DOWNTO 0);
		
			piso_actual_convertido: OUT std_logic_vector(1 DOWNTO 0);
			boton_seleccionado_convertido: OUT std_logic_vector(1 DOWNTO 0)
        );
    END COMPONENT;
    
   signal piso_actual : std_logic_vector(3 downto 0) := (others => '0');
	signal boton_seleccionado : std_logic_vector(3 downto 0) := (others => '0');
	
 	signal piso_actual_convertido : std_logic_vector(1 downto 0);
	signal boton_seleccionado_convertido : std_logic_vector(1 downto 0);
	
    
BEGIN
 
	
   uut: convertidor_piso_actual PORT MAP (
          piso_actual => piso_actual,
          piso_actual_convertido => piso_actual_convertido,
			 boton_seleccionado => boton_seleccionado,
			 boton_seleccionado_convertido => boton_seleccionado_convertido
        );

  

END;

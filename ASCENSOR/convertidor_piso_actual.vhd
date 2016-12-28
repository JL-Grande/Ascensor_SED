LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


entity convertidor_piso_actual is
	PORT(
		piso_actual: IN std_logic_vector(3 DOWNTO 0);
		boton_seleccionado: IN std_logic_vector(3 DOWNTO 0);
		
		piso_actual_convertido: OUT std_logic_vector(2 DOWNTO 0);
		boton_seleccionado_convertido: OUT std_logic_vector(2 DOWNTO 0)
		);
end convertidor_piso_actual;

architecture dataflow of convertidor_piso_actual is

begin
	WITH piso_actual SELECT
				piso_actual_convertido <=  "001" WHEN "0001",
													"010" WHEN "0010",
													"011" WHEN "0100",
													"100" WHEN "1000",
													"000" WHEN others;
	WITH boton_seleccionado SELECT
				boton_seleccionado_convertido <= "001" WHEN "0001",
															"010" WHEN "0010",
															"011" WHEN "0100",
															"100" WHEN "1000",
															"000" WHEN others;
end dataflow;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TOP is
PORT(
	  boton_seleccionado: IN std_logic_vector(3 DOWNTO 0); --ENTRADAS TOP
     piso_actual: IN std_logic_vector(3 DOWNTO 0);
     nivel, celula, abierto, cerrado:  IN std_logic;
	  
	  puerta, motor_subir, motor_bajar: OUT std_logic;	   --SALIDAS TOP
	  
	  piso_seleccionado: OUT std_logic_vector(3 DOWNTO 0);
	  decoder_numeros: OUT std_logic_vector(3 DOWNTO 0);
	  decoder_flechas: OUT std_logic_vector(3 DOWNTO 0);
	  
	  code : IN std_logic_vector(3 DOWNTO 0);             --ENTRADAS/SALIDAS PARA DECODER'S
	  digsel : IN std_logic_vector(3 DOWNTO 0);
	  digctrl : OUT std_logic_vector(3 DOWNTO 0);
     segment : OUT std_logic_vector(7 DOWNTO 0);
	  
	  clk,clock: in std_logic;										--clk:antes de entrar al divisorfrec. clock:después de salir del divisorfrec		
	  reset: in std_logic
	  	  
	  );
	  
end TOP;

architecture Behavioral of TOP is
COMPONENT decoder
	PORT (
		code : in STD_LOGIC_VECTOR (3 downto 0);
		led : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
 END COMPONENT;

COMPONENT convertidor_piso_actual
	PORT(
		piso_actual: IN std_logic_vector(3 DOWNTO 0);
		boton_seleccionado: IN std_logic_vector(3 DOWNTO 0);
		
		piso_actual_convertido: OUT std_logic_vector(1 DOWNTO 0);
		boton_seleccionado_convertido: OUT std_logic_vector(1 DOWNTO 0)
		);
 END COMPONENT;
 
COMPONENT divisorfrec
	PORT (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		salida:out STD_LOGIC
	);
 END COMPONENT;
 
COMPONENT FSM
	PORT(
	 clock,reset,nivel, celula, abierto, cerrado:  IN std_logic;
	 piso,boton :IN STD_LOGIC_VECTOR (1 DOWNTO 0)
	 );
END COMPONENT;
 
 signal inoutreloj:std_logic;
 signal inoutpiso_actual:std_logic_vector (1 DOWNTO 0);
 signal inoutpiso_deseado:std_logic_vector (1 DOWNTO 0);
 
begin

inst_decoder: decoder port map(

		code => code,
		led => segment (7 downto 1)
	);
	segment(0) <= '1';
	digctrl <= not digsel;

inst_convertidor_piso_actual:convertidor_piso_actual port map(
		piso_actual => piso_actual,
		boton_seleccionado => boton_seleccionado,
		piso_actual_convertido => inoutpiso_actual,
		boton_seleccionado_convertido => inoutpiso_deseado
		);		
		
inst_divisorfrec:divisorfrec port map(
		clk => clk,
		reset => reset,
		salida => inoutreloj
		);
inst_FSM:FSM port map(
		celula => celula,
		abierto => abierto,
		cerrado => cerrado,
		clock => inoutreloj,
		reset =>reset,
		nivel => nivel,
		piso => inoutpiso_actual,
		boton => inoutpiso_deseado
		);
		
end Behavioral;


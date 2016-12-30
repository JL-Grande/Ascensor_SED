
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TOP is
PORT(
	  boton_seleccionado: IN std_logic_vector(3 DOWNTO 0); --ENTRADAS TOP
     piso_actual: IN std_logic_vector(3 DOWNTO 0);
     nivel, celula, abierto, cerrado:  IN std_logic;
	  
	  puerta, motor_subir, motor_bajar: OUT std_logic;	   --SALIDAS TOP
	  piso0_sel, piso1_sel, piso2_sel, piso3_sel: OUT std_logic;
	  seg_piso, seg_flechas: OUT std_logic_vector(7 DOWNTO 0);
	  digit_ctrl, flecha_ctrl : OUT std_logic;
	  
	  decoder_numeros: OUT std_logic_vector(3 DOWNTO 0);
	  decoder_flechas: OUT std_logic_vector(3 DOWNTO 0);
	  
	  clk,clock: in std_logic;										--clk:antes de entrar al divisorfrec. clock:después de salir del divisorfrec		
	  reset: in std_logic
	  	  
	  );
	  
end TOP;

architecture Behavioral of TOP is
COMPONENT decoder
	PORT (
		code : in STD_LOGIC_VECTOR (3 downto 0);
		led : OUT STD_LOGIC_VECTOR (6 downto 0);
		dig_ctrl : OUT STD_LOGIC
	);
 END COMPONENT;

COMPONENT convertidor_piso_actual
	PORT(
		piso_actual: IN std_logic_vector(3 DOWNTO 0);
		boton_seleccionado: IN std_logic_vector(3 DOWNTO 0);
		
		piso_actual_convertido: OUT std_logic_vector(2 DOWNTO 0);
		boton_seleccionado_convertido: OUT std_logic_vector(2 DOWNTO 0)
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
	 piso,boton :IN STD_LOGIC_VECTOR (2 DOWNTO 0)
	 );
END COMPONENT;

COMPONENT dec_piso_seleccion
	PORT (
		piso_code : in  STD_LOGIC_VECTOR (1 downto 0);
      piso0 : out  STD_LOGIC;
      piso1 : out  STD_LOGIC;
      piso2 : out  STD_LOGIC;
      piso3 : out  STD_LOGIC
	);
END COMPONENT;

COMPONENT dec_flechas
	PORT (
		action : in  STD_LOGIC;
      led_flechas : out  STD_LOGIC_VECTOR (6 downto 0);
      flecha_ctrl : out  STD_LOGIC
	);
END COMPONENT;
 
 signal inoutreloj:std_logic;
 signal inoutpiso_actual:std_logic_vector (2 DOWNTO 0);
 signal inoutpiso_deseado:std_logic_vector (2 DOWNTO 0);
 signal sig_piso_actual:std_logic_vector (1 DOWNTO 0);
 signal code_piso_actual:std_logic_vector (3 DOWNTO 0);
 signal sig_action:std_logic;
 
begin



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
		reset => reset,
		nivel => nivel,
		piso => inoutpiso_actual,
		boton => inoutpiso_deseado
		);
		
inst_decoder: decoder port map(
		code => code_piso_actual,
		led => seg_piso (7 downto 1),
		dig_ctrl => digit_ctrl
	);
	seg_piso(0) <= '1';
		
inst_dec_piso_seleccion:dec_piso_seleccion port map(
		piso_code => sig_piso_actual,
		piso0 => piso0_sel,
		piso1 => piso1_sel,
		piso2 => piso2_sel,
		piso3 => piso3_sel
		);
		
inst_dec_flechas: dec_flechas port map(
		action => sig_action,
		led_flechas => seg_flechas (7 downto 1),
		flecha_ctrl => flecha_ctrl
	);
	seg_flechas(0) <= '1';
		
end Behavioral;


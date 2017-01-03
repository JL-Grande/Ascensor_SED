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
	  
	  clk: in std_logic;										--clk:antes de entrar al divisorfrec
	  reset: in std_logic 
	  );
	  
end TOP;

architecture Behavioral of TOP is

COMPONENT convertidor_piso_actual
	PORT(
		clk : in STD_LOGIC;
		rst : in  STD_LOGIC;
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
	 clock,reset,nivel,abierto, cerrado:  IN std_logic;
	 piso,boton :IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	 boton_memoria: out STD_LOGIC_VECTOR (2 DOWNTO 0);
	 accionador_puerta: out STD_LOGIC;
	 accionador_subir, accionador_bajar: out STD_LOGIC
	 );
END COMPONENT;

COMPONENT gestor_display
	PORT (
		CLK : in  STD_LOGIC;
      piso_now_3 : in  STD_LOGIC_VECTOR (2 downto 0);
      piso_obj_3 : in  STD_LOGIC_VECTOR (2 downto 0);
		piso_seleccionado : out STD_LOGIC_VECTOR (2 downto 0);
		piso_actual : out  STD_LOGIC_VECTOR (1 downto 0);
		accion : out  STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT decoder
	PORT (
		code : in STD_LOGIC_VECTOR (1 downto 0);
		led : OUT STD_LOGIC_VECTOR (6 downto 0);
		dig_ctrl : OUT STD_LOGIC
	);
 END COMPONENT;

COMPONENT dec_piso_seleccion
	PORT (
		piso_code : in  STD_LOGIC_VECTOR (2 downto 0);
      piso0 : out  STD_LOGIC;
      piso1 : out  STD_LOGIC;
      piso2 : out  STD_LOGIC;
      piso3 : out  STD_LOGIC
	);
END COMPONENT;

COMPONENT dec_flechas
	PORT (
		action : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
      led_flechas : out  STD_LOGIC_VECTOR (6 downto 0);
      flecha_ctrl : out  STD_LOGIC
	);
END COMPONENT;

COMPONENT motor_puerta
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
  		celula : in  STD_LOGIC;
      accionar_puerta : in  STD_LOGIC;
      actuador_puerta : out  STD_LOGIC
	);
END COMPONENT;

COMPONENT motor_ascensor 
	PORT(
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		accionar_bajar: in  STD_LOGIC;
		accionar_subir: in  STD_LOGIC;
		motor_subir: out  STD_LOGIC;
		motor_bajar : out  STD_LOGIC
	);
END COMPONENT;

 signal sig_puerta:std_logic;  --Senal para motor_puerta
 signal sig_subir:std_logic;	 --Senal para motor_subir 
 signal sig_bajar:std_logic; 	 --Senal para motor_bajar
 signal inoutreloj:std_logic;  --Senal del divisor de frecuencia
 signal inoutpiso_actual:std_logic_vector (2 DOWNTO 0);
 signal inoutpiso_deseado:std_logic_vector (2 DOWNTO 0);
 signal sig_boton_pulsado:std_logic_vector (2 DOWNTO 0);
 signal code_piso_actual:std_logic_vector (1 DOWNTO 0);
 signal code_piso_objetivo:std_logic_vector (2 DOWNTO 0);
 signal sig_action:std_logic_vector (1 DOWNTO 0);
 
begin

inst_convertidor_piso_actual:convertidor_piso_actual port map(
		clk => clk,
		rst => reset,
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
		abierto => abierto,
		cerrado => cerrado,
		clock => inoutreloj,
		reset => reset,
		nivel => nivel,
		piso => inoutpiso_actual,
		boton => inoutpiso_deseado,
		boton_memoria => sig_boton_pulsado,
		accionador_puerta => sig_puerta,
	   accionador_subir => sig_subir,
		accionador_bajar => sig_bajar
		);
		
inst_gestor_display:gestor_display port map(
		CLK => inoutreloj,
      piso_now_3 => inoutpiso_actual,
      piso_obj_3 => sig_boton_pulsado,
		piso_seleccionado => code_piso_objetivo,
		piso_actual => code_piso_actual,
		accion => sig_action
	);
		
inst_decoder: decoder port map(
		code => code_piso_actual,
		led => seg_piso (7 downto 1),
		dig_ctrl => digit_ctrl
	);
	seg_piso(0) <= '1';			--punto decimal
		
inst_dec_piso_seleccion:dec_piso_seleccion port map(
		piso_code => code_piso_objetivo,
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
	
inst_motor_puerta:motor_puerta port map(
		CLK => clk,
		RST => reset,
	  	celula => celula,
      accionar_puerta => sig_puerta,
      actuador_puerta => puerta
	);
		
inst_motor_ascensor:motor_ascensor port map(
		CLK => clk,
		RST => reset,
		accionar_bajar => sig_bajar,
		accionar_subir => sig_subir,
		motor_subir => motor_subir,
		motor_bajar => motor_bajar
	);
end Behavioral;
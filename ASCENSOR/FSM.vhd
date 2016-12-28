
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


entity FSM is
	PORT(
	 clock,reset,nivel, celula, abierto, cerrado:  IN std_logic;
	 piso,boton :IN STD_LOGIC_VECTOR (1 DOWNTO 0)
	 );
end FSM;

architecture Behavioral of FSM is

	TYPE estado IS (inicial,parado,cerrando,marcha,abriendo);
   SIGNAL presente: estado:=inicial;
   SIGNAL bot: std_logic_vector(1 DOWNTO 0); -- Almacena botón pulsado      
   SIGNAL piso_ini: std_logic_vector(1 DOWNTO 0);   -- Piso de partida
	
begin

estados:
PROCESS(reset,clock)
	BEGIN
		IF reset='1' THEN presente<=inicial;
		ELSIF clock='1' AND clock'event THEN
			CASE presente IS
				WHEN inicial=>   -- Estado inicial para que se nivele
					IF nivel='1' then presente<=parado;
					END IF;
				WHEN parado=>    -- Espera la pulsación de un botón
					IF (bot/="0000") AND (bot/=piso) THEN presente<=cerrando;
					END IF;
				WHEN cerrando=>  -- Cierra la puerta
					IF cerrado='1' THEN presente<=marcha;
					END IF;
				WHEN marcha=>    -- Lleva el ascensor a su piso
					IF (bot=piso) AND (nivel='1') THEN presente<=abriendo;
					END IF;                                              
				WHEN abriendo=>  -- Abre las puertas
					IF abierto='1' THEN presente<=parado;
					END IF;
			END CASE;
		END IF;
	END PROCESS estados;
	
memoria:
PROCESS(reset,clock)   -- Captura la pulsación del botón
BEGIN                -- y el piso donde se encuentra
   IF reset='1' THEN
     bot<="0000";
     piso_ini<=piso;
   ELSIF clock='1' AND clock'event THEN
     IF presente=parado THEN
       IF (boton="1000") OR (boton="0100") OR (boton="0010") OR (boton="0001") THEN bot<=boton;
       ELSE bot<="0000";  -- Cualquier otra combinación no vale
       END IF;
       piso_ini<=piso;
     END IF;
   END IF;
END PROCESS memoria;
end Behavioral;


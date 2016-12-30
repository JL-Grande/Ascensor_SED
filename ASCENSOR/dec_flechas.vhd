library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_flechas is
    Port ( action : in  STD_LOGIC;
           led_flechas : out  STD_LOGIC_VECTOR (6 downto 0);
           flecha_ctrl : out  STD_LOGIC);
end dec_flechas;

architecture dataflow of dec_flechas is

begin

	flecha_ctrl <= '0';
	WITH action SELECT
			led_flechas <= "0011101" WHEN '1',	--Subiendo
								"1100011" WHEN '0',	--Bajando
								"1111111" WHEN others;
END ARCHITECTURE dataflow;

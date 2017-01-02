library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gestor_display is
    Port ( CLK : in  STD_LOGIC;
           piso_now_3 : in  STD_LOGIC_VECTOR (2 downto 0);
           piso_obj_3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  piso_seleccionado : out STD_LOGIC_VECTOR (2 downto 0);
           piso_actual : out  STD_LOGIC_VECTOR (1 downto 0);
           accion : out  STD_LOGIC_VECTOR (1 downto 0)
			);
end gestor_display;

architecture Behavioral of gestor_display is 

COMPONENT traductor_3a2
	Port (
		vector_IN : in  STD_LOGIC_VECTOR (2 downto 0);
      vector_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;

signal piso_now_2:STD_LOGIC_VECTOR (1 downto 0);
signal piso_obj_2:STD_LOGIC_VECTOR (1 downto 0);

begin

inst_traductor_3a2_now:traductor_3a2 port map(
		vector_IN => piso_now_3,
		vector_OUT => piso_now_2
		);
		
inst_traductor_3a2_obj:traductor_3a2 port map(
		vector_IN => piso_obj_3,
		vector_OUT => piso_obj_2
		);

gestor_display:process(clk)
	begin
		if rising_edge(clk) then
			piso_actual <= piso_now_2;
			piso_seleccionado <= piso_obj_3;
			if (piso_now_2 < piso_obj_2) then
				accion <= "11";
			elsif (piso_now_2 > piso_obj_2) then
				accion <= "00";
			else
				accion <= "10";
			end if;
		end if;
	end process;

end Behavioral;
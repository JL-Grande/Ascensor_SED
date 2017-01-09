library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gestor_display is
    Port ( CLK : in  STD_LOGIC;
           piso_now : in  STD_LOGIC_VECTOR (1 downto 0);
           piso_obj : in  STD_LOGIC_VECTOR (1 downto 0);
			  piso_seleccionado : out STD_LOGIC_VECTOR (1 downto 0);
           piso_actual : out  STD_LOGIC_VECTOR (1 downto 0);
           accion : out  STD_LOGIC_VECTOR (1 downto 0)
			);
end gestor_display;

architecture Behavioral of gestor_display is 

begin

gestor_display:process(clk)
	begin
		if rising_edge(clk) then
			piso_actual <= piso_now;
			piso_seleccionado <= piso_obj;
			if (piso_obj= "00") then
				accion <= "01";
			elsif (piso_now < piso_obj) then
				accion <= "11";
			elsif (piso_now > piso_obj) then
				accion <= "00";
			else
				accion <= "10";
			end if;
		end if;
	end process;

end Behavioral;
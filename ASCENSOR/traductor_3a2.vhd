library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traductor_3a2 is
    Port ( clk: in STD_LOGIC;
			  vector_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           vector_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end traductor_3a2;

architecture Behavioral of traductor_3a2 is

signal transicion:STD_LOGIC_VECTOR (1 DOWNTO 0);

begin

traductor_3a2:process(clk)
	begin
		if rising_edge(clk) then
			if (vector_IN /= "000") then
				case (vector_IN) is
				when "001" =>
					vector_OUT <= "00";
				when "010" =>
					vector_OUT <= "01";
				when "011" =>
					vector_OUT <= "10";
				when others =>
					vector_OUT <= "11";
				end case;
			end if;
		end if;
	end process;

end Behavioral;
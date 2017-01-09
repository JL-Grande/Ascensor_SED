LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY decoder IS
 PORT(
			CLK : IN std_logic;
			code : IN std_logic_vector(1 DOWNTO 0);
			action : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			led : OUT std_logic_vector(6 DOWNTO 0);
			dig_ctrl : OUT  std_logic_vector(1 DOWNTO 0)
 );
END ENTITY decoder;
 
ARCHITECTURE Behavioral OF decoder IS

signal i:std_logic;

BEGIN
	process(CLK)
	begin
		if rising_edge(clk) then
			if i='0' then
				dig_ctrl <= "10";
				case (code) is
					when "01" =>
						led <= "0000001";
					when "10" =>
						led <= "1001111";
					when "11" =>
						led <= "0010010";
					when others =>
						led <= "1111110";
				end case;
				i <= '1';
			elsif i='1' then
				dig_ctrl <= "01";
				case (action) is
					when "11" =>	--Subiendo
						led <= "0011101";
					when "00" =>	--Bajando
						led <= "1100011";
					when others =>	--Parado
						led <= "1111110";
				end case;
				i <= '0';
			end if;
		end if;
	end process;
END ARCHITECTURE Behavioral;
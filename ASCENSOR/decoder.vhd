LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY decoder IS
 PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			code : IN std_logic_vector(1 DOWNTO 0);
			action : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			led : OUT std_logic_vector(6 DOWNTO 0);
			dig_ctrl : OUT  std_logic_vector(3 DOWNTO 0)
 );
END ENTITY decoder;
 
ARCHITECTURE Behavioral OF decoder IS

signal seg_reg0 : std_logic_vector(6 DOWNTO 0);
signal seg_reg1 : std_logic_vector(6 DOWNTO 0);
signal digit : std_logic;
signal address : std_logic;

BEGIN
	seg_write:process(CLK,RST)
	begin
		if rising_edge(CLK) then
			if RST = '1' then
				seg_reg0 <= "0000000";
				seg_reg1 <= "0000000";
			else
				case (code) is
						when "01" =>
							seg_reg0 <= "0000001";
							address <= '0';
						when "10" =>
							seg_reg0 <= "1001111";
							address <= '0';
						when "11" =>
							seg_reg0 <= "0010010";
							address <= '0';
						when others =>
							seg_reg0 <= "1111110";
							address <= '0';
				end case;
				
				case (action) is
						when "11" =>	--Subiendo
							seg_reg1 <= "0011101";
							address <= '1';
						when "00" =>	--Bajando
							seg_reg1 <= "1100011";
							address <= '1';
						when others =>	--Parado
							seg_reg1 <= "1111110";
							address <= '1';
				end case;
			end if;
		end if;
	end process;
	
	seg_out:process(CLK,RST)
	begin
		if RST = '1' then
			digit <= '0';
			led <= "0000000";
			dig_ctrl <= "1111";
		elsif rising_edge(CLK) then
			if digit='0' then
					dig_ctrl <= "1110";
					led <= seg_reg0;
			elsif digit='1' then
					dig_ctrl <= "0111";
					led <= seg_reg1;
			end if;
		end if;
	end process;

END ARCHITECTURE Behavioral;
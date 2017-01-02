
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traductor_3a2 is
    Port ( vector_IN : in  STD_LOGIC_VECTOR (2 downto 0);
           vector_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end traductor_3a2;

architecture Behavioral of traductor_3a2 is

begin

WITH vector_IN SELECT
				vector_OUT <=  "00" WHEN "001",
									"01" WHEN "010",
									"10" WHEN "011",
									"11" WHEN "100",
									"00" WHEN others;

end Behavioral;


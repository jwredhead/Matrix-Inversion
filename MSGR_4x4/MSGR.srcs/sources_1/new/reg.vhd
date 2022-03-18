library IEEE;
use IEEE.std_logic_1164.all;

entity reg is 
generic ( bits: integer := 4); 
port ( clk, E: IN STD_LOGIC;
		 D: IN STD_LOGIC_VECTOR(bits-1 downto 0);
		 Q: INOUT STD_LOGIC_VECTOR(bits-1 downto 0));
end reg;

architecture beh of reg is 

begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (E = '1') then
				Q <= D;
			else
				Q <= Q;
			end if;
		end if;
	end process;

end beh;

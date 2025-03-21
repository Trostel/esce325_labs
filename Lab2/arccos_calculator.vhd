library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arccos_calculator is
	port (
		clk 	: in std_logic;
		reset : in std_logic;
		X 		: in std_logic_vector(7 downto 0);
		ANGLE : out std_logic_vector(9 downto 0)
	);
end arccos_calculator;

architecture rtl of arccos_calculator is
	

begin
	calculate_angle : process (clk, reset)
		variable X2 : SIGNED (15 downto 0);
		variable P1 : SIGNED (6 downto 0);
		variable P2 : SIGNED (8 downto 0);
		variable P3 : SIGNED (8 downto 0);
		variable S1 : SIGNED (8 downto 0);
		variable S2 : SIGNED (10 downto 0);
	begin
		if (reset = '1') then
			ANGLE <= (others => '0');
		elsif (rising_edge(clk)) then
			-- X2 = X*X
			X2 := signed(X)*signed(X);
			
			-- P1 = (86*X2)/2^16
			P1 := resize(shift_right((to_signed(86, 8)*X2), 16), 7);
			
			-- S1 = 191 + P1
			
			-- P2 = (S1*X2)/2^16
			-- S2 = 1144 + P2
			-- P3 = (S2*X)/2^9
			-- ANGLE = 900 - P3
		end if;
	end process calculate_angle;
end rtl;
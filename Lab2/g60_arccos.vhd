library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g60_arccos is
	port (
		clk 	: in std_logic;
		reset : in std_logic;
		X 		: in std_logic_vector(7 downto 0);
		ANGLE : out std_logic_vector(9 downto 0)
	);
end g60_arccos;

architecture rtl of g60_arccos is
	signal X_i 	: UNSIGNED (7 downto 0);
	signal X2 	: UNSIGNED (15 downto 0);
	signal P1 	: UNSIGNED (6 downto 0);
	signal P2 	: UNSIGNED (8 downto 0);
	signal P3 	: UNSIGNED (8 downto 0);
	signal S1 	: UNSIGNED (8 downto 0);
	signal S2 	: UNSIGNED (10 downto 0);

begin
	-- X2 = X*X
	X2 <= X_i*X_i;
			
	-- P1 = (86*X2)/2^16
	P1 <= resize(shift_right((to_unsigned(86, 8)*X2), 16), 7);
	
	-- S1 = 191 + P1
	S1 <= resize(to_unsigned(191, 8) + P1, 9);
	
	-- P2 = (S1*X2)/2^16
	P2 <= resize(shift_right((S1*X2), 16), 9);

	-- S2 = 1144 + P2
	S2 <= to_unsigned(1144, 11) + P2;
	
	-- P3 = (S2*X)/2^9
	P3 <= resize(shift_right((S2*unsigned(X_i)), 9), 9);
	
	calculate_angle : process (clk, reset)
		
	begin
		if (reset = '1') then
			ANGLE <= (others => '0');
			X_i <= (others => '0');
		elsif (rising_edge(clk)) then
			X_i <= unsigned(X);
			
			-- ANGLE = 900 - P3
			ANGLE <= std_logic_vector((to_unsigned(900, 10) - P3));
		end if;
	end process calculate_angle;
end rtl;
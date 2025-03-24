library ieee;
use ieee.std_logic_1164.all;

entity g60_bcd_driver is
	Port (
		clk 	: in std_logic;
		reset : in std_logic;
		SW 	: in std_logic_vector(7 downto 0); -- slide switches
		HEX0 	: out std_logic_vector(6 downto 0);
		HEX1  : out std_logic_vector(6 downto 0);
		HEX2  : out std_logic_vector(6 downto 0);
		HEX3  : out std_logic_vector(6 downto 0);
		HEX4  : out std_logic_vector(6 downto 0)
	);
end g60_bcd_driver;

architecture rtl of g60_bcd_driver is

	signal internal_angle : std_logic_vector(15 downto 0);
	signal BCD1_int, BCD2_int, BCD3_int, BCD4_int, BCD5_int : std_logic_vector(3 downto 0);
	signal ripple_banking : std_logic_vector(2 downto 0); -- propagate blanking b/wn 4 hex displays
	
	component g60_arccos is
	port (
		clk 	: in std_logic;
		reset : in std_logic;
		X 		: in std_logic_vector(7 downto 0);
		ANGLE : out std_logic_vector(9 downto 0)
	);
	end component g60_arccos;
	
	component g60_Binary_BCD16 is
	port (
		bin  : in std_logic_vector (15 downto 0);
		BCD5 : out std_logic_vector (3 downto 0);	-- MSD
		BCD4 : out std_logic_vector (3 downto 0);
		BCD3 : out std_logic_vector (3 downto 0);
		BCD2 : out std_logic_vector (3 downto 0);
		BCD1 : out std_logic_vector (3 downto 0)  -- LSD
	);
	end component g60_Binary_BCD16;
	
	component g60_7_segment_decoder is
	port (
		BCD : in std_logic_vector(3 downto 0);
		RB_In : in std_logic;
		RB_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0)
	);
	end component g60_7_segment_decoder;

begin
	-- g60_arccos produces a 10 bit binary 'ANGLE' output. Pull down 
	-- the rest of the 16 bit input to g60_Binary_BCD16.
	internal_angle(15 downto 10) <= (others => '0');

	arccos : g60_arccos 
	port map (
		clk => clk,
		reset => reset,
		X => SW,
		ANGLE => internal_angle(9 downto 0)
	);
	
	binary_to_bcd : g60_Binary_BCD16
	port map (
		bin => internal_angle,
		BCD5 => BCD5_int,
		BCD4 => BCD4_int,
		BCD3 => BCD3_int,
		BCD2 => BCD2_int,
		BCD1 => BCD1_int		
	);
	
	-- 4 3 2 1 0 
	-- rightmost hex display
	hex0_display : g60_7_segment_decoder
	port map (
		BCD => BCD1_int,
		RB_in => '0',
		RB_out => open,
		segments => HEX0
	);
	
	hex1_display : g60_7_segment_decoder
	port map (
		BCD => BCD2_int,
		RB_in => ripple_banking(0),
		RB_out => open,
		segments => HEX1
	);
	
	hex2_display : g60_7_segment_decoder
	port map (
		BCD => BCD3_int,
		RB_in => ripple_banking(1),
		RB_out => ripple_banking(0),
		segments => HEX2
	);
	
	hex3_display : g60_7_segment_decoder
	port map (
		BCD => BCD4_int,
		RB_in => ripple_banking(2),
		RB_out => ripple_banking(1),
		segments => HEX3
	);
	
	-- leftmost hex display
	hex4_display : g60_7_segment_decoder
	port map (
		BCD => BCD5_int,
		RB_in => '1',
		RB_out => ripple_banking(2),
		segments => HEX4
	);
	

end rtl;
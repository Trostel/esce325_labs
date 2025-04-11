library ieee;
use ieee.std_logic_1164.all;

entity pd_lab_custom_component is
 Port (
	clk 			: in 	std_logic								:= 'X';
	reset_n 		: in 	std_logic								:= 'X'; 
	address 		: in 	std_logic_vector (1 downto 0) 	:= (others => 'X');
	write_n  	: in 	std_logic						  		:= 'X';
	writedata 	: in 	std_logic_vector (31 downto 0) 	:= (others => 'X');
	chipselect	: in 	std_logic								:= 'X';
	seg1			: out std_logic_vector (6 downto 0);
	seg2			: out std_logic_vector (6 downto 0);
	seg3			: out std_logic_vector (6 downto 0);
	seg4			: out std_logic_vector (6 downto 0)
 );
end pd_lab_custom_component;

architecture rtl of pd_lab_custom_component is

	component g60_bcd_driver is
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
	end component g60_bcd_driver;
	
	signal angle : std_logic_vector (7 downto 0) := (others => '0');
	
begin

	write_process : process (clk)
	
	begin
		if (reset_n = '0') then
			angle <= (others => '0');
		elsif (rising_edge(clk)) then
			if (write_n = '0') then
				angle <= writedata (7 downto 0);
			end if;
		end if;
		
	end process write_process;
	
	g60_bcd_instance : g60_bcd_driver
	port map (
		clk 		=> clk,
		reset	 	=> reset_n,
		SW			=> angle,
		HEX0		=>	seg1,
		HEX1		=> seg2,
		HEX2		=> seg3,
		HEX3		=>	seg4,
		HEX4		=> open
	);
	
end rtl;
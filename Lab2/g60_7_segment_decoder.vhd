library ieee;
use ieee.std_logic_1164.all;

entity g60_7_segment_decoder is
	port (
		BCD : in std_logic_vector(3 downto 0);
		RB_In : in std_logic;
		RB_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0)
	);
end g60_7_segment_decoder;

architecture rtl of g60_7_segment_decoder is

begin

end rtl;
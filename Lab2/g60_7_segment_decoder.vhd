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
	signal segments_int : std_logic_vector(6 downto 0);
begin
	-- BCD 8421 encoding
	-- 0 | 0b0000
	-- 1 | 0b0001
	-- 2 | 0b0010
	-- 3 | 0b0011
	-- 4 | 0b0100
	-- 5 | 0b0101
	-- 6 | 0b0110
	-- 7 | 0b0111
	-- 8 | 0b1000
	-- 9 | 0b1001
	-- all others don't care
	
	
	-- Decoder mapping
	-- HEX_0, 0xBF, 0b0111111
	-- HEX_1, 0x06, 0b0000110
	-- HEX_2, 0x5B, 0b1011011
	-- HEX_3, 0x4F, 0b1001111
	-- HEX_4, 0x66, 0b1100110
	-- HEX_5, 0x6D, 0b1101101
	-- HEX_6, 0x7D, 0b1111101
	-- HEX_7, 0x07, 0b0000111
	-- HEX_8, 0x7F, 0b1111111
	-- HEX_9, 0x6F, 0b1101111
	-- need to invert the above mappings...
	segments <= not segments_int;
	
	decode : process (BCD, RB_in)
	begin
		-- Ripple blank check
		if ((RB_in = '1') and (BCD = "0000")) then
			RB_Out <= '1';
			segments_int <= (others => '1');
		else
			RB_Out <= '0';
			case BCD is
				when "0000" => -- 0
					segments_int <= "0111111";
					
				when "0001" => -- 1
					segments_int <= "0000110";
					
				when "0010" => -- 2
					segments_int <= "1011011";
					
				when "0011" => -- 3
					segments_int <= "1001111";
					
				when "0100" => -- 4
					segments_int <= "1100110";
					
				when "0101" => -- 5
					segments_int <= "1101101";
		
				when "0110" => -- 6
					segments_int <= "1111101";
					
				when "0111" => -- 7
					segments_int <= "0000111";
					
				when "1000" => -- 8
					segments_int <= "1111111";
				
				when "1001" => -- 9
					segments_int <= "1101111";
				
				when others =>
					segments_int <= (others => '1');
				end case;
		end if;
	
	end process decode;
	
	
end rtl;
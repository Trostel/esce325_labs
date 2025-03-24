--
-- Version 1.0
-- Authors: Alex Lee, Christopher Tse On Fat
-- Date: February 24, 2025 (enter the date of the latest edit to the file)


library ieee;
use ieee.std_logic_1164.all;

entity g60_Binary_BCD16 is 
	port ( bin : in std_logic_vector (15 downto 0);
				BCD5 : out std_logic_vector (3 downto 0);	-- MSD
				BCD4 : out std_logic_vector (3 downto 0);
				BCD3 : out std_logic_vector (3 downto 0);
				BCD2 : out std_logic_vector (3 downto 0);
				BCD1 : out std_logic_vector (3 downto 0)  -- LSD
	);
	
	
end g60_Binary_BCD16;

architecture rtl of g60_Binary_BCD16 is 
		signal E_in : std_logic_vector (15 downto 0);
		signal D_in : std_logic_vector (15 downto 0);
		signal C_in : std_logic_vector (15 downto 0);
		signal B_in : std_logic_vector (15 downto 0);
		signal A_in : std_logic_vector (15 downto 0);
		
		signal Y6_out : std_logic_vector (15 downto 0);
		signal Y5_out : std_logic_vector (15 downto 0);
		signal Y4_out : std_logic_vector (15 downto 0);
		signal Y3_out : std_logic_vector (15 downto 0);
		signal Y2_out : std_logic_vector (15 downto 0);
		signal Y1_out : std_logic_vector (15 downto 0);
	component g60_DM74185
	port (  EDCBA : in std_logic_vector(4 downto 0);	
			Y : out std_logic_vector (5 downto 0)
		);
	end component g60_DM74185;
	begin

	DM0 : g60_DM74185
		port map (
			EDCBA(4) => E_in(0),
			EDCBA(3) => D_in(0),
			EDCBA(2) => C_in(0),
			EDCBA(1) => B_in(0),
			EDCBA(0) => A_in(0),
			Y(0) => y1_out(0),
			Y(1) => y2_out(0),
			Y(2) => y3_out(0),
			Y(3) => y4_out(0),
			Y(4) => y5_out(0),
			Y(5) => y6_out(0)
		);
		
	DM1 : g60_DM74185
		port map (
			EDCBA(4) => E_in(1),
			EDCBA(3) => D_in(1),
			EDCBA(2) => C_in(1),
			EDCBA(1) => B_in(1),
			EDCBA(0) => A_in(1),
			Y(0) => y1_out(1),
			Y(1) => y2_out(1),
			Y(2) => y3_out(1),
			Y(3) => y4_out(1),
			Y(4) => y5_out(1),
			Y(5) => y6_out(1)
		);
		
	DM2 : g60_DM74185
		port map (
			EDCBA(4) => E_in(2),
			EDCBA(3) => D_in(2),
			EDCBA(2) => C_in(2),
			EDCBA(1) => B_in(2),
			EDCBA(0) => A_in(2),
			Y(0) => y1_out(2),
			Y(1) => y2_out(2),
			Y(2) => y3_out(2),
			Y(3) => y4_out(2),
			Y(4) => y5_out(2),
			Y(5) => y6_out(2)
		);
		
	DM3 : g60_DM74185
		port map (
			EDCBA(4) => E_in(3),
			EDCBA(3) => D_in(3),
			EDCBA(2) => C_in(3),
			EDCBA(1) => B_in(3),
			EDCBA(0) => A_in(3),
			Y(0) => y1_out(3),
			Y(1) => y2_out(3),
			Y(2) => y3_out(3),
			Y(3) => y4_out(3),
			Y(4) => y5_out(3),
			Y(5) => y6_out(3)
		);
		
	DM4 : g60_DM74185
		port map (
			EDCBA(4) => E_in(4),
			EDCBA(3) => D_in(4),
			EDCBA(2) => C_in(4),
			EDCBA(1) => B_in(4),
			EDCBA(0) => A_in(4),
			Y(0) => y1_out(4),
			Y(1) => y2_out(4),
			Y(2) => y3_out(4),
			Y(3) => y4_out(4),
			Y(4) => y5_out(4),
			Y(5) => y6_out(4)
		);
	
	DM5 : g60_DM74185
		port map (
			EDCBA(4) => E_in(5),
			EDCBA(3) => D_in(5),
			EDCBA(2) => C_in(5),
			EDCBA(1) => B_in(5),
			EDCBA(0) => A_in(5),
			Y(0) => y1_out(5),
			Y(1) => y2_out(5),
			Y(2) => y3_out(5),
			Y(3) => y4_out(5),
			Y(4) => y5_out(5),
			Y(5) => y6_out(5)
		);
	
	DM6 : g60_DM74185
		port map (
			EDCBA(4) => E_in(6),
			EDCBA(3) => D_in(6),
			EDCBA(2) => C_in(6),
			EDCBA(1) => B_in(6),
			EDCBA(0) => A_in(6),
			Y(0) => y1_out(6),
			Y(1) => y2_out(6),
			Y(2) => y3_out(6),
			Y(3) => y4_out(6),
			Y(4) => y5_out(6),
			Y(5) => y6_out(6)
		);
		
	DM7 : g60_DM74185
		port map (
			EDCBA(4) => E_in(7),
			EDCBA(3) => D_in(7),
			EDCBA(2) => C_in(7),
			EDCBA(1) => B_in(7),
			EDCBA(0) => A_in(7),
			Y(0) => y1_out(7),
			Y(1) => y2_out(7),
			Y(2) => y3_out(7),
			Y(3) => y4_out(7),
			Y(4) => y5_out(7),
			Y(5) => y6_out(7)
		);
		
	DM8 : g60_DM74185
		port map (
			EDCBA(4) => E_in(8),
			EDCBA(3) => D_in(8),
			EDCBA(2) => C_in(8),
			EDCBA(1) => B_in(8),
			EDCBA(0) => A_in(8),
			Y(0) => y1_out(8),
			Y(1) => y2_out(8),
			Y(2) => y3_out(8),
			Y(3) => y4_out(8),
			Y(4) => y5_out(8),
			Y(5) => y6_out(8)
		);
	
	DM9 : g60_DM74185
		port map (
			EDCBA(4) => E_in(9),
			EDCBA(3) => D_in(9),
			EDCBA(2) => C_in(9),
			EDCBA(1) => B_in(9),
			EDCBA(0) => A_in(9),
			Y(0) => y1_out(9),
			Y(1) => y2_out(9),
			Y(2) => y3_out(9),
			Y(3) => y4_out(9),
			Y(4) => y5_out(9),
			Y(5) => y6_out(9)
		);
		
	DM10 : g60_DM74185
		port map (
			EDCBA(4) => E_in(10),
			EDCBA(3) => D_in(10),
			EDCBA(2) => C_in(10),
			EDCBA(1) => B_in(10),
			EDCBA(0) => A_in(10),
			Y(0) => y1_out(10),
			Y(1) => y2_out(10),
			Y(2) => y3_out(10),
			Y(3) => y4_out(10),
			Y(4) => y5_out(10),
			Y(5) => y6_out(10)
		);
		
	DM11 : g60_DM74185
		port map (
			EDCBA(4) => E_in(11),
			EDCBA(3) => D_in(11),
			EDCBA(2) => C_in(11),
			EDCBA(1) => B_in(11),
			EDCBA(0) => A_in(11),
			Y(0) => y1_out(11),
			Y(1) => y2_out(11),
			Y(2) => y3_out(11),
			Y(3) => y4_out(11),
			Y(4) => y5_out(11),
			Y(5) => y6_out(11)
		);
	
	DM12 : g60_DM74185
		port map (
			EDCBA(4) => E_in(12),
			EDCBA(3) => D_in(12),
			EDCBA(2) => C_in(12),
			EDCBA(1) => B_in(12),
			EDCBA(0) => A_in(12),
			Y(0) => y1_out(12),
			Y(1) => y2_out(12),
			Y(2) => y3_out(12),
			Y(3) => y4_out(12),
			Y(4) => y5_out(12),
			Y(5) => y6_out(12)
		);
		
	DM13 : g60_DM74185
		port map (
			EDCBA(4) => E_in(13),
			EDCBA(3) => D_in(13),
			EDCBA(2) => C_in(13),
			EDCBA(1) => B_in(13),
			EDCBA(0) => A_in(13),
			Y(0) => y1_out(13),
			Y(1) => y2_out(13),
			Y(2) => y3_out(13),
			Y(3) => y4_out(13),
			Y(4) => y5_out(13),
			Y(5) => y6_out(13)
		);
		
	DM14 : g60_DM74185
		port map (
			EDCBA(4) => E_in(14),
			EDCBA(3) => D_in(14),
			EDCBA(2) => C_in(14),
			EDCBA(1) => B_in(14),
			EDCBA(0) => A_in(14),
			Y(0) => y1_out(14),
			Y(1) => y2_out(14),
			Y(2) => y3_out(14),
			Y(3) => y4_out(14),
			Y(4) => y5_out(14),
			Y(5) => y6_out(14)
		);
		
	DM15 : g60_DM74185
		port map (
			EDCBA(4) => E_in(15),
			EDCBA(3) => D_in(15),
			EDCBA(2) => C_in(15),
			EDCBA(1) => B_in(15),
			EDCBA(0) => A_in(15),
			Y(0) => y1_out(15),
			Y(1) => y2_out(15),
			Y(2) => y3_out(15),
			Y(3) => y4_out(15),
			Y(4) => y5_out(15),
			Y(5) => y6_out(15)
		);
	
	-- DM0 in
	E_in(0) <= bin(15);
	D_in(0) <= bin(14);
	C_in(0) <= bin(13);
	B_in(0) <= bin(12);
	A_in(0) <= bin(11);
	
	-- DM1 in
	E_in(1) <= y3_out(0);
	D_in(1) <= y2_out(0);
	C_in(1) <= y1_out(0);
	B_in(1) <= bin(10);
	A_in(1) <= bin(9);

	
	-- DM2 in
	E_in(2) <= y6_out(0);
	D_in(2) <= y5_out(0);
	C_in(2) <= y4_out(0);
	B_in(2) <= y5_out(1);
	A_in(2) <= y4_out(1);
	
	-- DM3 in
	E_in(3) <= y3_out(1);
	D_in(3) <= y2_out(1);
	C_in(3) <= y1_out(1);
	B_in(3) <= bin(8);
	A_in(3) <= bin(7);
	
	-- DM4 in
	E_in(4) <= y3_out(2);
	D_in(4) <= y2_out(2);
	C_in(4) <= y1_out(2);
	B_in(4) <= y5_out(3);
	A_in(4) <= y4_out(3);
	
	-- DM5 in
	E_in(5) <= y3_out(3);
	D_in(5) <= y2_out(3);
	C_in(5) <= y1_out(3);
	B_in(5) <= bin(6);
	A_in(5) <= bin(5);
	
	-- DM6 in
	E_in(6) <= y6_out(2);
	D_in(6) <= y5_out(2);
	C_in(6) <= y4_out(2);
	B_in(6) <= y5_out(4);
	A_in(6) <= y4_out(4);
	
	-- DM7 in
	E_in(7) <= y3_out(4);
	D_in(7) <= y2_out(4);
	C_in(7) <= y1_out(4);
	B_in(7) <= y5_out(5);
	A_in(7) <= y4_out(5);
	
	-- DM8 in
	E_in(8) <= y3_out(5);
	D_in(8) <= y2_out(5);
	C_in(8) <= y1_out(5);
	B_in(8) <= bin(4);
	A_in(8) <= bin(3);
	
	-- DM9 in
	E_in(9) <= y3_out(6);
	D_in(9) <= y2_out(6);
	C_in(9) <= y1_out(6);
	B_in(9) <= y5_out(7);
	A_in(9) <= y4_out(7);
	
	-- DM10 in
	E_in(10) <= y3_out(7);
	D_in(10) <= y2_out(7);
	C_in(10) <= y1_out(7);
	B_in(10) <= y5_out(8);
	A_in(10) <= y4_out(8);
	
	-- DM11 in
	E_in(11) <= y3_out(8);
	D_in(11) <= y2_out(8);
	C_in(11) <= y1_out(8);
	B_in(11) <= bin(2);
	A_in(11) <= bin(1);
	
	-- DM12 in
	E_in(12) <= y6_out(6);
	D_in(12) <= y5_out(6);
	C_in(12) <= y4_out(6);
	B_in(12) <= y5_out(9);
	A_in(12) <= y4_out(9);
	
	-- DM13 in
	E_in(13) <= y3_out(9);
	D_in(13) <= y2_out(9);
	C_in(13) <= y1_out(9);
	B_in(13) <= y5_out(10);
	A_in(13) <= y4_out(10);
	
	-- DM14 in
	E_in(14) <= '0';
	D_in(14) <= y3_out(10);
	C_in(14) <= y2_out(10);
	B_in(14) <= y1_out(10);
	A_in(14) <= y5_out(11);
	
	-- DM15 in
	E_in(15) <= '0';
	D_in(15) <= y3_out(12);
	C_in(15) <= y2_out(12);
	B_in(15) <= y1_out(12);
	A_in(15) <= y5_out(13);
	
	-- BCD1
	BCD1(0) <= bin(0);
	BCD1(1) <= y1_out(11);
	BCD1(2) <= y2_out(11);
	BCD1(3) <= y3_out(11);
	
	-- BCD2
	BCD2(0) <= y4_out(11);
	BCD2(1) <= y1_out(14);
	BCD2(2) <= y2_out(14);
	BCD2(3) <= y3_out(14);
	
	-- BCD3
	BCD3(0) <= y4_out(14);
	BCD3(1) <= y1_out(13);
	BCD3(2) <= y2_out(13);
	BCD3(3) <= y3_out(13);
	
	-- BCD4
	BCD4(0) <= y4_out(13);
	BCD4(1) <= y1_out(15);
	BCD4(2) <= y2_out(15);
	BCD4(3) <= y3_out(15);
	
	-- BCD5
	BCD5(0) <= y4_out(15);
	BCD5(1) <= y4_out(12);
	BCD5(2) <= y5_out(12);
	BCD5(3) <= y6_out(12);
	
end rtl;
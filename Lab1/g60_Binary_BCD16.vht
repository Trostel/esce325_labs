-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/24/2025 19:46:12"
                                                            
-- Vhdl Test Bench template for design  :  g60_Binary_BCD16
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g60_Binary_BCD16_vhd_tst IS
END g60_Binary_BCD16_vhd_tst;
ARCHITECTURE g60_Binary_BCD16_arch OF g60_Binary_BCD16_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BCD1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bin : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT g60_Binary_BCD16
	PORT (
	BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	BCD5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	bin : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g60_Binary_BCD16
	PORT MAP (
-- list connections between master ports and signals
	BCD1 => BCD1,
	BCD2 => BCD2,
	BCD3 => BCD3,
	BCD4 => BCD4,
	BCD5 => BCD5,
	bin => bin
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
		bin <= "0000000000000000";
		wait for 10 ns;
		bin <= "1111111111111111";
		WAIT FOR 5 ns;
		bin <= "1110011001010011";
		wait for 10 ns;
wait;
		
END PROCESS always;                                          
END g60_Binary_BCD16_arch;

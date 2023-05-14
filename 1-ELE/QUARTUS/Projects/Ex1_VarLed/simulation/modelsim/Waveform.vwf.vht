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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/02/2020 12:53:45"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          VarLed
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VarLed_vhd_vec_tst IS
END VarLed_vhd_vec_tst;
ARCHITECTURE VarLed_arch OF VarLed_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BTN : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CLK : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL SWT : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT VarLed
	PORT (
	BTN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	CLK : IN STD_LOGIC;
	LED : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	SWT : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : VarLed
	PORT MAP (
-- list connections between master ports and signals
	BTN => BTN,
	CLK => CLK,
	LED => LED,
	SWT => SWT
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;
-- BTN[1]
t_prcs_BTN_1: PROCESS
BEGIN
	BTN(1) <= '1';
WAIT;
END PROCESS t_prcs_BTN_1;
-- BTN[0]
t_prcs_BTN_0: PROCESS
BEGIN
	BTN(0) <= '1';
WAIT;
END PROCESS t_prcs_BTN_0;
-- SWT[9]
t_prcs_SWT_9: PROCESS
BEGIN
	SWT(9) <= '0';
WAIT;
END PROCESS t_prcs_SWT_9;
-- SWT[8]
t_prcs_SWT_8: PROCESS
BEGIN
	SWT(8) <= '0';
WAIT;
END PROCESS t_prcs_SWT_8;
-- SWT[7]
t_prcs_SWT_7: PROCESS
BEGIN
	SWT(7) <= '0';
WAIT;
END PROCESS t_prcs_SWT_7;
-- SWT[6]
t_prcs_SWT_6: PROCESS
BEGIN
	SWT(6) <= '0';
WAIT;
END PROCESS t_prcs_SWT_6;
-- SWT[5]
t_prcs_SWT_5: PROCESS
BEGIN
	SWT(5) <= '0';
WAIT;
END PROCESS t_prcs_SWT_5;
-- SWT[4]
t_prcs_SWT_4: PROCESS
BEGIN
	SWT(4) <= '0';
WAIT;
END PROCESS t_prcs_SWT_4;
-- SWT[3]
t_prcs_SWT_3: PROCESS
BEGIN
	SWT(3) <= '0';
WAIT;
END PROCESS t_prcs_SWT_3;
-- SWT[2]
t_prcs_SWT_2: PROCESS
BEGIN
	SWT(2) <= '0';
WAIT;
END PROCESS t_prcs_SWT_2;
-- SWT[1]
t_prcs_SWT_1: PROCESS
BEGIN
	SWT(1) <= '0';
WAIT;
END PROCESS t_prcs_SWT_1;
-- SWT[0]
t_prcs_SWT_0: PROCESS
BEGIN
	SWT(0) <= '0';
WAIT;
END PROCESS t_prcs_SWT_0;
END VarLed_arch;

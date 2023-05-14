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
-- Generated on "04/13/2020 17:51:08"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          UART_RTX
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY UART_RTX_vhd_vec_tst IS
END UART_RTX_vhd_vec_tst;
ARCHITECTURE UART_RTX_arch OF UART_RTX_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BTN : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CLK : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL RXL : STD_LOGIC;
SIGNAL SWT : STD_LOGIC;
SIGNAL TXL : STD_LOGIC;
COMPONENT UART_RTX
	PORT (
	BTN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	CLK : IN STD_LOGIC;
	LED : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	RXL : IN STD_LOGIC;
	SWT : IN STD_LOGIC;
	TXL : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : UART_RTX
	PORT MAP (
-- list connections between master ports and signals
	BTN => BTN,
	CLK => CLK,
	LED => LED,
	RXL => RXL,
	SWT => SWT,
	TXL => TXL
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 4500000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- BTN[1]
t_prcs_BTN_1: PROCESS
BEGIN
	BTN(1) <= '1';
WAIT;
END PROCESS t_prcs_BTN_1;

-- RXL
t_prcs_RXL: PROCESS
BEGIN
	RXL <= '1';
	WAIT FOR 80000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 360000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 240000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 360000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 240000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 360000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
	WAIT FOR 120000 ps;
	RXL <= '0';
	WAIT FOR 120000 ps;
	RXL <= '1';
WAIT;
END PROCESS t_prcs_RXL;
END UART_RTX_arch;

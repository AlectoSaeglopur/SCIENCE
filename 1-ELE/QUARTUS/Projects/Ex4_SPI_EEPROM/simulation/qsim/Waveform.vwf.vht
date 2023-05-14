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
-- Generated on "05/29/2021 22:43:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SPI_EEPROM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SPI_EEPROM_vhd_vec_tst IS
END SPI_EEPROM_vhd_vec_tst;
ARCHITECTURE SPI_EEPROM_arch OF SPI_EEPROM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BTN : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CLK : STD_LOGIC;
SIGNAL DBG_RXBUF : STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL DGB_STREG : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LED : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL SCK : STD_LOGIC;
SIGNAL SCS : STD_LOGIC;
SIGNAL SDI : STD_LOGIC;
SIGNAL SDO : STD_LOGIC;
SIGNAL SEG0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SEG5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SWT : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT SPI_EEPROM
	PORT (
	BTN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	CLK : IN STD_LOGIC;
	DBG_RXBUF : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
	DGB_STREG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	LED : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	SCK : OUT STD_LOGIC;
	SCS : OUT STD_LOGIC;
	SDI : IN STD_LOGIC;
	SDO : OUT STD_LOGIC;
	SEG0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEG5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SWT : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : SPI_EEPROM
	PORT MAP (
-- list connections between master ports and signals
	BTN => BTN,
	CLK => CLK,
	DBG_RXBUF => DBG_RXBUF,
	DGB_STREG => DGB_STREG,
	LED => LED,
	SCK => SCK,
	SCS => SCS,
	SDI => SDI,
	SDO => SDO,
	SEG0 => SEG0,
	SEG1 => SEG1,
	SEG2 => SEG2,
	SEG3 => SEG3,
	SEG4 => SEG4,
	SEG5 => SEG5,
	SWT => SWT
	);

-- BTN[0]
t_prcs_BTN_0: PROCESS
BEGIN
	BTN(0) <= '1';
	WAIT FOR 120000 ps;
	BTN(0) <= '0';
	WAIT FOR 120000 ps;
	BTN(0) <= '1';
	WAIT FOR 4480000 ps;
	BTN(0) <= '0';
	WAIT FOR 240000 ps;
	BTN(0) <= '1';
WAIT;
END PROCESS t_prcs_BTN_0;

-- BTN[1]
t_prcs_BTN_1: PROCESS
BEGIN
	BTN(1) <= '1';
WAIT;
END PROCESS t_prcs_BTN_1;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 5400000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- SDI
t_prcs_SDI: PROCESS
BEGIN
	SDI <= '0';
	WAIT FOR 1760000 ps;
	SDI <= '1';
	WAIT FOR 480000 ps;
	SDI <= '0';
	WAIT FOR 160000 ps;
	SDI <= '1';
	WAIT FOR 240000 ps;
	SDI <= '0';
	WAIT FOR 720000 ps;
	SDI <= '1';
	WAIT FOR 160000 ps;
	SDI <= '0';
	WAIT FOR 240000 ps;
	SDI <= '1';
	WAIT FOR 480000 ps;
	SDI <= '0';
WAIT;
END PROCESS t_prcs_SDI;
END SPI_EEPROM_arch;

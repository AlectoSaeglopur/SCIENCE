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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/29/2021 22:43:10"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SPI_EEPROM IS
    PORT (
	CLK : IN std_logic;
	SDI : IN std_logic;
	SDO : OUT std_logic;
	SCS : OUT std_logic;
	SCK : OUT std_logic;
	DBG_RXBUF : OUT std_logic_vector(23 DOWNTO 0);
	DGB_STREG : OUT std_logic_vector(7 DOWNTO 0);
	BTN : IN std_logic_vector(1 DOWNTO 0);
	SWT : IN std_logic_vector(1 DOWNTO 0);
	LED : OUT std_logic_vector(9 DOWNTO 0);
	SEG0 : OUT std_logic_vector(7 DOWNTO 0);
	SEG1 : OUT std_logic_vector(7 DOWNTO 0);
	SEG2 : OUT std_logic_vector(7 DOWNTO 0);
	SEG3 : OUT std_logic_vector(7 DOWNTO 0);
	SEG4 : OUT std_logic_vector(7 DOWNTO 0);
	SEG5 : OUT std_logic_vector(7 DOWNTO 0)
	);
END SPI_EEPROM;

-- Design Ports Information
-- SDO	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCS	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SCK	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[0]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[1]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[2]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[3]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[4]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[5]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[6]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[7]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[8]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[9]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[10]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[11]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[12]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[13]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[14]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[15]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[16]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[17]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[18]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[19]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[20]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[21]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[22]	=>  Location: PIN_K14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DBG_RXBUF[23]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[1]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[2]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[3]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[4]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[5]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[6]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DGB_STREG[7]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[7]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[8]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[9]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[1]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[5]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[6]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG0[7]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[0]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[1]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[2]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[3]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[5]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[6]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG1[7]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[0]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[1]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[2]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[3]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[4]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[5]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[6]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG2[7]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[0]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[2]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[3]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[4]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[5]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[6]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG3[7]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[0]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[1]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[3]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[4]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[5]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[6]	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG4[7]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[0]	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[1]	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[3]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[4]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[5]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[6]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEG5[7]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SDI	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SPI_EEPROM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_SDI : std_logic;
SIGNAL ww_SDO : std_logic;
SIGNAL ww_SCS : std_logic;
SIGNAL ww_SCK : std_logic;
SIGNAL ww_DBG_RXBUF : std_logic_vector(23 DOWNTO 0);
SIGNAL ww_DGB_STREG : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_BTN : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SWT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LED : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_SEG0 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SEG1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SEG2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SEG3 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SEG4 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SEG5 : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \SckLine~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \SDO~output_o\ : std_logic;
SIGNAL \SCS~output_o\ : std_logic;
SIGNAL \SCK~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[0]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[1]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[2]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[3]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[4]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[5]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[6]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[7]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[8]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[9]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[10]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[11]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[12]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[13]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[14]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[15]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[16]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[17]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[18]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[19]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[20]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[21]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[22]~output_o\ : std_logic;
SIGNAL \DBG_RXBUF[23]~output_o\ : std_logic;
SIGNAL \DGB_STREG[0]~output_o\ : std_logic;
SIGNAL \DGB_STREG[1]~output_o\ : std_logic;
SIGNAL \DGB_STREG[2]~output_o\ : std_logic;
SIGNAL \DGB_STREG[3]~output_o\ : std_logic;
SIGNAL \DGB_STREG[4]~output_o\ : std_logic;
SIGNAL \DGB_STREG[5]~output_o\ : std_logic;
SIGNAL \DGB_STREG[6]~output_o\ : std_logic;
SIGNAL \DGB_STREG[7]~output_o\ : std_logic;
SIGNAL \LED[0]~output_o\ : std_logic;
SIGNAL \LED[1]~output_o\ : std_logic;
SIGNAL \LED[2]~output_o\ : std_logic;
SIGNAL \LED[3]~output_o\ : std_logic;
SIGNAL \LED[4]~output_o\ : std_logic;
SIGNAL \LED[5]~output_o\ : std_logic;
SIGNAL \LED[6]~output_o\ : std_logic;
SIGNAL \LED[7]~output_o\ : std_logic;
SIGNAL \LED[8]~output_o\ : std_logic;
SIGNAL \LED[9]~output_o\ : std_logic;
SIGNAL \SEG0[0]~output_o\ : std_logic;
SIGNAL \SEG0[1]~output_o\ : std_logic;
SIGNAL \SEG0[2]~output_o\ : std_logic;
SIGNAL \SEG0[3]~output_o\ : std_logic;
SIGNAL \SEG0[4]~output_o\ : std_logic;
SIGNAL \SEG0[5]~output_o\ : std_logic;
SIGNAL \SEG0[6]~output_o\ : std_logic;
SIGNAL \SEG0[7]~output_o\ : std_logic;
SIGNAL \SEG1[0]~output_o\ : std_logic;
SIGNAL \SEG1[1]~output_o\ : std_logic;
SIGNAL \SEG1[2]~output_o\ : std_logic;
SIGNAL \SEG1[3]~output_o\ : std_logic;
SIGNAL \SEG1[4]~output_o\ : std_logic;
SIGNAL \SEG1[5]~output_o\ : std_logic;
SIGNAL \SEG1[6]~output_o\ : std_logic;
SIGNAL \SEG1[7]~output_o\ : std_logic;
SIGNAL \SEG2[0]~output_o\ : std_logic;
SIGNAL \SEG2[1]~output_o\ : std_logic;
SIGNAL \SEG2[2]~output_o\ : std_logic;
SIGNAL \SEG2[3]~output_o\ : std_logic;
SIGNAL \SEG2[4]~output_o\ : std_logic;
SIGNAL \SEG2[5]~output_o\ : std_logic;
SIGNAL \SEG2[6]~output_o\ : std_logic;
SIGNAL \SEG2[7]~output_o\ : std_logic;
SIGNAL \SEG3[0]~output_o\ : std_logic;
SIGNAL \SEG3[1]~output_o\ : std_logic;
SIGNAL \SEG3[2]~output_o\ : std_logic;
SIGNAL \SEG3[3]~output_o\ : std_logic;
SIGNAL \SEG3[4]~output_o\ : std_logic;
SIGNAL \SEG3[5]~output_o\ : std_logic;
SIGNAL \SEG3[6]~output_o\ : std_logic;
SIGNAL \SEG3[7]~output_o\ : std_logic;
SIGNAL \SEG4[0]~output_o\ : std_logic;
SIGNAL \SEG4[1]~output_o\ : std_logic;
SIGNAL \SEG4[2]~output_o\ : std_logic;
SIGNAL \SEG4[3]~output_o\ : std_logic;
SIGNAL \SEG4[4]~output_o\ : std_logic;
SIGNAL \SEG4[5]~output_o\ : std_logic;
SIGNAL \SEG4[6]~output_o\ : std_logic;
SIGNAL \SEG4[7]~output_o\ : std_logic;
SIGNAL \SEG5[0]~output_o\ : std_logic;
SIGNAL \SEG5[1]~output_o\ : std_logic;
SIGNAL \SEG5[2]~output_o\ : std_logic;
SIGNAL \SEG5[3]~output_o\ : std_logic;
SIGNAL \SEG5[4]~output_o\ : std_logic;
SIGNAL \SEG5[5]~output_o\ : std_logic;
SIGNAL \SEG5[6]~output_o\ : std_logic;
SIGNAL \SEG5[7]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \NxSckCnt[1]~1_combout\ : std_logic;
SIGNAL \NxSckCnt[0]~0_combout\ : std_logic;
SIGNAL \SckLine~0_combout\ : std_logic;
SIGNAL \SckLine~q\ : std_logic;
SIGNAL \SckLine~clkctrl_outclk\ : std_logic;
SIGNAL \NxTxBitCnt[0]~3_combout\ : std_logic;
SIGNAL \BTN[1]~input_o\ : std_logic;
SIGNAL \Pushed[1]~1_combout\ : std_logic;
SIGNAL \SM_Handler~5_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~4_combout\ : std_logic;
SIGNAL \Equal21~0_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~5_combout\ : std_logic;
SIGNAL \Equal23~1_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~2_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~6_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~7_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~8_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Equal17~0_combout\ : std_logic;
SIGNAL \Clock_SCK~3_combout\ : std_logic;
SIGNAL \SDI~input_o\ : std_logic;
SIGNAL \NxStatusReg~0_combout\ : std_logic;
SIGNAL \NxTxBitCnt[1]~15_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \NxStatusReg[1]~3_combout\ : std_logic;
SIGNAL \NxStatusReg[1]~4_combout\ : std_logic;
SIGNAL \SWT[0]~input_o\ : std_logic;
SIGNAL \BTN[0]~input_o\ : std_logic;
SIGNAL \Pushed[0]~0_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \SM_Handler~4_combout\ : std_logic;
SIGNAL \Equal5~2_combout\ : std_logic;
SIGNAL \StatusReg[0]~0_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~9_combout\ : std_logic;
SIGNAL \NxStatusReg[0]~1_combout\ : std_logic;
SIGNAL \NxStatusReg[0]~2_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~10_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~11_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~12_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~14_combout\ : std_logic;
SIGNAL \NxState~13_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~13_combout\ : std_logic;
SIGNAL \NxState[1]~9_combout\ : std_logic;
SIGNAL \NxState~35_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \NxState~21_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \NxState~36_combout\ : std_logic;
SIGNAL \NxState[1]~20_combout\ : std_logic;
SIGNAL \NxState[1]~22_combout\ : std_logic;
SIGNAL \NxTxByteCnt~4_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~3_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~4_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~1_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~2_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~5_combout\ : std_logic;
SIGNAL \Equal9~1_combout\ : std_logic;
SIGNAL \NxTxByteCnt~5_combout\ : std_logic;
SIGNAL \Add2~1_combout\ : std_logic;
SIGNAL \NxTxByteCnt~7_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \NxTxByteCnt~6_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \Equal22~0_combout\ : std_logic;
SIGNAL \NxState~11_combout\ : std_logic;
SIGNAL \NxState~10_combout\ : std_logic;
SIGNAL \NxState~12_combout\ : std_logic;
SIGNAL \NxState~33_combout\ : std_logic;
SIGNAL \NxState~17_combout\ : std_logic;
SIGNAL \NxState~15_combout\ : std_logic;
SIGNAL \NxState~14_combout\ : std_logic;
SIGNAL \NxState~16_combout\ : std_logic;
SIGNAL \NxState~18_combout\ : std_logic;
SIGNAL \NxState~19_combout\ : std_logic;
SIGNAL \NxState[2]~34_combout\ : std_logic;
SIGNAL \NxState[2]~27_combout\ : std_logic;
SIGNAL \NxState[2]~26_combout\ : std_logic;
SIGNAL \NxState[2]~28_combout\ : std_logic;
SIGNAL \NxState[2]~29_combout\ : std_logic;
SIGNAL \Equal10~0_combout\ : std_logic;
SIGNAL \NxState[3]~23_combout\ : std_logic;
SIGNAL \NxState[3]~24_combout\ : std_logic;
SIGNAL \NxState[3]~25_combout\ : std_logic;
SIGNAL \NxState[4]~30_combout\ : std_logic;
SIGNAL \NxState[4]~31_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~0_combout\ : std_logic;
SIGNAL \SM_Handler~6_combout\ : std_logic;
SIGNAL \NxSdoLine~16_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Equal11~0_combout\ : std_logic;
SIGNAL \NxSdoLine~17_combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \NxSdoLine~18_combout\ : std_logic;
SIGNAL \NxSdoLine~19_combout\ : std_logic;
SIGNAL \NxSdoLine~37_combout\ : std_logic;
SIGNAL \NxSdoLine~33_combout\ : std_logic;
SIGNAL \NxSdoLine~34_combout\ : std_logic;
SIGNAL \NxSdoLine~20_combout\ : std_logic;
SIGNAL \NxSdoLine~36_combout\ : std_logic;
SIGNAL \NxSdoLine~21_combout\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \Equal15~0_combout\ : std_logic;
SIGNAL \NxSdoLine~29_combout\ : std_logic;
SIGNAL \NxSdoLine~30_combout\ : std_logic;
SIGNAL \NxSdoLine~31_combout\ : std_logic;
SIGNAL \Equal19~0_combout\ : std_logic;
SIGNAL \NxState~8_combout\ : std_logic;
SIGNAL \NxSdoLine~27_combout\ : std_logic;
SIGNAL \NxSdoLine~13_combout\ : std_logic;
SIGNAL \NxSdoLine~38_combout\ : std_logic;
SIGNAL \NxSdoLine~26_combout\ : std_logic;
SIGNAL \NxSdoLine~22_combout\ : std_logic;
SIGNAL \NxSdoLine~23_combout\ : std_logic;
SIGNAL \NxSdoLine~24_combout\ : std_logic;
SIGNAL \SWT[1]~input_o\ : std_logic;
SIGNAL \NxSdoLine~39_combout\ : std_logic;
SIGNAL \IncrWrVal[0]~8_combout\ : std_logic;
SIGNAL \Clock_SCK~2_combout\ : std_logic;
SIGNAL \IncrWrVal[0]~12_combout\ : std_logic;
SIGNAL \IncrWrVal[0]~9\ : std_logic;
SIGNAL \IncrWrVal[1]~10_combout\ : std_logic;
SIGNAL \IncrWrVal[1]~11\ : std_logic;
SIGNAL \IncrWrVal[2]~13_combout\ : std_logic;
SIGNAL \IncrWrVal[2]~14\ : std_logic;
SIGNAL \IncrWrVal[3]~15_combout\ : std_logic;
SIGNAL \IncrWrVal[3]~16\ : std_logic;
SIGNAL \IncrWrVal[4]~17_combout\ : std_logic;
SIGNAL \IncrWrVal[4]~18\ : std_logic;
SIGNAL \IncrWrVal[5]~19_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \IncrWrVal[5]~20\ : std_logic;
SIGNAL \IncrWrVal[6]~21_combout\ : std_logic;
SIGNAL \IncrWrVal[6]~22\ : std_logic;
SIGNAL \IncrWrVal[7]~23_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \NxSdoLine~40_combout\ : std_logic;
SIGNAL \NxSdoLine~25_combout\ : std_logic;
SIGNAL \NxSdoLine~28_combout\ : std_logic;
SIGNAL \NxSdoLine~32_combout\ : std_logic;
SIGNAL \NxSdoLine~35_combout\ : std_logic;
SIGNAL \SdoLine~q\ : std_logic;
SIGNAL \Equal23~0_combout\ : std_logic;
SIGNAL \Equal13~0_combout\ : std_logic;
SIGNAL \NxSckEn~0_combout\ : std_logic;
SIGNAL \NxScsLine~7_combout\ : std_logic;
SIGNAL \Equal16~0_combout\ : std_logic;
SIGNAL \Equal16~1_combout\ : std_logic;
SIGNAL \NxScsLine~8_combout\ : std_logic;
SIGNAL \NxScsLine~9_combout\ : std_logic;
SIGNAL \NxScsLine~15_combout\ : std_logic;
SIGNAL \NxScsLine~16_combout\ : std_logic;
SIGNAL \NxScsLine~10_combout\ : std_logic;
SIGNAL \NxScsLine~12_combout\ : std_logic;
SIGNAL \NxScsLine~11_combout\ : std_logic;
SIGNAL \NxScsLine~13_combout\ : std_logic;
SIGNAL \NxScsLine~14_combout\ : std_logic;
SIGNAL \ScsLine~q\ : std_logic;
SIGNAL \NxSckEn~4_combout\ : std_logic;
SIGNAL \NxSckEn~1_combout\ : std_logic;
SIGNAL \NxSckEn~2_combout\ : std_logic;
SIGNAL \NxSckEn~3_combout\ : std_logic;
SIGNAL \NxSckEn~5_combout\ : std_logic;
SIGNAL \SckEn~q\ : std_logic;
SIGNAL \SCK~0_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \NxRxBuf[2][0]~42_combout\ : std_logic;
SIGNAL \NxRxBuf[2][0]~77_combout\ : std_logic;
SIGNAL \RxBuf~0_combout\ : std_logic;
SIGNAL \RxBuf[2][0]~q\ : std_logic;
SIGNAL \NxRxBuf[2][1]~43_combout\ : std_logic;
SIGNAL \NxRxBuf[2][1]~78_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~q\ : std_logic;
SIGNAL \NxRxBuf~44_combout\ : std_logic;
SIGNAL \NxRxBuf[2][2]~45_combout\ : std_logic;
SIGNAL \NxRxBuf[2][2]~79_combout\ : std_logic;
SIGNAL \RxBuf[2][2]~q\ : std_logic;
SIGNAL \NxRxBuf~46_combout\ : std_logic;
SIGNAL \NxRxBuf[2][3]~47_combout\ : std_logic;
SIGNAL \NxRxBuf[2][3]~80_combout\ : std_logic;
SIGNAL \RxBuf[2][3]~q\ : std_logic;
SIGNAL \NxRxBuf~48_combout\ : std_logic;
SIGNAL \NxRxBuf[2][4]~49_combout\ : std_logic;
SIGNAL \NxRxBuf[2][4]~81_combout\ : std_logic;
SIGNAL \RxBuf[2][4]~q\ : std_logic;
SIGNAL \NxRxBuf~50_combout\ : std_logic;
SIGNAL \NxRxBuf[2][5]~51_combout\ : std_logic;
SIGNAL \NxRxBuf[2][5]~82_combout\ : std_logic;
SIGNAL \RxBuf[2][5]~q\ : std_logic;
SIGNAL \NxRxBuf~52_combout\ : std_logic;
SIGNAL \NxRxBuf[2][6]~53_combout\ : std_logic;
SIGNAL \NxRxBuf[2][6]~83_combout\ : std_logic;
SIGNAL \RxBuf[2][6]~q\ : std_logic;
SIGNAL \NxRxBuf[2][7]~54_combout\ : std_logic;
SIGNAL \NxRxBuf[2][7]~55_combout\ : std_logic;
SIGNAL \NxRxBuf[2][7]~84_combout\ : std_logic;
SIGNAL \RxBuf[2][7]~q\ : std_logic;
SIGNAL \NxState~32_combout\ : std_logic;
SIGNAL \NxRxBuf[1][0]~56_combout\ : std_logic;
SIGNAL \RxBuf[1][0]~q\ : std_logic;
SIGNAL \NxRxBuf[1][1]~57_combout\ : std_logic;
SIGNAL \NxRxBuf[1][1]~85_combout\ : std_logic;
SIGNAL \RxBuf[1][1]~q\ : std_logic;
SIGNAL \NxRxBuf[1][2]~58_combout\ : std_logic;
SIGNAL \NxRxBuf[1][2]~86_combout\ : std_logic;
SIGNAL \RxBuf[1][2]~q\ : std_logic;
SIGNAL \NxRxBuf[1][3]~59_combout\ : std_logic;
SIGNAL \NxRxBuf[1][3]~87_combout\ : std_logic;
SIGNAL \RxBuf[1][3]~q\ : std_logic;
SIGNAL \NxRxBuf[1][4]~60_combout\ : std_logic;
SIGNAL \NxRxBuf[1][4]~88_combout\ : std_logic;
SIGNAL \RxBuf[1][4]~q\ : std_logic;
SIGNAL \NxRxBuf[1][5]~61_combout\ : std_logic;
SIGNAL \NxRxBuf[1][5]~89_combout\ : std_logic;
SIGNAL \RxBuf[1][5]~q\ : std_logic;
SIGNAL \NxRxBuf[1][6]~62_combout\ : std_logic;
SIGNAL \NxRxBuf[1][6]~90_combout\ : std_logic;
SIGNAL \RxBuf[1][6]~q\ : std_logic;
SIGNAL \NxRxBuf[1][7]~63_combout\ : std_logic;
SIGNAL \NxRxBuf[1][7]~91_combout\ : std_logic;
SIGNAL \RxBuf[1][7]~q\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \NxRxBuf[0][0]~64_combout\ : std_logic;
SIGNAL \NxRxBuf[0][0]~92_combout\ : std_logic;
SIGNAL \RxBuf[0][0]~q\ : std_logic;
SIGNAL \NxRxBuf[0][1]~65_combout\ : std_logic;
SIGNAL \NxRxBuf[0][1]~93_combout\ : std_logic;
SIGNAL \RxBuf[0][1]~q\ : std_logic;
SIGNAL \NxRxBuf[0][2]~66_combout\ : std_logic;
SIGNAL \NxRxBuf[0][2]~94_combout\ : std_logic;
SIGNAL \RxBuf[0][2]~q\ : std_logic;
SIGNAL \NxRxBuf~69_combout\ : std_logic;
SIGNAL \NxRxBuf~67_combout\ : std_logic;
SIGNAL \NxRxBuf[0][3]~68_combout\ : std_logic;
SIGNAL \NxRxBuf[0][3]~70_combout\ : std_logic;
SIGNAL \RxBuf[0][3]~q\ : std_logic;
SIGNAL \NxRxBuf[0][4]~71_combout\ : std_logic;
SIGNAL \NxRxBuf[0][4]~95_combout\ : std_logic;
SIGNAL \RxBuf[0][4]~q\ : std_logic;
SIGNAL \NxRxBuf~72_combout\ : std_logic;
SIGNAL \NxRxBuf[0][5]~73_combout\ : std_logic;
SIGNAL \NxRxBuf[0][5]~74_combout\ : std_logic;
SIGNAL \RxBuf[0][5]~q\ : std_logic;
SIGNAL \NxRxBuf[0][6]~75_combout\ : std_logic;
SIGNAL \NxRxBuf[0][6]~96_combout\ : std_logic;
SIGNAL \RxBuf[0][6]~q\ : std_logic;
SIGNAL \NxRxBuf[0][7]~76_combout\ : std_logic;
SIGNAL \NxRxBuf[0][7]~97_combout\ : std_logic;
SIGNAL \RxBuf[0][7]~q\ : std_logic;
SIGNAL \LedR~0_combout\ : std_logic;
SIGNAL \LedR~q\ : std_logic;
SIGNAL \LedW~0_combout\ : std_logic;
SIGNAL \LedW~q\ : std_logic;
SIGNAL \NxStatusReg[2]~5_combout\ : std_logic;
SIGNAL \NxStatusReg[2]~6_combout\ : std_logic;
SIGNAL \NxStatusReg[3]~7_combout\ : std_logic;
SIGNAL \Equal9~0_combout\ : std_logic;
SIGNAL \NxStatusReg~8_combout\ : std_logic;
SIGNAL \NxStatusReg[3]~9_combout\ : std_logic;
SIGNAL \NxStatusReg[4]~10_combout\ : std_logic;
SIGNAL \NxStatusReg[4]~11_combout\ : std_logic;
SIGNAL \NxStatusReg[5]~12_combout\ : std_logic;
SIGNAL \NxStatusReg[5]~13_combout\ : std_logic;
SIGNAL \NxStatusReg[6]~14_combout\ : std_logic;
SIGNAL \NxStatusReg[6]~15_combout\ : std_logic;
SIGNAL \NxStatusReg[7]~16_combout\ : std_logic;
SIGNAL \NxStatusReg[7]~17_combout\ : std_logic;
SIGNAL \SEG0~0_combout\ : std_logic;
SIGNAL \SEG0~1_combout\ : std_logic;
SIGNAL \SEG0~2_combout\ : std_logic;
SIGNAL \SEG0~3_combout\ : std_logic;
SIGNAL \SEG0~4_combout\ : std_logic;
SIGNAL \SEG0~5_combout\ : std_logic;
SIGNAL \SEG0~6_combout\ : std_logic;
SIGNAL \SEG1~0_combout\ : std_logic;
SIGNAL \SEG1~1_combout\ : std_logic;
SIGNAL \SEG1~2_combout\ : std_logic;
SIGNAL \SEG1~3_combout\ : std_logic;
SIGNAL \SEG1~4_combout\ : std_logic;
SIGNAL \SEG1~5_combout\ : std_logic;
SIGNAL \SEG1~6_combout\ : std_logic;
SIGNAL \SEG2~0_combout\ : std_logic;
SIGNAL \SEG2~1_combout\ : std_logic;
SIGNAL \SEG2~2_combout\ : std_logic;
SIGNAL \SEG2~3_combout\ : std_logic;
SIGNAL \SEG2~4_combout\ : std_logic;
SIGNAL \SEG2~5_combout\ : std_logic;
SIGNAL \SEG2~6_combout\ : std_logic;
SIGNAL \SEG3~0_combout\ : std_logic;
SIGNAL \SEG3~1_combout\ : std_logic;
SIGNAL \SEG3~2_combout\ : std_logic;
SIGNAL \SEG3~3_combout\ : std_logic;
SIGNAL \SEG3~4_combout\ : std_logic;
SIGNAL \SEG3~5_combout\ : std_logic;
SIGNAL \SEG3~6_combout\ : std_logic;
SIGNAL \SEG4~0_combout\ : std_logic;
SIGNAL \SEG4~1_combout\ : std_logic;
SIGNAL \SEG4~2_combout\ : std_logic;
SIGNAL \SEG4~3_combout\ : std_logic;
SIGNAL \SEG4~4_combout\ : std_logic;
SIGNAL \SEG4~5_combout\ : std_logic;
SIGNAL \SEG4~6_combout\ : std_logic;
SIGNAL \SEG5~0_combout\ : std_logic;
SIGNAL \SEG5~1_combout\ : std_logic;
SIGNAL \SEG5~2_combout\ : std_logic;
SIGNAL \SEG5~3_combout\ : std_logic;
SIGNAL \SEG5~4_combout\ : std_logic;
SIGNAL \SEG5~5_combout\ : std_logic;
SIGNAL \SEG5~6_combout\ : std_logic;
SIGNAL IncrWrVal : std_logic_vector(7 DOWNTO 0);
SIGNAL StatusReg : std_logic_vector(7 DOWNTO 0);
SIGNAL State : std_logic_vector(4 DOWNTO 0);
SIGNAL Pushed : std_logic_vector(1 DOWNTO 0);
SIGNAL TxBitCnt : std_logic_vector(2 DOWNTO 0);
SIGNAL TxByteCnt : std_logic_vector(3 DOWNTO 0);
SIGNAL SckCnt : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_SEG5~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG4~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG3~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG2~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG1~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG0~6_combout\ : std_logic;
SIGNAL ALT_INV_StatusReg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_RxBuf[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][5]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][4]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][3]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][2]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[0][0]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][7]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][6]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][5]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][4]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][3]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][2]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][1]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][7]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][6]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][5]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][4]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][3]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][2]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][1]~q\ : std_logic;
SIGNAL \ALT_INV_RxBuf[2][0]~q\ : std_logic;
SIGNAL \ALT_INV_ScsLine~q\ : std_logic;
SIGNAL \ALT_INV_SckLine~clkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLK <= CLK;
ww_SDI <= SDI;
SDO <= ww_SDO;
SCS <= ww_SCS;
SCK <= ww_SCK;
DBG_RXBUF <= ww_DBG_RXBUF;
DGB_STREG <= ww_DGB_STREG;
ww_BTN <= BTN;
ww_SWT <= SWT;
LED <= ww_LED;
SEG0 <= ww_SEG0;
SEG1 <= ww_SEG1;
SEG2 <= ww_SEG2;
SEG3 <= ww_SEG3;
SEG4 <= ww_SEG4;
SEG5 <= ww_SEG5;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\SckLine~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \SckLine~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_SEG5~6_combout\ <= NOT \SEG5~6_combout\;
\ALT_INV_SEG4~6_combout\ <= NOT \SEG4~6_combout\;
\ALT_INV_SEG3~6_combout\ <= NOT \SEG3~6_combout\;
\ALT_INV_SEG2~6_combout\ <= NOT \SEG2~6_combout\;
\ALT_INV_SEG1~6_combout\ <= NOT \SEG1~6_combout\;
\ALT_INV_SEG0~6_combout\ <= NOT \SEG0~6_combout\;
ALT_INV_StatusReg(7) <= NOT StatusReg(7);
ALT_INV_StatusReg(6) <= NOT StatusReg(6);
ALT_INV_StatusReg(5) <= NOT StatusReg(5);
ALT_INV_StatusReg(4) <= NOT StatusReg(4);
ALT_INV_StatusReg(3) <= NOT StatusReg(3);
ALT_INV_StatusReg(2) <= NOT StatusReg(2);
ALT_INV_StatusReg(1) <= NOT StatusReg(1);
ALT_INV_StatusReg(0) <= NOT StatusReg(0);
\ALT_INV_RxBuf[0][7]~q\ <= NOT \RxBuf[0][7]~q\;
\ALT_INV_RxBuf[0][6]~q\ <= NOT \RxBuf[0][6]~q\;
\ALT_INV_RxBuf[0][5]~q\ <= NOT \RxBuf[0][5]~q\;
\ALT_INV_RxBuf[0][4]~q\ <= NOT \RxBuf[0][4]~q\;
\ALT_INV_RxBuf[0][3]~q\ <= NOT \RxBuf[0][3]~q\;
\ALT_INV_RxBuf[0][2]~q\ <= NOT \RxBuf[0][2]~q\;
\ALT_INV_RxBuf[0][1]~q\ <= NOT \RxBuf[0][1]~q\;
\ALT_INV_RxBuf[0][0]~q\ <= NOT \RxBuf[0][0]~q\;
\ALT_INV_RxBuf[1][7]~q\ <= NOT \RxBuf[1][7]~q\;
\ALT_INV_RxBuf[1][6]~q\ <= NOT \RxBuf[1][6]~q\;
\ALT_INV_RxBuf[1][5]~q\ <= NOT \RxBuf[1][5]~q\;
\ALT_INV_RxBuf[1][4]~q\ <= NOT \RxBuf[1][4]~q\;
\ALT_INV_RxBuf[1][3]~q\ <= NOT \RxBuf[1][3]~q\;
\ALT_INV_RxBuf[1][2]~q\ <= NOT \RxBuf[1][2]~q\;
\ALT_INV_RxBuf[1][1]~q\ <= NOT \RxBuf[1][1]~q\;
\ALT_INV_RxBuf[1][0]~q\ <= NOT \RxBuf[1][0]~q\;
\ALT_INV_RxBuf[2][7]~q\ <= NOT \RxBuf[2][7]~q\;
\ALT_INV_RxBuf[2][6]~q\ <= NOT \RxBuf[2][6]~q\;
\ALT_INV_RxBuf[2][5]~q\ <= NOT \RxBuf[2][5]~q\;
\ALT_INV_RxBuf[2][4]~q\ <= NOT \RxBuf[2][4]~q\;
\ALT_INV_RxBuf[2][3]~q\ <= NOT \RxBuf[2][3]~q\;
\ALT_INV_RxBuf[2][2]~q\ <= NOT \RxBuf[2][2]~q\;
\ALT_INV_RxBuf[2][1]~q\ <= NOT \RxBuf[2][1]~q\;
\ALT_INV_RxBuf[2][0]~q\ <= NOT \RxBuf[2][0]~q\;
\ALT_INV_ScsLine~q\ <= NOT \ScsLine~q\;
\ALT_INV_SckLine~clkctrl_outclk\ <= NOT \SckLine~clkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N24
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X24_Y0_N2
\SDO~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SdoLine~q\,
	devoe => ww_devoe,
	o => \SDO~output_o\);

-- Location: IOOBUF_X31_Y0_N30
\SCS~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ScsLine~q\,
	devoe => ww_devoe,
	o => \SCS~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\SCK~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SCK~0_combout\,
	devoe => ww_devoe,
	o => \SCK~output_o\);

-- Location: IOOBUF_X54_Y54_N2
\DBG_RXBUF[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][0]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[0]~output_o\);

-- Location: IOOBUF_X56_Y54_N23
\DBG_RXBUF[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][1]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[1]~output_o\);

-- Location: IOOBUF_X54_Y54_N9
\DBG_RXBUF[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][2]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[2]~output_o\);

-- Location: IOOBUF_X54_Y54_N16
\DBG_RXBUF[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][3]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[3]~output_o\);

-- Location: IOOBUF_X60_Y54_N30
\DBG_RXBUF[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][4]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[4]~output_o\);

-- Location: IOOBUF_X58_Y54_N9
\DBG_RXBUF[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][5]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[5]~output_o\);

-- Location: IOOBUF_X60_Y54_N23
\DBG_RXBUF[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][6]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[6]~output_o\);

-- Location: IOOBUF_X54_Y54_N23
\DBG_RXBUF[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[2][7]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[7]~output_o\);

-- Location: IOOBUF_X56_Y54_N2
\DBG_RXBUF[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][0]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[8]~output_o\);

-- Location: IOOBUF_X58_Y54_N2
\DBG_RXBUF[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][1]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[9]~output_o\);

-- Location: IOOBUF_X54_Y54_N30
\DBG_RXBUF[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][2]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[10]~output_o\);

-- Location: IOOBUF_X58_Y54_N30
\DBG_RXBUF[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][3]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[11]~output_o\);

-- Location: IOOBUF_X78_Y45_N16
\DBG_RXBUF[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][4]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[12]~output_o\);

-- Location: IOOBUF_X78_Y41_N16
\DBG_RXBUF[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][5]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[13]~output_o\);

-- Location: IOOBUF_X49_Y54_N16
\DBG_RXBUF[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][6]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[14]~output_o\);

-- Location: IOOBUF_X56_Y54_N16
\DBG_RXBUF[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[1][7]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[15]~output_o\);

-- Location: IOOBUF_X78_Y45_N2
\DBG_RXBUF[16]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][0]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[16]~output_o\);

-- Location: IOOBUF_X78_Y49_N23
\DBG_RXBUF[17]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][1]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[17]~output_o\);

-- Location: IOOBUF_X71_Y54_N30
\DBG_RXBUF[18]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][2]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[18]~output_o\);

-- Location: IOOBUF_X46_Y54_N16
\DBG_RXBUF[19]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][3]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[19]~output_o\);

-- Location: IOOBUF_X78_Y44_N16
\DBG_RXBUF[20]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][4]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[20]~output_o\);

-- Location: IOOBUF_X78_Y49_N16
\DBG_RXBUF[21]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][5]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[21]~output_o\);

-- Location: IOOBUF_X78_Y41_N24
\DBG_RXBUF[22]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][6]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[22]~output_o\);

-- Location: IOOBUF_X69_Y54_N2
\DBG_RXBUF[23]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RxBuf[0][7]~q\,
	devoe => ww_devoe,
	o => \DBG_RXBUF[23]~output_o\);

-- Location: IOOBUF_X58_Y0_N16
\DGB_STREG[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[0]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\DGB_STREG[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[1]~output_o\);

-- Location: IOOBUF_X26_Y39_N23
\DGB_STREG[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\DGB_STREG[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[3]~output_o\);

-- Location: IOOBUF_X22_Y39_N30
\DGB_STREG[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[4]~output_o\);

-- Location: IOOBUF_X78_Y31_N2
\DGB_STREG[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[5]~output_o\);

-- Location: IOOBUF_X24_Y0_N16
\DGB_STREG[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[6]~output_o\);

-- Location: IOOBUF_X22_Y0_N30
\DGB_STREG[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DGB_STREG[7]~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\LED[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LedR~q\,
	devoe => ww_devoe,
	o => \LED[0]~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\LED[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LedW~q\,
	devoe => ww_devoe,
	o => \LED[1]~output_o\);

-- Location: IOOBUF_X51_Y54_N16
\LED[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(0),
	devoe => ww_devoe,
	o => \LED[2]~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\LED[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(1),
	devoe => ww_devoe,
	o => \LED[3]~output_o\);

-- Location: IOOBUF_X56_Y54_N30
\LED[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(2),
	devoe => ww_devoe,
	o => \LED[4]~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\LED[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(3),
	devoe => ww_devoe,
	o => \LED[5]~output_o\);

-- Location: IOOBUF_X66_Y54_N23
\LED[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(4),
	devoe => ww_devoe,
	o => \LED[6]~output_o\);

-- Location: IOOBUF_X56_Y54_N9
\LED[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(5),
	devoe => ww_devoe,
	o => \LED[7]~output_o\);

-- Location: IOOBUF_X51_Y54_N9
\LED[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(6),
	devoe => ww_devoe,
	o => \LED[8]~output_o\);

-- Location: IOOBUF_X49_Y54_N9
\LED[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_StatusReg(7),
	devoe => ww_devoe,
	o => \LED[9]~output_o\);

-- Location: IOOBUF_X58_Y54_N16
\SEG0[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~0_combout\,
	devoe => ww_devoe,
	o => \SEG0[0]~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\SEG0[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~1_combout\,
	devoe => ww_devoe,
	o => \SEG0[1]~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\SEG0[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~2_combout\,
	devoe => ww_devoe,
	o => \SEG0[2]~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\SEG0[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~3_combout\,
	devoe => ww_devoe,
	o => \SEG0[3]~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\SEG0[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~4_combout\,
	devoe => ww_devoe,
	o => \SEG0[4]~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\SEG0[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG0~5_combout\,
	devoe => ww_devoe,
	o => \SEG0[5]~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\SEG0[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG0~6_combout\,
	devoe => ww_devoe,
	o => \SEG0[6]~output_o\);

-- Location: IOOBUF_X66_Y54_N16
\SEG0[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG0[7]~output_o\);

-- Location: IOOBUF_X69_Y54_N23
\SEG1[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~0_combout\,
	devoe => ww_devoe,
	o => \SEG1[0]~output_o\);

-- Location: IOOBUF_X78_Y49_N9
\SEG1[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~1_combout\,
	devoe => ww_devoe,
	o => \SEG1[1]~output_o\);

-- Location: IOOBUF_X78_Y49_N2
\SEG1[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~2_combout\,
	devoe => ww_devoe,
	o => \SEG1[2]~output_o\);

-- Location: IOOBUF_X60_Y54_N9
\SEG1[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~3_combout\,
	devoe => ww_devoe,
	o => \SEG1[3]~output_o\);

-- Location: IOOBUF_X64_Y54_N2
\SEG1[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~4_combout\,
	devoe => ww_devoe,
	o => \SEG1[4]~output_o\);

-- Location: IOOBUF_X66_Y54_N30
\SEG1[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG1~5_combout\,
	devoe => ww_devoe,
	o => \SEG1[5]~output_o\);

-- Location: IOOBUF_X69_Y54_N30
\SEG1[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG1~6_combout\,
	devoe => ww_devoe,
	o => \SEG1[6]~output_o\);

-- Location: IOOBUF_X60_Y54_N16
\SEG1[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG1[7]~output_o\);

-- Location: IOOBUF_X78_Y44_N9
\SEG2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~0_combout\,
	devoe => ww_devoe,
	o => \SEG2[0]~output_o\);

-- Location: IOOBUF_X66_Y54_N2
\SEG2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~1_combout\,
	devoe => ww_devoe,
	o => \SEG2[1]~output_o\);

-- Location: IOOBUF_X69_Y54_N16
\SEG2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~2_combout\,
	devoe => ww_devoe,
	o => \SEG2[2]~output_o\);

-- Location: IOOBUF_X78_Y44_N2
\SEG2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~3_combout\,
	devoe => ww_devoe,
	o => \SEG2[3]~output_o\);

-- Location: IOOBUF_X78_Y43_N2
\SEG2[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~4_combout\,
	devoe => ww_devoe,
	o => \SEG2[4]~output_o\);

-- Location: IOOBUF_X78_Y35_N2
\SEG2[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG2~5_combout\,
	devoe => ww_devoe,
	o => \SEG2[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N9
\SEG2[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG2~6_combout\,
	devoe => ww_devoe,
	o => \SEG2[6]~output_o\);

-- Location: IOOBUF_X66_Y54_N9
\SEG2[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG2[7]~output_o\);

-- Location: IOOBUF_X78_Y35_N23
\SEG3[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~0_combout\,
	devoe => ww_devoe,
	o => \SEG3[0]~output_o\);

-- Location: IOOBUF_X78_Y33_N9
\SEG3[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~1_combout\,
	devoe => ww_devoe,
	o => \SEG3[1]~output_o\);

-- Location: IOOBUF_X78_Y33_N2
\SEG3[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~2_combout\,
	devoe => ww_devoe,
	o => \SEG3[2]~output_o\);

-- Location: IOOBUF_X69_Y54_N9
\SEG3[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~3_combout\,
	devoe => ww_devoe,
	o => \SEG3[3]~output_o\);

-- Location: IOOBUF_X78_Y41_N9
\SEG3[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~4_combout\,
	devoe => ww_devoe,
	o => \SEG3[4]~output_o\);

-- Location: IOOBUF_X78_Y41_N2
\SEG3[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG3~5_combout\,
	devoe => ww_devoe,
	o => \SEG3[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N16
\SEG3[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG3~6_combout\,
	devoe => ww_devoe,
	o => \SEG3[6]~output_o\);

-- Location: IOOBUF_X78_Y35_N9
\SEG3[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG3[7]~output_o\);

-- Location: IOOBUF_X78_Y40_N16
\SEG4[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~0_combout\,
	devoe => ww_devoe,
	o => \SEG4[0]~output_o\);

-- Location: IOOBUF_X78_Y40_N2
\SEG4[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~1_combout\,
	devoe => ww_devoe,
	o => \SEG4[1]~output_o\);

-- Location: IOOBUF_X78_Y40_N23
\SEG4[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~2_combout\,
	devoe => ww_devoe,
	o => \SEG4[2]~output_o\);

-- Location: IOOBUF_X78_Y42_N16
\SEG4[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~3_combout\,
	devoe => ww_devoe,
	o => \SEG4[3]~output_o\);

-- Location: IOOBUF_X78_Y45_N23
\SEG4[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~4_combout\,
	devoe => ww_devoe,
	o => \SEG4[4]~output_o\);

-- Location: IOOBUF_X78_Y40_N9
\SEG4[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG4~5_combout\,
	devoe => ww_devoe,
	o => \SEG4[5]~output_o\);

-- Location: IOOBUF_X78_Y35_N16
\SEG4[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG4~6_combout\,
	devoe => ww_devoe,
	o => \SEG4[6]~output_o\);

-- Location: IOOBUF_X78_Y43_N23
\SEG4[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG4[7]~output_o\);

-- Location: IOOBUF_X78_Y45_N9
\SEG5[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~0_combout\,
	devoe => ww_devoe,
	o => \SEG5[0]~output_o\);

-- Location: IOOBUF_X78_Y42_N2
\SEG5[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~1_combout\,
	devoe => ww_devoe,
	o => \SEG5[1]~output_o\);

-- Location: IOOBUF_X78_Y37_N16
\SEG5[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~2_combout\,
	devoe => ww_devoe,
	o => \SEG5[2]~output_o\);

-- Location: IOOBUF_X78_Y34_N24
\SEG5[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~3_combout\,
	devoe => ww_devoe,
	o => \SEG5[3]~output_o\);

-- Location: IOOBUF_X78_Y34_N9
\SEG5[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~4_combout\,
	devoe => ww_devoe,
	o => \SEG5[4]~output_o\);

-- Location: IOOBUF_X78_Y34_N16
\SEG5[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG5~5_combout\,
	devoe => ww_devoe,
	o => \SEG5[5]~output_o\);

-- Location: IOOBUF_X78_Y34_N2
\SEG5[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_SEG5~6_combout\,
	devoe => ww_devoe,
	o => \SEG5[6]~output_o\);

-- Location: IOOBUF_X78_Y37_N9
\SEG5[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \SEG5[7]~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G19
\CLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: LCCOMB_X47_Y51_N12
\NxSckCnt[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[1]~1_combout\ = (!SckCnt(1) & SckCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => SckCnt(1),
	datad => SckCnt(0),
	combout => \NxSckCnt[1]~1_combout\);

-- Location: FF_X47_Y51_N13
\SckCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(1));

-- Location: LCCOMB_X47_Y51_N10
\NxSckCnt[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[0]~0_combout\ = (!SckCnt(0) & !SckCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => SckCnt(0),
	datad => SckCnt(1),
	combout => \NxSckCnt[0]~0_combout\);

-- Location: FF_X47_Y51_N11
\SckCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(0));

-- Location: LCCOMB_X45_Y51_N0
\SckLine~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SckLine~0_combout\ = \SckLine~q\ $ (((!SckCnt(0) & SckCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(0),
	datac => \SckLine~q\,
	datad => SckCnt(1),
	combout => \SckLine~0_combout\);

-- Location: FF_X45_Y51_N1
SckLine : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \SckLine~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SckLine~q\);

-- Location: CLKCTRL_G12
\SckLine~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SckLine~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SckLine~clkctrl_outclk\);

-- Location: LCCOMB_X49_Y50_N26
\NxTxBitCnt[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~3_combout\ = (!State(4) & !State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datad => State(2),
	combout => \NxTxBitCnt[0]~3_combout\);

-- Location: IOIBUF_X49_Y54_N29
\BTN[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BTN(1),
	o => \BTN[1]~input_o\);

-- Location: LCCOMB_X50_Y51_N12
\Pushed[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Pushed[1]~1_combout\ = !\BTN[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \BTN[1]~input_o\,
	combout => \Pushed[1]~1_combout\);

-- Location: FF_X50_Y51_N13
\Pushed[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \Pushed[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pushed(1));

-- Location: LCCOMB_X50_Y51_N6
\SM_Handler~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~5_combout\ = (!\BTN[1]~input_o\ & !Pushed(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datad => Pushed(1),
	combout => \SM_Handler~5_combout\);

-- Location: LCCOMB_X52_Y51_N2
\Equal2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (!State(2) & !State(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datac => State(3),
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X54_Y50_N2
\NxTxBitCnt[0]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~4_combout\ = (State(4) & (((State(3))))) # (!State(4) & (((State(0))) # (!State(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(0),
	datac => State(3),
	datad => State(4),
	combout => \NxTxBitCnt[0]~4_combout\);

-- Location: LCCOMB_X49_Y50_N16
\Equal21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~0_combout\ = (State(4) & (!State(3) & !State(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datac => State(3),
	datad => State(2),
	combout => \Equal21~0_combout\);

-- Location: LCCOMB_X49_Y50_N20
\NxTxBitCnt[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~5_combout\ = (\NxTxBitCnt[0]~3_combout\ & ((State(1) & (!State(3) & !State(0))) # (!State(1) & ((State(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => \NxTxBitCnt[0]~3_combout\,
	combout => \NxTxBitCnt[0]~5_combout\);

-- Location: LCCOMB_X50_Y50_N0
\Equal23~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~1_combout\ = (State(1) & State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datad => State(0),
	combout => \Equal23~1_combout\);

-- Location: LCCOMB_X49_Y50_N18
\NxTxBitCnt[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~2_combout\ = (!State(4) & State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datad => State(2),
	combout => \NxTxBitCnt[0]~2_combout\);

-- Location: LCCOMB_X49_Y50_N30
\NxTxBitCnt[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~6_combout\ = (\NxTxBitCnt[0]~2_combout\ & ((State(3) & ((!State(0)))) # (!State(3) & ((State(0)) # (!State(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => \NxTxBitCnt[0]~2_combout\,
	combout => \NxTxBitCnt[0]~6_combout\);

-- Location: LCCOMB_X49_Y50_N8
\NxTxBitCnt[0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~7_combout\ = (\NxTxBitCnt[0]~5_combout\) # ((\NxTxBitCnt[0]~6_combout\) # ((\Equal21~0_combout\ & !\Equal23~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~0_combout\,
	datab => \NxTxBitCnt[0]~5_combout\,
	datac => \Equal23~1_combout\,
	datad => \NxTxBitCnt[0]~6_combout\,
	combout => \NxTxBitCnt[0]~7_combout\);

-- Location: LCCOMB_X51_Y50_N22
\NxTxBitCnt[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~8_combout\ = (!\NxTxBitCnt[0]~7_combout\ & ((State(2)) # (\NxTxBitCnt[0]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \NxTxBitCnt[0]~4_combout\,
	datac => \NxTxBitCnt[0]~7_combout\,
	combout => \NxTxBitCnt[0]~8_combout\);

-- Location: LCCOMB_X52_Y51_N0
\Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (State(0) & (!State(4) & State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(4),
	datac => State(1),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X49_Y50_N28
\Equal17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal17~0_combout\ = (State(3) & (State(1) & (!State(0) & \NxTxBitCnt[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => \NxTxBitCnt[0]~2_combout\,
	combout => \Equal17~0_combout\);

-- Location: LCCOMB_X52_Y51_N6
\Clock_SCK~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Clock_SCK~3_combout\ = (\Equal17~0_combout\) # ((State(2) & (\Equal4~0_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal4~0_combout\,
	datac => State(3),
	datad => \Equal17~0_combout\,
	combout => \Clock_SCK~3_combout\);

-- Location: IOIBUF_X24_Y0_N29
\SDI~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SDI,
	o => \SDI~input_o\);

-- Location: LCCOMB_X49_Y50_N0
\NxStatusReg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~0_combout\ = (State(1) & (\NxTxBitCnt[0]~2_combout\ & (State(3) $ (State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => \NxTxBitCnt[0]~2_combout\,
	combout => \NxStatusReg~0_combout\);

-- Location: LCCOMB_X51_Y50_N30
\NxTxBitCnt[1]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[1]~15_combout\ = (\NxTxBitCnt[0]~12_combout\ & ((TxBitCnt(0) $ (TxBitCnt(1))))) # (!\NxTxBitCnt[0]~12_combout\ & (\NxTxBitCnt[0]~8_combout\ & ((TxBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[0]~8_combout\,
	datab => TxBitCnt(0),
	datac => TxBitCnt(1),
	datad => \NxTxBitCnt[0]~12_combout\,
	combout => \NxTxBitCnt[1]~15_combout\);

-- Location: FF_X51_Y50_N31
\TxBitCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxBitCnt[1]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitCnt(1));

-- Location: LCCOMB_X56_Y50_N12
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (TxBitCnt(2) & (TxBitCnt(1) & !TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X55_Y51_N10
\NxStatusReg[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[1]~3_combout\ = (\NxStatusReg~0_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!StatusReg(1)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => StatusReg(1),
	datad => \Mux3~0_combout\,
	combout => \NxStatusReg[1]~3_combout\);

-- Location: LCCOMB_X55_Y51_N26
\NxStatusReg[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[1]~4_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[1]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[1]~3_combout\,
	combout => \NxStatusReg[1]~4_combout\);

-- Location: IOIBUF_X51_Y54_N29
\SWT[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(0),
	o => \SWT[0]~input_o\);

-- Location: IOIBUF_X46_Y54_N29
\BTN[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BTN(0),
	o => \BTN[0]~input_o\);

-- Location: LCCOMB_X52_Y51_N20
\Pushed[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Pushed[0]~0_combout\ = !\BTN[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \BTN[0]~input_o\,
	combout => \Pushed[0]~0_combout\);

-- Location: FF_X52_Y51_N21
\Pushed[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \Pushed[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pushed(0));

-- Location: LCCOMB_X54_Y51_N2
\Equal5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (!State(1) & (!State(4) & !State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(4),
	datad => State(0),
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X52_Y51_N14
\SM_Handler~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~4_combout\ = (\BTN[0]~input_o\) # ((Pushed(0)) # ((!\Equal2~1_combout\) # (!\Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datab => Pushed(0),
	datac => \Equal5~0_combout\,
	datad => \Equal2~1_combout\,
	combout => \SM_Handler~4_combout\);

-- Location: LCCOMB_X52_Y51_N30
\Equal5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~2_combout\ = (State(2) & (\Equal5~0_combout\ & !State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~0_combout\,
	datac => State(3),
	combout => \Equal5~2_combout\);

-- Location: LCCOMB_X52_Y51_N26
\StatusReg[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \StatusReg[0]~0_combout\ = (!\Equal5~2_combout\ & ((\Clock_SCK~3_combout\ & ((\SM_Handler~4_combout\))) # (!\Clock_SCK~3_combout\ & (!\SWT[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Clock_SCK~3_combout\,
	datab => \SWT[0]~input_o\,
	datac => \SM_Handler~4_combout\,
	datad => \Equal5~2_combout\,
	combout => \StatusReg[0]~0_combout\);

-- Location: FF_X55_Y51_N27
\StatusReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[1]~4_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(1));

-- Location: LCCOMB_X50_Y51_N24
\NxTxBitCnt[0]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~9_combout\ = (State(3) & (\Equal4~0_combout\ & ((!State(2)) # (!StatusReg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(1),
	datab => State(3),
	datac => \Equal4~0_combout\,
	datad => State(2),
	combout => \NxTxBitCnt[0]~9_combout\);

-- Location: LCCOMB_X55_Y51_N8
\NxStatusReg[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[0]~1_combout\ = (\NxStatusReg~0_combout\ & ((\NxState[1]~9_combout\ & (\SDI~input_o\)) # (!\NxState[1]~9_combout\ & ((!StatusReg(0)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => \NxState[1]~9_combout\,
	datad => StatusReg(0),
	combout => \NxStatusReg[0]~1_combout\);

-- Location: LCCOMB_X55_Y51_N0
\NxStatusReg[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[0]~2_combout\ = (!\NxStatusReg[0]~1_combout\ & \Clock_SCK~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxStatusReg[0]~1_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \NxStatusReg[0]~2_combout\);

-- Location: FF_X55_Y51_N1
\StatusReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[0]~2_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(0));

-- Location: LCCOMB_X50_Y51_N2
\NxTxBitCnt[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~10_combout\ = (State(3) & (((StatusReg(0))))) # (!State(3) & (!\BTN[1]~input_o\ & ((!Pushed(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => State(3),
	datac => StatusReg(0),
	datad => Pushed(1),
	combout => \NxTxBitCnt[0]~10_combout\);

-- Location: LCCOMB_X50_Y51_N20
\NxTxBitCnt[0]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~11_combout\ = (\NxTxBitCnt[0]~9_combout\) # ((!State(2) & (\Equal5~0_combout\ & \NxTxBitCnt[0]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \NxTxBitCnt[0]~9_combout\,
	datac => \Equal5~0_combout\,
	datad => \NxTxBitCnt[0]~10_combout\,
	combout => \NxTxBitCnt[0]~11_combout\);

-- Location: LCCOMB_X51_Y50_N24
\NxTxBitCnt[0]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~12_combout\ = (\NxTxBitCnt[0]~11_combout\) # (((\NxTxBitCnt[0]~7_combout\ & !\NxState[1]~9_combout\)) # (!\SM_Handler~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[0]~11_combout\,
	datab => \SM_Handler~4_combout\,
	datac => \NxTxBitCnt[0]~7_combout\,
	datad => \NxState[1]~9_combout\,
	combout => \NxTxBitCnt[0]~12_combout\);

-- Location: LCCOMB_X51_Y50_N10
\NxTxBitCnt[0]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~14_combout\ = (TxBitCnt(0) & (\NxTxBitCnt[0]~8_combout\ & !\NxTxBitCnt[0]~12_combout\)) # (!TxBitCnt(0) & ((\NxTxBitCnt[0]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[0]~8_combout\,
	datac => TxBitCnt(0),
	datad => \NxTxBitCnt[0]~12_combout\,
	combout => \NxTxBitCnt[0]~14_combout\);

-- Location: FF_X51_Y50_N11
\TxBitCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxBitCnt[0]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitCnt(0));

-- Location: LCCOMB_X51_Y50_N16
\NxState~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~13_combout\ = (!TxBitCnt(1)) # (!TxBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(0),
	datac => TxBitCnt(1),
	combout => \NxState~13_combout\);

-- Location: LCCOMB_X51_Y50_N0
\NxTxBitCnt[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~13_combout\ = (\NxTxBitCnt[0]~12_combout\ & ((\NxState~13_combout\ $ (!TxBitCnt(2))))) # (!\NxTxBitCnt[0]~12_combout\ & (\NxTxBitCnt[0]~8_combout\ & ((TxBitCnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[0]~8_combout\,
	datab => \NxState~13_combout\,
	datac => TxBitCnt(2),
	datad => \NxTxBitCnt[0]~12_combout\,
	combout => \NxTxBitCnt[2]~13_combout\);

-- Location: FF_X51_Y50_N1
\TxBitCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxBitCnt[2]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitCnt(2));

-- Location: LCCOMB_X56_Y50_N22
\NxState[1]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~9_combout\ = (TxBitCnt(2) & (TxBitCnt(1) & TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxState[1]~9_combout\);

-- Location: LCCOMB_X49_Y51_N12
\NxState~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~35_combout\ = (State(0) & (!State(1) & ((\NxState[1]~9_combout\) # (State(2))))) # (!State(0) & (State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(1),
	datac => \NxState[1]~9_combout\,
	datad => State(2),
	combout => \NxState~35_combout\);

-- Location: LCCOMB_X49_Y51_N18
\Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!State(1) & State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(1),
	datad => State(0),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X49_Y51_N24
\NxState~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~21_combout\ = (\NxState[1]~9_combout\ & (\Equal2~0_combout\)) # (!\NxState[1]~9_combout\ & (((\Equal23~1_combout\ & State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Equal23~1_combout\,
	datac => \NxState[1]~9_combout\,
	datad => State(2),
	combout => \NxState~21_combout\);

-- Location: LCCOMB_X49_Y51_N16
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (State(1) & !State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(1),
	datad => State(0),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X49_Y51_N22
\NxState~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~36_combout\ = (State(3) & (\NxState~35_combout\)) # (!State(3) & (((\NxState~21_combout\) # (\Equal3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~35_combout\,
	datab => \NxState~21_combout\,
	datac => \Equal3~0_combout\,
	datad => State(3),
	combout => \NxState~36_combout\);

-- Location: LCCOMB_X49_Y51_N30
\NxState[1]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~20_combout\ = (State(0) & ((State(1) & ((!\Equal2~1_combout\))) # (!State(1) & (\NxState[1]~9_combout\ & \Equal2~1_combout\)))) # (!State(0) & (State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(1),
	datac => \NxState[1]~9_combout\,
	datad => \Equal2~1_combout\,
	combout => \NxState[1]~20_combout\);

-- Location: LCCOMB_X49_Y51_N8
\NxState[1]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~22_combout\ = (State(4) & (((\NxState[1]~20_combout\)))) # (!State(4) & (\NxState~36_combout\ & (\SM_Handler~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~36_combout\,
	datab => \SM_Handler~4_combout\,
	datac => \NxState[1]~20_combout\,
	datad => State(4),
	combout => \NxState[1]~22_combout\);

-- Location: FF_X49_Y51_N9
\State[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[1]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(1));

-- Location: LCCOMB_X54_Y50_N30
\NxTxByteCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~4_combout\ = (!State(3) & (!State(0) & !TxByteCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(0),
	datac => TxByteCnt(0),
	combout => \NxTxByteCnt~4_combout\);

-- Location: LCCOMB_X49_Y50_N10
\TxByteCnt[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~3_combout\ = ((!State(3) & (State(1) & !State(0)))) # (!State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => State(2),
	combout => \TxByteCnt[3]~3_combout\);

-- Location: LCCOMB_X49_Y50_N4
\TxByteCnt[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~4_combout\ = (State(4) & (((!State(0) & !\NxState[1]~9_combout\)))) # (!State(4) & ((\TxByteCnt[3]~3_combout\) # ((!\NxState[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~3_combout\,
	datab => State(4),
	datac => State(0),
	datad => \NxState[1]~9_combout\,
	combout => \TxByteCnt[3]~4_combout\);

-- Location: LCCOMB_X49_Y51_N28
\TxByteCnt[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~1_combout\ = (State(0) & (((State(3)) # (!State(1))))) # (!State(0) & (!State(1) & ((State(3)) # (!State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(2),
	datac => State(1),
	datad => State(3),
	combout => \TxByteCnt[3]~1_combout\);

-- Location: LCCOMB_X49_Y51_N6
\TxByteCnt[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~2_combout\ = (\Equal2~1_combout\ & ((\Equal4~0_combout\) # ((!State(4) & \Equal3~0_combout\)))) # (!\Equal2~1_combout\ & (State(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => \Equal3~0_combout\,
	datac => \Equal4~0_combout\,
	datad => \Equal2~1_combout\,
	combout => \TxByteCnt[3]~2_combout\);

-- Location: LCCOMB_X49_Y51_N0
\TxByteCnt[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~5_combout\ = (!\TxByteCnt[3]~4_combout\ & (!\TxByteCnt[3]~1_combout\ & (!\TxByteCnt[3]~0_combout\ & !\TxByteCnt[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~4_combout\,
	datab => \TxByteCnt[3]~1_combout\,
	datac => \TxByteCnt[3]~0_combout\,
	datad => \TxByteCnt[3]~2_combout\,
	combout => \TxByteCnt[3]~5_combout\);

-- Location: FF_X54_Y50_N31
\TxByteCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~4_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(0));

-- Location: LCCOMB_X54_Y50_N28
\Equal9~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal9~1_combout\ = (!State(3) & !State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datac => State(0),
	combout => \Equal9~1_combout\);

-- Location: LCCOMB_X54_Y50_N16
\NxTxByteCnt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~5_combout\ = (\Equal9~1_combout\ & (!\Equal6~0_combout\ & (TxByteCnt(0) $ (TxByteCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(0),
	datab => \Equal9~1_combout\,
	datac => TxByteCnt(1),
	datad => \Equal6~0_combout\,
	combout => \NxTxByteCnt~5_combout\);

-- Location: FF_X54_Y50_N17
\TxByteCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~5_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(1));

-- Location: LCCOMB_X54_Y50_N22
\Add2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~1_combout\ = TxByteCnt(2) $ (((TxByteCnt(1) & TxByteCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxByteCnt(1),
	datac => TxByteCnt(0),
	datad => TxByteCnt(2),
	combout => \Add2~1_combout\);

-- Location: LCCOMB_X54_Y50_N12
\NxTxByteCnt~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~7_combout\ = (!State(3) & (!State(0) & (\Add2~1_combout\ & !\Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(0),
	datac => \Add2~1_combout\,
	datad => \Equal6~0_combout\,
	combout => \NxTxByteCnt~7_combout\);

-- Location: FF_X54_Y50_N13
\TxByteCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~7_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(2));

-- Location: LCCOMB_X54_Y50_N4
\Add2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = TxByteCnt(3) $ (((TxByteCnt(2) & (TxByteCnt(0) & TxByteCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(3),
	datac => TxByteCnt(0),
	datad => TxByteCnt(1),
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X54_Y50_N18
\NxTxByteCnt~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~6_combout\ = (!State(3) & (\Add2~0_combout\ & (!State(0) & !\Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Add2~0_combout\,
	datac => State(0),
	datad => \Equal6~0_combout\,
	combout => \NxTxByteCnt~6_combout\);

-- Location: FF_X54_Y50_N19
\TxByteCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~6_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(3));

-- Location: LCCOMB_X54_Y50_N6
\Equal6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (!TxByteCnt(2) & (!TxByteCnt(3) & (TxByteCnt(0) & !TxByteCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(3),
	datac => TxByteCnt(0),
	datad => TxByteCnt(1),
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X50_Y50_N16
\Equal22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal22~0_combout\ = (State(1) & (\Equal21~0_combout\ & !State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datac => \Equal21~0_combout\,
	datad => State(0),
	combout => \Equal22~0_combout\);

-- Location: LCCOMB_X51_Y50_N4
\NxState~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~11_combout\ = (\NxState[1]~9_combout\ & (((\Equal6~0_combout\ & \Equal22~0_combout\)) # (!State(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \Equal6~0_combout\,
	datac => \Equal22~0_combout\,
	datad => \NxState[1]~9_combout\,
	combout => \NxState~11_combout\);

-- Location: LCCOMB_X56_Y50_N4
\NxState~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~10_combout\ = (!State(1) & (((!TxBitCnt(0)) # (!TxBitCnt(2))) # (!TxBitCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(1),
	datab => TxBitCnt(2),
	datac => State(1),
	datad => TxBitCnt(0),
	combout => \NxState~10_combout\);

-- Location: LCCOMB_X51_Y50_N6
\NxState~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~12_combout\ = (\Equal2~1_combout\ & ((State(0) & ((\NxState~10_combout\))) # (!State(0) & (\NxState~11_combout\)))) # (!\Equal2~1_combout\ & (State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~1_combout\,
	datab => State(0),
	datac => \NxState~11_combout\,
	datad => \NxState~10_combout\,
	combout => \NxState~12_combout\);

-- Location: LCCOMB_X51_Y50_N20
\NxState~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~33_combout\ = (State(0) & (((\NxState~13_combout\) # (!TxBitCnt(2))))) # (!State(0) & (State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \NxState~13_combout\,
	datac => TxBitCnt(2),
	datad => State(0),
	combout => \NxState~33_combout\);

-- Location: LCCOMB_X51_Y50_N26
\NxState~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~17_combout\ = (((State(0)) # (!TxBitCnt(2))) # (!TxBitCnt(0))) # (!TxBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(1),
	datab => TxBitCnt(0),
	datac => TxBitCnt(2),
	datad => State(0),
	combout => \NxState~17_combout\);

-- Location: LCCOMB_X52_Y51_N22
\NxState~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~15_combout\ = (State(1) & (((!State(0) & \NxState[1]~9_combout\)))) # (!State(1) & ((State(0) & ((!\NxState[1]~9_combout\))) # (!State(0) & (\SM_Handler~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~5_combout\,
	datab => State(1),
	datac => State(0),
	datad => \NxState[1]~9_combout\,
	combout => \NxState~15_combout\);

-- Location: LCCOMB_X52_Y51_N28
\NxState~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~14_combout\ = (State(0) & (((!State(1) & !\NxState[1]~9_combout\)))) # (!State(0) & ((StatusReg(0)) # ((State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => StatusReg(0),
	datac => State(1),
	datad => \NxState[1]~9_combout\,
	combout => \NxState~14_combout\);

-- Location: LCCOMB_X52_Y51_N24
\NxState~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~16_combout\ = (State(3) & (((\NxState~14_combout\) # (State(2))))) # (!State(3) & (\NxState~15_combout\ & ((!State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~15_combout\,
	datab => \NxState~14_combout\,
	datac => State(3),
	datad => State(2),
	combout => \NxState~16_combout\);

-- Location: LCCOMB_X51_Y50_N28
\NxState~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~18_combout\ = (State(2) & ((\NxState~16_combout\ & ((!\NxState~17_combout\))) # (!\NxState~16_combout\ & (\NxState~33_combout\)))) # (!State(2) & (((\NxState~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \NxState~33_combout\,
	datac => \NxState~17_combout\,
	datad => \NxState~16_combout\,
	combout => \NxState~18_combout\);

-- Location: LCCOMB_X51_Y50_N2
\NxState~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~19_combout\ = ((State(4) & (\NxState~12_combout\)) # (!State(4) & ((\NxState~18_combout\)))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~12_combout\,
	datab => \NxState~18_combout\,
	datac => State(4),
	datad => \SM_Handler~4_combout\,
	combout => \NxState~19_combout\);

-- Location: FF_X51_Y50_N3
\State[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(0));

-- Location: LCCOMB_X51_Y50_N14
\NxState[2]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~34_combout\ = (State(0) & (((State(1))))) # (!State(0) & (\SM_Handler~5_combout\ & (!State(3) & !State(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~5_combout\,
	datab => State(0),
	datac => State(3),
	datad => State(1),
	combout => \NxState[2]~34_combout\);

-- Location: LCCOMB_X54_Y50_N14
\NxState[2]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~27_combout\ = ((State(1) & (!State(0))) # (!State(1) & ((State(0)) # (!\Equal6~0_combout\)))) # (!\NxState[1]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \NxState[1]~9_combout\,
	datac => State(0),
	datad => \Equal6~0_combout\,
	combout => \NxState[2]~27_combout\);

-- Location: LCCOMB_X54_Y50_N20
\NxState[2]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~26_combout\ = (State(4)) # ((State(3) & ((!State(0)) # (!State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(0),
	datac => State(3),
	datad => State(4),
	combout => \NxState[2]~26_combout\);

-- Location: LCCOMB_X54_Y50_N8
\NxState[2]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~28_combout\ = (State(2) & ((\NxState[2]~26_combout\) # ((\NxState[2]~27_combout\ & !State(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \NxState[2]~27_combout\,
	datac => State(3),
	datad => \NxState[2]~26_combout\,
	combout => \NxState[2]~28_combout\);

-- Location: LCCOMB_X51_Y50_N12
\NxState[2]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~29_combout\ = (\NxState[2]~28_combout\) # ((\NxTxBitCnt[0]~3_combout\ & (\NxState[2]~34_combout\ & \SM_Handler~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[0]~3_combout\,
	datab => \NxState[2]~34_combout\,
	datac => \NxState[2]~28_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \NxState[2]~29_combout\);

-- Location: FF_X51_Y50_N13
\State[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[2]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(2));

-- Location: LCCOMB_X52_Y51_N12
\Equal10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal10~0_combout\ = (State(2) & (\Equal4~0_combout\ & !State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal4~0_combout\,
	datac => State(3),
	combout => \Equal10~0_combout\);

-- Location: LCCOMB_X52_Y51_N18
\NxState[3]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~23_combout\ = (State(4)) # ((State(0) & (!State(1))) # (!State(0) & ((State(1)) # (StatusReg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(4),
	datac => State(1),
	datad => StatusReg(0),
	combout => \NxState[3]~23_combout\);

-- Location: LCCOMB_X52_Y51_N4
\NxState[3]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~24_combout\ = (State(3) & ((\NxState[3]~23_combout\) # (State(2) $ (State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(1),
	datac => State(3),
	datad => \NxState[3]~23_combout\,
	combout => \NxState[3]~24_combout\);

-- Location: LCCOMB_X52_Y51_N8
\NxState[3]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~25_combout\ = (\SM_Handler~4_combout\ & ((\NxState[3]~24_combout\) # ((\Equal10~0_combout\ & \NxState[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~0_combout\,
	datab => \SM_Handler~4_combout\,
	datac => \NxState[3]~24_combout\,
	datad => \NxState[1]~9_combout\,
	combout => \NxState[3]~25_combout\);

-- Location: FF_X52_Y51_N9
\State[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[3]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(3));

-- Location: LCCOMB_X49_Y51_N10
\NxState[4]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[4]~30_combout\ = (State(3) & (\Equal23~1_combout\ & (!StatusReg(1) & State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal23~1_combout\,
	datac => StatusReg(1),
	datad => State(2),
	combout => \NxState[4]~30_combout\);

-- Location: LCCOMB_X49_Y51_N20
\NxState[4]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[4]~31_combout\ = (\NxState[4]~30_combout\) # ((State(4) & ((!\Equal2~1_combout\) # (!\Equal23~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[4]~30_combout\,
	datab => \Equal23~1_combout\,
	datac => State(4),
	datad => \Equal2~1_combout\,
	combout => \NxState[4]~31_combout\);

-- Location: FF_X49_Y51_N21
\State[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[4]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(4));

-- Location: LCCOMB_X49_Y51_N14
\TxByteCnt[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~0_combout\ = ((!State(4) & (\Equal2~0_combout\ & \Equal2~1_combout\))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => \Equal2~0_combout\,
	datac => \SM_Handler~4_combout\,
	datad => \Equal2~1_combout\,
	combout => \TxByteCnt[3]~0_combout\);

-- Location: LCCOMB_X50_Y51_N30
\SM_Handler~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~6_combout\ = (!State(2) & (!State(3) & (\Equal5~0_combout\ & \SM_Handler~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \Equal5~0_combout\,
	datad => \SM_Handler~5_combout\,
	combout => \SM_Handler~6_combout\);

-- Location: LCCOMB_X50_Y51_N0
\NxSdoLine~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~16_combout\ = (State(2)) # ((State(4)) # ((State(1)) # (!State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(4),
	datac => State(3),
	datad => State(1),
	combout => \NxSdoLine~16_combout\);

-- Location: LCCOMB_X56_Y50_N24
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = TxBitCnt(1) $ (TxBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X56_Y51_N30
\Equal11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal11~0_combout\ = (!State(2) & (State(3) & \Equal5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datad => \Equal5~0_combout\,
	combout => \Equal11~0_combout\);

-- Location: LCCOMB_X50_Y51_N18
\NxSdoLine~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~17_combout\ = (!\NxSdoLine~16_combout\ & (\Mux4~0_combout\ & ((StatusReg(0)) # (!\Equal11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(0),
	datab => \NxSdoLine~16_combout\,
	datac => \Mux4~0_combout\,
	datad => \Equal11~0_combout\,
	combout => \NxSdoLine~17_combout\);

-- Location: LCCOMB_X54_Y50_N0
\Equal5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (State(2) & !State(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datac => State(3),
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X47_Y51_N30
\Equal8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (State(0) & (!State(4) & (!State(1) & \Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(4),
	datac => State(1),
	datad => \Equal5~1_combout\,
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X50_Y51_N28
\NxSdoLine~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~18_combout\ = (\NxSdoLine~17_combout\) # ((TxBitCnt(0) & ((\SM_Handler~6_combout\) # (\Equal8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~6_combout\,
	datab => \NxSdoLine~17_combout\,
	datac => TxBitCnt(0),
	datad => \Equal8~0_combout\,
	combout => \NxSdoLine~18_combout\);

-- Location: LCCOMB_X50_Y51_N22
\NxSdoLine~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~19_combout\ = (TxBitCnt(2) & ((\TxByteCnt[3]~0_combout\ & ((TxBitCnt(1)))) # (!\TxByteCnt[3]~0_combout\ & (\NxSdoLine~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~0_combout\,
	datab => \NxSdoLine~18_combout\,
	datac => TxBitCnt(2),
	datad => TxBitCnt(1),
	combout => \NxSdoLine~19_combout\);

-- Location: LCCOMB_X49_Y50_N22
\NxSdoLine~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~37_combout\ = (State(3)) # ((State(4)) # ((!State(1) & !State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datac => State(1),
	datad => State(2),
	combout => \NxSdoLine~37_combout\);

-- Location: LCCOMB_X50_Y51_N26
\NxSdoLine~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~33_combout\ = (\NxSdoLine~16_combout\) # ((!StatusReg(0) & \Equal11~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxSdoLine~16_combout\,
	datac => StatusReg(0),
	datad => \Equal11~0_combout\,
	combout => \NxSdoLine~33_combout\);

-- Location: LCCOMB_X50_Y51_N4
\NxSdoLine~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~34_combout\ = (!\SM_Handler~6_combout\ & (\NxSdoLine~37_combout\ & (\NxSdoLine~33_combout\ & !\TxByteCnt[3]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~6_combout\,
	datab => \NxSdoLine~37_combout\,
	datac => \NxSdoLine~33_combout\,
	datad => \TxByteCnt[3]~0_combout\,
	combout => \NxSdoLine~34_combout\);

-- Location: LCCOMB_X49_Y51_N26
\NxSdoLine~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~20_combout\ = (!TxBitCnt(2) & (\Equal3~0_combout\ & (!State(4) & \Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(2),
	datab => \Equal3~0_combout\,
	datac => State(4),
	datad => \Equal2~1_combout\,
	combout => \NxSdoLine~20_combout\);

-- Location: LCCOMB_X49_Y51_N2
\NxSdoLine~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~36_combout\ = (\NxSdoLine~20_combout\ & (!\TxByteCnt[3]~0_combout\ & (TxBitCnt(1) $ (TxBitCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~20_combout\,
	datab => \TxByteCnt[3]~0_combout\,
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxSdoLine~36_combout\);

-- Location: LCCOMB_X50_Y51_N8
\NxSdoLine~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~21_combout\ = (\NxSdoLine~36_combout\) # ((\Equal4~0_combout\ & (!State(3) & \SdoLine~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~36_combout\,
	datab => \Equal4~0_combout\,
	datac => State(3),
	datad => \SdoLine~q\,
	combout => \NxSdoLine~21_combout\);

-- Location: LCCOMB_X54_Y50_N10
\Equal14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (State(1) & (State(0) & (State(3) & !State(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(0),
	datac => State(3),
	datad => State(4),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X50_Y50_N30
\Equal15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal15~0_combout\ = (State(2) & (\Equal5~0_combout\ & State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(2),
	datac => \Equal5~0_combout\,
	datad => State(3),
	combout => \Equal15~0_combout\);

-- Location: LCCOMB_X56_Y50_N26
\NxSdoLine~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~29_combout\ = (TxBitCnt(2) & TxBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => TxBitCnt(2),
	datad => TxBitCnt(0),
	combout => \NxSdoLine~29_combout\);

-- Location: LCCOMB_X50_Y50_N2
\NxSdoLine~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~30_combout\ = (\NxSdoLine~29_combout\ & ((\Equal15~0_combout\) # ((\Equal14~0_combout\ & !State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal14~0_combout\,
	datab => State(2),
	datac => \Equal15~0_combout\,
	datad => \NxSdoLine~29_combout\,
	combout => \NxSdoLine~30_combout\);

-- Location: LCCOMB_X50_Y50_N12
\NxSdoLine~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~31_combout\ = (\NxSdoLine~30_combout\) # ((\SdoLine~q\ & ((\Equal11~0_combout\) # (\Equal17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SdoLine~q\,
	datab => \NxSdoLine~30_combout\,
	datac => \Equal11~0_combout\,
	datad => \Equal17~0_combout\,
	combout => \NxSdoLine~31_combout\);

-- Location: LCCOMB_X52_Y51_N10
\Equal19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~0_combout\ = (State(2) & (\Equal4~0_combout\ & State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal4~0_combout\,
	datac => State(3),
	combout => \Equal19~0_combout\);

-- Location: LCCOMB_X47_Y50_N8
\NxState~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~8_combout\ = (!State(1) & !State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(1),
	datac => State(0),
	combout => \NxState~8_combout\);

-- Location: LCCOMB_X50_Y50_N20
\NxSdoLine~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~27_combout\ = (\Equal19~0_combout\ & (((StatusReg(1))))) # (!\Equal19~0_combout\ & (((!\NxState~8_combout\)) # (!\Equal21~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~0_combout\,
	datab => \Equal19~0_combout\,
	datac => \NxState~8_combout\,
	datad => StatusReg(1),
	combout => \NxSdoLine~27_combout\);

-- Location: LCCOMB_X49_Y50_N24
\NxSdoLine~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~13_combout\ = (State(1) & (State(0))) # (!State(1) & ((!State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(1),
	datac => State(0),
	datad => State(2),
	combout => \NxSdoLine~13_combout\);

-- Location: LCCOMB_X49_Y50_N2
\NxSdoLine~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~38_combout\ = (\NxSdoLine~13_combout\) # ((State(4)) # (!State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxSdoLine~13_combout\,
	datac => State(3),
	datad => State(4),
	combout => \NxSdoLine~38_combout\);

-- Location: LCCOMB_X50_Y50_N18
\NxSdoLine~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~26_combout\ = (State(2)) # (((!\Equal5~0_combout\ & !\Equal4~0_combout\)) # (!State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(2),
	datac => \Equal4~0_combout\,
	datad => State(3),
	combout => \NxSdoLine~26_combout\);

-- Location: LCCOMB_X50_Y50_N10
\NxSdoLine~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~22_combout\ = (\Equal21~0_combout\ & (!TxBitCnt(2) & (\Mux4~0_combout\ & \Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~0_combout\,
	datab => TxBitCnt(2),
	datac => \Mux4~0_combout\,
	datad => \Equal2~0_combout\,
	combout => \NxSdoLine~22_combout\);

-- Location: LCCOMB_X50_Y50_N28
\NxSdoLine~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~23_combout\ = ((!State(1) & !State(0))) # (!\Equal21~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datac => \Equal21~0_combout\,
	datad => State(0),
	combout => \NxSdoLine~23_combout\);

-- Location: LCCOMB_X50_Y50_N14
\NxSdoLine~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~24_combout\ = (\SdoLine~q\ & ((\NxSdoLine~23_combout\) # (\Equal19~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxSdoLine~23_combout\,
	datac => \SdoLine~q\,
	datad => \Equal19~0_combout\,
	combout => \NxSdoLine~24_combout\);

-- Location: IOIBUF_X51_Y54_N22
\SWT[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(1),
	o => \SWT[1]~input_o\);

-- Location: LCCOMB_X52_Y50_N2
\NxSdoLine~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~39_combout\ = TxBitCnt(1) $ ((((!TxBitCnt(2)) # (!\SWT[1]~input_o\)) # (!TxBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(1),
	datab => TxBitCnt(0),
	datac => \SWT[1]~input_o\,
	datad => TxBitCnt(2),
	combout => \NxSdoLine~39_combout\);

-- Location: LCCOMB_X52_Y50_N8
\IncrWrVal[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[0]~8_combout\ = IncrWrVal(0) $ (VCC)
-- \IncrWrVal[0]~9\ = CARRY(IncrWrVal(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IncrWrVal(0),
	datad => VCC,
	combout => \IncrWrVal[0]~8_combout\,
	cout => \IncrWrVal[0]~9\);

-- Location: LCCOMB_X51_Y50_N18
\Clock_SCK~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Clock_SCK~2_combout\ = (\NxTxBitCnt[1]~15_combout\) # ((\NxTxBitCnt[2]~13_combout\) # ((\NxTxBitCnt[0]~14_combout\) # (!\Equal22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[1]~15_combout\,
	datab => \NxTxBitCnt[2]~13_combout\,
	datac => \Equal22~0_combout\,
	datad => \NxTxBitCnt[0]~14_combout\,
	combout => \Clock_SCK~2_combout\);

-- Location: LCCOMB_X52_Y50_N0
\IncrWrVal[0]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[0]~12_combout\ = (!\SWT[0]~input_o\) # (!\Clock_SCK~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Clock_SCK~2_combout\,
	datad => \SWT[0]~input_o\,
	combout => \IncrWrVal[0]~12_combout\);

-- Location: FF_X52_Y50_N9
\IncrWrVal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[0]~8_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(0));

-- Location: LCCOMB_X52_Y50_N10
\IncrWrVal[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[1]~10_combout\ = (IncrWrVal(1) & (!\IncrWrVal[0]~9\)) # (!IncrWrVal(1) & ((\IncrWrVal[0]~9\) # (GND)))
-- \IncrWrVal[1]~11\ = CARRY((!\IncrWrVal[0]~9\) # (!IncrWrVal(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(1),
	datad => VCC,
	cin => \IncrWrVal[0]~9\,
	combout => \IncrWrVal[1]~10_combout\,
	cout => \IncrWrVal[1]~11\);

-- Location: FF_X52_Y50_N11
\IncrWrVal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[1]~10_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(1));

-- Location: LCCOMB_X52_Y50_N12
\IncrWrVal[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[2]~13_combout\ = (IncrWrVal(2) & (\IncrWrVal[1]~11\ $ (GND))) # (!IncrWrVal(2) & (!\IncrWrVal[1]~11\ & VCC))
-- \IncrWrVal[2]~14\ = CARRY((IncrWrVal(2) & !\IncrWrVal[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(2),
	datad => VCC,
	cin => \IncrWrVal[1]~11\,
	combout => \IncrWrVal[2]~13_combout\,
	cout => \IncrWrVal[2]~14\);

-- Location: FF_X52_Y50_N13
\IncrWrVal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[2]~13_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(2));

-- Location: LCCOMB_X52_Y50_N14
\IncrWrVal[3]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[3]~15_combout\ = (IncrWrVal(3) & (!\IncrWrVal[2]~14\)) # (!IncrWrVal(3) & ((\IncrWrVal[2]~14\) # (GND)))
-- \IncrWrVal[3]~16\ = CARRY((!\IncrWrVal[2]~14\) # (!IncrWrVal(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => IncrWrVal(3),
	datad => VCC,
	cin => \IncrWrVal[2]~14\,
	combout => \IncrWrVal[3]~15_combout\,
	cout => \IncrWrVal[3]~16\);

-- Location: FF_X52_Y50_N15
\IncrWrVal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[3]~15_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(3));

-- Location: LCCOMB_X52_Y50_N16
\IncrWrVal[4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[4]~17_combout\ = (IncrWrVal(4) & (\IncrWrVal[3]~16\ $ (GND))) # (!IncrWrVal(4) & (!\IncrWrVal[3]~16\ & VCC))
-- \IncrWrVal[4]~18\ = CARRY((IncrWrVal(4) & !\IncrWrVal[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => IncrWrVal(4),
	datad => VCC,
	cin => \IncrWrVal[3]~16\,
	combout => \IncrWrVal[4]~17_combout\,
	cout => \IncrWrVal[4]~18\);

-- Location: FF_X52_Y50_N17
\IncrWrVal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[4]~17_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(4));

-- Location: LCCOMB_X52_Y50_N18
\IncrWrVal[5]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[5]~19_combout\ = (IncrWrVal(5) & (!\IncrWrVal[4]~18\)) # (!IncrWrVal(5) & ((\IncrWrVal[4]~18\) # (GND)))
-- \IncrWrVal[5]~20\ = CARRY((!\IncrWrVal[4]~18\) # (!IncrWrVal(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => IncrWrVal(5),
	datad => VCC,
	cin => \IncrWrVal[4]~18\,
	combout => \IncrWrVal[5]~19_combout\,
	cout => \IncrWrVal[5]~20\);

-- Location: FF_X52_Y50_N19
\IncrWrVal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[5]~19_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(5));

-- Location: LCCOMB_X52_Y50_N24
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (TxBitCnt(2) & (TxBitCnt(0) & (IncrWrVal(0)))) # (!TxBitCnt(2) & (((IncrWrVal(4))) # (!TxBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(2),
	datab => TxBitCnt(0),
	datac => IncrWrVal(0),
	datad => IncrWrVal(4),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X52_Y50_N26
\Mux5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (TxBitCnt(0) & (((\Mux5~0_combout\)))) # (!TxBitCnt(0) & ((\Mux5~0_combout\ & ((IncrWrVal(5)))) # (!\Mux5~0_combout\ & (IncrWrVal(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(1),
	datab => IncrWrVal(5),
	datac => TxBitCnt(0),
	datad => \Mux5~0_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X52_Y50_N20
\IncrWrVal[6]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[6]~21_combout\ = (IncrWrVal(6) & (\IncrWrVal[5]~20\ $ (GND))) # (!IncrWrVal(6) & (!\IncrWrVal[5]~20\ & VCC))
-- \IncrWrVal[6]~22\ = CARRY((IncrWrVal(6) & !\IncrWrVal[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => IncrWrVal(6),
	datad => VCC,
	cin => \IncrWrVal[5]~20\,
	combout => \IncrWrVal[6]~21_combout\,
	cout => \IncrWrVal[6]~22\);

-- Location: FF_X52_Y50_N21
\IncrWrVal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[6]~21_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(6));

-- Location: LCCOMB_X52_Y50_N22
\IncrWrVal[7]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[7]~23_combout\ = IncrWrVal(7) $ (\IncrWrVal[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(7),
	cin => \IncrWrVal[6]~22\,
	combout => \IncrWrVal[7]~23_combout\);

-- Location: FF_X52_Y50_N23
\IncrWrVal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \IncrWrVal[7]~23_combout\,
	sclr => \Clock_SCK~2_combout\,
	ena => \IncrWrVal[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(7));

-- Location: LCCOMB_X52_Y50_N28
\Mux5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (TxBitCnt(0) & ((TxBitCnt(2) & (IncrWrVal(2))) # (!TxBitCnt(2) & ((IncrWrVal(6)))))) # (!TxBitCnt(0) & (((!TxBitCnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(2),
	datab => IncrWrVal(6),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X52_Y50_N6
\Mux5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (TxBitCnt(0) & (((\Mux5~2_combout\)))) # (!TxBitCnt(0) & ((\Mux5~2_combout\ & (IncrWrVal(7))) # (!\Mux5~2_combout\ & ((IncrWrVal(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(7),
	datab => TxBitCnt(0),
	datac => IncrWrVal(3),
	datad => \Mux5~2_combout\,
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X52_Y50_N4
\NxSdoLine~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~40_combout\ = (\SWT[1]~input_o\ & (\NxSdoLine~39_combout\)) # (!\SWT[1]~input_o\ & ((\NxSdoLine~39_combout\ & ((\Mux5~3_combout\))) # (!\NxSdoLine~39_combout\ & (\Mux5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[1]~input_o\,
	datab => \NxSdoLine~39_combout\,
	datac => \Mux5~1_combout\,
	datad => \Mux5~3_combout\,
	combout => \NxSdoLine~40_combout\);

-- Location: LCCOMB_X50_Y50_N24
\NxSdoLine~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~25_combout\ = (\NxSdoLine~22_combout\) # ((\NxSdoLine~24_combout\) # ((\NxSdoLine~40_combout\ & \Equal22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~22_combout\,
	datab => \NxSdoLine~24_combout\,
	datac => \NxSdoLine~40_combout\,
	datad => \Equal22~0_combout\,
	combout => \NxSdoLine~25_combout\);

-- Location: LCCOMB_X50_Y50_N8
\NxSdoLine~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~28_combout\ = (\NxSdoLine~38_combout\ & (\NxSdoLine~26_combout\ & (\NxSdoLine~25_combout\ & \NxSdoLine~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~38_combout\,
	datab => \NxSdoLine~26_combout\,
	datac => \NxSdoLine~25_combout\,
	datad => \NxSdoLine~27_combout\,
	combout => \NxSdoLine~28_combout\);

-- Location: LCCOMB_X50_Y50_N6
\NxSdoLine~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~32_combout\ = (\NxSdoLine~31_combout\) # ((\NxSdoLine~28_combout\) # ((!\NxSdoLine~27_combout\ & \Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~31_combout\,
	datab => \NxSdoLine~27_combout\,
	datac => \NxSdoLine~28_combout\,
	datad => \Mux3~0_combout\,
	combout => \NxSdoLine~32_combout\);

-- Location: LCCOMB_X50_Y51_N16
\NxSdoLine~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~35_combout\ = (\NxSdoLine~19_combout\) # ((\NxSdoLine~21_combout\) # ((\NxSdoLine~34_combout\ & \NxSdoLine~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~19_combout\,
	datab => \NxSdoLine~34_combout\,
	datac => \NxSdoLine~21_combout\,
	datad => \NxSdoLine~32_combout\,
	combout => \NxSdoLine~35_combout\);

-- Location: FF_X50_Y51_N17
SdoLine : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxSdoLine~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SdoLine~q\);

-- Location: LCCOMB_X47_Y51_N24
\Equal23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~0_combout\ = (\Equal21~0_combout\ & (State(1) & State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal21~0_combout\,
	datac => State(1),
	datad => State(0),
	combout => \Equal23~0_combout\);

-- Location: LCCOMB_X49_Y51_N4
\Equal13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal13~0_combout\ = (!State(4) & (!State(2) & (\Equal3~0_combout\ & State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => State(2),
	datac => \Equal3~0_combout\,
	datad => State(3),
	combout => \Equal13~0_combout\);

-- Location: LCCOMB_X47_Y51_N26
\NxSckEn~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~0_combout\ = (!\Equal13~0_combout\ & ((\Equal19~0_combout\) # (!\Equal23~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal23~0_combout\,
	datac => \Equal13~0_combout\,
	datad => \Equal19~0_combout\,
	combout => \NxSckEn~0_combout\);

-- Location: LCCOMB_X50_Y50_N26
\NxScsLine~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~7_combout\ = (\Equal19~0_combout\ & (((!StatusReg(1))))) # (!\Equal19~0_combout\ & (\Equal23~1_combout\ & (\Equal21~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => \Equal19~0_combout\,
	datac => \Equal21~0_combout\,
	datad => StatusReg(1),
	combout => \NxScsLine~7_combout\);

-- Location: LCCOMB_X49_Y50_N14
\Equal16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~0_combout\ = (State(3) & (!State(4) & (!State(1) & State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datac => State(1),
	datad => State(2),
	combout => \Equal16~0_combout\);

-- Location: LCCOMB_X47_Y50_N10
\Equal16~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~1_combout\ = (State(0) & \Equal16~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(0),
	datad => \Equal16~0_combout\,
	combout => \Equal16~1_combout\);

-- Location: LCCOMB_X50_Y50_N4
\NxScsLine~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~8_combout\ = (\Equal15~0_combout\) # ((\Equal16~1_combout\) # ((!\NxScsLine~7_combout\ & \NxSdoLine~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~7_combout\,
	datab => \NxSdoLine~26_combout\,
	datac => \Equal15~0_combout\,
	datad => \Equal16~1_combout\,
	combout => \NxScsLine~8_combout\);

-- Location: LCCOMB_X47_Y51_N20
\NxScsLine~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~9_combout\ = (\Equal17~0_combout\ & (((\NxState[1]~9_combout\)) # (!\ScsLine~q\))) # (!\Equal17~0_combout\ & (!\ScsLine~q\ & ((\NxScsLine~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal17~0_combout\,
	datab => \ScsLine~q\,
	datac => \NxState[1]~9_combout\,
	datad => \NxScsLine~8_combout\,
	combout => \NxScsLine~9_combout\);

-- Location: LCCOMB_X49_Y50_N12
\NxScsLine~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~15_combout\ = (State(2) & (State(3))) # (!State(2) & (!State(0) & ((StatusReg(0)) # (!State(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(2),
	datac => State(0),
	datad => StatusReg(0),
	combout => \NxScsLine~15_combout\);

-- Location: LCCOMB_X49_Y50_N6
\NxScsLine~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~16_combout\ = (State(4)) # ((State(1) & ((State(3)))) # (!State(1) & (\NxScsLine~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~15_combout\,
	datab => State(1),
	datac => State(3),
	datad => State(4),
	combout => \NxScsLine~16_combout\);

-- Location: LCCOMB_X47_Y51_N22
\NxScsLine~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~10_combout\ = (!\SM_Handler~6_combout\ & (\NxScsLine~16_combout\ & ((\NxScsLine~9_combout\) # (!\NxSckEn~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSckEn~0_combout\,
	datab => \NxScsLine~9_combout\,
	datac => \SM_Handler~6_combout\,
	datad => \NxScsLine~16_combout\,
	combout => \NxScsLine~10_combout\);

-- Location: LCCOMB_X47_Y51_N16
\NxScsLine~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~12_combout\ = (\Equal4~0_combout\ & (\Equal5~1_combout\ & (TxBitCnt(1) & \NxSdoLine~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datab => \Equal5~1_combout\,
	datac => TxBitCnt(1),
	datad => \NxSdoLine~29_combout\,
	combout => \NxScsLine~12_combout\);

-- Location: LCCOMB_X50_Y51_N14
\NxScsLine~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~11_combout\ = (\Equal5~0_combout\ & (\NxState[1]~9_combout\ & (\Equal6~0_combout\ & \Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => \NxState[1]~9_combout\,
	datac => \Equal6~0_combout\,
	datad => \Equal5~1_combout\,
	combout => \NxScsLine~11_combout\);

-- Location: LCCOMB_X47_Y51_N18
\NxScsLine~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~13_combout\ = (\NxScsLine~12_combout\) # ((\NxScsLine~11_combout\) # ((!\NxScsLine~16_combout\ & !\ScsLine~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~16_combout\,
	datab => \NxScsLine~12_combout\,
	datac => \NxScsLine~11_combout\,
	datad => \ScsLine~q\,
	combout => \NxScsLine~13_combout\);

-- Location: LCCOMB_X47_Y51_N0
\NxScsLine~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~14_combout\ = ((!\NxScsLine~10_combout\ & !\NxScsLine~13_combout\)) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~10_combout\,
	datab => \NxScsLine~13_combout\,
	datac => \SM_Handler~4_combout\,
	combout => \NxScsLine~14_combout\);

-- Location: FF_X47_Y51_N1
ScsLine : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxScsLine~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ScsLine~q\);

-- Location: LCCOMB_X47_Y51_N8
\NxSckEn~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~4_combout\ = (!\NxScsLine~11_combout\ & (\SckEn~q\ & ((!\NxState[1]~9_combout\) # (!\Clock_SCK~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~11_combout\,
	datab => \Clock_SCK~3_combout\,
	datac => \NxState[1]~9_combout\,
	datad => \SckEn~q\,
	combout => \NxSckEn~4_combout\);

-- Location: LCCOMB_X47_Y51_N4
\NxSckEn~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~1_combout\ = (!\NxScsLine~11_combout\ & (\SckEn~q\ & ((!\Equal10~0_combout\) # (!\NxState[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~11_combout\,
	datab => \SckEn~q\,
	datac => \NxState[1]~9_combout\,
	datad => \Equal10~0_combout\,
	combout => \NxSckEn~1_combout\);

-- Location: LCCOMB_X50_Y50_N22
\NxSckEn~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~2_combout\ = (\NxSdoLine~38_combout\ & ((\NxScsLine~7_combout\ & ((\Equal19~0_combout\))) # (!\NxScsLine~7_combout\ & (!\NxSdoLine~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~38_combout\,
	datab => \NxSdoLine~26_combout\,
	datac => \NxScsLine~7_combout\,
	datad => \Equal19~0_combout\,
	combout => \NxSckEn~2_combout\);

-- Location: LCCOMB_X47_Y51_N6
\NxSckEn~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~3_combout\ = (\NxScsLine~16_combout\ & (((\SM_Handler~6_combout\) # (\NxSckEn~2_combout\)))) # (!\NxScsLine~16_combout\ & (\NxSckEn~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~16_combout\,
	datab => \NxSckEn~1_combout\,
	datac => \SM_Handler~6_combout\,
	datad => \NxSckEn~2_combout\,
	combout => \NxSckEn~3_combout\);

-- Location: LCCOMB_X47_Y51_N2
\NxSckEn~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~5_combout\ = ((\NxSckEn~3_combout\) # ((\NxSckEn~0_combout\ & \NxSckEn~4_combout\))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSckEn~0_combout\,
	datab => \NxSckEn~4_combout\,
	datac => \SM_Handler~4_combout\,
	datad => \NxSckEn~3_combout\,
	combout => \NxSckEn~5_combout\);

-- Location: FF_X47_Y51_N3
SckEn : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxSckEn~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SckEn~q\);

-- Location: LCCOMB_X47_Y51_N28
\SCK~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SCK~0_combout\ = (\SckLine~q\ & \SckEn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SckLine~q\,
	datad => \SckEn~q\,
	combout => \SCK~0_combout\);

-- Location: LCCOMB_X54_Y50_N24
\Decoder0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (!TxByteCnt(2) & (!TxByteCnt(3) & (!TxByteCnt(0) & TxByteCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(3),
	datac => TxByteCnt(0),
	datad => TxByteCnt(1),
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X56_Y51_N8
\NxRxBuf[2][0]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][0]~42_combout\ = (\NxState[1]~9_combout\ & ((\Decoder0~0_combout\ & (\SDI~input_o\)) # (!\Decoder0~0_combout\ & ((!\RxBuf[2][0]~q\))))) # (!\NxState[1]~9_combout\ & (((!\RxBuf[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~9_combout\,
	datab => \Decoder0~0_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[2][0]~q\,
	combout => \NxRxBuf[2][0]~42_combout\);

-- Location: LCCOMB_X56_Y51_N16
\NxRxBuf[2][0]~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][0]~77_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][0]~42_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][0]~42_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][0]~77_combout\);

-- Location: LCCOMB_X52_Y51_N16
\RxBuf~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf~0_combout\ = (\Equal5~2_combout\) # ((!\Equal17~0_combout\ & (!\SWT[0]~input_o\ & !\Equal10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal17~0_combout\,
	datab => \SWT[0]~input_o\,
	datac => \Equal5~2_combout\,
	datad => \Equal10~0_combout\,
	combout => \RxBuf~0_combout\);

-- Location: FF_X56_Y51_N17
\RxBuf[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][0]~77_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][0]~q\);

-- Location: LCCOMB_X56_Y51_N26
\NxRxBuf[2][1]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][1]~43_combout\ = (\Decoder0~0_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!\RxBuf[2][1]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Decoder0~0_combout\,
	datac => \Mux3~0_combout\,
	datad => \RxBuf[2][1]~q\,
	combout => \NxRxBuf[2][1]~43_combout\);

-- Location: LCCOMB_X56_Y51_N2
\NxRxBuf[2][1]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][1]~78_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][1]~43_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][1]~43_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][1]~78_combout\);

-- Location: FF_X56_Y51_N3
\RxBuf[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][1]~78_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][1]~q\);

-- Location: LCCOMB_X54_Y51_N14
\NxRxBuf~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~44_combout\ = (!TxBitCnt(1) & (TxBitCnt(0) & TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxRxBuf~44_combout\);

-- Location: LCCOMB_X56_Y51_N28
\NxRxBuf[2][2]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][2]~45_combout\ = (\Decoder0~0_combout\ & ((\NxRxBuf~44_combout\ & ((\SDI~input_o\))) # (!\NxRxBuf~44_combout\ & (!\RxBuf[2][2]~q\)))) # (!\Decoder0~0_combout\ & (!\RxBuf[2][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \Decoder0~0_combout\,
	datac => \SDI~input_o\,
	datad => \NxRxBuf~44_combout\,
	combout => \NxRxBuf[2][2]~45_combout\);

-- Location: LCCOMB_X56_Y51_N12
\NxRxBuf[2][2]~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][2]~79_combout\ = (\Equal5~0_combout\ & (!State(3) & (State(2) & !\NxRxBuf[2][2]~45_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(3),
	datac => State(2),
	datad => \NxRxBuf[2][2]~45_combout\,
	combout => \NxRxBuf[2][2]~79_combout\);

-- Location: FF_X56_Y51_N13
\RxBuf[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][2]~79_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][2]~q\);

-- Location: LCCOMB_X56_Y50_N8
\NxRxBuf~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~46_combout\ = (TxBitCnt(2) & (!TxBitCnt(1) & !TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxRxBuf~46_combout\);

-- Location: LCCOMB_X56_Y51_N14
\NxRxBuf[2][3]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][3]~47_combout\ = (\NxRxBuf~46_combout\ & ((\Decoder0~0_combout\ & ((\SDI~input_o\))) # (!\Decoder0~0_combout\ & (!\RxBuf[2][3]~q\)))) # (!\NxRxBuf~46_combout\ & (((!\RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~46_combout\,
	datab => \Decoder0~0_combout\,
	datac => \RxBuf[2][3]~q\,
	datad => \SDI~input_o\,
	combout => \NxRxBuf[2][3]~47_combout\);

-- Location: LCCOMB_X56_Y51_N6
\NxRxBuf[2][3]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][3]~80_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][3]~47_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][3]~47_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][3]~80_combout\);

-- Location: FF_X56_Y51_N7
\RxBuf[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][3]~80_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][3]~q\);

-- Location: LCCOMB_X56_Y50_N10
\NxRxBuf~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~48_combout\ = (!TxBitCnt(2) & (TxBitCnt(1) & TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxRxBuf~48_combout\);

-- Location: LCCOMB_X58_Y50_N14
\NxRxBuf[2][4]~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][4]~49_combout\ = (\Decoder0~0_combout\ & ((\NxRxBuf~48_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~48_combout\ & ((!\RxBuf[2][4]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[2][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxRxBuf~48_combout\,
	datad => \RxBuf[2][4]~q\,
	combout => \NxRxBuf[2][4]~49_combout\);

-- Location: LCCOMB_X58_Y50_N16
\NxRxBuf[2][4]~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][4]~81_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][4]~49_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][4]~49_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][4]~81_combout\);

-- Location: FF_X58_Y50_N17
\RxBuf[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][4]~81_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][4]~q\);

-- Location: LCCOMB_X56_Y50_N20
\NxRxBuf~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~50_combout\ = (!TxBitCnt(2) & (TxBitCnt(1) & !TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxRxBuf~50_combout\);

-- Location: LCCOMB_X58_Y50_N8
\NxRxBuf[2][5]~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][5]~51_combout\ = (\Decoder0~0_combout\ & ((\NxRxBuf~50_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~50_combout\ & ((!\RxBuf[2][5]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxRxBuf~50_combout\,
	datad => \RxBuf[2][5]~q\,
	combout => \NxRxBuf[2][5]~51_combout\);

-- Location: LCCOMB_X58_Y50_N18
\NxRxBuf[2][5]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][5]~82_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][5]~51_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][5]~51_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][5]~82_combout\);

-- Location: FF_X58_Y50_N19
\RxBuf[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][5]~82_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][5]~q\);

-- Location: LCCOMB_X56_Y50_N6
\NxRxBuf~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~52_combout\ = (!TxBitCnt(2) & (!TxBitCnt(1) & TxBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	datad => TxBitCnt(0),
	combout => \NxRxBuf~52_combout\);

-- Location: LCCOMB_X58_Y50_N26
\NxRxBuf[2][6]~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][6]~53_combout\ = (\Decoder0~0_combout\ & ((\NxRxBuf~52_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~52_combout\ & ((!\RxBuf[2][6]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[2][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \NxRxBuf~52_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[2][6]~q\,
	combout => \NxRxBuf[2][6]~53_combout\);

-- Location: LCCOMB_X58_Y50_N28
\NxRxBuf[2][6]~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][6]~83_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[2][6]~53_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[2][6]~53_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[2][6]~83_combout\);

-- Location: FF_X58_Y50_N29
\RxBuf[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][6]~83_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][6]~q\);

-- Location: LCCOMB_X54_Y51_N0
\NxRxBuf[2][7]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][7]~54_combout\ = (!TxBitCnt(1) & (!TxBitCnt(0) & !TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxRxBuf[2][7]~54_combout\);

-- Location: LCCOMB_X54_Y51_N26
\NxRxBuf[2][7]~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][7]~55_combout\ = (\Decoder0~0_combout\ & ((\NxRxBuf[2][7]~54_combout\ & (\SDI~input_o\)) # (!\NxRxBuf[2][7]~54_combout\ & ((!\RxBuf[2][7]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \RxBuf[2][7]~q\,
	datac => \Decoder0~0_combout\,
	datad => \NxRxBuf[2][7]~54_combout\,
	combout => \NxRxBuf[2][7]~55_combout\);

-- Location: LCCOMB_X54_Y51_N24
\NxRxBuf[2][7]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][7]~84_combout\ = (State(2) & (\Equal5~0_combout\ & (!\NxRxBuf[2][7]~55_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~0_combout\,
	datac => \NxRxBuf[2][7]~55_combout\,
	datad => State(3),
	combout => \NxRxBuf[2][7]~84_combout\);

-- Location: FF_X54_Y51_N25
\RxBuf[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][7]~84_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][7]~q\);

-- Location: LCCOMB_X56_Y50_N14
\NxState~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~32_combout\ = (TxBitCnt(1) & (TxBitCnt(2) & (\Equal6~0_combout\ & TxBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(1),
	datab => TxBitCnt(2),
	datac => \Equal6~0_combout\,
	datad => TxBitCnt(0),
	combout => \NxState~32_combout\);

-- Location: LCCOMB_X57_Y50_N0
\NxRxBuf[1][0]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][0]~56_combout\ = (\Equal5~2_combout\ & ((\NxState~32_combout\ & (!\SDI~input_o\)) # (!\NxState~32_combout\ & ((\RxBuf[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Equal5~2_combout\,
	datac => \RxBuf[1][0]~q\,
	datad => \NxState~32_combout\,
	combout => \NxRxBuf[1][0]~56_combout\);

-- Location: FF_X57_Y50_N1
\RxBuf[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][0]~56_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][0]~q\);

-- Location: LCCOMB_X57_Y50_N8
\NxRxBuf[1][1]~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][1]~57_combout\ = (\Equal6~0_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!\RxBuf[1][1]~q\))))) # (!\Equal6~0_combout\ & (((!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Equal6~0_combout\,
	datac => \Mux3~0_combout\,
	datad => \RxBuf[1][1]~q\,
	combout => \NxRxBuf[1][1]~57_combout\);

-- Location: LCCOMB_X57_Y50_N2
\NxRxBuf[1][1]~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][1]~85_combout\ = (\Equal5~0_combout\ & (State(2) & (!\NxRxBuf[1][1]~57_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(2),
	datac => \NxRxBuf[1][1]~57_combout\,
	datad => State(3),
	combout => \NxRxBuf[1][1]~85_combout\);

-- Location: FF_X57_Y50_N3
\RxBuf[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][1]~85_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][1]~q\);

-- Location: LCCOMB_X54_Y51_N12
\NxRxBuf[1][2]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][2]~58_combout\ = (\NxRxBuf~44_combout\ & ((\Equal6~0_combout\ & (\SDI~input_o\)) # (!\Equal6~0_combout\ & ((!\RxBuf[1][2]~q\))))) # (!\NxRxBuf~44_combout\ & (((!\RxBuf[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxRxBuf~44_combout\,
	datac => \Equal6~0_combout\,
	datad => \RxBuf[1][2]~q\,
	combout => \NxRxBuf[1][2]~58_combout\);

-- Location: LCCOMB_X54_Y51_N10
\NxRxBuf[1][2]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][2]~86_combout\ = (!State(3) & (\Equal5~0_combout\ & (State(2) & !\NxRxBuf[1][2]~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal5~0_combout\,
	datac => State(2),
	datad => \NxRxBuf[1][2]~58_combout\,
	combout => \NxRxBuf[1][2]~86_combout\);

-- Location: FF_X54_Y51_N11
\RxBuf[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][2]~86_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][2]~q\);

-- Location: LCCOMB_X57_Y50_N18
\NxRxBuf[1][3]~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][3]~59_combout\ = (\Equal6~0_combout\ & ((\NxRxBuf~46_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~46_combout\ & ((!\RxBuf[1][3]~q\))))) # (!\Equal6~0_combout\ & (((!\RxBuf[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Equal6~0_combout\,
	datac => \NxRxBuf~46_combout\,
	datad => \RxBuf[1][3]~q\,
	combout => \NxRxBuf[1][3]~59_combout\);

-- Location: LCCOMB_X57_Y50_N28
\NxRxBuf[1][3]~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][3]~87_combout\ = (\Equal5~0_combout\ & (!State(3) & (State(2) & !\NxRxBuf[1][3]~59_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(3),
	datac => State(2),
	datad => \NxRxBuf[1][3]~59_combout\,
	combout => \NxRxBuf[1][3]~87_combout\);

-- Location: FF_X57_Y50_N29
\RxBuf[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][3]~87_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][3]~q\);

-- Location: LCCOMB_X58_Y50_N4
\NxRxBuf[1][4]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][4]~60_combout\ = (\Equal6~0_combout\ & ((\NxRxBuf~48_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~48_combout\ & ((!\RxBuf[1][4]~q\))))) # (!\Equal6~0_combout\ & (((!\RxBuf[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxRxBuf~48_combout\,
	datad => \RxBuf[1][4]~q\,
	combout => \NxRxBuf[1][4]~60_combout\);

-- Location: LCCOMB_X58_Y50_N30
\NxRxBuf[1][4]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][4]~88_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[1][4]~60_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[1][4]~60_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[1][4]~88_combout\);

-- Location: FF_X58_Y50_N31
\RxBuf[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][4]~88_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][4]~q\);

-- Location: LCCOMB_X58_Y50_N22
\NxRxBuf[1][5]~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][5]~61_combout\ = (\Equal6~0_combout\ & ((\NxRxBuf~50_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~50_combout\ & ((!\RxBuf[1][5]~q\))))) # (!\Equal6~0_combout\ & (((!\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxRxBuf~50_combout\,
	datad => \RxBuf[1][5]~q\,
	combout => \NxRxBuf[1][5]~61_combout\);

-- Location: LCCOMB_X58_Y50_N24
\NxRxBuf[1][5]~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][5]~89_combout\ = (State(2) & (!State(3) & (!\NxRxBuf[1][5]~61_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(3),
	datac => \NxRxBuf[1][5]~61_combout\,
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[1][5]~89_combout\);

-- Location: FF_X58_Y50_N25
\RxBuf[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][5]~89_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][5]~q\);

-- Location: LCCOMB_X58_Y50_N0
\NxRxBuf[1][6]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][6]~62_combout\ = (\Equal6~0_combout\ & ((\NxRxBuf~52_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~52_combout\ & ((!\RxBuf[1][6]~q\))))) # (!\Equal6~0_combout\ & (((!\RxBuf[1][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \NxRxBuf~52_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[1][6]~q\,
	combout => \NxRxBuf[1][6]~62_combout\);

-- Location: LCCOMB_X58_Y50_N2
\NxRxBuf[1][6]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][6]~90_combout\ = (State(2) & (\Equal5~0_combout\ & (!State(3) & !\NxRxBuf[1][6]~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~0_combout\,
	datac => State(3),
	datad => \NxRxBuf[1][6]~62_combout\,
	combout => \NxRxBuf[1][6]~90_combout\);

-- Location: FF_X58_Y50_N3
\RxBuf[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][6]~90_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][6]~q\);

-- Location: LCCOMB_X54_Y51_N22
\NxRxBuf[1][7]~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][7]~63_combout\ = (\NxRxBuf[2][7]~54_combout\ & ((\Equal6~0_combout\ & (\SDI~input_o\)) # (!\Equal6~0_combout\ & ((!\RxBuf[1][7]~q\))))) # (!\NxRxBuf[2][7]~54_combout\ & (((!\RxBuf[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxRxBuf[2][7]~54_combout\,
	datac => \Equal6~0_combout\,
	datad => \RxBuf[1][7]~q\,
	combout => \NxRxBuf[1][7]~63_combout\);

-- Location: LCCOMB_X54_Y51_N28
\NxRxBuf[1][7]~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][7]~91_combout\ = (State(2) & (\Equal5~0_combout\ & (!\NxRxBuf[1][7]~63_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~0_combout\,
	datac => \NxRxBuf[1][7]~63_combout\,
	datad => State(3),
	combout => \NxRxBuf[1][7]~91_combout\);

-- Location: FF_X54_Y51_N29
\RxBuf[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][7]~91_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][7]~q\);

-- Location: LCCOMB_X54_Y50_N26
\Decoder0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (!TxByteCnt(2) & (!TxByteCnt(3) & (!TxByteCnt(0) & !TxByteCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(3),
	datac => TxByteCnt(0),
	datad => TxByteCnt(1),
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X57_Y50_N20
\NxRxBuf[0][0]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][0]~64_combout\ = (\Decoder0~1_combout\ & ((\NxState[1]~9_combout\ & ((\SDI~input_o\))) # (!\NxState[1]~9_combout\ & (!\RxBuf[0][0]~q\)))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \NxState[1]~9_combout\,
	datac => \RxBuf[0][0]~q\,
	datad => \SDI~input_o\,
	combout => \NxRxBuf[0][0]~64_combout\);

-- Location: LCCOMB_X57_Y50_N30
\NxRxBuf[0][0]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][0]~92_combout\ = (\Equal5~0_combout\ & (!State(3) & (State(2) & !\NxRxBuf[0][0]~64_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(3),
	datac => State(2),
	datad => \NxRxBuf[0][0]~64_combout\,
	combout => \NxRxBuf[0][0]~92_combout\);

-- Location: FF_X57_Y50_N31
\RxBuf[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][0]~92_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][0]~q\);

-- Location: LCCOMB_X57_Y50_N22
\NxRxBuf[0][1]~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][1]~65_combout\ = (\Mux3~0_combout\ & ((\Decoder0~1_combout\ & (\SDI~input_o\)) # (!\Decoder0~1_combout\ & ((!\RxBuf[0][1]~q\))))) # (!\Mux3~0_combout\ & (((!\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Mux3~0_combout\,
	datac => \Decoder0~1_combout\,
	datad => \RxBuf[0][1]~q\,
	combout => \NxRxBuf[0][1]~65_combout\);

-- Location: LCCOMB_X57_Y50_N24
\NxRxBuf[0][1]~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][1]~93_combout\ = (\Equal5~0_combout\ & (State(2) & (!\NxRxBuf[0][1]~65_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(2),
	datac => \NxRxBuf[0][1]~65_combout\,
	datad => State(3),
	combout => \NxRxBuf[0][1]~93_combout\);

-- Location: FF_X57_Y50_N25
\RxBuf[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][1]~93_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][1]~q\);

-- Location: LCCOMB_X54_Y51_N8
\NxRxBuf[0][2]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][2]~66_combout\ = (\NxRxBuf~44_combout\ & ((\Decoder0~1_combout\ & (\SDI~input_o\)) # (!\Decoder0~1_combout\ & ((!\RxBuf[0][2]~q\))))) # (!\NxRxBuf~44_combout\ & (((!\RxBuf[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxRxBuf~44_combout\,
	datac => \Decoder0~1_combout\,
	datad => \RxBuf[0][2]~q\,
	combout => \NxRxBuf[0][2]~66_combout\);

-- Location: LCCOMB_X54_Y51_N30
\NxRxBuf[0][2]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][2]~94_combout\ = (!State(3) & (!\NxRxBuf[0][2]~66_combout\ & (State(2) & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxRxBuf[0][2]~66_combout\,
	datac => State(2),
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[0][2]~94_combout\);

-- Location: FF_X54_Y51_N31
\RxBuf[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][2]~94_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][2]~q\);

-- Location: LCCOMB_X57_Y50_N26
\NxRxBuf~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~69_combout\ = (\SDI~input_o\ & \Decoder0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datac => \Decoder0~1_combout\,
	combout => \NxRxBuf~69_combout\);

-- Location: LCCOMB_X56_Y50_N0
\NxRxBuf~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~67_combout\ = (TxBitCnt(2) & !TxBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	combout => \NxRxBuf~67_combout\);

-- Location: LCCOMB_X57_Y50_N16
\NxRxBuf[0][3]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][3]~68_combout\ = (!\RxBuf[0][3]~q\ & (((TxBitCnt(0)) # (!\NxRxBuf~67_combout\)) # (!\Decoder0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \RxBuf[0][3]~q\,
	datac => \NxRxBuf~67_combout\,
	datad => TxBitCnt(0),
	combout => \NxRxBuf[0][3]~68_combout\);

-- Location: LCCOMB_X57_Y50_N10
\NxRxBuf[0][3]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][3]~70_combout\ = (\Equal5~2_combout\ & (!\NxRxBuf[0][3]~68_combout\ & ((!\NxRxBuf~46_combout\) # (!\NxRxBuf~69_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~69_combout\,
	datab => \NxRxBuf~46_combout\,
	datac => \Equal5~2_combout\,
	datad => \NxRxBuf[0][3]~68_combout\,
	combout => \NxRxBuf[0][3]~70_combout\);

-- Location: FF_X57_Y50_N11
\RxBuf[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][3]~70_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][3]~q\);

-- Location: LCCOMB_X58_Y50_N10
\NxRxBuf[0][4]~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][4]~71_combout\ = (\Decoder0~1_combout\ & ((\NxRxBuf~48_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~48_combout\ & ((!\RxBuf[0][4]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \SDI~input_o\,
	datac => \NxRxBuf~48_combout\,
	datad => \RxBuf[0][4]~q\,
	combout => \NxRxBuf[0][4]~71_combout\);

-- Location: LCCOMB_X58_Y50_N20
\NxRxBuf[0][4]~95\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][4]~95_combout\ = (State(2) & (\Equal5~0_combout\ & (!State(3) & !\NxRxBuf[0][4]~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~0_combout\,
	datac => State(3),
	datad => \NxRxBuf[0][4]~71_combout\,
	combout => \NxRxBuf[0][4]~95_combout\);

-- Location: FF_X58_Y50_N21
\RxBuf[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][4]~95_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][4]~q\);

-- Location: LCCOMB_X56_Y50_N2
\NxRxBuf~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~72_combout\ = (!TxBitCnt(2) & TxBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(2),
	datac => TxBitCnt(1),
	combout => \NxRxBuf~72_combout\);

-- Location: LCCOMB_X57_Y50_N4
\NxRxBuf[0][5]~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][5]~73_combout\ = (!\RxBuf[0][5]~q\ & ((TxBitCnt(0)) # ((!\NxRxBuf~72_combout\) # (!\Decoder0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => \RxBuf[0][5]~q\,
	datac => \Decoder0~1_combout\,
	datad => \NxRxBuf~72_combout\,
	combout => \NxRxBuf[0][5]~73_combout\);

-- Location: LCCOMB_X57_Y50_N12
\NxRxBuf[0][5]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][5]~74_combout\ = (\Equal5~2_combout\ & (!\NxRxBuf[0][5]~73_combout\ & ((!\NxRxBuf~50_combout\) # (!\NxRxBuf~69_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~69_combout\,
	datab => \Equal5~2_combout\,
	datac => \NxRxBuf[0][5]~73_combout\,
	datad => \NxRxBuf~50_combout\,
	combout => \NxRxBuf[0][5]~74_combout\);

-- Location: FF_X57_Y50_N13
\RxBuf[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][5]~74_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][5]~q\);

-- Location: LCCOMB_X58_Y50_N12
\NxRxBuf[0][6]~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][6]~75_combout\ = (\Decoder0~1_combout\ & ((\NxRxBuf~52_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~52_combout\ & ((!\RxBuf[0][6]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \NxRxBuf~52_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[0][6]~q\,
	combout => \NxRxBuf[0][6]~75_combout\);

-- Location: LCCOMB_X57_Y50_N6
\NxRxBuf[0][6]~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][6]~96_combout\ = (\Equal5~0_combout\ & (State(2) & (!\NxRxBuf[0][6]~75_combout\ & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => State(2),
	datac => \NxRxBuf[0][6]~75_combout\,
	datad => State(3),
	combout => \NxRxBuf[0][6]~96_combout\);

-- Location: FF_X57_Y50_N7
\RxBuf[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][6]~96_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][6]~q\);

-- Location: LCCOMB_X54_Y51_N18
\NxRxBuf[0][7]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][7]~76_combout\ = (\Decoder0~1_combout\ & ((\NxRxBuf[2][7]~54_combout\ & (\SDI~input_o\)) # (!\NxRxBuf[2][7]~54_combout\ & ((!\RxBuf[0][7]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \RxBuf[0][7]~q\,
	datac => \Decoder0~1_combout\,
	datad => \NxRxBuf[2][7]~54_combout\,
	combout => \NxRxBuf[0][7]~76_combout\);

-- Location: LCCOMB_X54_Y51_N16
\NxRxBuf[0][7]~97\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][7]~97_combout\ = (!State(3) & (!\NxRxBuf[0][7]~76_combout\ & (State(2) & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxRxBuf[0][7]~76_combout\,
	datac => State(2),
	datad => \Equal5~0_combout\,
	combout => \NxRxBuf[0][7]~97_combout\);

-- Location: FF_X54_Y51_N17
\RxBuf[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][7]~97_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][7]~q\);

-- Location: LCCOMB_X51_Y50_N8
\LedR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedR~0_combout\ = \LedR~q\ $ (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LedR~q\,
	datad => \SM_Handler~4_combout\,
	combout => \LedR~0_combout\);

-- Location: FF_X51_Y50_N9
LedR : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \LedR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LedR~q\);

-- Location: LCCOMB_X50_Y51_N10
\LedW~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedW~0_combout\ = \LedW~q\ $ (((\SM_Handler~6_combout\ & !\TxByteCnt[3]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~6_combout\,
	datac => \LedW~q\,
	datad => \TxByteCnt[3]~0_combout\,
	combout => \LedW~0_combout\);

-- Location: FF_X50_Y51_N11
LedW : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \LedW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LedW~q\);

-- Location: LCCOMB_X55_Y51_N28
\NxStatusReg[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[2]~5_combout\ = (\NxStatusReg~0_combout\ & ((\NxRxBuf~44_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~44_combout\ & ((!StatusReg(2)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => \NxRxBuf~44_combout\,
	datad => StatusReg(2),
	combout => \NxStatusReg[2]~5_combout\);

-- Location: LCCOMB_X55_Y51_N4
\NxStatusReg[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[2]~6_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[2]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[2]~5_combout\,
	combout => \NxStatusReg[2]~6_combout\);

-- Location: FF_X55_Y51_N5
\StatusReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[2]~6_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(2));

-- Location: LCCOMB_X55_Y51_N14
\NxStatusReg[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[3]~7_combout\ = (!StatusReg(3) & (((TxBitCnt(0)) # (!\NxStatusReg~0_combout\)) # (!\NxRxBuf~67_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~67_combout\,
	datab => TxBitCnt(0),
	datac => StatusReg(3),
	datad => \NxStatusReg~0_combout\,
	combout => \NxStatusReg[3]~7_combout\);

-- Location: LCCOMB_X54_Y51_N4
\Equal9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal9~0_combout\ = (State(1) & (!State(4) & State(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(4),
	datac => State(2),
	combout => \Equal9~0_combout\);

-- Location: LCCOMB_X54_Y51_N20
\NxStatusReg~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~8_combout\ = (\SDI~input_o\ & (\Equal9~0_combout\ & (State(0) $ (State(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => State(0),
	datac => \Equal9~0_combout\,
	datad => State(3),
	combout => \NxStatusReg~8_combout\);

-- Location: LCCOMB_X55_Y51_N30
\NxStatusReg[3]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[3]~9_combout\ = (\Clock_SCK~3_combout\ & (!\NxStatusReg[3]~7_combout\ & ((!\NxStatusReg~8_combout\) # (!\NxRxBuf~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~46_combout\,
	datab => \Clock_SCK~3_combout\,
	datac => \NxStatusReg[3]~7_combout\,
	datad => \NxStatusReg~8_combout\,
	combout => \NxStatusReg[3]~9_combout\);

-- Location: FF_X55_Y51_N31
\StatusReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[3]~9_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(3));

-- Location: LCCOMB_X55_Y51_N16
\NxStatusReg[4]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[4]~10_combout\ = (\NxStatusReg~0_combout\ & ((\NxRxBuf~48_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~48_combout\ & ((!StatusReg(4)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => \NxRxBuf~48_combout\,
	datad => StatusReg(4),
	combout => \NxStatusReg[4]~10_combout\);

-- Location: LCCOMB_X55_Y51_N24
\NxStatusReg[4]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[4]~11_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[4]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[4]~10_combout\,
	combout => \NxStatusReg[4]~11_combout\);

-- Location: FF_X55_Y51_N25
\StatusReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[4]~11_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(4));

-- Location: LCCOMB_X55_Y51_N18
\NxStatusReg[5]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[5]~12_combout\ = (!StatusReg(5) & (((TxBitCnt(0)) # (!\NxStatusReg~0_combout\)) # (!\NxRxBuf~72_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~72_combout\,
	datab => TxBitCnt(0),
	datac => \NxStatusReg~0_combout\,
	datad => StatusReg(5),
	combout => \NxStatusReg[5]~12_combout\);

-- Location: LCCOMB_X55_Y51_N2
\NxStatusReg[5]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[5]~13_combout\ = (\Clock_SCK~3_combout\ & (!\NxStatusReg[5]~12_combout\ & ((!\NxStatusReg~8_combout\) # (!\NxRxBuf~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf~50_combout\,
	datab => \NxStatusReg~8_combout\,
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[5]~12_combout\,
	combout => \NxStatusReg[5]~13_combout\);

-- Location: FF_X55_Y51_N3
\StatusReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[5]~13_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(5));

-- Location: LCCOMB_X55_Y51_N20
\NxStatusReg[6]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[6]~14_combout\ = (\NxStatusReg~0_combout\ & ((\NxRxBuf~52_combout\ & (\SDI~input_o\)) # (!\NxRxBuf~52_combout\ & ((!StatusReg(6)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => StatusReg(6),
	datad => \NxRxBuf~52_combout\,
	combout => \NxStatusReg[6]~14_combout\);

-- Location: LCCOMB_X55_Y51_N12
\NxStatusReg[6]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[6]~15_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[6]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[6]~14_combout\,
	combout => \NxStatusReg[6]~15_combout\);

-- Location: FF_X55_Y51_N13
\StatusReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[6]~15_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(6));

-- Location: LCCOMB_X55_Y51_N22
\NxStatusReg[7]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[7]~16_combout\ = (\NxStatusReg~0_combout\ & ((\NxRxBuf[2][7]~54_combout\ & (\SDI~input_o\)) # (!\NxRxBuf[2][7]~54_combout\ & ((!StatusReg(7)))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~0_combout\,
	datac => \NxRxBuf[2][7]~54_combout\,
	datad => StatusReg(7),
	combout => \NxStatusReg[7]~16_combout\);

-- Location: LCCOMB_X55_Y51_N6
\NxStatusReg[7]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[7]~17_combout\ = (!\NxStatusReg[7]~16_combout\ & \Clock_SCK~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxStatusReg[7]~16_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \NxStatusReg[7]~17_combout\);

-- Location: FF_X55_Y51_N7
\StatusReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[7]~17_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(7));

-- Location: LCCOMB_X56_Y51_N0
\SEG0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~0_combout\ = (\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\ & (\RxBuf[2][3]~q\ $ (!\RxBuf[2][1]~q\)))) # (!\RxBuf[2][2]~q\ & (\RxBuf[2][1]~q\ & (\RxBuf[2][0]~q\ $ (!\RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~0_combout\);

-- Location: LCCOMB_X56_Y51_N10
\SEG0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~1_combout\ = (\RxBuf[2][3]~q\ & (!\RxBuf[2][2]~q\ & (\RxBuf[2][0]~q\ $ (\RxBuf[2][1]~q\)))) # (!\RxBuf[2][3]~q\ & ((\RxBuf[2][0]~q\ & (!\RxBuf[2][2]~q\)) # (!\RxBuf[2][0]~q\ & ((!\RxBuf[2][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~1_combout\);

-- Location: LCCOMB_X56_Y51_N4
\SEG0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~2_combout\ = (\RxBuf[2][2]~q\ & (\RxBuf[2][0]~q\ & (\RxBuf[2][3]~q\ & !\RxBuf[2][1]~q\))) # (!\RxBuf[2][2]~q\ & (!\RxBuf[2][3]~q\ & ((\RxBuf[2][0]~q\) # (!\RxBuf[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~2_combout\);

-- Location: LCCOMB_X56_Y51_N22
\SEG0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~3_combout\ = (\RxBuf[2][1]~q\ & (\RxBuf[2][3]~q\ & (\RxBuf[2][2]~q\ $ (\RxBuf[2][0]~q\)))) # (!\RxBuf[2][1]~q\ & ((\RxBuf[2][2]~q\ & (\RxBuf[2][0]~q\ & !\RxBuf[2][3]~q\)) # (!\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~3_combout\);

-- Location: LCCOMB_X56_Y51_N24
\SEG0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~4_combout\ = (\RxBuf[2][1]~q\ & ((\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\)) # (!\RxBuf[2][2]~q\ & ((\RxBuf[2][3]~q\))))) # (!\RxBuf[2][1]~q\ & (((!\RxBuf[2][0]~q\ & \RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~4_combout\);

-- Location: LCCOMB_X56_Y51_N18
\SEG0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~5_combout\ = (\RxBuf[2][2]~q\ & (\RxBuf[2][3]~q\ & ((!\RxBuf[2][1]~q\) # (!\RxBuf[2][0]~q\)))) # (!\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\ & (\RxBuf[2][3]~q\ $ (\RxBuf[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~5_combout\);

-- Location: LCCOMB_X56_Y51_N20
\SEG0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~6_combout\ = (\RxBuf[2][0]~q\ & ((\RxBuf[2][2]~q\ $ (\RxBuf[2][3]~q\)) # (!\RxBuf[2][1]~q\))) # (!\RxBuf[2][0]~q\ & ((\RxBuf[2][2]~q\ $ (\RxBuf[2][1]~q\)) # (!\RxBuf[2][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][2]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][3]~q\,
	datad => \RxBuf[2][1]~q\,
	combout => \SEG0~6_combout\);

-- Location: LCCOMB_X66_Y53_N0
\SEG1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~0_combout\ = (\RxBuf[2][7]~q\ & (\RxBuf[2][5]~q\ & (\RxBuf[2][4]~q\ $ (\RxBuf[2][6]~q\)))) # (!\RxBuf[2][7]~q\ & (!\RxBuf[2][4]~q\ & (\RxBuf[2][6]~q\ $ (\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~0_combout\);

-- Location: LCCOMB_X66_Y53_N2
\SEG1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~1_combout\ = (\RxBuf[2][7]~q\ & (!\RxBuf[2][6]~q\ & (\RxBuf[2][4]~q\ $ (\RxBuf[2][5]~q\)))) # (!\RxBuf[2][7]~q\ & ((\RxBuf[2][4]~q\ & (!\RxBuf[2][6]~q\)) # (!\RxBuf[2][4]~q\ & ((!\RxBuf[2][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~1_combout\);

-- Location: LCCOMB_X66_Y53_N12
\SEG1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~2_combout\ = (\RxBuf[2][7]~q\ & (\RxBuf[2][4]~q\ & (\RxBuf[2][6]~q\ & !\RxBuf[2][5]~q\))) # (!\RxBuf[2][7]~q\ & (!\RxBuf[2][6]~q\ & ((\RxBuf[2][4]~q\) # (!\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~2_combout\);

-- Location: LCCOMB_X66_Y53_N6
\SEG1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~3_combout\ = (\RxBuf[2][5]~q\ & (\RxBuf[2][7]~q\ & (\RxBuf[2][4]~q\ $ (\RxBuf[2][6]~q\)))) # (!\RxBuf[2][5]~q\ & ((\RxBuf[2][4]~q\ & (!\RxBuf[2][7]~q\ & \RxBuf[2][6]~q\)) # (!\RxBuf[2][4]~q\ & ((!\RxBuf[2][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~3_combout\);

-- Location: LCCOMB_X66_Y53_N16
\SEG1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~4_combout\ = (\RxBuf[2][5]~q\ & ((\RxBuf[2][6]~q\ & ((!\RxBuf[2][4]~q\))) # (!\RxBuf[2][6]~q\ & (\RxBuf[2][7]~q\)))) # (!\RxBuf[2][5]~q\ & (\RxBuf[2][7]~q\ & (!\RxBuf[2][4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~4_combout\);

-- Location: LCCOMB_X66_Y53_N26
\SEG1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~5_combout\ = (\RxBuf[2][4]~q\ & (\RxBuf[2][7]~q\ & (\RxBuf[2][6]~q\ & !\RxBuf[2][5]~q\))) # (!\RxBuf[2][4]~q\ & (\RxBuf[2][7]~q\ $ (((!\RxBuf[2][6]~q\ & \RxBuf[2][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~5_combout\);

-- Location: LCCOMB_X66_Y53_N20
\SEG1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~6_combout\ = (\RxBuf[2][4]~q\ & ((\RxBuf[2][7]~q\ $ (\RxBuf[2][6]~q\)) # (!\RxBuf[2][5]~q\))) # (!\RxBuf[2][4]~q\ & ((\RxBuf[2][6]~q\ $ (\RxBuf[2][5]~q\)) # (!\RxBuf[2][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~6_combout\);

-- Location: LCCOMB_X70_Y50_N16
\SEG2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~0_combout\ = (\RxBuf[1][2]~q\ & (!\RxBuf[1][0]~q\ & (\RxBuf[1][3]~q\ $ (!\RxBuf[1][1]~q\)))) # (!\RxBuf[1][2]~q\ & (\RxBuf[1][1]~q\ & (\RxBuf[1][3]~q\ $ (!\RxBuf[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~0_combout\);

-- Location: LCCOMB_X70_Y50_N26
\SEG2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~1_combout\ = (\RxBuf[1][3]~q\ & (!\RxBuf[1][2]~q\ & (\RxBuf[1][0]~q\ $ (\RxBuf[1][1]~q\)))) # (!\RxBuf[1][3]~q\ & ((\RxBuf[1][0]~q\ & (!\RxBuf[1][2]~q\)) # (!\RxBuf[1][0]~q\ & ((!\RxBuf[1][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~1_combout\);

-- Location: LCCOMB_X70_Y50_N4
\SEG2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~2_combout\ = (\RxBuf[1][2]~q\ & (\RxBuf[1][3]~q\ & (\RxBuf[1][0]~q\ & !\RxBuf[1][1]~q\))) # (!\RxBuf[1][2]~q\ & (!\RxBuf[1][3]~q\ & ((\RxBuf[1][0]~q\) # (!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~2_combout\);

-- Location: LCCOMB_X70_Y50_N22
\SEG2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~3_combout\ = (\RxBuf[1][1]~q\ & (\RxBuf[1][3]~q\ & (\RxBuf[1][2]~q\ $ (\RxBuf[1][0]~q\)))) # (!\RxBuf[1][1]~q\ & ((\RxBuf[1][2]~q\ & (!\RxBuf[1][3]~q\ & \RxBuf[1][0]~q\)) # (!\RxBuf[1][2]~q\ & ((!\RxBuf[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~3_combout\);

-- Location: LCCOMB_X70_Y50_N8
\SEG2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~4_combout\ = (\RxBuf[1][1]~q\ & ((\RxBuf[1][2]~q\ & ((!\RxBuf[1][0]~q\))) # (!\RxBuf[1][2]~q\ & (\RxBuf[1][3]~q\)))) # (!\RxBuf[1][1]~q\ & (((\RxBuf[1][3]~q\ & !\RxBuf[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~4_combout\);

-- Location: LCCOMB_X70_Y50_N18
\SEG2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~5_combout\ = (\RxBuf[1][2]~q\ & (\RxBuf[1][3]~q\ & ((!\RxBuf[1][1]~q\) # (!\RxBuf[1][0]~q\)))) # (!\RxBuf[1][2]~q\ & (!\RxBuf[1][0]~q\ & (\RxBuf[1][3]~q\ $ (\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~5_combout\);

-- Location: LCCOMB_X70_Y50_N28
\SEG2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~6_combout\ = (\RxBuf[1][0]~q\ & ((\RxBuf[1][2]~q\ $ (\RxBuf[1][3]~q\)) # (!\RxBuf[1][1]~q\))) # (!\RxBuf[1][0]~q\ & ((\RxBuf[1][2]~q\ $ (\RxBuf[1][1]~q\)) # (!\RxBuf[1][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][2]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][0]~q\,
	datad => \RxBuf[1][1]~q\,
	combout => \SEG2~6_combout\);

-- Location: LCCOMB_X77_Y41_N8
\SEG3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~0_combout\ = (\RxBuf[1][7]~q\ & (\RxBuf[1][5]~q\ & (\RxBuf[1][4]~q\ $ (\RxBuf[1][6]~q\)))) # (!\RxBuf[1][7]~q\ & (!\RxBuf[1][4]~q\ & (\RxBuf[1][6]~q\ $ (\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~0_combout\);

-- Location: LCCOMB_X77_Y41_N26
\SEG3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~1_combout\ = (\RxBuf[1][7]~q\ & (!\RxBuf[1][6]~q\ & (\RxBuf[1][4]~q\ $ (\RxBuf[1][5]~q\)))) # (!\RxBuf[1][7]~q\ & ((\RxBuf[1][4]~q\ & (!\RxBuf[1][6]~q\)) # (!\RxBuf[1][4]~q\ & ((!\RxBuf[1][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~1_combout\);

-- Location: LCCOMB_X77_Y41_N20
\SEG3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~2_combout\ = (\RxBuf[1][7]~q\ & (\RxBuf[1][4]~q\ & (\RxBuf[1][6]~q\ & !\RxBuf[1][5]~q\))) # (!\RxBuf[1][7]~q\ & (!\RxBuf[1][6]~q\ & ((\RxBuf[1][4]~q\) # (!\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~2_combout\);

-- Location: LCCOMB_X77_Y41_N30
\SEG3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~3_combout\ = (\RxBuf[1][5]~q\ & (\RxBuf[1][7]~q\ & (\RxBuf[1][4]~q\ $ (\RxBuf[1][6]~q\)))) # (!\RxBuf[1][5]~q\ & ((\RxBuf[1][4]~q\ & (!\RxBuf[1][7]~q\ & \RxBuf[1][6]~q\)) # (!\RxBuf[1][4]~q\ & ((!\RxBuf[1][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~3_combout\);

-- Location: LCCOMB_X77_Y41_N16
\SEG3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~4_combout\ = (\RxBuf[1][5]~q\ & ((\RxBuf[1][6]~q\ & ((!\RxBuf[1][4]~q\))) # (!\RxBuf[1][6]~q\ & (\RxBuf[1][7]~q\)))) # (!\RxBuf[1][5]~q\ & (\RxBuf[1][7]~q\ & (!\RxBuf[1][4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~4_combout\);

-- Location: LCCOMB_X77_Y41_N18
\SEG3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~5_combout\ = (\RxBuf[1][4]~q\ & (\RxBuf[1][7]~q\ & (\RxBuf[1][6]~q\ & !\RxBuf[1][5]~q\))) # (!\RxBuf[1][4]~q\ & (\RxBuf[1][7]~q\ $ (((!\RxBuf[1][6]~q\ & \RxBuf[1][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~5_combout\);

-- Location: LCCOMB_X77_Y41_N4
\SEG3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~6_combout\ = (\RxBuf[1][4]~q\ & ((\RxBuf[1][7]~q\ $ (\RxBuf[1][6]~q\)) # (!\RxBuf[1][5]~q\))) # (!\RxBuf[1][4]~q\ & ((\RxBuf[1][6]~q\ $ (\RxBuf[1][5]~q\)) # (!\RxBuf[1][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][7]~q\,
	datab => \RxBuf[1][4]~q\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[1][5]~q\,
	combout => \SEG3~6_combout\);

-- Location: LCCOMB_X77_Y42_N8
\SEG4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~0_combout\ = (\RxBuf[0][3]~q\ & (\RxBuf[0][1]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][2]~q\)))) # (!\RxBuf[0][3]~q\ & (!\RxBuf[0][0]~q\ & (\RxBuf[0][2]~q\ $ (\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~0_combout\);

-- Location: LCCOMB_X77_Y42_N26
\SEG4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~1_combout\ = (\RxBuf[0][3]~q\ & (!\RxBuf[0][2]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][1]~q\)))) # (!\RxBuf[0][3]~q\ & ((\RxBuf[0][0]~q\ & (!\RxBuf[0][2]~q\)) # (!\RxBuf[0][0]~q\ & ((!\RxBuf[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~1_combout\);

-- Location: LCCOMB_X77_Y42_N28
\SEG4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~2_combout\ = (\RxBuf[0][3]~q\ & (\RxBuf[0][0]~q\ & (\RxBuf[0][2]~q\ & !\RxBuf[0][1]~q\))) # (!\RxBuf[0][3]~q\ & (!\RxBuf[0][2]~q\ & ((\RxBuf[0][0]~q\) # (!\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~2_combout\);

-- Location: LCCOMB_X77_Y42_N14
\SEG4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~3_combout\ = (\RxBuf[0][1]~q\ & (\RxBuf[0][3]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][2]~q\)))) # (!\RxBuf[0][1]~q\ & ((\RxBuf[0][0]~q\ & (!\RxBuf[0][3]~q\ & \RxBuf[0][2]~q\)) # (!\RxBuf[0][0]~q\ & ((!\RxBuf[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~3_combout\);

-- Location: LCCOMB_X77_Y42_N16
\SEG4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~4_combout\ = (\RxBuf[0][1]~q\ & ((\RxBuf[0][2]~q\ & ((!\RxBuf[0][0]~q\))) # (!\RxBuf[0][2]~q\ & (\RxBuf[0][3]~q\)))) # (!\RxBuf[0][1]~q\ & (\RxBuf[0][3]~q\ & (!\RxBuf[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~4_combout\);

-- Location: LCCOMB_X77_Y42_N18
\SEG4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~5_combout\ = (\RxBuf[0][0]~q\ & (\RxBuf[0][3]~q\ & (\RxBuf[0][2]~q\ & !\RxBuf[0][1]~q\))) # (!\RxBuf[0][0]~q\ & (\RxBuf[0][3]~q\ $ (((!\RxBuf[0][2]~q\ & \RxBuf[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~5_combout\);

-- Location: LCCOMB_X77_Y42_N12
\SEG4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~6_combout\ = (\RxBuf[0][0]~q\ & ((\RxBuf[0][3]~q\ $ (\RxBuf[0][2]~q\)) # (!\RxBuf[0][1]~q\))) # (!\RxBuf[0][0]~q\ & ((\RxBuf[0][2]~q\ $ (\RxBuf[0][1]~q\)) # (!\RxBuf[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[0][0]~q\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[0][1]~q\,
	combout => \SEG4~6_combout\);

-- Location: LCCOMB_X77_Y38_N16
\SEG5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~0_combout\ = (\RxBuf[0][6]~q\ & (!\RxBuf[0][4]~q\ & (\RxBuf[0][7]~q\ $ (!\RxBuf[0][5]~q\)))) # (!\RxBuf[0][6]~q\ & (\RxBuf[0][5]~q\ & (\RxBuf[0][7]~q\ $ (!\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~0_combout\);

-- Location: LCCOMB_X77_Y38_N2
\SEG5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~1_combout\ = (\RxBuf[0][7]~q\ & (!\RxBuf[0][6]~q\ & (\RxBuf[0][5]~q\ $ (\RxBuf[0][4]~q\)))) # (!\RxBuf[0][7]~q\ & ((\RxBuf[0][4]~q\ & (!\RxBuf[0][6]~q\)) # (!\RxBuf[0][4]~q\ & ((!\RxBuf[0][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~1_combout\);

-- Location: LCCOMB_X77_Y38_N4
\SEG5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~2_combout\ = (\RxBuf[0][6]~q\ & (\RxBuf[0][7]~q\ & (!\RxBuf[0][5]~q\ & \RxBuf[0][4]~q\))) # (!\RxBuf[0][6]~q\ & (!\RxBuf[0][7]~q\ & ((\RxBuf[0][4]~q\) # (!\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~2_combout\);

-- Location: LCCOMB_X77_Y38_N6
\SEG5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~3_combout\ = (\RxBuf[0][5]~q\ & (\RxBuf[0][7]~q\ & (\RxBuf[0][6]~q\ $ (\RxBuf[0][4]~q\)))) # (!\RxBuf[0][5]~q\ & ((\RxBuf[0][6]~q\ & (!\RxBuf[0][7]~q\ & \RxBuf[0][4]~q\)) # (!\RxBuf[0][6]~q\ & ((!\RxBuf[0][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~3_combout\);

-- Location: LCCOMB_X77_Y38_N8
\SEG5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~4_combout\ = (\RxBuf[0][5]~q\ & ((\RxBuf[0][6]~q\ & ((!\RxBuf[0][4]~q\))) # (!\RxBuf[0][6]~q\ & (\RxBuf[0][7]~q\)))) # (!\RxBuf[0][5]~q\ & (((\RxBuf[0][7]~q\ & !\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~4_combout\);

-- Location: LCCOMB_X77_Y38_N18
\SEG5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~5_combout\ = (\RxBuf[0][6]~q\ & (\RxBuf[0][7]~q\ & ((!\RxBuf[0][4]~q\) # (!\RxBuf[0][5]~q\)))) # (!\RxBuf[0][6]~q\ & (!\RxBuf[0][4]~q\ & (\RxBuf[0][7]~q\ $ (\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~5_combout\);

-- Location: LCCOMB_X77_Y38_N12
\SEG5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~6_combout\ = (\RxBuf[0][4]~q\ & ((\RxBuf[0][6]~q\ $ (\RxBuf[0][7]~q\)) # (!\RxBuf[0][5]~q\))) # (!\RxBuf[0][4]~q\ & ((\RxBuf[0][6]~q\ $ (\RxBuf[0][5]~q\)) # (!\RxBuf[0][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111101111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][6]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \SEG5~6_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_SDO <= \SDO~output_o\;

ww_SCS <= \SCS~output_o\;

ww_SCK <= \SCK~output_o\;

ww_DBG_RXBUF(0) <= \DBG_RXBUF[0]~output_o\;

ww_DBG_RXBUF(1) <= \DBG_RXBUF[1]~output_o\;

ww_DBG_RXBUF(2) <= \DBG_RXBUF[2]~output_o\;

ww_DBG_RXBUF(3) <= \DBG_RXBUF[3]~output_o\;

ww_DBG_RXBUF(4) <= \DBG_RXBUF[4]~output_o\;

ww_DBG_RXBUF(5) <= \DBG_RXBUF[5]~output_o\;

ww_DBG_RXBUF(6) <= \DBG_RXBUF[6]~output_o\;

ww_DBG_RXBUF(7) <= \DBG_RXBUF[7]~output_o\;

ww_DBG_RXBUF(8) <= \DBG_RXBUF[8]~output_o\;

ww_DBG_RXBUF(9) <= \DBG_RXBUF[9]~output_o\;

ww_DBG_RXBUF(10) <= \DBG_RXBUF[10]~output_o\;

ww_DBG_RXBUF(11) <= \DBG_RXBUF[11]~output_o\;

ww_DBG_RXBUF(12) <= \DBG_RXBUF[12]~output_o\;

ww_DBG_RXBUF(13) <= \DBG_RXBUF[13]~output_o\;

ww_DBG_RXBUF(14) <= \DBG_RXBUF[14]~output_o\;

ww_DBG_RXBUF(15) <= \DBG_RXBUF[15]~output_o\;

ww_DBG_RXBUF(16) <= \DBG_RXBUF[16]~output_o\;

ww_DBG_RXBUF(17) <= \DBG_RXBUF[17]~output_o\;

ww_DBG_RXBUF(18) <= \DBG_RXBUF[18]~output_o\;

ww_DBG_RXBUF(19) <= \DBG_RXBUF[19]~output_o\;

ww_DBG_RXBUF(20) <= \DBG_RXBUF[20]~output_o\;

ww_DBG_RXBUF(21) <= \DBG_RXBUF[21]~output_o\;

ww_DBG_RXBUF(22) <= \DBG_RXBUF[22]~output_o\;

ww_DBG_RXBUF(23) <= \DBG_RXBUF[23]~output_o\;

ww_DGB_STREG(0) <= \DGB_STREG[0]~output_o\;

ww_DGB_STREG(1) <= \DGB_STREG[1]~output_o\;

ww_DGB_STREG(2) <= \DGB_STREG[2]~output_o\;

ww_DGB_STREG(3) <= \DGB_STREG[3]~output_o\;

ww_DGB_STREG(4) <= \DGB_STREG[4]~output_o\;

ww_DGB_STREG(5) <= \DGB_STREG[5]~output_o\;

ww_DGB_STREG(6) <= \DGB_STREG[6]~output_o\;

ww_DGB_STREG(7) <= \DGB_STREG[7]~output_o\;

ww_LED(0) <= \LED[0]~output_o\;

ww_LED(1) <= \LED[1]~output_o\;

ww_LED(2) <= \LED[2]~output_o\;

ww_LED(3) <= \LED[3]~output_o\;

ww_LED(4) <= \LED[4]~output_o\;

ww_LED(5) <= \LED[5]~output_o\;

ww_LED(6) <= \LED[6]~output_o\;

ww_LED(7) <= \LED[7]~output_o\;

ww_LED(8) <= \LED[8]~output_o\;

ww_LED(9) <= \LED[9]~output_o\;

ww_SEG0(0) <= \SEG0[0]~output_o\;

ww_SEG0(1) <= \SEG0[1]~output_o\;

ww_SEG0(2) <= \SEG0[2]~output_o\;

ww_SEG0(3) <= \SEG0[3]~output_o\;

ww_SEG0(4) <= \SEG0[4]~output_o\;

ww_SEG0(5) <= \SEG0[5]~output_o\;

ww_SEG0(6) <= \SEG0[6]~output_o\;

ww_SEG0(7) <= \SEG0[7]~output_o\;

ww_SEG1(0) <= \SEG1[0]~output_o\;

ww_SEG1(1) <= \SEG1[1]~output_o\;

ww_SEG1(2) <= \SEG1[2]~output_o\;

ww_SEG1(3) <= \SEG1[3]~output_o\;

ww_SEG1(4) <= \SEG1[4]~output_o\;

ww_SEG1(5) <= \SEG1[5]~output_o\;

ww_SEG1(6) <= \SEG1[6]~output_o\;

ww_SEG1(7) <= \SEG1[7]~output_o\;

ww_SEG2(0) <= \SEG2[0]~output_o\;

ww_SEG2(1) <= \SEG2[1]~output_o\;

ww_SEG2(2) <= \SEG2[2]~output_o\;

ww_SEG2(3) <= \SEG2[3]~output_o\;

ww_SEG2(4) <= \SEG2[4]~output_o\;

ww_SEG2(5) <= \SEG2[5]~output_o\;

ww_SEG2(6) <= \SEG2[6]~output_o\;

ww_SEG2(7) <= \SEG2[7]~output_o\;

ww_SEG3(0) <= \SEG3[0]~output_o\;

ww_SEG3(1) <= \SEG3[1]~output_o\;

ww_SEG3(2) <= \SEG3[2]~output_o\;

ww_SEG3(3) <= \SEG3[3]~output_o\;

ww_SEG3(4) <= \SEG3[4]~output_o\;

ww_SEG3(5) <= \SEG3[5]~output_o\;

ww_SEG3(6) <= \SEG3[6]~output_o\;

ww_SEG3(7) <= \SEG3[7]~output_o\;

ww_SEG4(0) <= \SEG4[0]~output_o\;

ww_SEG4(1) <= \SEG4[1]~output_o\;

ww_SEG4(2) <= \SEG4[2]~output_o\;

ww_SEG4(3) <= \SEG4[3]~output_o\;

ww_SEG4(4) <= \SEG4[4]~output_o\;

ww_SEG4(5) <= \SEG4[5]~output_o\;

ww_SEG4(6) <= \SEG4[6]~output_o\;

ww_SEG4(7) <= \SEG4[7]~output_o\;

ww_SEG5(0) <= \SEG5[0]~output_o\;

ww_SEG5(1) <= \SEG5[1]~output_o\;

ww_SEG5(2) <= \SEG5[2]~output_o\;

ww_SEG5(3) <= \SEG5[3]~output_o\;

ww_SEG5(4) <= \SEG5[4]~output_o\;

ww_SEG5(5) <= \SEG5[5]~output_o\;

ww_SEG5(6) <= \SEG5[6]~output_o\;

ww_SEG5(7) <= \SEG5[7]~output_o\;
END structure;



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

-- DATE "05/26/2022 17:36:45"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
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
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \NxSckCnt[2]~5_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \NxSckCnt[4]~4_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \NxSckCnt[5]~3_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \NxSckCnt[6]~2_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \NxSckCnt[7]~1_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \NxSckCnt[8]~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \SckLine~0_combout\ : std_logic;
SIGNAL \SckLine~q\ : std_logic;
SIGNAL \SckLine~clkctrl_outclk\ : std_logic;
SIGNAL \BTN[1]~input_o\ : std_logic;
SIGNAL \Pushed[1]~1_combout\ : std_logic;
SIGNAL \SM_Handler~5_combout\ : std_logic;
SIGNAL \NxState~10_combout\ : std_logic;
SIGNAL \NxTxByteCnt~3_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~3_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~4_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal2~5_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~2_combout\ : std_logic;
SIGNAL \Equal2~4_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~0_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~1_combout\ : std_logic;
SIGNAL \TxByteCnt[3]~5_combout\ : std_logic;
SIGNAL \NxTxByteCnt~1_combout\ : std_logic;
SIGNAL \NxTxByteCnt~4_combout\ : std_logic;
SIGNAL \NxTxByteCnt~2_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \NxTxByteCnt~0_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \NxState[2]~22_combout\ : std_logic;
SIGNAL \NxState[2]~21_combout\ : std_logic;
SIGNAL \NxState[2]~23_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~6_combout\ : std_logic;
SIGNAL \NxState[2]~24_combout\ : std_logic;
SIGNAL \NxState[2]~25_combout\ : std_logic;
SIGNAL \Equal17~0_combout\ : std_logic;
SIGNAL \Clock_SCK~3_combout\ : std_logic;
SIGNAL \SDI~input_o\ : std_logic;
SIGNAL \NxStatusReg~0_combout\ : std_logic;
SIGNAL \NxStatusReg[0]~1_combout\ : std_logic;
SIGNAL \NxStatusReg[0]~2_combout\ : std_logic;
SIGNAL \SWT[0]~input_o\ : std_logic;
SIGNAL \Equal5~5_combout\ : std_logic;
SIGNAL \Equal5~6_combout\ : std_logic;
SIGNAL \StatusReg[0]~0_combout\ : std_logic;
SIGNAL \NxState~9_combout\ : std_logic;
SIGNAL \NxState~11_combout\ : std_logic;
SIGNAL \NxState~5_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~13_combout\ : std_logic;
SIGNAL \NxState~12_combout\ : std_logic;
SIGNAL \NxState~28_combout\ : std_logic;
SIGNAL \NxState~13_combout\ : std_logic;
SIGNAL \NxState~6_combout\ : std_logic;
SIGNAL \Equal22~0_combout\ : std_logic;
SIGNAL \NxState~4_combout\ : std_logic;
SIGNAL \NxState~7_combout\ : std_logic;
SIGNAL \NxState~8_combout\ : std_logic;
SIGNAL \NxState~14_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \NxStatusReg[1]~3_combout\ : std_logic;
SIGNAL \NxStatusReg[1]~4_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~3_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~4_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~5_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~10_combout\ : std_logic;
SIGNAL \NxTxBitCnt[1]~15_combout\ : std_logic;
SIGNAL \NxState[1]~3_combout\ : std_logic;
SIGNAL \NxState[1]~15_combout\ : std_logic;
SIGNAL \Equal23~0_combout\ : std_logic;
SIGNAL \NxState~16_combout\ : std_logic;
SIGNAL \NxState~29_combout\ : std_logic;
SIGNAL \NxState~30_combout\ : std_logic;
SIGNAL \NxState[1]~17_combout\ : std_logic;
SIGNAL \Equal5~4_combout\ : std_logic;
SIGNAL \BTN[0]~input_o\ : std_logic;
SIGNAL \Pushed[0]~0_combout\ : std_logic;
SIGNAL \SM_Handler~4_combout\ : std_logic;
SIGNAL \NxState[3]~18_combout\ : std_logic;
SIGNAL \NxState[3]~19_combout\ : std_logic;
SIGNAL \NxScsLine~12_combout\ : std_logic;
SIGNAL \NxState[3]~20_combout\ : std_logic;
SIGNAL \NxState[4]~26_combout\ : std_logic;
SIGNAL \NxState[4]~27_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~2_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~8_combout\ : std_logic;
SIGNAL \Equal21~0_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~7_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~9_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~11_combout\ : std_logic;
SIGNAL \NxTxBitCnt[2]~12_combout\ : std_logic;
SIGNAL \NxTxBitCnt[0]~14_combout\ : std_logic;
SIGNAL \Equal11~0_combout\ : std_logic;
SIGNAL \Equal16~0_combout\ : std_logic;
SIGNAL \NxSdoLine~22_combout\ : std_logic;
SIGNAL \NxSdoLine~43_combout\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \SM_Handler~6_combout\ : std_logic;
SIGNAL \NxSdoLine~23_combout\ : std_logic;
SIGNAL \NxSdoLine~24_combout\ : std_logic;
SIGNAL \Equal2~6_combout\ : std_logic;
SIGNAL \NxSdoLine~25_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \NxSdoLine~26_combout\ : std_logic;
SIGNAL \NxSdoLine~27_combout\ : std_logic;
SIGNAL \NxSdoLine~44_combout\ : std_logic;
SIGNAL \NxSdoLine~41_combout\ : std_logic;
SIGNAL \Equal19~0_combout\ : std_logic;
SIGNAL \NxState~2_combout\ : std_logic;
SIGNAL \NxSdoLine~30_combout\ : std_logic;
SIGNAL \NxSdoLine~28_combout\ : std_logic;
SIGNAL \NxSdoLine~13_combout\ : std_logic;
SIGNAL \NxSdoLine~45_combout\ : std_logic;
SIGNAL \NxSdoLine~29_combout\ : std_logic;
SIGNAL \Equal15~0_combout\ : std_logic;
SIGNAL \Equal16~1_combout\ : std_logic;
SIGNAL \Equal13~0_combout\ : std_logic;
SIGNAL \NxSdoLine~31_combout\ : std_logic;
SIGNAL \NxSdoLine~32_combout\ : std_logic;
SIGNAL \IncrWrVal[0]~8_combout\ : std_logic;
SIGNAL \Clock_SCK~2_combout\ : std_logic;
SIGNAL \IncrWrVal[6]~12_combout\ : std_logic;
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
SIGNAL \NxSdoLine~34_combout\ : std_logic;
SIGNAL \SWT[1]~input_o\ : std_logic;
SIGNAL \NxSdoLine~33_combout\ : std_logic;
SIGNAL \NxSdoLine~35_combout\ : std_logic;
SIGNAL \NxSdoLine~36_combout\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \NxSdoLine~37_combout\ : std_logic;
SIGNAL \NxSdoLine~38_combout\ : std_logic;
SIGNAL \NxSdoLine~39_combout\ : std_logic;
SIGNAL \NxSdoLine~40_combout\ : std_logic;
SIGNAL \NxSdoLine~42_combout\ : std_logic;
SIGNAL \SdoLine~q\ : std_logic;
SIGNAL \NxScsLine~3_combout\ : std_logic;
SIGNAL \NxScsLine~6_combout\ : std_logic;
SIGNAL \NxScsLine~2_combout\ : std_logic;
SIGNAL \NxScsLine~4_combout\ : std_logic;
SIGNAL \NxScsLine~5_combout\ : std_logic;
SIGNAL \NxScsLine~8_combout\ : std_logic;
SIGNAL \NxSckEn~0_combout\ : std_logic;
SIGNAL \NxScsLine~7_combout\ : std_logic;
SIGNAL \NxScsLine~9_combout\ : std_logic;
SIGNAL \NxScsLine~10_combout\ : std_logic;
SIGNAL \NxScsLine~11_combout\ : std_logic;
SIGNAL \ScsLine~q\ : std_logic;
SIGNAL \NxSckEn~4_combout\ : std_logic;
SIGNAL \NxSckEn~1_combout\ : std_logic;
SIGNAL \NxSckEn~2_combout\ : std_logic;
SIGNAL \NxSckEn~3_combout\ : std_logic;
SIGNAL \NxSckEn~5_combout\ : std_logic;
SIGNAL \SckEn~q\ : std_logic;
SIGNAL \SCK~0_combout\ : std_logic;
SIGNAL \LedR~0_combout\ : std_logic;
SIGNAL \LedR~q\ : std_logic;
SIGNAL \LedW~0_combout\ : std_logic;
SIGNAL \LedW~q\ : std_logic;
SIGNAL \NxStatusReg~5_combout\ : std_logic;
SIGNAL \NxStatusReg[2]~6_combout\ : std_logic;
SIGNAL \NxStatusReg[2]~7_combout\ : std_logic;
SIGNAL \NxStatusReg~8_combout\ : std_logic;
SIGNAL \NxStatusReg[3]~9_combout\ : std_logic;
SIGNAL \NxStatusReg[3]~10_combout\ : std_logic;
SIGNAL \NxStatusReg~11_combout\ : std_logic;
SIGNAL \NxStatusReg[4]~12_combout\ : std_logic;
SIGNAL \NxStatusReg[4]~13_combout\ : std_logic;
SIGNAL \NxStatusReg~14_combout\ : std_logic;
SIGNAL \NxStatusReg[5]~15_combout\ : std_logic;
SIGNAL \NxStatusReg[5]~16_combout\ : std_logic;
SIGNAL \NxStatusReg~17_combout\ : std_logic;
SIGNAL \NxStatusReg[6]~18_combout\ : std_logic;
SIGNAL \NxStatusReg[6]~19_combout\ : std_logic;
SIGNAL \NxStatusReg[7]~20_combout\ : std_logic;
SIGNAL \NxStatusReg[7]~21_combout\ : std_logic;
SIGNAL \NxStatusReg[7]~22_combout\ : std_logic;
SIGNAL \NxRxBuf[2][1]~0_combout\ : std_logic;
SIGNAL \NxRxBuf[2][1]~1_combout\ : std_logic;
SIGNAL \RxBuf~0_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~q\ : std_logic;
SIGNAL \NxRxBuf[2][0]~7_combout\ : std_logic;
SIGNAL \RxBuf[2][0]~q\ : std_logic;
SIGNAL \NxRxBuf[2][2]~5_combout\ : std_logic;
SIGNAL \NxRxBuf[2][2]~6_combout\ : std_logic;
SIGNAL \RxBuf[2][2]~q\ : std_logic;
SIGNAL \NxStatusReg~23_combout\ : std_logic;
SIGNAL \NxRxBuf[2][3]~2_combout\ : std_logic;
SIGNAL \NxRxBuf~3_combout\ : std_logic;
SIGNAL \NxRxBuf[2][3]~4_combout\ : std_logic;
SIGNAL \RxBuf[2][3]~q\ : std_logic;
SIGNAL \SEG0~0_combout\ : std_logic;
SIGNAL \SEG0~1_combout\ : std_logic;
SIGNAL \SEG0~2_combout\ : std_logic;
SIGNAL \SEG0~3_combout\ : std_logic;
SIGNAL \SEG0~4_combout\ : std_logic;
SIGNAL \SEG0~5_combout\ : std_logic;
SIGNAL \SEG0~6_combout\ : std_logic;
SIGNAL \NxRxBuf[2][6]~12_combout\ : std_logic;
SIGNAL \NxRxBuf[2][6]~13_combout\ : std_logic;
SIGNAL \RxBuf[2][6]~q\ : std_logic;
SIGNAL \NxRxBuf[2][4]~14_combout\ : std_logic;
SIGNAL \NxRxBuf[2][4]~15_combout\ : std_logic;
SIGNAL \RxBuf[2][4]~q\ : std_logic;
SIGNAL \NxRxBuf[2][7]~10_combout\ : std_logic;
SIGNAL \NxRxBuf[2][7]~11_combout\ : std_logic;
SIGNAL \RxBuf[2][7]~q\ : std_logic;
SIGNAL \NxStatusReg~24_combout\ : std_logic;
SIGNAL \NxRxBuf[2][5]~8_combout\ : std_logic;
SIGNAL \NxRxBuf[2][5]~9_combout\ : std_logic;
SIGNAL \RxBuf[2][5]~q\ : std_logic;
SIGNAL \SEG1~0_combout\ : std_logic;
SIGNAL \SEG1~1_combout\ : std_logic;
SIGNAL \SEG1~2_combout\ : std_logic;
SIGNAL \SEG1~3_combout\ : std_logic;
SIGNAL \SEG1~4_combout\ : std_logic;
SIGNAL \SEG1~5_combout\ : std_logic;
SIGNAL \SEG1~6_combout\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \NxRxBuf[1][0]~22_combout\ : std_logic;
SIGNAL \NxRxBuf[1][0]~23_combout\ : std_logic;
SIGNAL \RxBuf[1][0]~q\ : std_logic;
SIGNAL \NxRxBuf[1][3]~18_combout\ : std_logic;
SIGNAL \NxRxBuf[1][3]~19_combout\ : std_logic;
SIGNAL \RxBuf[1][3]~q\ : std_logic;
SIGNAL \NxRxBuf[1][1]~16_combout\ : std_logic;
SIGNAL \NxRxBuf[1][1]~17_combout\ : std_logic;
SIGNAL \RxBuf[1][1]~q\ : std_logic;
SIGNAL \NxRxBuf[1][2]~20_combout\ : std_logic;
SIGNAL \NxRxBuf[1][2]~21_combout\ : std_logic;
SIGNAL \RxBuf[1][2]~q\ : std_logic;
SIGNAL \SEG2~0_combout\ : std_logic;
SIGNAL \SEG2~1_combout\ : std_logic;
SIGNAL \SEG2~2_combout\ : std_logic;
SIGNAL \SEG2~3_combout\ : std_logic;
SIGNAL \SEG2~4_combout\ : std_logic;
SIGNAL \SEG2~5_combout\ : std_logic;
SIGNAL \SEG2~6_combout\ : std_logic;
SIGNAL \NxRxBuf[1][5]~24_combout\ : std_logic;
SIGNAL \NxRxBuf[1][5]~25_combout\ : std_logic;
SIGNAL \RxBuf[1][5]~q\ : std_logic;
SIGNAL \NxRxBuf[1][6]~28_combout\ : std_logic;
SIGNAL \NxRxBuf[1][6]~29_combout\ : std_logic;
SIGNAL \RxBuf[1][6]~q\ : std_logic;
SIGNAL \NxRxBuf[1][4]~30_combout\ : std_logic;
SIGNAL \NxRxBuf[1][4]~31_combout\ : std_logic;
SIGNAL \RxBuf[1][4]~q\ : std_logic;
SIGNAL \NxRxBuf[1][7]~26_combout\ : std_logic;
SIGNAL \NxRxBuf[1][7]~27_combout\ : std_logic;
SIGNAL \RxBuf[1][7]~q\ : std_logic;
SIGNAL \SEG3~0_combout\ : std_logic;
SIGNAL \SEG3~1_combout\ : std_logic;
SIGNAL \SEG3~2_combout\ : std_logic;
SIGNAL \SEG3~3_combout\ : std_logic;
SIGNAL \SEG3~4_combout\ : std_logic;
SIGNAL \SEG3~5_combout\ : std_logic;
SIGNAL \SEG3~6_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \NxRxBuf[0][0]~38_combout\ : std_logic;
SIGNAL \NxRxBuf[0][0]~39_combout\ : std_logic;
SIGNAL \RxBuf[0][0]~q\ : std_logic;
SIGNAL \NxRxBuf[0][1]~32_combout\ : std_logic;
SIGNAL \NxRxBuf[0][1]~33_combout\ : std_logic;
SIGNAL \RxBuf[0][1]~q\ : std_logic;
SIGNAL \NxRxBuf[0][3]~34_combout\ : std_logic;
SIGNAL \NxRxBuf[0][3]~35_combout\ : std_logic;
SIGNAL \RxBuf[0][3]~q\ : std_logic;
SIGNAL \NxRxBuf[0][2]~36_combout\ : std_logic;
SIGNAL \NxRxBuf[0][2]~37_combout\ : std_logic;
SIGNAL \RxBuf[0][2]~q\ : std_logic;
SIGNAL \SEG4~0_combout\ : std_logic;
SIGNAL \SEG4~1_combout\ : std_logic;
SIGNAL \SEG4~2_combout\ : std_logic;
SIGNAL \SEG4~3_combout\ : std_logic;
SIGNAL \SEG4~4_combout\ : std_logic;
SIGNAL \SEG4~5_combout\ : std_logic;
SIGNAL \SEG4~6_combout\ : std_logic;
SIGNAL \NxRxBuf[0][7]~42_combout\ : std_logic;
SIGNAL \NxRxBuf[0][7]~43_combout\ : std_logic;
SIGNAL \RxBuf[0][7]~q\ : std_logic;
SIGNAL \NxRxBuf[0][6]~44_combout\ : std_logic;
SIGNAL \NxRxBuf[0][6]~45_combout\ : std_logic;
SIGNAL \RxBuf[0][6]~q\ : std_logic;
SIGNAL \NxRxBuf[0][4]~46_combout\ : std_logic;
SIGNAL \NxRxBuf[0][4]~47_combout\ : std_logic;
SIGNAL \RxBuf[0][4]~q\ : std_logic;
SIGNAL \NxRxBuf[0][5]~40_combout\ : std_logic;
SIGNAL \NxRxBuf[0][5]~41_combout\ : std_logic;
SIGNAL \RxBuf[0][5]~q\ : std_logic;
SIGNAL \SEG5~0_combout\ : std_logic;
SIGNAL \SEG5~1_combout\ : std_logic;
SIGNAL \SEG5~2_combout\ : std_logic;
SIGNAL \SEG5~3_combout\ : std_logic;
SIGNAL \SEG5~4_combout\ : std_logic;
SIGNAL \SEG5~5_combout\ : std_logic;
SIGNAL \SEG5~6_combout\ : std_logic;
SIGNAL IncrWrVal : std_logic_vector(7 DOWNTO 0);
SIGNAL StatusReg : std_logic_vector(7 DOWNTO 0);
SIGNAL TxBitCnt : std_logic_vector(2 DOWNTO 0);
SIGNAL State : std_logic_vector(4 DOWNTO 0);
SIGNAL Pushed : std_logic_vector(1 DOWNTO 0);
SIGNAL TxByteCnt : std_logic_vector(3 DOWNTO 0);
SIGNAL SckCnt : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_SckLine~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_SEG5~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG4~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG3~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG2~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG1~6_combout\ : std_logic;
SIGNAL \ALT_INV_SEG0~6_combout\ : std_logic;
SIGNAL ALT_INV_StatusReg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_ScsLine~q\ : std_logic;

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
\ALT_INV_SckLine~clkctrl_outclk\ <= NOT \SckLine~clkctrl_outclk\;
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
\ALT_INV_ScsLine~q\ <= NOT \ScsLine~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y45_N16
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

-- Location: LCCOMB_X55_Y42_N0
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = SckCnt(0) $ (VCC)
-- \Add0~1\ = CARRY(SckCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X55_Y42_N1
\SckCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(0));

-- Location: LCCOMB_X55_Y42_N2
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (SckCnt(1) & (!\Add0~1\)) # (!SckCnt(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!SckCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X55_Y42_N3
\SckCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(1));

-- Location: LCCOMB_X55_Y42_N4
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (SckCnt(2) & (\Add0~3\ $ (GND))) # (!SckCnt(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((SckCnt(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X55_Y42_N28
\NxSckCnt[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[2]~5_combout\ = (\Add0~4_combout\ & (((!\Equal0~1_combout\) # (!SckCnt(1))) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => SckCnt(1),
	datac => \Equal0~1_combout\,
	datad => \Add0~4_combout\,
	combout => \NxSckCnt[2]~5_combout\);

-- Location: FF_X55_Y42_N29
\SckCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(2));

-- Location: LCCOMB_X55_Y42_N6
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (SckCnt(3) & (!\Add0~5\)) # (!SckCnt(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!SckCnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: FF_X55_Y42_N7
\SckCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(3));

-- Location: LCCOMB_X55_Y42_N8
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (SckCnt(4) & (\Add0~7\ $ (GND))) # (!SckCnt(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((SckCnt(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X55_Y42_N18
\NxSckCnt[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[4]~4_combout\ = (\Add0~8_combout\ & (((!\Equal0~1_combout\) # (!SckCnt(1))) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => SckCnt(1),
	datac => \Equal0~1_combout\,
	datad => \Add0~8_combout\,
	combout => \NxSckCnt[4]~4_combout\);

-- Location: FF_X55_Y42_N19
\SckCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(4));

-- Location: LCCOMB_X55_Y42_N30
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (SckCnt(4) & (SckCnt(5) & (!SckCnt(3) & !SckCnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(4),
	datab => SckCnt(5),
	datac => SckCnt(3),
	datad => SckCnt(2),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X55_Y42_N10
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (SckCnt(5) & (!\Add0~9\)) # (!SckCnt(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!SckCnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X55_Y42_N24
\NxSckCnt[5]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[5]~3_combout\ = (\Add0~10_combout\ & (((!\Equal0~1_combout\) # (!SckCnt(1))) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => SckCnt(1),
	datac => \Equal0~1_combout\,
	datad => \Add0~10_combout\,
	combout => \NxSckCnt[5]~3_combout\);

-- Location: FF_X55_Y42_N25
\SckCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(5));

-- Location: LCCOMB_X55_Y42_N12
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (SckCnt(6) & (\Add0~11\ $ (GND))) # (!SckCnt(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((SckCnt(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X56_Y42_N6
\NxSckCnt[6]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[6]~2_combout\ = (\Add0~12_combout\ & (((!\Equal0~1_combout\) # (!\Equal0~0_combout\)) # (!SckCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(1),
	datab => \Equal0~0_combout\,
	datac => \Add0~12_combout\,
	datad => \Equal0~1_combout\,
	combout => \NxSckCnt[6]~2_combout\);

-- Location: FF_X56_Y42_N7
\SckCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(6));

-- Location: LCCOMB_X55_Y42_N14
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (SckCnt(7) & (!\Add0~13\)) # (!SckCnt(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!SckCnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => SckCnt(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X55_Y42_N20
\NxSckCnt[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[7]~1_combout\ = (\Add0~14_combout\ & (((!\Equal0~1_combout\) # (!SckCnt(1))) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => SckCnt(1),
	datac => \Equal0~1_combout\,
	datad => \Add0~14_combout\,
	combout => \NxSckCnt[7]~1_combout\);

-- Location: FF_X55_Y42_N21
\SckCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(7));

-- Location: LCCOMB_X55_Y42_N16
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = SckCnt(8) $ (!\Add0~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(8),
	cin => \Add0~15\,
	combout => \Add0~16_combout\);

-- Location: LCCOMB_X55_Y42_N26
\NxSckCnt[8]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckCnt[8]~0_combout\ = (\Add0~16_combout\ & (((!SckCnt(1)) # (!\Equal0~0_combout\)) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Add0~16_combout\,
	datac => \Equal0~0_combout\,
	datad => SckCnt(1),
	combout => \NxSckCnt[8]~0_combout\);

-- Location: FF_X55_Y42_N27
\SckCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxSckCnt[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => SckCnt(8));

-- Location: LCCOMB_X55_Y42_N22
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (SckCnt(6) & (SckCnt(0) & (SckCnt(8) & SckCnt(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(6),
	datab => SckCnt(0),
	datac => SckCnt(8),
	datad => SckCnt(7),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X56_Y42_N28
\SckLine~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SckLine~0_combout\ = \SckLine~q\ $ (((SckCnt(1) & (\Equal0~0_combout\ & \Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => SckCnt(1),
	datab => \Equal0~0_combout\,
	datac => \SckLine~q\,
	datad => \Equal0~1_combout\,
	combout => \SckLine~0_combout\);

-- Location: FF_X56_Y42_N29
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

-- Location: CLKCTRL_G8
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

-- Location: LCCOMB_X57_Y42_N20
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

-- Location: FF_X57_Y42_N21
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

-- Location: LCCOMB_X57_Y42_N6
\SM_Handler~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~5_combout\ = (!\BTN[1]~input_o\ & !Pushed(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BTN[1]~input_o\,
	datad => Pushed(1),
	combout => \SM_Handler~5_combout\);

-- Location: LCCOMB_X61_Y42_N24
\NxState~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~10_combout\ = (State(0) & (!\NxState[1]~3_combout\ & (!State(1)))) # (!State(0) & ((State(1) & (\NxState[1]~3_combout\)) # (!State(1) & ((\SM_Handler~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => State(0),
	datac => State(1),
	datad => \SM_Handler~5_combout\,
	combout => \NxState~10_combout\);

-- Location: LCCOMB_X58_Y41_N30
\NxTxByteCnt~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~3_combout\ = (!State(3) & (!State(0) & (!TxByteCnt(0) & \Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(0),
	datac => TxByteCnt(0),
	datad => \Equal6~0_combout\,
	combout => \NxTxByteCnt~3_combout\);

-- Location: LCCOMB_X58_Y41_N28
\TxByteCnt[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~3_combout\ = ((!State(3) & (!State(0) & State(1)))) # (!State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(0),
	datac => State(2),
	datad => State(1),
	combout => \TxByteCnt[3]~3_combout\);

-- Location: LCCOMB_X58_Y41_N6
\TxByteCnt[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~4_combout\ = (\NxState[1]~3_combout\ & (!State(4) & ((\TxByteCnt[3]~3_combout\)))) # (!\NxState[1]~3_combout\ & (((!State(0))) # (!State(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => State(4),
	datac => State(0),
	datad => \TxByteCnt[3]~3_combout\,
	combout => \TxByteCnt[3]~4_combout\);

-- Location: LCCOMB_X67_Y39_N28
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

-- Location: LCCOMB_X62_Y40_N8
\Equal2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~5_combout\ = (!State(3) & !State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(3),
	datad => State(2),
	combout => \Equal2~5_combout\);

-- Location: LCCOMB_X60_Y42_N20
\TxByteCnt[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~2_combout\ = (\Equal2~5_combout\ & ((\Equal4~0_combout\) # ((!State(4) & \Equal3~0_combout\)))) # (!\Equal2~5_combout\ & (State(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => \Equal4~0_combout\,
	datac => \Equal3~0_combout\,
	datad => \Equal2~5_combout\,
	combout => \TxByteCnt[3]~2_combout\);

-- Location: LCCOMB_X59_Y40_N4
\Equal2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~4_combout\ = (State(0) & !State(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(0),
	datad => State(1),
	combout => \Equal2~4_combout\);

-- Location: LCCOMB_X58_Y42_N16
\TxByteCnt[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~0_combout\ = ((\Equal2~4_combout\ & (\Equal2~5_combout\ & !State(4)))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~4_combout\,
	datab => \Equal2~4_combout\,
	datac => \Equal2~5_combout\,
	datad => State(4),
	combout => \TxByteCnt[3]~0_combout\);

-- Location: LCCOMB_X58_Y41_N10
\TxByteCnt[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~1_combout\ = (State(3) & ((State(0)) # ((!State(1))))) # (!State(3) & (!State(1) & ((State(0)) # (!State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(0),
	datac => State(2),
	datad => State(1),
	combout => \TxByteCnt[3]~1_combout\);

-- Location: LCCOMB_X58_Y41_N8
\TxByteCnt[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxByteCnt[3]~5_combout\ = (!\TxByteCnt[3]~4_combout\ & (!\TxByteCnt[3]~2_combout\ & (!\TxByteCnt[3]~0_combout\ & !\TxByteCnt[3]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~4_combout\,
	datab => \TxByteCnt[3]~2_combout\,
	datac => \TxByteCnt[3]~0_combout\,
	datad => \TxByteCnt[3]~1_combout\,
	combout => \TxByteCnt[3]~5_combout\);

-- Location: FF_X58_Y41_N31
\TxByteCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~3_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(0));

-- Location: LCCOMB_X58_Y40_N0
\NxTxByteCnt~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~1_combout\ = (\Equal6~0_combout\ & (!State(3) & !State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal6~0_combout\,
	datac => State(3),
	datad => State(0),
	combout => \NxTxByteCnt~1_combout\);

-- Location: LCCOMB_X58_Y41_N24
\NxTxByteCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~4_combout\ = (\NxTxByteCnt~1_combout\ & (TxByteCnt(0) $ (TxByteCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(0),
	datab => \NxTxByteCnt~1_combout\,
	datac => TxByteCnt(1),
	combout => \NxTxByteCnt~4_combout\);

-- Location: FF_X58_Y41_N25
\TxByteCnt[1]\ : dffeas
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
	q => TxByteCnt(1));

-- Location: LCCOMB_X58_Y41_N4
\NxTxByteCnt~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~2_combout\ = (\NxTxByteCnt~1_combout\ & (TxByteCnt(2) $ (((TxByteCnt(0) & TxByteCnt(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(0),
	datab => \NxTxByteCnt~1_combout\,
	datac => TxByteCnt(2),
	datad => TxByteCnt(1),
	combout => \NxTxByteCnt~2_combout\);

-- Location: FF_X58_Y41_N5
\TxByteCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~2_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(2));

-- Location: LCCOMB_X58_Y41_N16
\Add2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = TxByteCnt(3) $ (((TxByteCnt(2) & (TxByteCnt(1) & TxByteCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(1),
	datac => TxByteCnt(0),
	datad => TxByteCnt(3),
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X58_Y41_N2
\NxTxByteCnt~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxByteCnt~0_combout\ = (!State(3) & (\Add2~0_combout\ & (!State(0) & \Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Add2~0_combout\,
	datac => State(0),
	datad => \Equal6~0_combout\,
	combout => \NxTxByteCnt~0_combout\);

-- Location: FF_X58_Y41_N3
\TxByteCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxTxByteCnt~0_combout\,
	ena => \TxByteCnt[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxByteCnt(3));

-- Location: LCCOMB_X58_Y41_N18
\Equal6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (TxByteCnt(2)) # (((TxByteCnt(0)) # (TxByteCnt(3))) # (!TxByteCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(1),
	datac => TxByteCnt(0),
	datad => TxByteCnt(3),
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X61_Y42_N16
\NxState[2]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~22_combout\ = ((State(0) & (!State(1))) # (!State(0) & ((State(1)) # (\Equal6~0_combout\)))) # (!\NxState[1]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => State(0),
	datac => State(1),
	datad => \Equal6~0_combout\,
	combout => \NxState[2]~22_combout\);

-- Location: LCCOMB_X61_Y42_N30
\NxState[2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~21_combout\ = (State(4)) # ((State(3) & ((!State(0)) # (!State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datac => State(1),
	datad => State(0),
	combout => \NxState[2]~21_combout\);

-- Location: LCCOMB_X61_Y42_N10
\NxState[2]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~23_combout\ = (State(2) & ((\NxState[2]~21_combout\) # ((!State(3) & \NxState[2]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxState[2]~22_combout\,
	datac => \NxState[2]~21_combout\,
	datad => State(2),
	combout => \NxState[2]~23_combout\);

-- Location: LCCOMB_X61_Y42_N28
\NxTxBitCnt[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~6_combout\ = (!State(4) & !State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datad => State(2),
	combout => \NxTxBitCnt[2]~6_combout\);

-- Location: LCCOMB_X61_Y42_N12
\NxState[2]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~24_combout\ = (State(0) & (((State(1))))) # (!State(0) & (\SM_Handler~5_combout\ & (!State(1) & !State(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~5_combout\,
	datab => State(0),
	datac => State(1),
	datad => State(3),
	combout => \NxState[2]~24_combout\);

-- Location: LCCOMB_X61_Y42_N18
\NxState[2]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[2]~25_combout\ = (\SM_Handler~4_combout\ & ((\NxState[2]~23_combout\) # ((\NxTxBitCnt[2]~6_combout\ & \NxState[2]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[2]~23_combout\,
	datab => \NxTxBitCnt[2]~6_combout\,
	datac => \NxState[2]~24_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \NxState[2]~25_combout\);

-- Location: FF_X61_Y42_N19
\State[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[2]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(2));

-- Location: LCCOMB_X59_Y42_N16
\Equal17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal17~0_combout\ = (\NxTxBitCnt[2]~2_combout\ & (State(1) & (State(3) & !State(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~2_combout\,
	datab => State(1),
	datac => State(3),
	datad => State(0),
	combout => \Equal17~0_combout\);

-- Location: LCCOMB_X59_Y42_N20
\Clock_SCK~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Clock_SCK~3_combout\ = (\Equal17~0_combout\) # ((State(2) & (!State(3) & \Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal17~0_combout\,
	datac => State(3),
	datad => \Equal4~0_combout\,
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

-- Location: LCCOMB_X59_Y41_N8
\NxStatusReg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~0_combout\ = (\NxTxBitCnt[2]~2_combout\ & (State(1) & (State(0) $ (State(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~2_combout\,
	datab => State(1),
	datac => State(0),
	datad => State(3),
	combout => \NxStatusReg~0_combout\);

-- Location: LCCOMB_X60_Y40_N0
\NxStatusReg[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[0]~1_combout\ = (\NxStatusReg~0_combout\ & ((\NxState[1]~3_combout\ & ((\SDI~input_o\))) # (!\NxState[1]~3_combout\ & (!StatusReg(0))))) # (!\NxStatusReg~0_combout\ & (!StatusReg(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(0),
	datab => \SDI~input_o\,
	datac => \NxStatusReg~0_combout\,
	datad => \NxState[1]~3_combout\,
	combout => \NxStatusReg[0]~1_combout\);

-- Location: LCCOMB_X60_Y40_N8
\NxStatusReg[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[0]~2_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[0]~1_combout\,
	combout => \NxStatusReg[0]~2_combout\);

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

-- Location: LCCOMB_X58_Y41_N0
\Equal5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~5_combout\ = (State(2) & !State(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datac => State(3),
	combout => \Equal5~5_combout\);

-- Location: LCCOMB_X58_Y41_N26
\Equal5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~6_combout\ = (!State(4) & (!State(0) & (!State(1) & \Equal5~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => State(0),
	datac => State(1),
	datad => \Equal5~5_combout\,
	combout => \Equal5~6_combout\);

-- Location: LCCOMB_X60_Y40_N2
\StatusReg[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \StatusReg[0]~0_combout\ = (!\Equal5~6_combout\ & ((\Clock_SCK~3_combout\ & ((\SM_Handler~4_combout\))) # (!\Clock_SCK~3_combout\ & (!\SWT[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[0]~input_o\,
	datab => \Equal5~6_combout\,
	datac => \Clock_SCK~3_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \StatusReg[0]~0_combout\);

-- Location: FF_X60_Y40_N9
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

-- Location: LCCOMB_X61_Y42_N14
\NxState~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~9_combout\ = (State(1) & (((!State(0))))) # (!State(1) & ((State(0) & ((!\NxState[1]~3_combout\))) # (!State(0) & (StatusReg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => StatusReg(0),
	datac => \NxState[1]~3_combout\,
	datad => State(0),
	combout => \NxState~9_combout\);

-- Location: LCCOMB_X61_Y42_N26
\NxState~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~11_combout\ = (State(3) & (((\NxState~9_combout\) # (State(2))))) # (!State(3) & (\NxState~10_combout\ & ((!State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxState~10_combout\,
	datac => \NxState~9_combout\,
	datad => State(2),
	combout => \NxState~11_combout\);

-- Location: LCCOMB_X59_Y40_N20
\NxState~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~5_combout\ = (!TxBitCnt(0)) # (!TxBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	combout => \NxState~5_combout\);

-- Location: LCCOMB_X59_Y40_N8
\NxTxBitCnt[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~13_combout\ = (\NxTxBitCnt[2]~10_combout\ & ((TxBitCnt(2) $ (!\NxState~5_combout\)))) # (!\NxTxBitCnt[2]~10_combout\ & (\NxTxBitCnt[2]~12_combout\ & (TxBitCnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~10_combout\,
	datab => \NxTxBitCnt[2]~12_combout\,
	datac => TxBitCnt(2),
	datad => \NxState~5_combout\,
	combout => \NxTxBitCnt[2]~13_combout\);

-- Location: FF_X59_Y40_N9
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

-- Location: LCCOMB_X59_Y40_N14
\NxState~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~12_combout\ = (((State(0)) # (!TxBitCnt(2))) # (!TxBitCnt(1))) # (!TxBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => TxBitCnt(1),
	datac => State(0),
	datad => TxBitCnt(2),
	combout => \NxState~12_combout\);

-- Location: LCCOMB_X59_Y40_N28
\NxState~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~28_combout\ = (State(0) & (((\NxState~5_combout\)) # (!TxBitCnt(2)))) # (!State(0) & (((State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(2),
	datab => \NxState~5_combout\,
	datac => State(0),
	datad => State(1),
	combout => \NxState~28_combout\);

-- Location: LCCOMB_X61_Y42_N4
\NxState~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~13_combout\ = (\NxState~11_combout\ & (((!State(2))) # (!\NxState~12_combout\))) # (!\NxState~11_combout\ & (((\NxState~28_combout\ & State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~11_combout\,
	datab => \NxState~12_combout\,
	datac => \NxState~28_combout\,
	datad => State(2),
	combout => \NxState~13_combout\);

-- Location: LCCOMB_X62_Y39_N30
\NxState~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~6_combout\ = (!State(1) & (((!TxBitCnt(0)) # (!TxBitCnt(2))) # (!TxBitCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => TxBitCnt(1),
	datac => TxBitCnt(2),
	datad => TxBitCnt(0),
	combout => \NxState~6_combout\);

-- Location: LCCOMB_X60_Y42_N4
\Equal22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal22~0_combout\ = (\Equal3~0_combout\ & (State(4) & (!State(3) & !State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => State(4),
	datac => State(3),
	datad => State(2),
	combout => \Equal22~0_combout\);

-- Location: LCCOMB_X61_Y46_N28
\NxState~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~4_combout\ = (((\Equal6~0_combout\) # (!TxBitCnt(1))) # (!TxBitCnt(0))) # (!TxBitCnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(2),
	datab => TxBitCnt(0),
	datac => TxBitCnt(1),
	datad => \Equal6~0_combout\,
	combout => \NxState~4_combout\);

-- Location: LCCOMB_X61_Y42_N2
\NxState~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~7_combout\ = (State(1) & (\Equal22~0_combout\ & ((!\NxState~4_combout\)))) # (!State(1) & (((\NxState[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \Equal22~0_combout\,
	datac => \NxState[1]~3_combout\,
	datad => \NxState~4_combout\,
	combout => \NxState~7_combout\);

-- Location: LCCOMB_X61_Y42_N20
\NxState~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~8_combout\ = (\Equal2~5_combout\ & ((State(0) & (\NxState~6_combout\)) # (!State(0) & ((\NxState~7_combout\))))) # (!\Equal2~5_combout\ & (State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~5_combout\,
	datab => State(0),
	datac => \NxState~6_combout\,
	datad => \NxState~7_combout\,
	combout => \NxState~8_combout\);

-- Location: LCCOMB_X61_Y42_N0
\NxState~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~14_combout\ = ((State(4) & ((\NxState~8_combout\))) # (!State(4) & (\NxState~13_combout\))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => \SM_Handler~4_combout\,
	datac => \NxState~13_combout\,
	datad => \NxState~8_combout\,
	combout => \NxState~14_combout\);

-- Location: FF_X61_Y42_N1
\State[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(0));

-- Location: LCCOMB_X60_Y42_N18
\Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (!State(4) & (State(0) & State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datac => State(0),
	datad => State(1),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X59_Y40_N24
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (TxBitCnt(1) & (!TxBitCnt(0) & TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X59_Y40_N12
\NxStatusReg[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[1]~3_combout\ = (\Mux3~0_combout\ & ((\NxStatusReg~0_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~0_combout\ & ((!StatusReg(1)))))) # (!\Mux3~0_combout\ & (((!StatusReg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Mux3~0_combout\,
	datac => \NxStatusReg~0_combout\,
	datad => StatusReg(1),
	combout => \NxStatusReg[1]~3_combout\);

-- Location: LCCOMB_X60_Y40_N18
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

-- Location: FF_X60_Y40_N19
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

-- Location: LCCOMB_X57_Y42_N28
\NxTxBitCnt[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~3_combout\ = (State(3) & (\Equal4~0_combout\ & ((!State(2)) # (!StatusReg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal4~0_combout\,
	datac => StatusReg(1),
	datad => State(2),
	combout => \NxTxBitCnt[2]~3_combout\);

-- Location: LCCOMB_X57_Y42_N30
\NxTxBitCnt[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~4_combout\ = (State(3) & (((StatusReg(0))))) # (!State(3) & (!Pushed(1) & ((!\BTN[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => Pushed(1),
	datac => StatusReg(0),
	datad => \BTN[1]~input_o\,
	combout => \NxTxBitCnt[2]~4_combout\);

-- Location: LCCOMB_X57_Y42_N16
\NxTxBitCnt[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~5_combout\ = (\NxTxBitCnt[2]~3_combout\) # ((\Equal5~4_combout\ & (\NxTxBitCnt[2]~4_combout\ & !State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~3_combout\,
	datab => \Equal5~4_combout\,
	datac => \NxTxBitCnt[2]~4_combout\,
	datad => State(2),
	combout => \NxTxBitCnt[2]~5_combout\);

-- Location: LCCOMB_X57_Y39_N0
\NxTxBitCnt[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~10_combout\ = (\NxTxBitCnt[2]~5_combout\) # (((\NxTxBitCnt[2]~9_combout\ & !\NxState[1]~3_combout\)) # (!\SM_Handler~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~5_combout\,
	datab => \NxTxBitCnt[2]~9_combout\,
	datac => \NxState[1]~3_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \NxTxBitCnt[2]~10_combout\);

-- Location: LCCOMB_X59_Y40_N10
\NxTxBitCnt[1]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[1]~15_combout\ = (\NxTxBitCnt[2]~10_combout\ & (TxBitCnt(0) $ (((TxBitCnt(1)))))) # (!\NxTxBitCnt[2]~10_combout\ & (((\NxTxBitCnt[2]~12_combout\ & TxBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => \NxTxBitCnt[2]~12_combout\,
	datac => TxBitCnt(1),
	datad => \NxTxBitCnt[2]~10_combout\,
	combout => \NxTxBitCnt[1]~15_combout\);

-- Location: FF_X59_Y40_N11
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

-- Location: LCCOMB_X59_Y40_N18
\NxState[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~3_combout\ = (TxBitCnt(1) & (TxBitCnt(0) & TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxState[1]~3_combout\);

-- Location: LCCOMB_X60_Y42_N6
\NxState[1]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~15_combout\ = (State(1) & (((!\Equal2~5_combout\) # (!State(0))))) # (!State(1) & (\NxState[1]~3_combout\ & (State(0) & \Equal2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => State(1),
	datac => State(0),
	datad => \Equal2~5_combout\,
	combout => \NxState[1]~15_combout\);

-- Location: LCCOMB_X67_Y43_N30
\Equal23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~0_combout\ = (State(1) & State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datad => State(0),
	combout => \Equal23~0_combout\);

-- Location: LCCOMB_X59_Y40_N0
\NxState~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~16_combout\ = (\NxState[1]~3_combout\ & (\Equal2~4_combout\)) # (!\NxState[1]~3_combout\ & (((\Equal23~0_combout\ & State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~4_combout\,
	datab => \Equal23~0_combout\,
	datac => \NxState[1]~3_combout\,
	datad => State(2),
	combout => \NxState~16_combout\);

-- Location: LCCOMB_X60_Y42_N2
\NxState~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~29_combout\ = (State(1) & (((!State(0))))) # (!State(1) & (State(0) & ((\NxState[1]~3_combout\) # (State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => State(1),
	datac => State(0),
	datad => State(2),
	combout => \NxState~29_combout\);

-- Location: LCCOMB_X60_Y42_N12
\NxState~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~30_combout\ = (State(3) & (((\NxState~29_combout\)))) # (!State(3) & ((\NxState~16_combout\) # ((\Equal3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState~16_combout\,
	datab => State(3),
	datac => \Equal3~0_combout\,
	datad => \NxState~29_combout\,
	combout => \NxState~30_combout\);

-- Location: LCCOMB_X60_Y42_N0
\NxState[1]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[1]~17_combout\ = (State(4) & (\NxState[1]~15_combout\)) # (!State(4) & (((\SM_Handler~4_combout\ & \NxState~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~15_combout\,
	datab => \SM_Handler~4_combout\,
	datac => State(4),
	datad => \NxState~30_combout\,
	combout => \NxState[1]~17_combout\);

-- Location: FF_X60_Y42_N1
\State[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[1]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(1));

-- Location: LCCOMB_X57_Y42_N2
\Equal5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal5~4_combout\ = (!State(1) & (!State(4) & !State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(4),
	datac => State(0),
	combout => \Equal5~4_combout\);

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

-- Location: LCCOMB_X58_Y42_N20
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

-- Location: FF_X58_Y42_N21
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

-- Location: LCCOMB_X58_Y42_N30
\SM_Handler~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~4_combout\ = ((\BTN[0]~input_o\) # ((Pushed(0)) # (!\Equal2~5_combout\))) # (!\Equal5~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~4_combout\,
	datab => \BTN[0]~input_o\,
	datac => \Equal2~5_combout\,
	datad => Pushed(0),
	combout => \SM_Handler~4_combout\);

-- Location: LCCOMB_X60_Y42_N24
\NxState[3]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~18_combout\ = (State(4)) # ((State(0) & ((!State(1)))) # (!State(0) & ((StatusReg(0)) # (State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => StatusReg(0),
	datac => State(0),
	datad => State(1),
	combout => \NxState[3]~18_combout\);

-- Location: LCCOMB_X60_Y42_N26
\NxState[3]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~19_combout\ = (State(3) & ((\NxState[3]~18_combout\) # (State(1) $ (State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[3]~18_combout\,
	datab => State(1),
	datac => State(3),
	datad => State(2),
	combout => \NxState[3]~19_combout\);

-- Location: LCCOMB_X60_Y42_N8
\NxScsLine~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~12_combout\ = (!State(3) & (\Equal4~0_combout\ & (\NxState[1]~3_combout\ & State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal4~0_combout\,
	datac => \NxState[1]~3_combout\,
	datad => State(2),
	combout => \NxScsLine~12_combout\);

-- Location: LCCOMB_X60_Y42_N10
\NxState[3]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[3]~20_combout\ = (\SM_Handler~4_combout\ & ((\NxState[3]~19_combout\) # (\NxScsLine~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SM_Handler~4_combout\,
	datac => \NxState[3]~19_combout\,
	datad => \NxScsLine~12_combout\,
	combout => \NxState[3]~20_combout\);

-- Location: FF_X60_Y42_N11
\State[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(3));

-- Location: LCCOMB_X57_Y42_N4
\NxState[4]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[4]~26_combout\ = (State(3) & (!StatusReg(1) & (\Equal23~0_combout\ & State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => StatusReg(1),
	datac => \Equal23~0_combout\,
	datad => State(2),
	combout => \NxState[4]~26_combout\);

-- Location: LCCOMB_X57_Y42_N24
\NxState[4]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState[4]~27_combout\ = (\NxState[4]~26_combout\) # ((State(4) & ((!\Equal2~5_combout\) # (!\Equal23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[4]~26_combout\,
	datab => \Equal23~0_combout\,
	datac => State(4),
	datad => \Equal2~5_combout\,
	combout => \NxState[4]~27_combout\);

-- Location: FF_X57_Y42_N25
\State[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxState[4]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(4));

-- Location: LCCOMB_X59_Y42_N30
\NxTxBitCnt[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~2_combout\ = (!State(4) & State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datac => State(2),
	combout => \NxTxBitCnt[2]~2_combout\);

-- Location: LCCOMB_X59_Y42_N26
\NxTxBitCnt[2]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~8_combout\ = (\NxTxBitCnt[2]~2_combout\ & ((State(3) & ((!State(0)))) # (!State(3) & ((State(0)) # (!State(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~2_combout\,
	datab => State(1),
	datac => State(3),
	datad => State(0),
	combout => \NxTxBitCnt[2]~8_combout\);

-- Location: LCCOMB_X57_Y42_N8
\Equal21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~0_combout\ = (!State(3) & (State(4) & !State(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datad => State(2),
	combout => \Equal21~0_combout\);

-- Location: LCCOMB_X61_Y42_N6
\NxTxBitCnt[2]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~7_combout\ = (\NxTxBitCnt[2]~6_combout\ & ((State(1) & (!State(3) & !State(0))) # (!State(1) & ((State(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxTxBitCnt[2]~6_combout\,
	datac => State(1),
	datad => State(0),
	combout => \NxTxBitCnt[2]~7_combout\);

-- Location: LCCOMB_X57_Y42_N26
\NxTxBitCnt[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~9_combout\ = (\NxTxBitCnt[2]~8_combout\) # ((\NxTxBitCnt[2]~7_combout\) # ((\Equal21~0_combout\ & !\Equal23~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxBitCnt[2]~8_combout\,
	datab => \Equal21~0_combout\,
	datac => \Equal23~0_combout\,
	datad => \NxTxBitCnt[2]~7_combout\,
	combout => \NxTxBitCnt[2]~9_combout\);

-- Location: LCCOMB_X61_Y42_N8
\NxTxBitCnt[2]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~11_combout\ = (State(4) & (State(3))) # (!State(4) & (((State(0)) # (!State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datac => State(1),
	datad => State(0),
	combout => \NxTxBitCnt[2]~11_combout\);

-- Location: LCCOMB_X62_Y40_N2
\NxTxBitCnt[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[2]~12_combout\ = (!\NxTxBitCnt[2]~9_combout\ & ((\NxTxBitCnt[2]~11_combout\) # (State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxTxBitCnt[2]~9_combout\,
	datac => \NxTxBitCnt[2]~11_combout\,
	datad => State(2),
	combout => \NxTxBitCnt[2]~12_combout\);

-- Location: LCCOMB_X59_Y40_N22
\NxTxBitCnt[0]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitCnt[0]~14_combout\ = (TxBitCnt(0) & (\NxTxBitCnt[2]~12_combout\ & !\NxTxBitCnt[2]~10_combout\)) # (!TxBitCnt(0) & ((\NxTxBitCnt[2]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxTxBitCnt[2]~12_combout\,
	datac => TxBitCnt(0),
	datad => \NxTxBitCnt[2]~10_combout\,
	combout => \NxTxBitCnt[0]~14_combout\);

-- Location: FF_X59_Y40_N23
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

-- Location: LCCOMB_X59_Y42_N8
\Equal11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal11~0_combout\ = (!State(2) & (\Equal5~4_combout\ & State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~4_combout\,
	datac => State(3),
	combout => \Equal11~0_combout\);

-- Location: LCCOMB_X60_Y42_N28
\Equal16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~0_combout\ = (!State(4) & (State(3) & !State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(4),
	datac => State(3),
	datad => State(1),
	combout => \Equal16~0_combout\);

-- Location: LCCOMB_X59_Y42_N10
\NxSdoLine~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~22_combout\ = (State(2)) # (((\Equal11~0_combout\ & !StatusReg(0))) # (!\Equal16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal11~0_combout\,
	datac => StatusReg(0),
	datad => \Equal16~0_combout\,
	combout => \NxSdoLine~22_combout\);

-- Location: LCCOMB_X58_Y42_N22
\NxSdoLine~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~43_combout\ = (\TxByteCnt[3]~0_combout\ & (((TxBitCnt(1))))) # (!\TxByteCnt[3]~0_combout\ & (!\NxSdoLine~22_combout\ & (TxBitCnt(0) $ (TxBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => TxBitCnt(1),
	datac => \NxSdoLine~22_combout\,
	datad => \TxByteCnt[3]~0_combout\,
	combout => \NxSdoLine~43_combout\);

-- Location: LCCOMB_X60_Y42_N30
\Equal8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (!State(3) & (!State(1) & (State(0) & State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(1),
	datac => State(0),
	datad => State(2),
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X57_Y42_N22
\SM_Handler~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SM_Handler~6_combout\ = (!State(3) & (\Equal5~4_combout\ & (\SM_Handler~5_combout\ & !State(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal5~4_combout\,
	datac => \SM_Handler~5_combout\,
	datad => State(2),
	combout => \SM_Handler~6_combout\);

-- Location: LCCOMB_X58_Y42_N12
\NxSdoLine~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~23_combout\ = (!\TxByteCnt[3]~0_combout\ & ((\SM_Handler~6_combout\) # ((!State(4) & \Equal8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~0_combout\,
	datab => State(4),
	datac => \Equal8~0_combout\,
	datad => \SM_Handler~6_combout\,
	combout => \NxSdoLine~23_combout\);

-- Location: LCCOMB_X58_Y42_N6
\NxSdoLine~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~24_combout\ = (TxBitCnt(2) & ((\NxSdoLine~43_combout\) # ((TxBitCnt(0) & \NxSdoLine~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~43_combout\,
	datab => TxBitCnt(2),
	datac => TxBitCnt(0),
	datad => \NxSdoLine~23_combout\,
	combout => \NxSdoLine~24_combout\);

-- Location: LCCOMB_X60_Y42_N22
\Equal2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~6_combout\ = (!State(4) & (!State(1) & (State(0) & \Equal2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => State(1),
	datac => State(0),
	datad => \Equal2~5_combout\,
	combout => \Equal2~6_combout\);

-- Location: LCCOMB_X60_Y42_N16
\NxSdoLine~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~25_combout\ = (!TxBitCnt(2) & (!State(4) & (\Equal3~0_combout\ & \Equal2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(2),
	datab => State(4),
	datac => \Equal3~0_combout\,
	datad => \Equal2~5_combout\,
	combout => \NxSdoLine~25_combout\);

-- Location: LCCOMB_X58_Y42_N2
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = TxBitCnt(1) $ (TxBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X58_Y42_N24
\NxSdoLine~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~26_combout\ = (\SM_Handler~4_combout\ & (!\Equal2~6_combout\ & (\NxSdoLine~25_combout\ & \Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~4_combout\,
	datab => \Equal2~6_combout\,
	datac => \NxSdoLine~25_combout\,
	datad => \Mux4~0_combout\,
	combout => \NxSdoLine~26_combout\);

-- Location: LCCOMB_X58_Y42_N18
\NxSdoLine~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~27_combout\ = (\NxSdoLine~26_combout\) # ((!State(3) & (\SdoLine~q\ & \Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \NxSdoLine~26_combout\,
	datac => \SdoLine~q\,
	datad => \Equal4~0_combout\,
	combout => \NxSdoLine~27_combout\);

-- Location: LCCOMB_X61_Y42_N22
\NxSdoLine~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~44_combout\ = (State(3)) # ((State(4)) # ((!State(1) & !State(2))))

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
	combout => \NxSdoLine~44_combout\);

-- Location: LCCOMB_X58_Y42_N4
\NxSdoLine~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~41_combout\ = (!\TxByteCnt[3]~0_combout\ & (!\SM_Handler~6_combout\ & (\NxSdoLine~22_combout\ & \NxSdoLine~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxByteCnt[3]~0_combout\,
	datab => \SM_Handler~6_combout\,
	datac => \NxSdoLine~22_combout\,
	datad => \NxSdoLine~44_combout\,
	combout => \NxSdoLine~41_combout\);

-- Location: LCCOMB_X57_Y42_N12
\Equal19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~0_combout\ = (State(3) & (\Equal4~0_combout\ & State(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datac => \Equal4~0_combout\,
	datad => State(2),
	combout => \Equal19~0_combout\);

-- Location: LCCOMB_X57_Y42_N14
\NxState~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~2_combout\ = (!State(1) & !State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datac => State(0),
	combout => \NxState~2_combout\);

-- Location: LCCOMB_X57_Y42_N0
\NxSdoLine~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~30_combout\ = (\Equal19~0_combout\ & (((StatusReg(1))))) # (!\Equal19~0_combout\ & (((!\Equal21~0_combout\)) # (!\NxState~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~0_combout\,
	datab => \NxState~2_combout\,
	datac => StatusReg(1),
	datad => \Equal21~0_combout\,
	combout => \NxSdoLine~30_combout\);

-- Location: LCCOMB_X58_Y42_N28
\NxSdoLine~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~28_combout\ = (\Equal21~0_combout\ & (\Equal2~4_combout\ & (!TxBitCnt(2) & \Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~0_combout\,
	datab => \Equal2~4_combout\,
	datac => TxBitCnt(2),
	datad => \Mux4~0_combout\,
	combout => \NxSdoLine~28_combout\);

-- Location: LCCOMB_X58_Y41_N22
\NxSdoLine~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~13_combout\ = (State(2)) # ((!State(0) & !State(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => State(0),
	datac => State(1),
	combout => \NxSdoLine~13_combout\);

-- Location: LCCOMB_X58_Y41_N20
\NxSdoLine~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~45_combout\ = (\SdoLine~q\ & ((State(3)) # ((\NxSdoLine~13_combout\) # (!State(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => State(4),
	datac => \NxSdoLine~13_combout\,
	datad => \SdoLine~q\,
	combout => \NxSdoLine~45_combout\);

-- Location: LCCOMB_X57_Y42_N10
\NxSdoLine~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~29_combout\ = ((State(2)) # ((!\Equal5~4_combout\ & !\Equal4~0_combout\))) # (!State(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(3),
	datab => \Equal5~4_combout\,
	datac => \Equal4~0_combout\,
	datad => State(2),
	combout => \NxSdoLine~29_combout\);

-- Location: LCCOMB_X59_Y42_N12
\Equal15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal15~0_combout\ = (State(2) & (\Equal5~4_combout\ & State(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal5~4_combout\,
	datac => State(3),
	combout => \Equal15~0_combout\);

-- Location: LCCOMB_X59_Y42_N28
\Equal16~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~1_combout\ = (\Equal16~0_combout\ & (State(2) & State(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal16~0_combout\,
	datac => State(2),
	datad => State(0),
	combout => \Equal16~1_combout\);

-- Location: LCCOMB_X59_Y42_N2
\Equal13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal13~0_combout\ = (!State(4) & (State(3) & (!State(2) & \Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => State(3),
	datac => State(2),
	datad => \Equal3~0_combout\,
	combout => \Equal13~0_combout\);

-- Location: LCCOMB_X59_Y42_N22
\NxSdoLine~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~31_combout\ = (!\Equal15~0_combout\ & (!\Equal16~1_combout\ & (!\Equal17~0_combout\ & !\Equal13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~0_combout\,
	datab => \Equal16~1_combout\,
	datac => \Equal17~0_combout\,
	datad => \Equal13~0_combout\,
	combout => \NxSdoLine~31_combout\);

-- Location: LCCOMB_X58_Y42_N14
\NxSdoLine~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~32_combout\ = (\NxSdoLine~29_combout\ & (\NxSdoLine~30_combout\ & \NxSdoLine~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~29_combout\,
	datac => \NxSdoLine~30_combout\,
	datad => \NxSdoLine~31_combout\,
	combout => \NxSdoLine~32_combout\);

-- Location: LCCOMB_X58_Y44_N8
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

-- Location: LCCOMB_X59_Y40_N26
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

-- Location: LCCOMB_X60_Y40_N10
\IncrWrVal[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \IncrWrVal[6]~12_combout\ = (!\Clock_SCK~2_combout\) # (!\SWT[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SWT[0]~input_o\,
	datad => \Clock_SCK~2_combout\,
	combout => \IncrWrVal[6]~12_combout\);

-- Location: FF_X58_Y44_N9
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(0));

-- Location: LCCOMB_X58_Y44_N10
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

-- Location: FF_X58_Y44_N11
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(1));

-- Location: LCCOMB_X58_Y44_N12
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

-- Location: FF_X58_Y44_N13
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(2));

-- Location: LCCOMB_X58_Y44_N14
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

-- Location: FF_X58_Y44_N15
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(3));

-- Location: LCCOMB_X58_Y44_N16
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

-- Location: FF_X58_Y44_N17
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(4));

-- Location: LCCOMB_X58_Y44_N18
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

-- Location: FF_X58_Y44_N19
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(5));

-- Location: LCCOMB_X58_Y44_N2
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (TxBitCnt(0) & ((TxBitCnt(2) & ((IncrWrVal(0)))) # (!TxBitCnt(2) & (IncrWrVal(4))))) # (!TxBitCnt(0) & (((!TxBitCnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => IncrWrVal(4),
	datac => IncrWrVal(0),
	datad => TxBitCnt(2),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X58_Y44_N28
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

-- Location: LCCOMB_X58_Y44_N20
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

-- Location: FF_X58_Y44_N21
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(6));

-- Location: LCCOMB_X58_Y44_N22
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

-- Location: FF_X58_Y44_N23
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
	ena => \IncrWrVal[6]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => IncrWrVal(7));

-- Location: LCCOMB_X58_Y44_N6
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

-- Location: LCCOMB_X58_Y44_N24
\Mux5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (TxBitCnt(0) & (((\Mux5~2_combout\)))) # (!TxBitCnt(0) & ((\Mux5~2_combout\ & (IncrWrVal(7))) # (!\Mux5~2_combout\ & ((IncrWrVal(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IncrWrVal(7),
	datab => IncrWrVal(3),
	datac => TxBitCnt(0),
	datad => \Mux5~2_combout\,
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X58_Y44_N26
\NxSdoLine~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~34_combout\ = (TxBitCnt(1) & (\Mux5~1_combout\)) # (!TxBitCnt(1) & ((\Mux5~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux5~1_combout\,
	datac => TxBitCnt(1),
	datad => \Mux5~3_combout\,
	combout => \NxSdoLine~34_combout\);

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

-- Location: LCCOMB_X58_Y44_N0
\NxSdoLine~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~33_combout\ = (\SWT[1]~input_o\ & (TxBitCnt(1) $ (((!TxBitCnt(2)) # (!TxBitCnt(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => \SWT[1]~input_o\,
	datac => TxBitCnt(1),
	datad => TxBitCnt(2),
	combout => \NxSdoLine~33_combout\);

-- Location: LCCOMB_X58_Y44_N4
\NxSdoLine~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~35_combout\ = (\Equal22~0_combout\ & ((\NxSdoLine~33_combout\) # ((\NxSdoLine~34_combout\ & !\SWT[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~34_combout\,
	datab => \SWT[1]~input_o\,
	datac => \Equal22~0_combout\,
	datad => \NxSdoLine~33_combout\,
	combout => \NxSdoLine~35_combout\);

-- Location: LCCOMB_X58_Y42_N0
\NxSdoLine~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~36_combout\ = (\NxSdoLine~32_combout\ & ((\NxSdoLine~28_combout\) # ((\NxSdoLine~45_combout\) # (\NxSdoLine~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~28_combout\,
	datab => \NxSdoLine~45_combout\,
	datac => \NxSdoLine~32_combout\,
	datad => \NxSdoLine~35_combout\,
	combout => \NxSdoLine~36_combout\);

-- Location: LCCOMB_X59_Y42_N14
\Equal14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (!State(4) & (State(1) & (State(3) & State(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(4),
	datab => State(1),
	datac => State(3),
	datad => State(0),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X59_Y42_N24
\NxSdoLine~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~37_combout\ = (TxBitCnt(0) & TxBitCnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxSdoLine~37_combout\);

-- Location: LCCOMB_X59_Y42_N18
\NxSdoLine~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~38_combout\ = (\NxSdoLine~37_combout\ & ((\Equal15~0_combout\) # ((\Equal14~0_combout\ & !State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~0_combout\,
	datab => \Equal14~0_combout\,
	datac => State(2),
	datad => \NxSdoLine~37_combout\,
	combout => \NxSdoLine~38_combout\);

-- Location: LCCOMB_X59_Y42_N4
\NxSdoLine~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~39_combout\ = (\NxSdoLine~38_combout\) # ((\SdoLine~q\ & ((\Equal17~0_combout\) # (\Equal11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SdoLine~q\,
	datab => \Equal17~0_combout\,
	datac => \Equal11~0_combout\,
	datad => \NxSdoLine~38_combout\,
	combout => \NxSdoLine~39_combout\);

-- Location: LCCOMB_X58_Y42_N10
\NxSdoLine~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~40_combout\ = (\NxSdoLine~36_combout\) # ((\NxSdoLine~39_combout\) # ((!\NxSdoLine~30_combout\ & \Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~30_combout\,
	datab => \NxSdoLine~36_combout\,
	datac => \Mux3~0_combout\,
	datad => \NxSdoLine~39_combout\,
	combout => \NxSdoLine~40_combout\);

-- Location: LCCOMB_X58_Y42_N8
\NxSdoLine~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSdoLine~42_combout\ = (\NxSdoLine~24_combout\) # ((\NxSdoLine~27_combout\) # ((\NxSdoLine~41_combout\ & \NxSdoLine~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~24_combout\,
	datab => \NxSdoLine~27_combout\,
	datac => \NxSdoLine~41_combout\,
	datad => \NxSdoLine~40_combout\,
	combout => \NxSdoLine~42_combout\);

-- Location: FF_X58_Y42_N9
SdoLine : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxSdoLine~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SdoLine~q\);

-- Location: LCCOMB_X59_Y42_N6
\NxScsLine~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~3_combout\ = (State(2)) # (((\Equal11~0_combout\ & StatusReg(0))) # (!\Equal16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(2),
	datab => \Equal11~0_combout\,
	datac => StatusReg(0),
	datad => \Equal16~0_combout\,
	combout => \NxScsLine~3_combout\);

-- Location: LCCOMB_X56_Y42_N26
\NxScsLine~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~6_combout\ = (!\Equal2~6_combout\ & (\NxScsLine~3_combout\ & (!\SM_Handler~6_combout\ & \NxSdoLine~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~6_combout\,
	datab => \NxScsLine~3_combout\,
	datac => \SM_Handler~6_combout\,
	datad => \NxSdoLine~44_combout\,
	combout => \NxScsLine~6_combout\);

-- Location: LCCOMB_X56_Y42_N12
\NxScsLine~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~2_combout\ = (\Equal5~4_combout\ & (!\Equal6~0_combout\ & (\Equal5~5_combout\ & \NxState[1]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~4_combout\,
	datab => \Equal6~0_combout\,
	datac => \Equal5~5_combout\,
	datad => \NxState[1]~3_combout\,
	combout => \NxScsLine~2_combout\);

-- Location: LCCOMB_X56_Y42_N18
\NxScsLine~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~4_combout\ = (!\Equal2~6_combout\ & (\NxScsLine~3_combout\ & \NxSdoLine~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~6_combout\,
	datac => \NxScsLine~3_combout\,
	datad => \NxSdoLine~44_combout\,
	combout => \NxScsLine~4_combout\);

-- Location: LCCOMB_X56_Y42_N24
\NxScsLine~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~5_combout\ = (\NxScsLine~2_combout\) # ((\NxScsLine~12_combout\) # ((!\NxScsLine~4_combout\ & !\ScsLine~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~2_combout\,
	datab => \NxScsLine~4_combout\,
	datac => \NxScsLine~12_combout\,
	datad => \ScsLine~q\,
	combout => \NxScsLine~5_combout\);

-- Location: LCCOMB_X57_Y42_N18
\NxScsLine~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~8_combout\ = (\Equal19~0_combout\ & (!StatusReg(1))) # (!\Equal19~0_combout\ & (((\Equal23~0_combout\ & \Equal21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~0_combout\,
	datab => StatusReg(1),
	datac => \Equal23~0_combout\,
	datad => \Equal21~0_combout\,
	combout => \NxScsLine~8_combout\);

-- Location: LCCOMB_X56_Y42_N10
\NxSckEn~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~0_combout\ = (!\Equal13~0_combout\ & ((\Equal19~0_combout\) # (!\NxScsLine~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal19~0_combout\,
	datac => \Equal13~0_combout\,
	datad => \NxScsLine~8_combout\,
	combout => \NxSckEn~0_combout\);

-- Location: LCCOMB_X59_Y42_N0
\NxScsLine~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~7_combout\ = (\ScsLine~q\ & (\Equal17~0_combout\ & (\NxState[1]~3_combout\))) # (!\ScsLine~q\ & ((\Equal17~0_combout\) # ((\Equal16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ScsLine~q\,
	datab => \Equal17~0_combout\,
	datac => \NxState[1]~3_combout\,
	datad => \Equal16~1_combout\,
	combout => \NxScsLine~7_combout\);

-- Location: LCCOMB_X56_Y42_N20
\NxScsLine~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~9_combout\ = ((\NxScsLine~7_combout\) # ((!\ScsLine~q\ & \Equal15~0_combout\))) # (!\NxSckEn~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSckEn~0_combout\,
	datab => \ScsLine~q\,
	datac => \NxScsLine~7_combout\,
	datad => \Equal15~0_combout\,
	combout => \NxScsLine~9_combout\);

-- Location: LCCOMB_X56_Y42_N22
\NxScsLine~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~10_combout\ = (\NxScsLine~9_combout\) # ((!\ScsLine~q\ & (\NxSdoLine~29_combout\ & !\NxScsLine~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ScsLine~q\,
	datab => \NxScsLine~9_combout\,
	datac => \NxSdoLine~29_combout\,
	datad => \NxScsLine~8_combout\,
	combout => \NxScsLine~10_combout\);

-- Location: LCCOMB_X56_Y42_N0
\NxScsLine~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxScsLine~11_combout\ = ((!\NxScsLine~5_combout\ & ((!\NxScsLine~10_combout\) # (!\NxScsLine~6_combout\)))) # (!\SM_Handler~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~6_combout\,
	datab => \NxScsLine~5_combout\,
	datac => \NxScsLine~10_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \NxScsLine~11_combout\);

-- Location: FF_X56_Y42_N1
ScsLine : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_SckLine~clkctrl_outclk\,
	d => \NxScsLine~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ScsLine~q\);

-- Location: LCCOMB_X56_Y42_N2
\NxSckEn~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~4_combout\ = (!\NxScsLine~2_combout\ & (\SckEn~q\ & ((!\NxState[1]~3_combout\) # (!\Clock_SCK~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~2_combout\,
	datab => \SckEn~q\,
	datac => \Clock_SCK~3_combout\,
	datad => \NxState[1]~3_combout\,
	combout => \NxSckEn~4_combout\);

-- Location: LCCOMB_X56_Y42_N30
\NxSckEn~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~1_combout\ = (!\NxScsLine~12_combout\ & (\SckEn~q\ & ((\NxState~4_combout\) # (!\Equal5~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxScsLine~12_combout\,
	datab => \SckEn~q\,
	datac => \Equal5~6_combout\,
	datad => \NxState~4_combout\,
	combout => \NxSckEn~1_combout\);

-- Location: LCCOMB_X56_Y42_N14
\NxSckEn~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~2_combout\ = (\NxSdoLine~31_combout\ & ((\NxScsLine~8_combout\ & ((\Equal19~0_combout\))) # (!\NxScsLine~8_combout\ & (!\NxSdoLine~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSdoLine~31_combout\,
	datab => \NxSdoLine~29_combout\,
	datac => \Equal19~0_combout\,
	datad => \NxScsLine~8_combout\,
	combout => \NxSckEn~2_combout\);

-- Location: LCCOMB_X56_Y42_N4
\NxSckEn~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~3_combout\ = (\NxScsLine~4_combout\ & (((\NxSckEn~2_combout\) # (\SM_Handler~6_combout\)))) # (!\NxScsLine~4_combout\ & (\NxSckEn~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSckEn~1_combout\,
	datab => \NxSckEn~2_combout\,
	datac => \SM_Handler~6_combout\,
	datad => \NxScsLine~4_combout\,
	combout => \NxSckEn~3_combout\);

-- Location: LCCOMB_X56_Y42_N16
\NxSckEn~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxSckEn~5_combout\ = (\NxSckEn~3_combout\) # (((\NxSckEn~0_combout\ & \NxSckEn~4_combout\)) # (!\SM_Handler~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxSckEn~0_combout\,
	datab => \NxSckEn~4_combout\,
	datac => \NxSckEn~3_combout\,
	datad => \SM_Handler~4_combout\,
	combout => \NxSckEn~5_combout\);

-- Location: FF_X56_Y42_N17
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

-- Location: LCCOMB_X56_Y42_N8
\SCK~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SCK~0_combout\ = (\SckLine~q\ & \SckEn~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SckLine~q\,
	datad => \SckEn~q\,
	combout => \SCK~0_combout\);

-- Location: LCCOMB_X52_Y41_N16
\LedR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedR~0_combout\ = \SM_Handler~4_combout\ $ (!\LedR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SM_Handler~4_combout\,
	datac => \LedR~q\,
	combout => \LedR~0_combout\);

-- Location: FF_X52_Y41_N17
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

-- Location: LCCOMB_X58_Y42_N26
\LedW~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedW~0_combout\ = \LedW~q\ $ (((\SM_Handler~4_combout\ & (\SM_Handler~6_combout\ & !\Equal2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SM_Handler~4_combout\,
	datab => \SM_Handler~6_combout\,
	datac => \LedW~q\,
	datad => \Equal2~6_combout\,
	combout => \LedW~0_combout\);

-- Location: FF_X58_Y42_N27
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

-- Location: LCCOMB_X59_Y40_N30
\NxStatusReg~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~5_combout\ = (!TxBitCnt(1) & (TxBitCnt(0) & TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxStatusReg~5_combout\);

-- Location: LCCOMB_X60_Y40_N28
\NxStatusReg[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[2]~6_combout\ = (\NxStatusReg~0_combout\ & ((\NxStatusReg~5_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg~5_combout\ & (!StatusReg(2))))) # (!\NxStatusReg~0_combout\ & (!StatusReg(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(2),
	datab => \SDI~input_o\,
	datac => \NxStatusReg~0_combout\,
	datad => \NxStatusReg~5_combout\,
	combout => \NxStatusReg[2]~6_combout\);

-- Location: LCCOMB_X60_Y40_N20
\NxStatusReg[2]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[2]~7_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[2]~6_combout\,
	combout => \NxStatusReg[2]~7_combout\);

-- Location: FF_X60_Y40_N21
\StatusReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[2]~7_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(2));

-- Location: LCCOMB_X62_Y39_N16
\NxStatusReg~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~8_combout\ = (!TxBitCnt(0) & (TxBitCnt(2) & !TxBitCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(0),
	datac => TxBitCnt(2),
	datad => TxBitCnt(1),
	combout => \NxStatusReg~8_combout\);

-- Location: LCCOMB_X62_Y39_N26
\NxStatusReg[3]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[3]~9_combout\ = (\NxStatusReg~0_combout\ & ((\NxStatusReg~8_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg~8_combout\ & (!StatusReg(3))))) # (!\NxStatusReg~0_combout\ & (!StatusReg(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(3),
	datab => \SDI~input_o\,
	datac => \NxStatusReg~0_combout\,
	datad => \NxStatusReg~8_combout\,
	combout => \NxStatusReg[3]~9_combout\);

-- Location: LCCOMB_X60_Y40_N14
\NxStatusReg[3]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[3]~10_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[3]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Clock_SCK~3_combout\,
	datad => \NxStatusReg[3]~9_combout\,
	combout => \NxStatusReg[3]~10_combout\);

-- Location: FF_X60_Y40_N15
\StatusReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[3]~10_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(3));

-- Location: LCCOMB_X59_Y40_N16
\NxStatusReg~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~11_combout\ = (TxBitCnt(1) & (TxBitCnt(0) & !TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxStatusReg~11_combout\);

-- Location: LCCOMB_X64_Y44_N4
\NxStatusReg[4]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[4]~12_combout\ = (\NxStatusReg~11_combout\ & ((\NxStatusReg~0_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~0_combout\ & ((!StatusReg(4)))))) # (!\NxStatusReg~11_combout\ & (((!StatusReg(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~11_combout\,
	datac => \NxStatusReg~0_combout\,
	datad => StatusReg(4),
	combout => \NxStatusReg[4]~12_combout\);

-- Location: LCCOMB_X60_Y40_N24
\NxStatusReg[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[4]~13_combout\ = (\Clock_SCK~3_combout\ & !\NxStatusReg[4]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Clock_SCK~3_combout\,
	datac => \NxStatusReg[4]~12_combout\,
	combout => \NxStatusReg[4]~13_combout\);

-- Location: FF_X60_Y40_N25
\StatusReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[4]~13_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(4));

-- Location: LCCOMB_X62_Y39_N4
\NxStatusReg~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~14_combout\ = (!TxBitCnt(0) & (!TxBitCnt(2) & TxBitCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(0),
	datac => TxBitCnt(2),
	datad => TxBitCnt(1),
	combout => \NxStatusReg~14_combout\);

-- Location: LCCOMB_X62_Y39_N14
\NxStatusReg[5]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[5]~15_combout\ = (\NxStatusReg~0_combout\ & ((\NxStatusReg~14_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg~14_combout\ & (!StatusReg(5))))) # (!\NxStatusReg~0_combout\ & (((!StatusReg(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxStatusReg~0_combout\,
	datab => \NxStatusReg~14_combout\,
	datac => StatusReg(5),
	datad => \SDI~input_o\,
	combout => \NxStatusReg[5]~15_combout\);

-- Location: LCCOMB_X60_Y40_N26
\NxStatusReg[5]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[5]~16_combout\ = (!\NxStatusReg[5]~15_combout\ & \Clock_SCK~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxStatusReg[5]~15_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \NxStatusReg[5]~16_combout\);

-- Location: FF_X60_Y40_N27
\StatusReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[5]~16_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(5));

-- Location: LCCOMB_X59_Y40_N2
\NxStatusReg~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~17_combout\ = (!TxBitCnt(1) & (TxBitCnt(0) & !TxBitCnt(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datac => TxBitCnt(0),
	datad => TxBitCnt(2),
	combout => \NxStatusReg~17_combout\);

-- Location: LCCOMB_X62_Y39_N0
\NxStatusReg[6]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[6]~18_combout\ = (\NxStatusReg~0_combout\ & ((\NxStatusReg~17_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg~17_combout\ & (!StatusReg(6))))) # (!\NxStatusReg~0_combout\ & (!StatusReg(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(6),
	datab => \SDI~input_o\,
	datac => \NxStatusReg~0_combout\,
	datad => \NxStatusReg~17_combout\,
	combout => \NxStatusReg[6]~18_combout\);

-- Location: LCCOMB_X60_Y40_N4
\NxStatusReg[6]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[6]~19_combout\ = (!\NxStatusReg[6]~18_combout\ & \Clock_SCK~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxStatusReg[6]~18_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \NxStatusReg[6]~19_combout\);

-- Location: FF_X60_Y40_N5
\StatusReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[6]~19_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(6));

-- Location: LCCOMB_X62_Y39_N10
\NxStatusReg[7]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[7]~20_combout\ = (!TxBitCnt(0) & (!TxBitCnt(2) & !TxBitCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(0),
	datac => TxBitCnt(2),
	datad => TxBitCnt(1),
	combout => \NxStatusReg[7]~20_combout\);

-- Location: LCCOMB_X60_Y40_N22
\NxStatusReg[7]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[7]~21_combout\ = (\NxStatusReg~0_combout\ & ((\NxStatusReg[7]~20_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg[7]~20_combout\ & (!StatusReg(7))))) # (!\NxStatusReg~0_combout\ & (!StatusReg(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => StatusReg(7),
	datab => \SDI~input_o\,
	datac => \NxStatusReg~0_combout\,
	datad => \NxStatusReg[7]~20_combout\,
	combout => \NxStatusReg[7]~21_combout\);

-- Location: LCCOMB_X60_Y40_N30
\NxStatusReg[7]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg[7]~22_combout\ = (!\NxStatusReg[7]~21_combout\ & \Clock_SCK~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxStatusReg[7]~21_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \NxStatusReg[7]~22_combout\);

-- Location: FF_X60_Y40_N31
\StatusReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxStatusReg[7]~22_combout\,
	ena => \StatusReg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => StatusReg(7));

-- Location: LCCOMB_X61_Y46_N30
\NxRxBuf[2][1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][1]~0_combout\ = (\Equal6~0_combout\ & (((!\RxBuf[2][1]~q\)))) # (!\Equal6~0_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!\RxBuf[2][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \SDI~input_o\,
	datac => \Mux3~0_combout\,
	datad => \RxBuf[2][1]~q\,
	combout => \NxRxBuf[2][1]~0_combout\);

-- Location: LCCOMB_X61_Y45_N0
\NxRxBuf[2][1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][1]~1_combout\ = (!\NxRxBuf[2][1]~0_combout\ & \Equal5~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \NxRxBuf[2][1]~0_combout\,
	datad => \Equal5~6_combout\,
	combout => \NxRxBuf[2][1]~1_combout\);

-- Location: LCCOMB_X60_Y40_N16
\RxBuf~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf~0_combout\ = (\Equal5~6_combout\) # ((!\SWT[0]~input_o\ & !\Clock_SCK~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[0]~input_o\,
	datab => \Equal5~6_combout\,
	datac => \Clock_SCK~3_combout\,
	combout => \RxBuf~0_combout\);

-- Location: FF_X61_Y45_N1
\RxBuf[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][1]~1_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][1]~q\);

-- Location: LCCOMB_X61_Y46_N20
\NxRxBuf[2][0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][0]~7_combout\ = (\Equal5~6_combout\ & ((\NxState~4_combout\ & ((\RxBuf[2][0]~q\))) # (!\NxState~4_combout\ & (!\SDI~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datab => \SDI~input_o\,
	datac => \RxBuf[2][0]~q\,
	datad => \NxState~4_combout\,
	combout => \NxRxBuf[2][0]~7_combout\);

-- Location: FF_X61_Y46_N21
\RxBuf[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][0]~7_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][0]~q\);

-- Location: LCCOMB_X61_Y46_N22
\NxRxBuf[2][2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][2]~5_combout\ = (\Equal6~0_combout\ & (((!\RxBuf[2][2]~q\)))) # (!\Equal6~0_combout\ & ((\NxStatusReg~5_combout\ & ((\SDI~input_o\))) # (!\NxStatusReg~5_combout\ & (!\RxBuf[2][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \NxStatusReg~5_combout\,
	datac => \RxBuf[2][2]~q\,
	datad => \SDI~input_o\,
	combout => \NxRxBuf[2][2]~5_combout\);

-- Location: LCCOMB_X61_Y46_N26
\NxRxBuf[2][2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][2]~6_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[2][2]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datac => \NxRxBuf[2][2]~5_combout\,
	combout => \NxRxBuf[2][2]~6_combout\);

-- Location: FF_X61_Y46_N27
\RxBuf[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][2]~6_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][2]~q\);

-- Location: LCCOMB_X61_Y46_N16
\NxStatusReg~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~23_combout\ = (!TxBitCnt(1) & TxBitCnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitCnt(1),
	datad => TxBitCnt(2),
	combout => \NxStatusReg~23_combout\);

-- Location: LCCOMB_X61_Y46_N18
\NxRxBuf[2][3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][3]~2_combout\ = (!\RxBuf[2][3]~q\ & ((\Equal6~0_combout\) # ((TxBitCnt(0)) # (!\NxStatusReg~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \NxStatusReg~23_combout\,
	datac => TxBitCnt(0),
	datad => \RxBuf[2][3]~q\,
	combout => \NxRxBuf[2][3]~2_combout\);

-- Location: LCCOMB_X61_Y46_N4
\NxRxBuf~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf~3_combout\ = (!\Equal6~0_combout\ & (!TxBitCnt(0) & \SDI~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datac => TxBitCnt(0),
	datad => \SDI~input_o\,
	combout => \NxRxBuf~3_combout\);

-- Location: LCCOMB_X61_Y46_N24
\NxRxBuf[2][3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][3]~4_combout\ = (\Equal5~6_combout\ & (!\NxRxBuf[2][3]~2_combout\ & ((!\NxStatusReg~23_combout\) # (!\NxRxBuf~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datab => \NxRxBuf[2][3]~2_combout\,
	datac => \NxRxBuf~3_combout\,
	datad => \NxStatusReg~23_combout\,
	combout => \NxRxBuf[2][3]~4_combout\);

-- Location: FF_X61_Y46_N25
\RxBuf[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][3]~4_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][3]~q\);

-- Location: LCCOMB_X61_Y46_N14
\SEG0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~0_combout\ = (\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\ & (\RxBuf[2][1]~q\ $ (!\RxBuf[2][3]~q\)))) # (!\RxBuf[2][2]~q\ & (\RxBuf[2][1]~q\ & (\RxBuf[2][0]~q\ $ (!\RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~0_combout\);

-- Location: LCCOMB_X61_Y46_N0
\SEG0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~1_combout\ = (\RxBuf[2][1]~q\ & (!\RxBuf[2][2]~q\ & (\RxBuf[2][0]~q\ $ (\RxBuf[2][3]~q\)))) # (!\RxBuf[2][1]~q\ & ((\RxBuf[2][0]~q\ & (!\RxBuf[2][2]~q\)) # (!\RxBuf[2][0]~q\ & ((!\RxBuf[2][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~1_combout\);

-- Location: LCCOMB_X61_Y46_N2
\SEG0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~2_combout\ = (\RxBuf[2][2]~q\ & (!\RxBuf[2][1]~q\ & (\RxBuf[2][0]~q\ & \RxBuf[2][3]~q\))) # (!\RxBuf[2][2]~q\ & (!\RxBuf[2][3]~q\ & ((\RxBuf[2][0]~q\) # (!\RxBuf[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~2_combout\);

-- Location: LCCOMB_X61_Y46_N12
\SEG0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~3_combout\ = (\RxBuf[2][1]~q\ & (\RxBuf[2][3]~q\ & (\RxBuf[2][0]~q\ $ (\RxBuf[2][2]~q\)))) # (!\RxBuf[2][1]~q\ & ((\RxBuf[2][0]~q\ & (\RxBuf[2][2]~q\ & !\RxBuf[2][3]~q\)) # (!\RxBuf[2][0]~q\ & (!\RxBuf[2][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~3_combout\);

-- Location: LCCOMB_X61_Y46_N6
\SEG0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~4_combout\ = (\RxBuf[2][1]~q\ & ((\RxBuf[2][2]~q\ & (!\RxBuf[2][0]~q\)) # (!\RxBuf[2][2]~q\ & ((\RxBuf[2][3]~q\))))) # (!\RxBuf[2][1]~q\ & (!\RxBuf[2][0]~q\ & ((\RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~4_combout\);

-- Location: LCCOMB_X61_Y46_N8
\SEG0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~5_combout\ = (\RxBuf[2][1]~q\ & (!\RxBuf[2][0]~q\ & (\RxBuf[2][2]~q\ $ (!\RxBuf[2][3]~q\)))) # (!\RxBuf[2][1]~q\ & (\RxBuf[2][3]~q\ & ((\RxBuf[2][2]~q\) # (!\RxBuf[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~5_combout\);

-- Location: LCCOMB_X61_Y46_N10
\SEG0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG0~6_combout\ = (\RxBuf[2][0]~q\ & ((\RxBuf[2][2]~q\ $ (\RxBuf[2][3]~q\)) # (!\RxBuf[2][1]~q\))) # (!\RxBuf[2][0]~q\ & ((\RxBuf[2][1]~q\ $ (\RxBuf[2][2]~q\)) # (!\RxBuf[2][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[2][0]~q\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][3]~q\,
	combout => \SEG0~6_combout\);

-- Location: LCCOMB_X64_Y44_N8
\NxRxBuf[2][6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][6]~12_combout\ = (\NxStatusReg~17_combout\ & ((\Equal6~0_combout\ & ((!\RxBuf[2][6]~q\))) # (!\Equal6~0_combout\ & (\SDI~input_o\)))) # (!\NxStatusReg~17_combout\ & (((!\RxBuf[2][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~17_combout\,
	datac => \Equal6~0_combout\,
	datad => \RxBuf[2][6]~q\,
	combout => \NxRxBuf[2][6]~12_combout\);

-- Location: LCCOMB_X64_Y44_N10
\NxRxBuf[2][6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][6]~13_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[2][6]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datac => \NxRxBuf[2][6]~12_combout\,
	combout => \NxRxBuf[2][6]~13_combout\);

-- Location: FF_X64_Y44_N11
\RxBuf[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][6]~13_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][6]~q\);

-- Location: LCCOMB_X64_Y44_N2
\NxRxBuf[2][4]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][4]~14_combout\ = (\NxStatusReg~11_combout\ & ((\Equal6~0_combout\ & ((!\RxBuf[2][4]~q\))) # (!\Equal6~0_combout\ & (\SDI~input_o\)))) # (!\NxStatusReg~11_combout\ & (((!\RxBuf[2][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \NxStatusReg~11_combout\,
	datac => \Equal6~0_combout\,
	datad => \RxBuf[2][4]~q\,
	combout => \NxRxBuf[2][4]~14_combout\);

-- Location: LCCOMB_X64_Y44_N28
\NxRxBuf[2][4]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][4]~15_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[2][4]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datad => \NxRxBuf[2][4]~14_combout\,
	combout => \NxRxBuf[2][4]~15_combout\);

-- Location: FF_X64_Y44_N29
\RxBuf[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][4]~15_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][4]~q\);

-- Location: LCCOMB_X66_Y38_N22
\NxRxBuf[2][7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][7]~10_combout\ = (\Equal6~0_combout\ & (((!\RxBuf[2][7]~q\)))) # (!\Equal6~0_combout\ & ((\NxStatusReg[7]~20_combout\ & (\SDI~input_o\)) # (!\NxStatusReg[7]~20_combout\ & ((!\RxBuf[2][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxStatusReg[7]~20_combout\,
	datad => \RxBuf[2][7]~q\,
	combout => \NxRxBuf[2][7]~10_combout\);

-- Location: LCCOMB_X66_Y38_N8
\NxRxBuf[2][7]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][7]~11_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[2][7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datac => \NxRxBuf[2][7]~10_combout\,
	combout => \NxRxBuf[2][7]~11_combout\);

-- Location: FF_X66_Y38_N9
\RxBuf[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][7]~11_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][7]~q\);

-- Location: LCCOMB_X62_Y39_N28
\NxStatusReg~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxStatusReg~24_combout\ = (!TxBitCnt(2) & TxBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => TxBitCnt(2),
	datad => TxBitCnt(1),
	combout => \NxStatusReg~24_combout\);

-- Location: LCCOMB_X64_Y44_N30
\NxRxBuf[2][5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][5]~8_combout\ = (!\RxBuf[2][5]~q\ & ((TxBitCnt(0)) # ((\Equal6~0_combout\) # (!\NxStatusReg~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitCnt(0),
	datab => \NxStatusReg~24_combout\,
	datac => \Equal6~0_combout\,
	datad => \RxBuf[2][5]~q\,
	combout => \NxRxBuf[2][5]~8_combout\);

-- Location: LCCOMB_X64_Y44_N24
\NxRxBuf[2][5]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[2][5]~9_combout\ = (!\NxRxBuf[2][5]~8_combout\ & (\Equal5~6_combout\ & ((!\NxStatusReg~24_combout\) # (!\NxRxBuf~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf[2][5]~8_combout\,
	datab => \Equal5~6_combout\,
	datac => \NxRxBuf~3_combout\,
	datad => \NxStatusReg~24_combout\,
	combout => \NxRxBuf[2][5]~9_combout\);

-- Location: FF_X64_Y44_N25
\RxBuf[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[2][5]~9_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][5]~q\);

-- Location: LCCOMB_X64_Y44_N6
\SEG1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~0_combout\ = (\RxBuf[2][6]~q\ & (!\RxBuf[2][4]~q\ & (\RxBuf[2][7]~q\ $ (!\RxBuf[2][5]~q\)))) # (!\RxBuf[2][6]~q\ & (\RxBuf[2][5]~q\ & (\RxBuf[2][4]~q\ $ (!\RxBuf[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~0_combout\);

-- Location: LCCOMB_X64_Y44_N0
\SEG1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~1_combout\ = (\RxBuf[2][7]~q\ & (!\RxBuf[2][6]~q\ & (\RxBuf[2][4]~q\ $ (\RxBuf[2][5]~q\)))) # (!\RxBuf[2][7]~q\ & ((\RxBuf[2][4]~q\ & (!\RxBuf[2][6]~q\)) # (!\RxBuf[2][4]~q\ & ((!\RxBuf[2][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~1_combout\);

-- Location: LCCOMB_X64_Y44_N26
\SEG1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~2_combout\ = (\RxBuf[2][6]~q\ & (\RxBuf[2][4]~q\ & (\RxBuf[2][7]~q\ & !\RxBuf[2][5]~q\))) # (!\RxBuf[2][6]~q\ & (!\RxBuf[2][7]~q\ & ((\RxBuf[2][4]~q\) # (!\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~2_combout\);

-- Location: LCCOMB_X64_Y44_N12
\SEG1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~3_combout\ = (\RxBuf[2][5]~q\ & (\RxBuf[2][7]~q\ & (\RxBuf[2][6]~q\ $ (\RxBuf[2][4]~q\)))) # (!\RxBuf[2][5]~q\ & ((\RxBuf[2][6]~q\ & (\RxBuf[2][4]~q\ & !\RxBuf[2][7]~q\)) # (!\RxBuf[2][6]~q\ & (!\RxBuf[2][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~3_combout\);

-- Location: LCCOMB_X64_Y44_N14
\SEG1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~4_combout\ = (\RxBuf[2][5]~q\ & ((\RxBuf[2][6]~q\ & (!\RxBuf[2][4]~q\)) # (!\RxBuf[2][6]~q\ & ((\RxBuf[2][7]~q\))))) # (!\RxBuf[2][5]~q\ & (((!\RxBuf[2][4]~q\ & \RxBuf[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~4_combout\);

-- Location: LCCOMB_X64_Y44_N16
\SEG1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~5_combout\ = (\RxBuf[2][6]~q\ & (\RxBuf[2][7]~q\ & ((!\RxBuf[2][5]~q\) # (!\RxBuf[2][4]~q\)))) # (!\RxBuf[2][6]~q\ & (!\RxBuf[2][4]~q\ & (\RxBuf[2][7]~q\ $ (\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~5_combout\);

-- Location: LCCOMB_X64_Y44_N18
\SEG1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG1~6_combout\ = (\RxBuf[2][4]~q\ & ((\RxBuf[2][6]~q\ $ (\RxBuf[2][7]~q\)) # (!\RxBuf[2][5]~q\))) # (!\RxBuf[2][4]~q\ & ((\RxBuf[2][6]~q\ $ (\RxBuf[2][5]~q\)) # (!\RxBuf[2][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][6]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][7]~q\,
	datad => \RxBuf[2][5]~q\,
	combout => \SEG1~6_combout\);

-- Location: LCCOMB_X58_Y41_N12
\Decoder0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (!TxByteCnt(2) & (!TxByteCnt(1) & (TxByteCnt(0) & !TxByteCnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(1),
	datac => TxByteCnt(0),
	datad => TxByteCnt(3),
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X63_Y42_N24
\NxRxBuf[1][0]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][0]~22_combout\ = (\Decoder0~0_combout\ & ((\NxState[1]~3_combout\ & (\SDI~input_o\)) # (!\NxState[1]~3_combout\ & ((!\RxBuf[1][0]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxState[1]~3_combout\,
	datad => \RxBuf[1][0]~q\,
	combout => \NxRxBuf[1][0]~22_combout\);

-- Location: LCCOMB_X63_Y42_N20
\NxRxBuf[1][0]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][0]~23_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][0]~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datad => \NxRxBuf[1][0]~22_combout\,
	combout => \NxRxBuf[1][0]~23_combout\);

-- Location: FF_X63_Y42_N21
\RxBuf[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][0]~23_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][0]~q\);

-- Location: LCCOMB_X62_Y39_N22
\NxRxBuf[1][3]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][3]~18_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg~8_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~8_combout\ & ((!\RxBuf[1][3]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \NxStatusReg~8_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[1][3]~q\,
	combout => \NxRxBuf[1][3]~18_combout\);

-- Location: LCCOMB_X62_Y39_N24
\NxRxBuf[1][3]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][3]~19_combout\ = (!\NxRxBuf[1][3]~18_combout\ & \Equal5~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxBuf[1][3]~18_combout\,
	datac => \Equal5~6_combout\,
	combout => \NxRxBuf[1][3]~19_combout\);

-- Location: FF_X62_Y39_N25
\RxBuf[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][3]~19_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][3]~q\);

-- Location: LCCOMB_X63_Y42_N12
\NxRxBuf[1][1]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][1]~16_combout\ = (\Decoder0~0_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!\RxBuf[1][1]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \Mux3~0_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[1][1]~q\,
	combout => \NxRxBuf[1][1]~16_combout\);

-- Location: LCCOMB_X63_Y42_N0
\NxRxBuf[1][1]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][1]~17_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][1]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datad => \NxRxBuf[1][1]~16_combout\,
	combout => \NxRxBuf[1][1]~17_combout\);

-- Location: FF_X63_Y42_N1
\RxBuf[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][1]~17_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][1]~q\);

-- Location: LCCOMB_X63_Y42_N14
\NxRxBuf[1][2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][2]~20_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg~5_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~5_combout\ & ((!\RxBuf[1][2]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxStatusReg~5_combout\,
	datad => \RxBuf[1][2]~q\,
	combout => \NxRxBuf[1][2]~20_combout\);

-- Location: LCCOMB_X63_Y42_N2
\NxRxBuf[1][2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][2]~21_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][2]~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datac => \NxRxBuf[1][2]~20_combout\,
	combout => \NxRxBuf[1][2]~21_combout\);

-- Location: FF_X63_Y42_N3
\RxBuf[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][2]~21_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][2]~q\);

-- Location: LCCOMB_X67_Y43_N0
\SEG2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~0_combout\ = (\RxBuf[1][3]~q\ & (\RxBuf[1][1]~q\ & (\RxBuf[1][0]~q\ $ (\RxBuf[1][2]~q\)))) # (!\RxBuf[1][3]~q\ & (!\RxBuf[1][0]~q\ & (\RxBuf[1][1]~q\ $ (\RxBuf[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~0_combout\);

-- Location: LCCOMB_X67_Y43_N18
\SEG2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~1_combout\ = (\RxBuf[1][3]~q\ & (!\RxBuf[1][2]~q\ & (\RxBuf[1][0]~q\ $ (\RxBuf[1][1]~q\)))) # (!\RxBuf[1][3]~q\ & ((\RxBuf[1][0]~q\ & ((!\RxBuf[1][2]~q\))) # (!\RxBuf[1][0]~q\ & (!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~1_combout\);

-- Location: LCCOMB_X67_Y43_N12
\SEG2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~2_combout\ = (\RxBuf[1][3]~q\ & (\RxBuf[1][0]~q\ & (!\RxBuf[1][1]~q\ & \RxBuf[1][2]~q\))) # (!\RxBuf[1][3]~q\ & (!\RxBuf[1][2]~q\ & ((\RxBuf[1][0]~q\) # (!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~2_combout\);

-- Location: LCCOMB_X67_Y43_N22
\SEG2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~3_combout\ = (\RxBuf[1][1]~q\ & (\RxBuf[1][3]~q\ & (\RxBuf[1][0]~q\ $ (\RxBuf[1][2]~q\)))) # (!\RxBuf[1][1]~q\ & ((\RxBuf[1][0]~q\ & (!\RxBuf[1][3]~q\ & \RxBuf[1][2]~q\)) # (!\RxBuf[1][0]~q\ & ((!\RxBuf[1][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~3_combout\);

-- Location: LCCOMB_X67_Y43_N24
\SEG2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~4_combout\ = (\RxBuf[1][1]~q\ & ((\RxBuf[1][2]~q\ & (!\RxBuf[1][0]~q\)) # (!\RxBuf[1][2]~q\ & ((\RxBuf[1][3]~q\))))) # (!\RxBuf[1][1]~q\ & (!\RxBuf[1][0]~q\ & (\RxBuf[1][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~4_combout\);

-- Location: LCCOMB_X67_Y43_N2
\SEG2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~5_combout\ = (\RxBuf[1][0]~q\ & (\RxBuf[1][3]~q\ & (!\RxBuf[1][1]~q\ & \RxBuf[1][2]~q\))) # (!\RxBuf[1][0]~q\ & (\RxBuf[1][3]~q\ $ (((\RxBuf[1][1]~q\ & !\RxBuf[1][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~5_combout\);

-- Location: LCCOMB_X67_Y43_N20
\SEG2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG2~6_combout\ = (\RxBuf[1][0]~q\ & ((\RxBuf[1][3]~q\ $ (\RxBuf[1][2]~q\)) # (!\RxBuf[1][1]~q\))) # (!\RxBuf[1][0]~q\ & ((\RxBuf[1][1]~q\ $ (\RxBuf[1][2]~q\)) # (!\RxBuf[1][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][0]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][2]~q\,
	combout => \SEG2~6_combout\);

-- Location: LCCOMB_X62_Y39_N8
\NxRxBuf[1][5]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][5]~24_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg~14_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~14_combout\ & ((!\RxBuf[1][5]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \NxStatusReg~14_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[1][5]~q\,
	combout => \NxRxBuf[1][5]~24_combout\);

-- Location: LCCOMB_X62_Y39_N2
\NxRxBuf[1][5]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][5]~25_combout\ = (!\NxRxBuf[1][5]~24_combout\ & \Equal5~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxRxBuf[1][5]~24_combout\,
	datac => \Equal5~6_combout\,
	combout => \NxRxBuf[1][5]~25_combout\);

-- Location: FF_X62_Y39_N3
\RxBuf[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][5]~25_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][5]~q\);

-- Location: LCCOMB_X63_Y42_N28
\NxRxBuf[1][6]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][6]~28_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg~17_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~17_combout\ & ((!\RxBuf[1][6]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \RxBuf[1][6]~q\,
	datad => \NxStatusReg~17_combout\,
	combout => \NxRxBuf[1][6]~28_combout\);

-- Location: LCCOMB_X63_Y42_N8
\NxRxBuf[1][6]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][6]~29_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][6]~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datad => \NxRxBuf[1][6]~28_combout\,
	combout => \NxRxBuf[1][6]~29_combout\);

-- Location: FF_X63_Y42_N9
\RxBuf[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][6]~29_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][6]~q\);

-- Location: LCCOMB_X63_Y42_N22
\NxRxBuf[1][4]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][4]~30_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg~11_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~11_combout\ & ((!\RxBuf[1][4]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \NxStatusReg~11_combout\,
	datad => \RxBuf[1][4]~q\,
	combout => \NxRxBuf[1][4]~30_combout\);

-- Location: LCCOMB_X63_Y42_N26
\NxRxBuf[1][4]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][4]~31_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][4]~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datac => \NxRxBuf[1][4]~30_combout\,
	combout => \NxRxBuf[1][4]~31_combout\);

-- Location: FF_X63_Y42_N27
\RxBuf[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][4]~31_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][4]~q\);

-- Location: LCCOMB_X63_Y42_N10
\NxRxBuf[1][7]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][7]~26_combout\ = (\Decoder0~0_combout\ & ((\NxStatusReg[7]~20_combout\ & (\SDI~input_o\)) # (!\NxStatusReg[7]~20_combout\ & ((!\RxBuf[1][7]~q\))))) # (!\Decoder0~0_combout\ & (((!\RxBuf[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \SDI~input_o\,
	datac => \RxBuf[1][7]~q\,
	datad => \NxStatusReg[7]~20_combout\,
	combout => \NxRxBuf[1][7]~26_combout\);

-- Location: LCCOMB_X63_Y42_N30
\NxRxBuf[1][7]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[1][7]~27_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[1][7]~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~6_combout\,
	datad => \NxRxBuf[1][7]~26_combout\,
	combout => \NxRxBuf[1][7]~27_combout\);

-- Location: FF_X63_Y42_N31
\RxBuf[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[1][7]~27_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][7]~q\);

-- Location: LCCOMB_X70_Y39_N24
\SEG3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~0_combout\ = (\RxBuf[1][6]~q\ & (!\RxBuf[1][4]~q\ & (\RxBuf[1][5]~q\ $ (!\RxBuf[1][7]~q\)))) # (!\RxBuf[1][6]~q\ & (\RxBuf[1][5]~q\ & (\RxBuf[1][4]~q\ $ (!\RxBuf[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~0_combout\);

-- Location: LCCOMB_X70_Y39_N2
\SEG3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~1_combout\ = (\RxBuf[1][5]~q\ & (!\RxBuf[1][6]~q\ & (\RxBuf[1][4]~q\ $ (\RxBuf[1][7]~q\)))) # (!\RxBuf[1][5]~q\ & ((\RxBuf[1][4]~q\ & (!\RxBuf[1][6]~q\)) # (!\RxBuf[1][4]~q\ & ((!\RxBuf[1][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~1_combout\);

-- Location: LCCOMB_X70_Y39_N12
\SEG3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~2_combout\ = (\RxBuf[1][6]~q\ & (!\RxBuf[1][5]~q\ & (\RxBuf[1][4]~q\ & \RxBuf[1][7]~q\))) # (!\RxBuf[1][6]~q\ & (!\RxBuf[1][7]~q\ & ((\RxBuf[1][4]~q\) # (!\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~2_combout\);

-- Location: LCCOMB_X70_Y39_N6
\SEG3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~3_combout\ = (\RxBuf[1][5]~q\ & (\RxBuf[1][7]~q\ & (\RxBuf[1][6]~q\ $ (\RxBuf[1][4]~q\)))) # (!\RxBuf[1][5]~q\ & ((\RxBuf[1][6]~q\ & (\RxBuf[1][4]~q\ & !\RxBuf[1][7]~q\)) # (!\RxBuf[1][6]~q\ & (!\RxBuf[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~3_combout\);

-- Location: LCCOMB_X70_Y39_N8
\SEG3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~4_combout\ = (\RxBuf[1][5]~q\ & ((\RxBuf[1][6]~q\ & (!\RxBuf[1][4]~q\)) # (!\RxBuf[1][6]~q\ & ((\RxBuf[1][7]~q\))))) # (!\RxBuf[1][5]~q\ & (((!\RxBuf[1][4]~q\ & \RxBuf[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~4_combout\);

-- Location: LCCOMB_X70_Y39_N26
\SEG3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~5_combout\ = (\RxBuf[1][5]~q\ & (!\RxBuf[1][4]~q\ & (\RxBuf[1][6]~q\ $ (!\RxBuf[1][7]~q\)))) # (!\RxBuf[1][5]~q\ & (\RxBuf[1][7]~q\ & ((\RxBuf[1][6]~q\) # (!\RxBuf[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~5_combout\);

-- Location: LCCOMB_X70_Y39_N4
\SEG3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG3~6_combout\ = (\RxBuf[1][4]~q\ & ((\RxBuf[1][6]~q\ $ (\RxBuf[1][7]~q\)) # (!\RxBuf[1][5]~q\))) # (!\RxBuf[1][4]~q\ & ((\RxBuf[1][5]~q\ $ (\RxBuf[1][6]~q\)) # (!\RxBuf[1][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011011011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][5]~q\,
	datab => \RxBuf[1][6]~q\,
	datac => \RxBuf[1][4]~q\,
	datad => \RxBuf[1][7]~q\,
	combout => \SEG3~6_combout\);

-- Location: LCCOMB_X58_Y41_N14
\Decoder0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (!TxByteCnt(2) & (!TxByteCnt(1) & (!TxByteCnt(0) & !TxByteCnt(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxByteCnt(2),
	datab => TxByteCnt(1),
	datac => TxByteCnt(0),
	datad => TxByteCnt(3),
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X67_Y39_N10
\NxRxBuf[0][0]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][0]~38_combout\ = (\NxState[1]~3_combout\ & ((\Decoder0~1_combout\ & (\SDI~input_o\)) # (!\Decoder0~1_combout\ & ((!\RxBuf[0][0]~q\))))) # (!\NxState[1]~3_combout\ & (((!\RxBuf[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxState[1]~3_combout\,
	datab => \Decoder0~1_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[0][0]~q\,
	combout => \NxRxBuf[0][0]~38_combout\);

-- Location: LCCOMB_X67_Y39_N12
\NxRxBuf[0][0]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][0]~39_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][0]~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datad => \NxRxBuf[0][0]~38_combout\,
	combout => \NxRxBuf[0][0]~39_combout\);

-- Location: FF_X67_Y39_N13
\RxBuf[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][0]~39_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][0]~q\);

-- Location: LCCOMB_X67_Y39_N30
\NxRxBuf[0][1]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][1]~32_combout\ = (\Decoder0~1_combout\ & ((\Mux3~0_combout\ & (\SDI~input_o\)) # (!\Mux3~0_combout\ & ((!\RxBuf[0][1]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \Mux3~0_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[0][1]~q\,
	combout => \NxRxBuf[0][1]~32_combout\);

-- Location: LCCOMB_X67_Y39_N16
\NxRxBuf[0][1]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][1]~33_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][1]~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datac => \NxRxBuf[0][1]~32_combout\,
	combout => \NxRxBuf[0][1]~33_combout\);

-- Location: FF_X67_Y39_N17
\RxBuf[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][1]~33_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][1]~q\);

-- Location: LCCOMB_X62_Y39_N18
\NxRxBuf[0][3]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][3]~34_combout\ = (\Decoder0~1_combout\ & ((\NxStatusReg~8_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~8_combout\ & ((!\RxBuf[0][3]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \NxStatusReg~8_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[0][3]~q\,
	combout => \NxRxBuf[0][3]~34_combout\);

-- Location: LCCOMB_X62_Y39_N20
\NxRxBuf[0][3]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][3]~35_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][3]~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal5~6_combout\,
	datad => \NxRxBuf[0][3]~34_combout\,
	combout => \NxRxBuf[0][3]~35_combout\);

-- Location: FF_X62_Y39_N21
\RxBuf[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][3]~35_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][3]~q\);

-- Location: LCCOMB_X67_Y39_N8
\NxRxBuf[0][2]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][2]~36_combout\ = (\Decoder0~1_combout\ & ((\NxStatusReg~5_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~5_combout\ & ((!\RxBuf[0][2]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SDI~input_o\,
	datab => \Decoder0~1_combout\,
	datac => \NxStatusReg~5_combout\,
	datad => \RxBuf[0][2]~q\,
	combout => \NxRxBuf[0][2]~36_combout\);

-- Location: LCCOMB_X67_Y39_N18
\NxRxBuf[0][2]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][2]~37_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][2]~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datac => \NxRxBuf[0][2]~36_combout\,
	combout => \NxRxBuf[0][2]~37_combout\);

-- Location: FF_X67_Y39_N19
\RxBuf[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][2]~37_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][2]~q\);

-- Location: LCCOMB_X67_Y39_N6
\SEG4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~0_combout\ = (\RxBuf[0][3]~q\ & (\RxBuf[0][1]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][2]~q\)))) # (!\RxBuf[0][3]~q\ & (!\RxBuf[0][0]~q\ & (\RxBuf[0][1]~q\ $ (\RxBuf[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~0_combout\);

-- Location: LCCOMB_X67_Y39_N0
\SEG4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~1_combout\ = (\RxBuf[0][1]~q\ & (!\RxBuf[0][2]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][3]~q\)))) # (!\RxBuf[0][1]~q\ & ((\RxBuf[0][0]~q\ & ((!\RxBuf[0][2]~q\))) # (!\RxBuf[0][0]~q\ & (!\RxBuf[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~1_combout\);

-- Location: LCCOMB_X67_Y39_N2
\SEG4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~2_combout\ = (\RxBuf[0][3]~q\ & (\RxBuf[0][0]~q\ & (!\RxBuf[0][1]~q\ & \RxBuf[0][2]~q\))) # (!\RxBuf[0][3]~q\ & (!\RxBuf[0][2]~q\ & ((\RxBuf[0][0]~q\) # (!\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~2_combout\);

-- Location: LCCOMB_X67_Y39_N20
\SEG4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~3_combout\ = (\RxBuf[0][1]~q\ & (\RxBuf[0][3]~q\ & (\RxBuf[0][0]~q\ $ (\RxBuf[0][2]~q\)))) # (!\RxBuf[0][1]~q\ & ((\RxBuf[0][0]~q\ & (!\RxBuf[0][3]~q\ & \RxBuf[0][2]~q\)) # (!\RxBuf[0][0]~q\ & ((!\RxBuf[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~3_combout\);

-- Location: LCCOMB_X67_Y39_N22
\SEG4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~4_combout\ = (\RxBuf[0][1]~q\ & ((\RxBuf[0][2]~q\ & (!\RxBuf[0][0]~q\)) # (!\RxBuf[0][2]~q\ & ((\RxBuf[0][3]~q\))))) # (!\RxBuf[0][1]~q\ & (!\RxBuf[0][0]~q\ & (\RxBuf[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~4_combout\);

-- Location: LCCOMB_X67_Y39_N24
\SEG4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~5_combout\ = (\RxBuf[0][0]~q\ & (!\RxBuf[0][1]~q\ & (\RxBuf[0][3]~q\ & \RxBuf[0][2]~q\))) # (!\RxBuf[0][0]~q\ & (\RxBuf[0][3]~q\ $ (((\RxBuf[0][1]~q\ & !\RxBuf[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~5_combout\);

-- Location: LCCOMB_X67_Y39_N26
\SEG4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG4~6_combout\ = (\RxBuf[0][0]~q\ & ((\RxBuf[0][3]~q\ $ (\RxBuf[0][2]~q\)) # (!\RxBuf[0][1]~q\))) # (!\RxBuf[0][0]~q\ & ((\RxBuf[0][1]~q\ $ (\RxBuf[0][2]~q\)) # (!\RxBuf[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \SEG4~6_combout\);

-- Location: LCCOMB_X66_Y38_N24
\NxRxBuf[0][7]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][7]~42_combout\ = (\NxStatusReg[7]~20_combout\ & ((\Decoder0~1_combout\ & (\SDI~input_o\)) # (!\Decoder0~1_combout\ & ((!\RxBuf[0][7]~q\))))) # (!\NxStatusReg[7]~20_combout\ & (((!\RxBuf[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxStatusReg[7]~20_combout\,
	datab => \SDI~input_o\,
	datac => \RxBuf[0][7]~q\,
	datad => \Decoder0~1_combout\,
	combout => \NxRxBuf[0][7]~42_combout\);

-- Location: LCCOMB_X66_Y38_N26
\NxRxBuf[0][7]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][7]~43_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][7]~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datad => \NxRxBuf[0][7]~42_combout\,
	combout => \NxRxBuf[0][7]~43_combout\);

-- Location: FF_X66_Y38_N27
\RxBuf[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][7]~43_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][7]~q\);

-- Location: LCCOMB_X66_Y38_N18
\NxRxBuf[0][6]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][6]~44_combout\ = (\Decoder0~1_combout\ & ((\NxStatusReg~17_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~17_combout\ & ((!\RxBuf[0][6]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \NxStatusReg~17_combout\,
	datac => \SDI~input_o\,
	datad => \RxBuf[0][6]~q\,
	combout => \NxRxBuf[0][6]~44_combout\);

-- Location: LCCOMB_X66_Y38_N28
\NxRxBuf[0][6]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][6]~45_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][6]~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datad => \NxRxBuf[0][6]~44_combout\,
	combout => \NxRxBuf[0][6]~45_combout\);

-- Location: FF_X66_Y38_N29
\RxBuf[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][6]~45_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][6]~q\);

-- Location: LCCOMB_X66_Y38_N12
\NxRxBuf[0][4]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][4]~46_combout\ = (\Decoder0~1_combout\ & ((\NxStatusReg~11_combout\ & (\SDI~input_o\)) # (!\NxStatusReg~11_combout\ & ((!\RxBuf[0][4]~q\))))) # (!\Decoder0~1_combout\ & (((!\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \SDI~input_o\,
	datac => \RxBuf[0][4]~q\,
	datad => \NxStatusReg~11_combout\,
	combout => \NxRxBuf[0][4]~46_combout\);

-- Location: LCCOMB_X66_Y38_N30
\NxRxBuf[0][4]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][4]~47_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][4]~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~6_combout\,
	datad => \NxRxBuf[0][4]~46_combout\,
	combout => \NxRxBuf[0][4]~47_combout\);

-- Location: FF_X66_Y38_N31
\RxBuf[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][4]~47_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][4]~q\);

-- Location: LCCOMB_X62_Y39_N12
\NxRxBuf[0][5]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][5]~40_combout\ = (\NxStatusReg~14_combout\ & ((\Decoder0~1_combout\ & ((\SDI~input_o\))) # (!\Decoder0~1_combout\ & (!\RxBuf[0][5]~q\)))) # (!\NxStatusReg~14_combout\ & (!\RxBuf[0][5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][5]~q\,
	datab => \SDI~input_o\,
	datac => \NxStatusReg~14_combout\,
	datad => \Decoder0~1_combout\,
	combout => \NxRxBuf[0][5]~40_combout\);

-- Location: LCCOMB_X62_Y39_N6
\NxRxBuf[0][5]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxBuf[0][5]~41_combout\ = (\Equal5~6_combout\ & !\NxRxBuf[0][5]~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal5~6_combout\,
	datad => \NxRxBuf[0][5]~40_combout\,
	combout => \NxRxBuf[0][5]~41_combout\);

-- Location: FF_X62_Y39_N7
\RxBuf[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SckLine~clkctrl_outclk\,
	d => \NxRxBuf[0][5]~41_combout\,
	ena => \RxBuf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][5]~q\);

-- Location: LCCOMB_X66_Y38_N16
\SEG5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~0_combout\ = (\RxBuf[0][7]~q\ & (\RxBuf[0][5]~q\ & (\RxBuf[0][6]~q\ $ (\RxBuf[0][4]~q\)))) # (!\RxBuf[0][7]~q\ & (!\RxBuf[0][4]~q\ & (\RxBuf[0][6]~q\ $ (\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~0_combout\);

-- Location: LCCOMB_X66_Y38_N10
\SEG5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~1_combout\ = (\RxBuf[0][7]~q\ & (!\RxBuf[0][6]~q\ & (\RxBuf[0][4]~q\ $ (\RxBuf[0][5]~q\)))) # (!\RxBuf[0][7]~q\ & ((\RxBuf[0][4]~q\ & (!\RxBuf[0][6]~q\)) # (!\RxBuf[0][4]~q\ & ((!\RxBuf[0][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~1_combout\);

-- Location: LCCOMB_X66_Y38_N20
\SEG5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~2_combout\ = (\RxBuf[0][7]~q\ & (\RxBuf[0][6]~q\ & (\RxBuf[0][4]~q\ & !\RxBuf[0][5]~q\))) # (!\RxBuf[0][7]~q\ & (!\RxBuf[0][6]~q\ & ((\RxBuf[0][4]~q\) # (!\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~2_combout\);

-- Location: LCCOMB_X66_Y38_N14
\SEG5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~3_combout\ = (\RxBuf[0][5]~q\ & (\RxBuf[0][7]~q\ & (\RxBuf[0][6]~q\ $ (\RxBuf[0][4]~q\)))) # (!\RxBuf[0][5]~q\ & ((\RxBuf[0][6]~q\ & (!\RxBuf[0][7]~q\ & \RxBuf[0][4]~q\)) # (!\RxBuf[0][6]~q\ & ((!\RxBuf[0][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~3_combout\);

-- Location: LCCOMB_X66_Y38_N0
\SEG5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~4_combout\ = (\RxBuf[0][5]~q\ & ((\RxBuf[0][6]~q\ & ((!\RxBuf[0][4]~q\))) # (!\RxBuf[0][6]~q\ & (\RxBuf[0][7]~q\)))) # (!\RxBuf[0][5]~q\ & (\RxBuf[0][7]~q\ & ((!\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~4_combout\);

-- Location: LCCOMB_X66_Y38_N2
\SEG5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~5_combout\ = (\RxBuf[0][6]~q\ & (\RxBuf[0][7]~q\ & ((!\RxBuf[0][5]~q\) # (!\RxBuf[0][4]~q\)))) # (!\RxBuf[0][6]~q\ & (!\RxBuf[0][4]~q\ & (\RxBuf[0][7]~q\ $ (\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \SEG5~5_combout\);

-- Location: LCCOMB_X66_Y38_N4
\SEG5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG5~6_combout\ = (\RxBuf[0][4]~q\ & ((\RxBuf[0][7]~q\ $ (\RxBuf[0][6]~q\)) # (!\RxBuf[0][5]~q\))) # (!\RxBuf[0][4]~q\ & ((\RxBuf[0][6]~q\ $ (\RxBuf[0][5]~q\)) # (!\RxBuf[0][7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][7]~q\,
	datab => \RxBuf[0][6]~q\,
	datac => \RxBuf[0][4]~q\,
	datad => \RxBuf[0][5]~q\,
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



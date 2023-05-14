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

-- DATE "04/13/2020 17:51:09"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
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

ENTITY 	UART_RTX IS
    PORT (
	CLK : IN std_logic;
	RXL : IN std_logic;
	BTN : IN std_logic_vector(1 DOWNTO 0);
	SWT : IN std_logic;
	LED : BUFFER std_logic_vector(9 DOWNTO 0);
	TXL : BUFFER std_logic
	);
END UART_RTX;

-- Design Ports Information
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
-- TXL	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RXL	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UART_RTX IS
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
SIGNAL ww_RXL : std_logic;
SIGNAL ww_BTN : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SWT : std_logic;
SIGNAL ww_LED : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_TXL : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ClkTxUART~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \LED[8]~output_o\ : std_logic;
SIGNAL \LED[9]~output_o\ : std_logic;
SIGNAL \LED[0]~output_o\ : std_logic;
SIGNAL \LED[1]~output_o\ : std_logic;
SIGNAL \LED[2]~output_o\ : std_logic;
SIGNAL \LED[3]~output_o\ : std_logic;
SIGNAL \LED[4]~output_o\ : std_logic;
SIGNAL \LED[5]~output_o\ : std_logic;
SIGNAL \LED[6]~output_o\ : std_logic;
SIGNAL \LED[7]~output_o\ : std_logic;
SIGNAL \TXL~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \NxCntRxUART[1]~3_combout\ : std_logic;
SIGNAL \NxCntRxUART[2]~0_combout\ : std_logic;
SIGNAL \NxCntRxUART[2]~1_combout\ : std_logic;
SIGNAL \Equal7~0_combout\ : std_logic;
SIGNAL \CntRxUART[0]~0_combout\ : std_logic;
SIGNAL \CntRxUART[0]~1_combout\ : std_logic;
SIGNAL \NxCntRxUART[0]~2_combout\ : std_logic;
SIGNAL \Equal12~0_combout\ : std_logic;
SIGNAL \RXL~input_o\ : std_logic;
SIGNAL \RxSt~0_combout\ : std_logic;
SIGNAL \RxSt~1_combout\ : std_logic;
SIGNAL \BTN[1]~input_o\ : std_logic;
SIGNAL \RxSt~2_combout\ : std_logic;
SIGNAL \RxSt~3_combout\ : std_logic;
SIGNAL \RxParBit~0_combout\ : std_logic;
SIGNAL \RxParBit~1_combout\ : std_logic;
SIGNAL \RxParBit~2_combout\ : std_logic;
SIGNAL \RxParBit~q\ : std_logic;
SIGNAL \RxSt~4_combout\ : std_logic;
SIGNAL \RxFrIdx~2_combout\ : std_logic;
SIGNAL \RxFrIdx~8_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~4_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~5_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~6_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~7_combout\ : std_logic;
SIGNAL \RxFrIdx~3_combout\ : std_logic;
SIGNAL \Equal13~0_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~1_combout\ : std_logic;
SIGNAL \RxSt~5_combout\ : std_logic;
SIGNAL \RxFrIdx[0]~0_combout\ : std_logic;
SIGNAL \RxSt~10_combout\ : std_logic;
SIGNAL \RxSt~6_combout\ : std_logic;
SIGNAL \RxBitIdx~0_combout\ : std_logic;
SIGNAL \RxBitIdx~4_combout\ : std_logic;
SIGNAL \RxBitIdx~3_combout\ : std_logic;
SIGNAL \RxBitIdx~1_combout\ : std_logic;
SIGNAL \RxBitIdx~2_combout\ : std_logic;
SIGNAL \RxSt~7_combout\ : std_logic;
SIGNAL \RxSt~8_combout\ : std_logic;
SIGNAL \RxSt~9_combout\ : std_logic;
SIGNAL \RxSt~11_combout\ : std_logic;
SIGNAL \UpLeds~0_combout\ : std_logic;
SIGNAL \NxRxParBit~0_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~2_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~28_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~29_combout\ : std_logic;
SIGNAL \RxBuf[2][1]~q\ : std_logic;
SIGNAL \RxBuf[0][1]~3_combout\ : std_logic;
SIGNAL \RxBuf[0][1]~4_combout\ : std_logic;
SIGNAL \RxBuf[0][1]~q\ : std_logic;
SIGNAL \RxBuf[2][0]~0_combout\ : std_logic;
SIGNAL \RxBuf[2][0]~30_combout\ : std_logic;
SIGNAL \RxBuf[2][0]~q\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \RxBuf[0][0]~1_combout\ : std_logic;
SIGNAL \RxBuf[0][0]~q\ : std_logic;
SIGNAL \UpLeds~7_combout\ : std_logic;
SIGNAL \RxBuf[2][7]~15_combout\ : std_logic;
SIGNAL \RxBuf[2][7]~26_combout\ : std_logic;
SIGNAL \RxBuf[2][7]~q\ : std_logic;
SIGNAL \RxBuf[0][7]~16_combout\ : std_logic;
SIGNAL \RxBuf[0][7]~q\ : std_logic;
SIGNAL \RxBuf[2][6]~13_combout\ : std_logic;
SIGNAL \RxBuf[0][6]~14_combout\ : std_logic;
SIGNAL \RxBuf[0][6]~q\ : std_logic;
SIGNAL \RxBuf[2][6]~27_combout\ : std_logic;
SIGNAL \RxBuf[2][6]~q\ : std_logic;
SIGNAL \UpLeds~6_combout\ : std_logic;
SIGNAL \RxBuf[2][5]~11_combout\ : std_logic;
SIGNAL \RxBuf[0][5]~12_combout\ : std_logic;
SIGNAL \RxBuf[0][5]~q\ : std_logic;
SIGNAL \RxBuf[2][4]~9_combout\ : std_logic;
SIGNAL \RxBuf[2][4]~34_combout\ : std_logic;
SIGNAL \RxBuf[2][4]~q\ : std_logic;
SIGNAL \RxBuf[2][5]~33_combout\ : std_logic;
SIGNAL \RxBuf[2][5]~q\ : std_logic;
SIGNAL \RxBuf[0][4]~10_combout\ : std_logic;
SIGNAL \RxBuf[0][4]~q\ : std_logic;
SIGNAL \UpLeds~9_combout\ : std_logic;
SIGNAL \UpLeds~10_combout\ : std_logic;
SIGNAL \RxBuf[2][3]~7_combout\ : std_logic;
SIGNAL \RxBuf[2][3]~31_combout\ : std_logic;
SIGNAL \RxBuf[2][3]~q\ : std_logic;
SIGNAL \RxBuf[2][2]~5_combout\ : std_logic;
SIGNAL \RxBuf[0][2]~6_combout\ : std_logic;
SIGNAL \RxBuf[0][2]~q\ : std_logic;
SIGNAL \RxBuf[0][3]~8_combout\ : std_logic;
SIGNAL \RxBuf[0][3]~q\ : std_logic;
SIGNAL \RxBuf[2][2]~32_combout\ : std_logic;
SIGNAL \RxBuf[2][2]~q\ : std_logic;
SIGNAL \UpLeds~8_combout\ : std_logic;
SIGNAL \UpLeds~11_combout\ : std_logic;
SIGNAL \RxBuf[1][1]~17_combout\ : std_logic;
SIGNAL \RxBuf[1][1]~18_combout\ : std_logic;
SIGNAL \RxBuf[1][1]~q\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \RxBuf[1][0]~19_combout\ : std_logic;
SIGNAL \RxBuf[1][0]~q\ : std_logic;
SIGNAL \UpLeds~1_combout\ : std_logic;
SIGNAL \RxBuf[1][4]~23_combout\ : std_logic;
SIGNAL \RxBuf[1][4]~q\ : std_logic;
SIGNAL \RxBuf[1][5]~22_combout\ : std_logic;
SIGNAL \RxBuf[1][5]~q\ : std_logic;
SIGNAL \UpLeds~3_combout\ : std_logic;
SIGNAL \RxBuf[1][6]~25_combout\ : std_logic;
SIGNAL \RxBuf[1][6]~q\ : std_logic;
SIGNAL \RxBuf[1][7]~24_combout\ : std_logic;
SIGNAL \RxBuf[1][7]~q\ : std_logic;
SIGNAL \UpLeds~4_combout\ : std_logic;
SIGNAL \RxBuf[1][3]~20_combout\ : std_logic;
SIGNAL \RxBuf[1][3]~q\ : std_logic;
SIGNAL \RxBuf[1][2]~21_combout\ : std_logic;
SIGNAL \RxBuf[1][2]~q\ : std_logic;
SIGNAL \UpLeds~2_combout\ : std_logic;
SIGNAL \UpLeds~5_combout\ : std_logic;
SIGNAL \UpLeds~12_combout\ : std_logic;
SIGNAL \UpLeds~q\ : std_logic;
SIGNAL \LED~1_combout\ : std_logic;
SIGNAL \LED~2_combout\ : std_logic;
SIGNAL \LED~3_combout\ : std_logic;
SIGNAL \LED~4_combout\ : std_logic;
SIGNAL \LED~5_combout\ : std_logic;
SIGNAL \LED~6_combout\ : std_logic;
SIGNAL \LED~7_combout\ : std_logic;
SIGNAL \LED~8_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \NxCntTxUART[1]~5_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \NxCntTxUART[3]~4_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \NxCntTxUART[4]~3_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \NxCntTxUART[5]~2_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \NxCntTxUART[6]~1_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \NxCntTxUART[7]~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \ClkTxUART~0_combout\ : std_logic;
SIGNAL \ClkTxUART~q\ : std_logic;
SIGNAL \ClkTxUART~clkctrl_outclk\ : std_logic;
SIGNAL \BTN[0]~input_o\ : std_logic;
SIGNAL \Pushed~0_combout\ : std_logic;
SIGNAL \Pushed~q\ : std_logic;
SIGNAL \TxOvBitIdx[0]~6_combout\ : std_logic;
SIGNAL \TxOvBitIdx[4]~15\ : std_logic;
SIGNAL \TxOvBitIdx[5]~16_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Message_Handler~0_combout\ : std_logic;
SIGNAL \TxOvBitIdx[0]~7\ : std_logic;
SIGNAL \TxOvBitIdx[1]~8_combout\ : std_logic;
SIGNAL \TxOvBitIdx[1]~9\ : std_logic;
SIGNAL \TxOvBitIdx[2]~10_combout\ : std_logic;
SIGNAL \TxOvBitIdx[2]~11\ : std_logic;
SIGNAL \TxOvBitIdx[3]~12_combout\ : std_logic;
SIGNAL \TxOvBitIdx[3]~13\ : std_logic;
SIGNAL \TxOvBitIdx[4]~14_combout\ : std_logic;
SIGNAL \Reset_Handler~0_combout\ : std_logic;
SIGNAL \Reset_Handler~1_combout\ : std_logic;
SIGNAL \Reset_Handler~2_combout\ : std_logic;
SIGNAL \ResetTx~q\ : std_logic;
SIGNAL \NxTxBitIdx[0]~1_combout\ : std_logic;
SIGNAL \TxBitIdx[0]~0_combout\ : std_logic;
SIGNAL \NxTxBitIdx[1]~0_combout\ : std_logic;
SIGNAL \NxTxBitIdx[2]~3_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \NxTxBitIdx[3]~2_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \SWT~input_o\ : std_logic;
SIGNAL \TxLine~0_combout\ : std_logic;
SIGNAL \NxTxFrIdx[0]~1_combout\ : std_logic;
SIGNAL \NxTxFrIdx[1]~0_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \TxLine~1_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \NxTxParBit~1_combout\ : std_logic;
SIGNAL \NxTxParBit~0_combout\ : std_logic;
SIGNAL \NxTxParBit~2_combout\ : std_logic;
SIGNAL \TxParBit~q\ : std_logic;
SIGNAL \TxLine~2_combout\ : std_logic;
SIGNAL \TxLine~3_combout\ : std_logic;
SIGNAL TxOvBitIdx : std_logic_vector(5 DOWNTO 0);
SIGNAL TxBitIdx : std_logic_vector(3 DOWNTO 0);
SIGNAL TxFrIdx : std_logic_vector(1 DOWNTO 0);
SIGNAL CntTxUART : std_logic_vector(7 DOWNTO 0);
SIGNAL RxSt : std_logic_vector(2 DOWNTO 0);
SIGNAL RxFrIdx : std_logic_vector(1 DOWNTO 0);
SIGNAL CntRxUART : std_logic_vector(2 DOWNTO 0);
SIGNAL RxBitIdx : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_TxLine~3_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLK <= CLK;
ww_RXL <= RXL;
ww_BTN <= BTN;
ww_SWT <= SWT;
LED <= ww_LED;
TXL <= ww_TXL;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\ClkTxUART~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ClkTxUART~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_TxLine~3_combout\ <= NOT \TxLine~3_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N16
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

-- Location: IOOBUF_X51_Y54_N9
\LED[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \LED[8]~output_o\);

-- Location: IOOBUF_X49_Y54_N9
\LED[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \LED[9]~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\LED[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LED~1_combout\,
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
	i => \LED~2_combout\,
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
	i => \LED~3_combout\,
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
	i => \LED~4_combout\,
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
	i => \LED~5_combout\,
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
	i => \LED~6_combout\,
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
	i => \LED~7_combout\,
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
	i => \LED~8_combout\,
	devoe => ww_devoe,
	o => \LED[7]~output_o\);

-- Location: IOOBUF_X24_Y0_N30
\TXL~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_TxLine~3_combout\,
	devoe => ww_devoe,
	o => \TXL~output_o\);

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

-- Location: LCCOMB_X42_Y35_N30
\NxCntRxUART[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntRxUART[1]~3_combout\ = (\CntRxUART[0]~1_combout\ & (CntRxUART(0) $ (CntRxUART(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CntRxUART(0),
	datac => CntRxUART(1),
	datad => \CntRxUART[0]~1_combout\,
	combout => \NxCntRxUART[1]~3_combout\);

-- Location: FF_X42_Y35_N31
\CntRxUART[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntRxUART[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntRxUART(1));

-- Location: LCCOMB_X42_Y35_N22
\NxCntRxUART[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntRxUART[2]~0_combout\ = (RxSt(2) & (!\Equal12~0_combout\ & (!RxSt(0) & !RxSt(1)))) # (!RxSt(2) & ((RxSt(1) & (!\Equal12~0_combout\)) # (!RxSt(1) & ((RxSt(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(2),
	datab => \Equal12~0_combout\,
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \NxCntRxUART[2]~0_combout\);

-- Location: LCCOMB_X42_Y35_N10
\NxCntRxUART[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntRxUART[2]~1_combout\ = (\NxCntRxUART[2]~0_combout\ & (CntRxUART(2) $ (((CntRxUART(0) & CntRxUART(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxCntRxUART[2]~0_combout\,
	datab => CntRxUART(0),
	datac => CntRxUART(2),
	datad => CntRxUART(1),
	combout => \NxCntRxUART[2]~1_combout\);

-- Location: FF_X42_Y35_N11
\CntRxUART[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntRxUART[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntRxUART(2));

-- Location: LCCOMB_X42_Y35_N16
\Equal7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal7~0_combout\ = (CntRxUART(0)) # ((CntRxUART(2)) # (!CntRxUART(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CntRxUART(0),
	datac => CntRxUART(1),
	datad => CntRxUART(2),
	combout => \Equal7~0_combout\);

-- Location: LCCOMB_X42_Y35_N18
\CntRxUART[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CntRxUART[0]~0_combout\ = (RxSt(0) & ((RxSt(2)) # (\Equal7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(2),
	datac => RxSt(0),
	datad => \Equal7~0_combout\,
	combout => \CntRxUART[0]~0_combout\);

-- Location: LCCOMB_X42_Y35_N12
\CntRxUART[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CntRxUART[0]~1_combout\ = (RxSt(2) & (!\Equal12~0_combout\ & (!\CntRxUART[0]~0_combout\ & !RxSt(1)))) # (!RxSt(2) & ((RxSt(1) & (!\Equal12~0_combout\)) # (!RxSt(1) & ((\CntRxUART[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(2),
	datab => \Equal12~0_combout\,
	datac => \CntRxUART[0]~0_combout\,
	datad => RxSt(1),
	combout => \CntRxUART[0]~1_combout\);

-- Location: LCCOMB_X42_Y35_N28
\NxCntRxUART[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntRxUART[0]~2_combout\ = (!CntRxUART(0) & \CntRxUART[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => CntRxUART(0),
	datad => \CntRxUART[0]~1_combout\,
	combout => \NxCntRxUART[0]~2_combout\);

-- Location: FF_X42_Y35_N29
\CntRxUART[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntRxUART[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntRxUART(0));

-- Location: LCCOMB_X42_Y35_N0
\Equal12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal12~0_combout\ = (CntRxUART(0) & (!CntRxUART(1) & CntRxUART(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CntRxUART(0),
	datac => CntRxUART(1),
	datad => CntRxUART(2),
	combout => \Equal12~0_combout\);

-- Location: IOIBUF_X24_Y0_N1
\RXL~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RXL,
	o => \RXL~input_o\);

-- Location: LCCOMB_X42_Y35_N2
\RxSt~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~0_combout\ = (CntRxUART(1) & (!CntRxUART(0) & (!\RXL~input_o\ & !CntRxUART(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntRxUART(1),
	datab => CntRxUART(0),
	datac => \RXL~input_o\,
	datad => CntRxUART(2),
	combout => \RxSt~0_combout\);

-- Location: LCCOMB_X42_Y35_N20
\RxSt~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~1_combout\ = (RxSt(0) & ((RxSt(1) & (!\Equal12~0_combout\)) # (!RxSt(1) & ((\RxSt~0_combout\))))) # (!RxSt(0) & (((RxSt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal12~0_combout\,
	datab => \RxSt~0_combout\,
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \RxSt~1_combout\);

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

-- Location: LCCOMB_X42_Y35_N24
\RxSt~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~2_combout\ = (!RxSt(2) & (\RxSt~1_combout\ & \BTN[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(2),
	datab => \RxSt~1_combout\,
	datad => \BTN[1]~input_o\,
	combout => \RxSt~2_combout\);

-- Location: FF_X42_Y35_N25
\RxSt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxSt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxSt(1));

-- Location: LCCOMB_X38_Y35_N26
\RxSt~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~3_combout\ = (!RxSt(2) & (RxSt(0) & RxSt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxSt(2),
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \RxSt~3_combout\);

-- Location: LCCOMB_X38_Y35_N18
\RxParBit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxParBit~0_combout\ = (RxSt(2) & (RxSt(0))) # (!RxSt(2) & (!RxSt(0) & \RXL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxSt(2),
	datac => RxSt(0),
	datad => \RXL~input_o\,
	combout => \RxParBit~0_combout\);

-- Location: LCCOMB_X38_Y35_N4
\RxParBit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxParBit~1_combout\ = (\BTN[1]~input_o\ & ((RxSt(2) & (!\RxParBit~0_combout\ & !RxSt(1))) # (!RxSt(2) & ((RxSt(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => RxSt(2),
	datac => \RxParBit~0_combout\,
	datad => RxSt(1),
	combout => \RxParBit~1_combout\);

-- Location: LCCOMB_X38_Y35_N12
\RxParBit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxParBit~2_combout\ = (\RxParBit~1_combout\ & (\RxParBit~q\ $ (((\Equal12~0_combout\ & \RxParBit~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxParBit~1_combout\,
	datab => \Equal12~0_combout\,
	datac => \RxParBit~q\,
	datad => \RxParBit~0_combout\,
	combout => \RxParBit~2_combout\);

-- Location: FF_X38_Y35_N13
RxParBit : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxParBit~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxParBit~q\);

-- Location: LCCOMB_X38_Y35_N6
\RxSt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~4_combout\ = (\RxSt~3_combout\ & (\Equal12~0_combout\ & (\RXL~input_o\ $ (!\RxParBit~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~3_combout\,
	datab => \Equal12~0_combout\,
	datac => \RXL~input_o\,
	datad => \RxParBit~q\,
	combout => \RxSt~4_combout\);

-- Location: LCCOMB_X38_Y35_N2
\RxFrIdx~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx~2_combout\ = (\RXL~input_o\ & (RxSt(2) & (!RxSt(0) & !RxSt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => RxSt(2),
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \RxFrIdx~2_combout\);

-- Location: LCCOMB_X38_Y35_N20
\RxFrIdx~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx~8_combout\ = (\RxFrIdx~2_combout\ & (!RxFrIdx(0) & \BTN[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RxFrIdx~2_combout\,
	datac => RxFrIdx(0),
	datad => \BTN[1]~input_o\,
	combout => \RxFrIdx~8_combout\);

-- Location: LCCOMB_X42_Y35_N26
\RxFrIdx[0]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~4_combout\ = ((CntRxUART(0)) # ((CntRxUART(2)) # (!\RXL~input_o\))) # (!CntRxUART(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntRxUART(1),
	datab => CntRxUART(0),
	datac => \RXL~input_o\,
	datad => CntRxUART(2),
	combout => \RxFrIdx[0]~4_combout\);

-- Location: LCCOMB_X38_Y35_N28
\RxFrIdx[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~5_combout\ = (!RxSt(2) & (((\RxFrIdx[0]~4_combout\ & !RxSt(1))) # (!RxSt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxFrIdx[0]~4_combout\,
	datab => RxSt(2),
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \RxFrIdx[0]~5_combout\);

-- Location: LCCOMB_X38_Y35_N30
\RxFrIdx[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~6_combout\ = (\RxSt~3_combout\ & ((\RXL~input_o\ $ (!\RxParBit~q\)) # (!\Equal12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~3_combout\,
	datab => \Equal12~0_combout\,
	datac => \RXL~input_o\,
	datad => \RxParBit~q\,
	combout => \RxFrIdx[0]~6_combout\);

-- Location: LCCOMB_X38_Y35_N24
\RxFrIdx[0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~7_combout\ = ((!\RxFrIdx[0]~5_combout\ & (!\RxFrIdx[0]~6_combout\ & !\RxFrIdx[0]~1_combout\))) # (!\BTN[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => \RxFrIdx[0]~5_combout\,
	datac => \RxFrIdx[0]~6_combout\,
	datad => \RxFrIdx[0]~1_combout\,
	combout => \RxFrIdx[0]~7_combout\);

-- Location: FF_X38_Y35_N21
\RxFrIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxFrIdx~8_combout\,
	ena => \RxFrIdx[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxFrIdx(0));

-- Location: LCCOMB_X38_Y35_N10
\RxFrIdx~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx~3_combout\ = (\BTN[1]~input_o\ & (\RxFrIdx~2_combout\ & (RxFrIdx(1) $ (RxFrIdx(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => \RxFrIdx~2_combout\,
	datac => RxFrIdx(1),
	datad => RxFrIdx(0),
	combout => \RxFrIdx~3_combout\);

-- Location: FF_X38_Y35_N11
\RxFrIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxFrIdx~3_combout\,
	ena => \RxFrIdx[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxFrIdx(1));

-- Location: LCCOMB_X39_Y34_N8
\Equal13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal13~0_combout\ = (RxFrIdx(1) & !RxFrIdx(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxFrIdx(1),
	datad => RxFrIdx(0),
	combout => \Equal13~0_combout\);

-- Location: LCCOMB_X38_Y35_N0
\RxFrIdx[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~1_combout\ = (\RxFrIdx[0]~0_combout\ & (((\Equal13~0_combout\ & \RXL~input_o\)) # (!\Equal12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxFrIdx[0]~0_combout\,
	datab => \Equal13~0_combout\,
	datac => \Equal12~0_combout\,
	datad => \RXL~input_o\,
	combout => \RxFrIdx[0]~1_combout\);

-- Location: LCCOMB_X38_Y35_N16
\RxSt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~5_combout\ = (\BTN[1]~input_o\ & ((\RxSt~4_combout\) # (\RxFrIdx[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~4_combout\,
	datab => \RxFrIdx[0]~1_combout\,
	datad => \BTN[1]~input_o\,
	combout => \RxSt~5_combout\);

-- Location: FF_X38_Y35_N17
\RxSt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxSt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxSt(2));

-- Location: LCCOMB_X38_Y35_N22
\RxFrIdx[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxFrIdx[0]~0_combout\ = (RxSt(2) & (!RxSt(0) & !RxSt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxSt(2),
	datac => RxSt(0),
	datad => RxSt(1),
	combout => \RxFrIdx[0]~0_combout\);

-- Location: LCCOMB_X38_Y35_N8
\RxSt~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~10_combout\ = (\RxFrIdx[0]~0_combout\ & (\Equal13~0_combout\ & (\Equal12~0_combout\ & \RXL~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxFrIdx[0]~0_combout\,
	datab => \Equal13~0_combout\,
	datac => \Equal12~0_combout\,
	datad => \RXL~input_o\,
	combout => \RxSt~10_combout\);

-- Location: LCCOMB_X42_Y35_N6
\RxSt~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~6_combout\ = (!RxSt(1) & ((RxSt(0) & (\Equal7~0_combout\)) # (!RxSt(0) & ((!\RXL~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(0),
	datab => \Equal7~0_combout\,
	datac => \RXL~input_o\,
	datad => RxSt(1),
	combout => \RxSt~6_combout\);

-- Location: LCCOMB_X39_Y35_N16
\RxBitIdx~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBitIdx~0_combout\ = (\BTN[1]~input_o\ & (!RxSt(0) & (!RxSt(2) & RxSt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => RxSt(0),
	datac => RxSt(2),
	datad => RxSt(1),
	combout => \RxBitIdx~0_combout\);

-- Location: LCCOMB_X39_Y35_N26
\RxBitIdx~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBitIdx~4_combout\ = (\RxBitIdx~0_combout\ & (RxBitIdx(0) $ (\Equal12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RxBitIdx~0_combout\,
	datac => RxBitIdx(0),
	datad => \Equal12~0_combout\,
	combout => \RxBitIdx~4_combout\);

-- Location: FF_X39_Y35_N27
\RxBitIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBitIdx~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxBitIdx(0));

-- Location: LCCOMB_X39_Y35_N24
\RxBitIdx~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBitIdx~3_combout\ = (\RxBitIdx~0_combout\ & (RxBitIdx(1) $ (((RxBitIdx(0) & \Equal12~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(0),
	datab => \RxBitIdx~0_combout\,
	datac => RxBitIdx(1),
	datad => \Equal12~0_combout\,
	combout => \RxBitIdx~3_combout\);

-- Location: FF_X39_Y35_N25
\RxBitIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBitIdx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxBitIdx(1));

-- Location: LCCOMB_X42_Y35_N8
\RxBitIdx~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBitIdx~1_combout\ = (!CntRxUART(1) & (CntRxUART(0) & (RxBitIdx(1) & CntRxUART(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntRxUART(1),
	datab => CntRxUART(0),
	datac => RxBitIdx(1),
	datad => CntRxUART(2),
	combout => \RxBitIdx~1_combout\);

-- Location: LCCOMB_X39_Y35_N30
\RxBitIdx~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBitIdx~2_combout\ = (\RxBitIdx~0_combout\ & (RxBitIdx(2) $ (((RxBitIdx(0) & \RxBitIdx~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(0),
	datab => \RxBitIdx~0_combout\,
	datac => RxBitIdx(2),
	datad => \RxBitIdx~1_combout\,
	combout => \RxBitIdx~2_combout\);

-- Location: FF_X39_Y35_N31
\RxBitIdx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBitIdx~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxBitIdx(2));

-- Location: LCCOMB_X39_Y35_N10
\RxSt~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~7_combout\ = (RxBitIdx(0) & (!RxSt(0) & RxBitIdx(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(0),
	datab => RxSt(0),
	datac => RxBitIdx(2),
	combout => \RxSt~7_combout\);

-- Location: LCCOMB_X39_Y35_N28
\RxSt~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~8_combout\ = (\Equal12~0_combout\ & (\RxSt~7_combout\ & (RxBitIdx(1)))) # (!\Equal12~0_combout\ & (((RxSt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~7_combout\,
	datab => RxBitIdx(1),
	datac => RxSt(0),
	datad => \Equal12~0_combout\,
	combout => \RxSt~8_combout\);

-- Location: LCCOMB_X39_Y35_N14
\RxSt~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~9_combout\ = (!RxSt(2) & ((\RxSt~6_combout\) # ((\RxSt~8_combout\ & RxSt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~6_combout\,
	datab => \RxSt~8_combout\,
	datac => RxSt(2),
	datad => RxSt(1),
	combout => \RxSt~9_combout\);

-- Location: LCCOMB_X39_Y35_N2
\RxSt~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxSt~11_combout\ = (\BTN[1]~input_o\ & ((\RxSt~10_combout\) # (\RxSt~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxSt~10_combout\,
	datab => \RxSt~9_combout\,
	datac => \BTN[1]~input_o\,
	combout => \RxSt~11_combout\);

-- Location: FF_X39_Y35_N3
\RxSt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxSt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => RxSt(0));

-- Location: LCCOMB_X39_Y35_N12
\UpLeds~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~0_combout\ = (\UpLeds~q\ & (((RxSt(1)) # (!RxSt(2))) # (!RxSt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxSt(0),
	datab => \UpLeds~q\,
	datac => RxSt(2),
	datad => RxSt(1),
	combout => \UpLeds~0_combout\);

-- Location: LCCOMB_X39_Y35_N20
\NxRxParBit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxRxParBit~0_combout\ = (\Equal12~0_combout\ & (!RxSt(0) & (!RxSt(2) & RxSt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal12~0_combout\,
	datab => RxSt(0),
	datac => RxSt(2),
	datad => RxSt(1),
	combout => \NxRxParBit~0_combout\);

-- Location: LCCOMB_X39_Y34_N28
\RxBuf[2][1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][1]~2_combout\ = (\NxRxParBit~0_combout\ & (!RxBitIdx(2) & RxBitIdx(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxParBit~0_combout\,
	datac => RxBitIdx(2),
	datad => RxBitIdx(0),
	combout => \RxBuf[2][1]~2_combout\);

-- Location: LCCOMB_X39_Y34_N6
\RxBuf[2][1]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][1]~28_combout\ = (!RxFrIdx(0) & (RxFrIdx(1) & !RxBitIdx(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxFrIdx(0),
	datab => RxFrIdx(1),
	datad => RxBitIdx(1),
	combout => \RxBuf[2][1]~28_combout\);

-- Location: LCCOMB_X39_Y34_N10
\RxBuf[2][1]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][1]~29_combout\ = (\RxBuf[2][1]~2_combout\ & ((\RxBuf[2][1]~28_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][1]~28_combout\ & ((\RxBuf[2][1]~q\))))) # (!\RxBuf[2][1]~2_combout\ & (((\RxBuf[2][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][1]~2_combout\,
	datac => \RxBuf[2][1]~q\,
	datad => \RxBuf[2][1]~28_combout\,
	combout => \RxBuf[2][1]~29_combout\);

-- Location: FF_X39_Y34_N11
\RxBuf[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][1]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][1]~q\);

-- Location: LCCOMB_X39_Y34_N22
\RxBuf[0][1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][1]~3_combout\ = (!RxFrIdx(0) & (!RxFrIdx(1) & !RxBitIdx(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxFrIdx(0),
	datab => RxFrIdx(1),
	datad => RxBitIdx(1),
	combout => \RxBuf[0][1]~3_combout\);

-- Location: LCCOMB_X39_Y34_N24
\RxBuf[0][1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][1]~4_combout\ = (\RxBuf[2][1]~2_combout\ & ((\RxBuf[0][1]~3_combout\ & (\RXL~input_o\)) # (!\RxBuf[0][1]~3_combout\ & ((\RxBuf[0][1]~q\))))) # (!\RxBuf[2][1]~2_combout\ & (((\RxBuf[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][1]~2_combout\,
	datac => \RxBuf[0][1]~q\,
	datad => \RxBuf[0][1]~3_combout\,
	combout => \RxBuf[0][1]~4_combout\);

-- Location: FF_X39_Y34_N25
\RxBuf[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][1]~q\);

-- Location: LCCOMB_X40_Y34_N14
\RxBuf[2][0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][0]~0_combout\ = (\NxRxParBit~0_combout\ & (!RxBitIdx(0) & (!RxBitIdx(1) & !RxBitIdx(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxParBit~0_combout\,
	datab => RxBitIdx(0),
	datac => RxBitIdx(1),
	datad => RxBitIdx(2),
	combout => \RxBuf[2][0]~0_combout\);

-- Location: LCCOMB_X40_Y34_N26
\RxBuf[2][0]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][0]~30_combout\ = (\RxBuf[2][0]~0_combout\ & ((\Equal13~0_combout\ & (\RXL~input_o\)) # (!\Equal13~0_combout\ & ((\RxBuf[2][0]~q\))))) # (!\RxBuf[2][0]~0_combout\ & (((\RxBuf[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][0]~0_combout\,
	datac => \RxBuf[2][0]~q\,
	datad => \Equal13~0_combout\,
	combout => \RxBuf[2][0]~30_combout\);

-- Location: FF_X40_Y34_N27
\RxBuf[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][0]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][0]~q\);

-- Location: LCCOMB_X39_Y34_N20
\Decoder0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (RxFrIdx(1)) # (RxFrIdx(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxFrIdx(1),
	datad => RxFrIdx(0),
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X40_Y34_N8
\RxBuf[0][0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][0]~1_combout\ = (\RxBuf[2][0]~0_combout\ & ((\Decoder0~0_combout\ & ((\RxBuf[0][0]~q\))) # (!\Decoder0~0_combout\ & (\RXL~input_o\)))) # (!\RxBuf[2][0]~0_combout\ & (((\RxBuf[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][0]~0_combout\,
	datac => \RxBuf[0][0]~q\,
	datad => \Decoder0~0_combout\,
	combout => \RxBuf[0][0]~1_combout\);

-- Location: FF_X40_Y34_N9
\RxBuf[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][0]~q\);

-- Location: LCCOMB_X40_Y34_N4
\UpLeds~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~7_combout\ = (\RxBuf[2][1]~q\ & (\RxBuf[0][1]~q\ & (\RxBuf[2][0]~q\ $ (!\RxBuf[0][0]~q\)))) # (!\RxBuf[2][1]~q\ & (!\RxBuf[0][1]~q\ & (\RxBuf[2][0]~q\ $ (!\RxBuf[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][1]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[2][0]~q\,
	datad => \RxBuf[0][0]~q\,
	combout => \UpLeds~7_combout\);

-- Location: LCCOMB_X39_Y33_N6
\RxBuf[2][7]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][7]~15_combout\ = (RxBitIdx(2) & (\NxRxParBit~0_combout\ & (RxBitIdx(0) & RxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(2),
	datab => \NxRxParBit~0_combout\,
	datac => RxBitIdx(0),
	datad => RxBitIdx(1),
	combout => \RxBuf[2][7]~15_combout\);

-- Location: LCCOMB_X39_Y33_N22
\RxBuf[2][7]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][7]~26_combout\ = (\RxBuf[2][7]~15_combout\ & ((\Equal13~0_combout\ & (\RXL~input_o\)) # (!\Equal13~0_combout\ & ((\RxBuf[2][7]~q\))))) # (!\RxBuf[2][7]~15_combout\ & (((\RxBuf[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~15_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[2][7]~q\,
	datad => \Equal13~0_combout\,
	combout => \RxBuf[2][7]~26_combout\);

-- Location: FF_X39_Y33_N23
\RxBuf[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][7]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][7]~q\);

-- Location: LCCOMB_X39_Y33_N20
\RxBuf[0][7]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][7]~16_combout\ = (\Decoder0~0_combout\ & (((\RxBuf[0][7]~q\)))) # (!\Decoder0~0_combout\ & ((\RxBuf[2][7]~15_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][7]~15_combout\ & ((\RxBuf[0][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[0][7]~q\,
	datad => \RxBuf[2][7]~15_combout\,
	combout => \RxBuf[0][7]~16_combout\);

-- Location: FF_X39_Y33_N21
\RxBuf[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][7]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][7]~q\);

-- Location: LCCOMB_X39_Y33_N28
\RxBuf[2][6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][6]~13_combout\ = (RxBitIdx(2) & (\NxRxParBit~0_combout\ & (!RxBitIdx(0) & RxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(2),
	datab => \NxRxParBit~0_combout\,
	datac => RxBitIdx(0),
	datad => RxBitIdx(1),
	combout => \RxBuf[2][6]~13_combout\);

-- Location: LCCOMB_X39_Y33_N8
\RxBuf[0][6]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][6]~14_combout\ = (\Decoder0~0_combout\ & (((\RxBuf[0][6]~q\)))) # (!\Decoder0~0_combout\ & ((\RxBuf[2][6]~13_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][6]~13_combout\ & ((\RxBuf[0][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[0][6]~q\,
	datad => \RxBuf[2][6]~13_combout\,
	combout => \RxBuf[0][6]~14_combout\);

-- Location: FF_X39_Y33_N9
\RxBuf[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][6]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][6]~q\);

-- Location: LCCOMB_X39_Y33_N24
\RxBuf[2][6]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][6]~27_combout\ = (\Equal13~0_combout\ & ((\RxBuf[2][6]~13_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][6]~13_combout\ & ((\RxBuf[2][6]~q\))))) # (!\Equal13~0_combout\ & (((\RxBuf[2][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal13~0_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[2][6]~q\,
	datad => \RxBuf[2][6]~13_combout\,
	combout => \RxBuf[2][6]~27_combout\);

-- Location: FF_X39_Y33_N25
\RxBuf[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][6]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][6]~q\);

-- Location: LCCOMB_X39_Y33_N18
\UpLeds~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~6_combout\ = (\RxBuf[2][7]~q\ & (\RxBuf[0][7]~q\ & (\RxBuf[0][6]~q\ $ (!\RxBuf[2][6]~q\)))) # (!\RxBuf[2][7]~q\ & (!\RxBuf[0][7]~q\ & (\RxBuf[0][6]~q\ $ (!\RxBuf[2][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][7]~q\,
	datab => \RxBuf[0][7]~q\,
	datac => \RxBuf[0][6]~q\,
	datad => \RxBuf[2][6]~q\,
	combout => \UpLeds~6_combout\);

-- Location: LCCOMB_X40_Y34_N22
\RxBuf[2][5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][5]~11_combout\ = (RxBitIdx(2) & (RxBitIdx(0) & \NxRxParBit~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(2),
	datab => RxBitIdx(0),
	datac => \NxRxParBit~0_combout\,
	combout => \RxBuf[2][5]~11_combout\);

-- Location: LCCOMB_X40_Y34_N12
\RxBuf[0][5]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][5]~12_combout\ = (\RxBuf[2][5]~11_combout\ & ((\RxBuf[0][1]~3_combout\ & ((\RXL~input_o\))) # (!\RxBuf[0][1]~3_combout\ & (\RxBuf[0][5]~q\)))) # (!\RxBuf[2][5]~11_combout\ & (((\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][5]~11_combout\,
	datab => \RxBuf[0][1]~3_combout\,
	datac => \RxBuf[0][5]~q\,
	datad => \RXL~input_o\,
	combout => \RxBuf[0][5]~12_combout\);

-- Location: FF_X40_Y34_N13
\RxBuf[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][5]~q\);

-- Location: LCCOMB_X40_Y34_N20
\RxBuf[2][4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][4]~9_combout\ = (\NxRxParBit~0_combout\ & (!RxBitIdx(0) & (!RxBitIdx(1) & RxBitIdx(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxRxParBit~0_combout\,
	datab => RxBitIdx(0),
	datac => RxBitIdx(1),
	datad => RxBitIdx(2),
	combout => \RxBuf[2][4]~9_combout\);

-- Location: LCCOMB_X40_Y34_N16
\RxBuf[2][4]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][4]~34_combout\ = (\RxBuf[2][4]~9_combout\ & ((\Equal13~0_combout\ & (\RXL~input_o\)) # (!\Equal13~0_combout\ & ((\RxBuf[2][4]~q\))))) # (!\RxBuf[2][4]~9_combout\ & (((\RxBuf[2][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][4]~9_combout\,
	datac => \RxBuf[2][4]~q\,
	datad => \Equal13~0_combout\,
	combout => \RxBuf[2][4]~34_combout\);

-- Location: FF_X40_Y34_N17
\RxBuf[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][4]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][4]~q\);

-- Location: LCCOMB_X40_Y34_N30
\RxBuf[2][5]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][5]~33_combout\ = (\RxBuf[2][5]~11_combout\ & ((\RxBuf[2][1]~28_combout\ & ((\RXL~input_o\))) # (!\RxBuf[2][1]~28_combout\ & (\RxBuf[2][5]~q\)))) # (!\RxBuf[2][5]~11_combout\ & (((\RxBuf[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][5]~11_combout\,
	datab => \RxBuf[2][1]~28_combout\,
	datac => \RxBuf[2][5]~q\,
	datad => \RXL~input_o\,
	combout => \RxBuf[2][5]~33_combout\);

-- Location: FF_X40_Y34_N31
\RxBuf[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][5]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][5]~q\);

-- Location: LCCOMB_X40_Y34_N2
\RxBuf[0][4]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][4]~10_combout\ = (\RxBuf[2][4]~9_combout\ & ((\Decoder0~0_combout\ & ((\RxBuf[0][4]~q\))) # (!\Decoder0~0_combout\ & (\RXL~input_o\)))) # (!\RxBuf[2][4]~9_combout\ & (((\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][4]~9_combout\,
	datac => \RxBuf[0][4]~q\,
	datad => \Decoder0~0_combout\,
	combout => \RxBuf[0][4]~10_combout\);

-- Location: FF_X40_Y34_N3
\RxBuf[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][4]~q\);

-- Location: LCCOMB_X40_Y34_N18
\UpLeds~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~9_combout\ = (\RxBuf[0][5]~q\ & (\RxBuf[2][5]~q\ & (\RxBuf[2][4]~q\ $ (!\RxBuf[0][4]~q\)))) # (!\RxBuf[0][5]~q\ & (!\RxBuf[2][5]~q\ & (\RxBuf[2][4]~q\ $ (!\RxBuf[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][5]~q\,
	datab => \RxBuf[2][4]~q\,
	datac => \RxBuf[2][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \UpLeds~9_combout\);

-- Location: LCCOMB_X39_Y35_N22
\UpLeds~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~10_combout\ = (\UpLeds~9_combout\ & (RxSt(0) & (RxSt(2) & !RxSt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UpLeds~9_combout\,
	datab => RxSt(0),
	datac => RxSt(2),
	datad => RxSt(1),
	combout => \UpLeds~10_combout\);

-- Location: LCCOMB_X40_Y35_N22
\RxBuf[2][3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][3]~7_combout\ = (!RxBitIdx(2) & (\NxRxParBit~0_combout\ & (RxBitIdx(0) & RxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(2),
	datab => \NxRxParBit~0_combout\,
	datac => RxBitIdx(0),
	datad => RxBitIdx(1),
	combout => \RxBuf[2][3]~7_combout\);

-- Location: LCCOMB_X40_Y35_N6
\RxBuf[2][3]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][3]~31_combout\ = (\RxBuf[2][3]~7_combout\ & ((\Equal13~0_combout\ & ((\RXL~input_o\))) # (!\Equal13~0_combout\ & (\RxBuf[2][3]~q\)))) # (!\RxBuf[2][3]~7_combout\ & (((\RxBuf[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][3]~7_combout\,
	datab => \Equal13~0_combout\,
	datac => \RxBuf[2][3]~q\,
	datad => \RXL~input_o\,
	combout => \RxBuf[2][3]~31_combout\);

-- Location: FF_X40_Y35_N7
\RxBuf[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][3]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][3]~q\);

-- Location: LCCOMB_X40_Y35_N28
\RxBuf[2][2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][2]~5_combout\ = (!RxBitIdx(2) & (\NxRxParBit~0_combout\ & (!RxBitIdx(0) & RxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxBitIdx(2),
	datab => \NxRxParBit~0_combout\,
	datac => RxBitIdx(0),
	datad => RxBitIdx(1),
	combout => \RxBuf[2][2]~5_combout\);

-- Location: LCCOMB_X40_Y35_N0
\RxBuf[0][2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][2]~6_combout\ = (\Decoder0~0_combout\ & (((\RxBuf[0][2]~q\)))) # (!\Decoder0~0_combout\ & ((\RxBuf[2][2]~5_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][2]~5_combout\ & ((\RxBuf[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~0_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[0][2]~q\,
	datad => \RxBuf[2][2]~5_combout\,
	combout => \RxBuf[0][2]~6_combout\);

-- Location: FF_X40_Y35_N1
\RxBuf[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][2]~q\);

-- Location: LCCOMB_X40_Y35_N12
\RxBuf[0][3]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[0][3]~8_combout\ = (\RxBuf[2][3]~7_combout\ & ((\Decoder0~0_combout\ & ((\RxBuf[0][3]~q\))) # (!\Decoder0~0_combout\ & (\RXL~input_o\)))) # (!\RxBuf[2][3]~7_combout\ & (((\RxBuf[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][3]~7_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[0][3]~q\,
	datad => \Decoder0~0_combout\,
	combout => \RxBuf[0][3]~8_combout\);

-- Location: FF_X40_Y35_N13
\RxBuf[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[0][3]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[0][3]~q\);

-- Location: LCCOMB_X40_Y35_N24
\RxBuf[2][2]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[2][2]~32_combout\ = (\Equal13~0_combout\ & ((\RxBuf[2][2]~5_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][2]~5_combout\ & ((\RxBuf[2][2]~q\))))) # (!\Equal13~0_combout\ & (((\RxBuf[2][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \Equal13~0_combout\,
	datac => \RxBuf[2][2]~q\,
	datad => \RxBuf[2][2]~5_combout\,
	combout => \RxBuf[2][2]~32_combout\);

-- Location: FF_X40_Y35_N25
\RxBuf[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[2][2]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[2][2]~q\);

-- Location: LCCOMB_X40_Y35_N18
\UpLeds~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~8_combout\ = (\RxBuf[2][3]~q\ & (\RxBuf[0][3]~q\ & (\RxBuf[0][2]~q\ $ (!\RxBuf[2][2]~q\)))) # (!\RxBuf[2][3]~q\ & (!\RxBuf[0][3]~q\ & (\RxBuf[0][2]~q\ $ (!\RxBuf[2][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][3]~q\,
	datab => \RxBuf[0][2]~q\,
	datac => \RxBuf[0][3]~q\,
	datad => \RxBuf[2][2]~q\,
	combout => \UpLeds~8_combout\);

-- Location: LCCOMB_X39_Y35_N8
\UpLeds~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~11_combout\ = (\UpLeds~7_combout\ & (\UpLeds~6_combout\ & (\UpLeds~10_combout\ & \UpLeds~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UpLeds~7_combout\,
	datab => \UpLeds~6_combout\,
	datac => \UpLeds~10_combout\,
	datad => \UpLeds~8_combout\,
	combout => \UpLeds~11_combout\);

-- Location: LCCOMB_X39_Y34_N2
\RxBuf[1][1]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][1]~17_combout\ = (RxFrIdx(0) & (!RxFrIdx(1) & !RxBitIdx(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => RxFrIdx(0),
	datab => RxFrIdx(1),
	datad => RxBitIdx(1),
	combout => \RxBuf[1][1]~17_combout\);

-- Location: LCCOMB_X39_Y34_N30
\RxBuf[1][1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][1]~18_combout\ = (\RxBuf[2][1]~2_combout\ & ((\RxBuf[1][1]~17_combout\ & (\RXL~input_o\)) # (!\RxBuf[1][1]~17_combout\ & ((\RxBuf[1][1]~q\))))) # (!\RxBuf[2][1]~2_combout\ & (((\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][1]~2_combout\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][1]~17_combout\,
	combout => \RxBuf[1][1]~18_combout\);

-- Location: FF_X39_Y34_N31
\RxBuf[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][1]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][1]~q\);

-- Location: LCCOMB_X39_Y34_N12
\Decoder0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (!RxFrIdx(1) & RxFrIdx(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => RxFrIdx(1),
	datad => RxFrIdx(0),
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X40_Y34_N0
\RxBuf[1][0]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][0]~19_combout\ = (\RxBuf[2][0]~0_combout\ & ((\Decoder0~1_combout\ & (\RXL~input_o\)) # (!\Decoder0~1_combout\ & ((\RxBuf[1][0]~q\))))) # (!\RxBuf[2][0]~0_combout\ & (((\RxBuf[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][0]~0_combout\,
	datac => \RxBuf[1][0]~q\,
	datad => \Decoder0~1_combout\,
	combout => \RxBuf[1][0]~19_combout\);

-- Location: FF_X40_Y34_N1
\RxBuf[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][0]~q\);

-- Location: LCCOMB_X40_Y34_N10
\UpLeds~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~1_combout\ = (\RxBuf[0][0]~q\ & (\RxBuf[1][0]~q\ & (\RxBuf[0][1]~q\ $ (!\RxBuf[1][1]~q\)))) # (!\RxBuf[0][0]~q\ & (!\RxBuf[1][0]~q\ & (\RxBuf[0][1]~q\ $ (!\RxBuf[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][0]~q\,
	datab => \RxBuf[0][1]~q\,
	datac => \RxBuf[1][1]~q\,
	datad => \RxBuf[1][0]~q\,
	combout => \UpLeds~1_combout\);

-- Location: LCCOMB_X40_Y34_N6
\RxBuf[1][4]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][4]~23_combout\ = (\RxBuf[2][4]~9_combout\ & ((\Decoder0~1_combout\ & (\RXL~input_o\)) # (!\Decoder0~1_combout\ & ((\RxBuf[1][4]~q\))))) # (!\RxBuf[2][4]~9_combout\ & (((\RxBuf[1][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RXL~input_o\,
	datab => \RxBuf[2][4]~9_combout\,
	datac => \RxBuf[1][4]~q\,
	datad => \Decoder0~1_combout\,
	combout => \RxBuf[1][4]~23_combout\);

-- Location: FF_X40_Y34_N7
\RxBuf[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][4]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][4]~q\);

-- Location: LCCOMB_X40_Y34_N28
\RxBuf[1][5]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][5]~22_combout\ = (\RxBuf[2][5]~11_combout\ & ((\RxBuf[1][1]~17_combout\ & ((\RXL~input_o\))) # (!\RxBuf[1][1]~17_combout\ & (\RxBuf[1][5]~q\)))) # (!\RxBuf[2][5]~11_combout\ & (((\RxBuf[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][5]~11_combout\,
	datab => \RxBuf[1][1]~17_combout\,
	datac => \RxBuf[1][5]~q\,
	datad => \RXL~input_o\,
	combout => \RxBuf[1][5]~22_combout\);

-- Location: FF_X40_Y34_N29
\RxBuf[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][5]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][5]~q\);

-- Location: LCCOMB_X40_Y34_N24
\UpLeds~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~3_combout\ = (\RxBuf[1][4]~q\ & (\RxBuf[0][4]~q\ & (\RxBuf[1][5]~q\ $ (!\RxBuf[0][5]~q\)))) # (!\RxBuf[1][4]~q\ & (!\RxBuf[0][4]~q\ & (\RxBuf[1][5]~q\ $ (!\RxBuf[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][4]~q\,
	datab => \RxBuf[1][5]~q\,
	datac => \RxBuf[0][5]~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \UpLeds~3_combout\);

-- Location: LCCOMB_X39_Y33_N10
\RxBuf[1][6]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][6]~25_combout\ = (\Decoder0~1_combout\ & ((\RxBuf[2][6]~13_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][6]~13_combout\ & ((\RxBuf[1][6]~q\))))) # (!\Decoder0~1_combout\ & (((\RxBuf[1][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[1][6]~q\,
	datad => \RxBuf[2][6]~13_combout\,
	combout => \RxBuf[1][6]~25_combout\);

-- Location: FF_X39_Y33_N11
\RxBuf[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][6]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][6]~q\);

-- Location: LCCOMB_X39_Y33_N16
\RxBuf[1][7]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][7]~24_combout\ = (\Decoder0~1_combout\ & ((\RxBuf[2][7]~15_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][7]~15_combout\ & ((\RxBuf[1][7]~q\))))) # (!\Decoder0~1_combout\ & (((\RxBuf[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[1][7]~q\,
	datad => \RxBuf[2][7]~15_combout\,
	combout => \RxBuf[1][7]~24_combout\);

-- Location: FF_X39_Y33_N17
\RxBuf[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][7]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][7]~q\);

-- Location: LCCOMB_X39_Y33_N4
\UpLeds~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~4_combout\ = (\RxBuf[1][6]~q\ & (\RxBuf[0][6]~q\ & (\RxBuf[1][7]~q\ $ (!\RxBuf[0][7]~q\)))) # (!\RxBuf[1][6]~q\ & (!\RxBuf[0][6]~q\ & (\RxBuf[1][7]~q\ $ (!\RxBuf[0][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[1][6]~q\,
	datab => \RxBuf[1][7]~q\,
	datac => \RxBuf[0][6]~q\,
	datad => \RxBuf[0][7]~q\,
	combout => \UpLeds~4_combout\);

-- Location: LCCOMB_X40_Y35_N16
\RxBuf[1][3]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][3]~20_combout\ = (\RxBuf[2][3]~7_combout\ & ((\Decoder0~1_combout\ & (\RXL~input_o\)) # (!\Decoder0~1_combout\ & ((\RxBuf[1][3]~q\))))) # (!\RxBuf[2][3]~7_combout\ & (((\RxBuf[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[2][3]~7_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[1][3]~q\,
	datad => \Decoder0~1_combout\,
	combout => \RxBuf[1][3]~20_combout\);

-- Location: FF_X40_Y35_N17
\RxBuf[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][3]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][3]~q\);

-- Location: LCCOMB_X40_Y35_N10
\RxBuf[1][2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RxBuf[1][2]~21_combout\ = (\Decoder0~1_combout\ & ((\RxBuf[2][2]~5_combout\ & (\RXL~input_o\)) # (!\RxBuf[2][2]~5_combout\ & ((\RxBuf[1][2]~q\))))) # (!\Decoder0~1_combout\ & (((\RxBuf[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Decoder0~1_combout\,
	datab => \RXL~input_o\,
	datac => \RxBuf[1][2]~q\,
	datad => \RxBuf[2][2]~5_combout\,
	combout => \RxBuf[1][2]~21_combout\);

-- Location: FF_X40_Y35_N11
\RxBuf[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \RxBuf[1][2]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RxBuf[1][2]~q\);

-- Location: LCCOMB_X40_Y35_N4
\UpLeds~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~2_combout\ = (\RxBuf[0][3]~q\ & (\RxBuf[1][3]~q\ & (\RxBuf[1][2]~q\ $ (!\RxBuf[0][2]~q\)))) # (!\RxBuf[0][3]~q\ & (!\RxBuf[1][3]~q\ & (\RxBuf[1][2]~q\ $ (!\RxBuf[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RxBuf[0][3]~q\,
	datab => \RxBuf[1][3]~q\,
	datac => \RxBuf[1][2]~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \UpLeds~2_combout\);

-- Location: LCCOMB_X39_Y34_N0
\UpLeds~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~5_combout\ = (\UpLeds~1_combout\ & (\UpLeds~3_combout\ & (\UpLeds~4_combout\ & \UpLeds~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UpLeds~1_combout\,
	datab => \UpLeds~3_combout\,
	datac => \UpLeds~4_combout\,
	datad => \UpLeds~2_combout\,
	combout => \UpLeds~5_combout\);

-- Location: LCCOMB_X39_Y35_N0
\UpLeds~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UpLeds~12_combout\ = (\BTN[1]~input_o\ & ((\UpLeds~0_combout\) # ((\UpLeds~11_combout\ & \UpLeds~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UpLeds~0_combout\,
	datab => \UpLeds~11_combout\,
	datac => \BTN[1]~input_o\,
	datad => \UpLeds~5_combout\,
	combout => \UpLeds~12_combout\);

-- Location: FF_X39_Y35_N1
UpLeds : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \UpLeds~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UpLeds~q\);

-- Location: LCCOMB_X41_Y34_N0
\LED~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~1_combout\ = (\RxBuf[0][0]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UpLeds~q\,
	datad => \RxBuf[0][0]~q\,
	combout => \LED~1_combout\);

-- Location: LCCOMB_X39_Y34_N18
\LED~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~2_combout\ = (\RxBuf[0][1]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RxBuf[0][1]~q\,
	datac => \UpLeds~q\,
	combout => \LED~2_combout\);

-- Location: LCCOMB_X40_Y35_N2
\LED~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~3_combout\ = (\RxBuf[0][2]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UpLeds~q\,
	datad => \RxBuf[0][2]~q\,
	combout => \LED~3_combout\);

-- Location: LCCOMB_X40_Y35_N30
\LED~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~4_combout\ = (\RxBuf[0][3]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UpLeds~q\,
	datad => \RxBuf[0][3]~q\,
	combout => \LED~4_combout\);

-- Location: LCCOMB_X41_Y34_N26
\LED~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~5_combout\ = (\RxBuf[0][4]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UpLeds~q\,
	datad => \RxBuf[0][4]~q\,
	combout => \LED~5_combout\);

-- Location: LCCOMB_X41_Y34_N12
\LED~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~6_combout\ = (\RxBuf[0][5]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \UpLeds~q\,
	datad => \RxBuf[0][5]~q\,
	combout => \LED~6_combout\);

-- Location: LCCOMB_X39_Y33_N26
\LED~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~7_combout\ = (\RxBuf[0][6]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RxBuf[0][6]~q\,
	datad => \UpLeds~q\,
	combout => \LED~7_combout\);

-- Location: LCCOMB_X39_Y33_N14
\LED~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~8_combout\ = (\RxBuf[0][7]~q\) # (!\UpLeds~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RxBuf[0][7]~q\,
	datad => \UpLeds~q\,
	combout => \LED~8_combout\);

-- Location: LCCOMB_X2_Y38_N0
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = CntTxUART(0) $ (VCC)
-- \Add0~1\ = CARRY(CntTxUART(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CntTxUART(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X2_Y38_N1
\CntTxUART[0]\ : dffeas
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
	q => CntTxUART(0));

-- Location: LCCOMB_X2_Y38_N2
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (CntTxUART(1) & (!\Add0~1\)) # (!CntTxUART(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!CntTxUART(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntTxUART(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X2_Y38_N20
\NxCntTxUART[1]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[1]~5_combout\ = (\Add0~2_combout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~2_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCntTxUART[1]~5_combout\);

-- Location: FF_X2_Y38_N21
\CntTxUART[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(1));

-- Location: LCCOMB_X2_Y38_N4
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (CntTxUART(2) & (\Add0~3\ $ (GND))) # (!CntTxUART(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((CntTxUART(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntTxUART(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X2_Y38_N5
\CntTxUART[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(2));

-- Location: LCCOMB_X2_Y38_N6
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (CntTxUART(3) & (!\Add0~5\)) # (!CntTxUART(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!CntTxUART(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CntTxUART(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X2_Y38_N26
\NxCntTxUART[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[3]~4_combout\ = (\Add0~6_combout\ & ((!\Equal0~1_combout\) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	combout => \NxCntTxUART[3]~4_combout\);

-- Location: FF_X2_Y38_N27
\CntTxUART[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(3));

-- Location: LCCOMB_X2_Y38_N22
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (CntTxUART(3) & (CntTxUART(0) & (!CntTxUART(2) & !CntTxUART(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntTxUART(3),
	datab => CntTxUART(0),
	datac => CntTxUART(2),
	datad => CntTxUART(1),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X2_Y38_N8
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (CntTxUART(4) & (\Add0~7\ $ (GND))) # (!CntTxUART(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((CntTxUART(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CntTxUART(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X2_Y38_N30
\NxCntTxUART[4]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[4]~3_combout\ = (\Add0~8_combout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Add0~8_combout\,
	combout => \NxCntTxUART[4]~3_combout\);

-- Location: FF_X2_Y38_N31
\CntTxUART[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(4));

-- Location: LCCOMB_X2_Y38_N10
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (CntTxUART(5) & (!\Add0~9\)) # (!CntTxUART(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!CntTxUART(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntTxUART(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X2_Y38_N28
\NxCntTxUART[5]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[5]~2_combout\ = (\Add0~10_combout\ & ((!\Equal0~1_combout\) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	combout => \NxCntTxUART[5]~2_combout\);

-- Location: FF_X2_Y38_N29
\CntTxUART[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(5));

-- Location: LCCOMB_X2_Y38_N12
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (CntTxUART(6) & (\Add0~11\ $ (GND))) # (!CntTxUART(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((CntTxUART(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntTxUART(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X2_Y38_N18
\NxCntTxUART[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[6]~1_combout\ = (\Add0~12_combout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Add0~12_combout\,
	combout => \NxCntTxUART[6]~1_combout\);

-- Location: FF_X2_Y38_N19
\CntTxUART[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(6));

-- Location: LCCOMB_X2_Y38_N14
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = \Add0~13\ $ (CntTxUART(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => CntTxUART(7),
	cin => \Add0~13\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X2_Y38_N16
\NxCntTxUART[7]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntTxUART[7]~0_combout\ = (\Add0~14_combout\ & ((!\Equal0~0_combout\) # (!\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Add0~14_combout\,
	combout => \NxCntTxUART[7]~0_combout\);

-- Location: FF_X2_Y38_N17
\CntTxUART[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntTxUART[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntTxUART(7));

-- Location: LCCOMB_X2_Y38_N24
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (CntTxUART(7) & (CntTxUART(5) & (CntTxUART(4) & CntTxUART(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntTxUART(7),
	datab => CntTxUART(5),
	datac => CntTxUART(4),
	datad => CntTxUART(6),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y38_N14
\ClkTxUART~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ClkTxUART~0_combout\ = \ClkTxUART~q\ $ (((\Equal0~0_combout\ & \Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~0_combout\,
	datac => \ClkTxUART~q\,
	datad => \Equal0~1_combout\,
	combout => \ClkTxUART~0_combout\);

-- Location: FF_X1_Y38_N15
ClkTxUART : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \ClkTxUART~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ClkTxUART~q\);

-- Location: CLKCTRL_G3
\ClkTxUART~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ClkTxUART~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ClkTxUART~clkctrl_outclk\);

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

-- Location: LCCOMB_X49_Y50_N8
\Pushed~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Pushed~0_combout\ = !\BTN[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \BTN[0]~input_o\,
	combout => \Pushed~0_combout\);

-- Location: FF_X49_Y50_N9
Pushed : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \Pushed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Pushed~q\);

-- Location: LCCOMB_X50_Y50_N10
\TxOvBitIdx[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[0]~6_combout\ = TxOvBitIdx(0) $ (VCC)
-- \TxOvBitIdx[0]~7\ = CARRY(TxOvBitIdx(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(0),
	datad => VCC,
	combout => \TxOvBitIdx[0]~6_combout\,
	cout => \TxOvBitIdx[0]~7\);

-- Location: LCCOMB_X50_Y50_N18
\TxOvBitIdx[4]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[4]~14_combout\ = (TxOvBitIdx(4) & (\TxOvBitIdx[3]~13\ $ (GND))) # (!TxOvBitIdx(4) & (!\TxOvBitIdx[3]~13\ & VCC))
-- \TxOvBitIdx[4]~15\ = CARRY((TxOvBitIdx(4) & !\TxOvBitIdx[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TxOvBitIdx(4),
	datad => VCC,
	cin => \TxOvBitIdx[3]~13\,
	combout => \TxOvBitIdx[4]~14_combout\,
	cout => \TxOvBitIdx[4]~15\);

-- Location: LCCOMB_X50_Y50_N20
\TxOvBitIdx[5]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[5]~16_combout\ = \TxOvBitIdx[4]~15\ $ (TxOvBitIdx(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => TxOvBitIdx(5),
	cin => \TxOvBitIdx[4]~15\,
	combout => \TxOvBitIdx[5]~16_combout\);

-- Location: FF_X50_Y50_N21
\TxOvBitIdx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[5]~16_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(5));

-- Location: LCCOMB_X50_Y50_N24
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (TxOvBitIdx(0) & (TxOvBitIdx(3) & (TxOvBitIdx(1) & TxOvBitIdx(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(0),
	datab => TxOvBitIdx(3),
	datac => TxOvBitIdx(1),
	datad => TxOvBitIdx(5),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X50_Y50_N6
\Message_Handler~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Message_Handler~0_combout\ = ((!TxOvBitIdx(4) & (!TxOvBitIdx(2) & \Equal1~0_combout\))) # (!\ResetTx~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(4),
	datab => \ResetTx~q\,
	datac => TxOvBitIdx(2),
	datad => \Equal1~0_combout\,
	combout => \Message_Handler~0_combout\);

-- Location: FF_X50_Y50_N11
\TxOvBitIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[0]~6_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(0));

-- Location: LCCOMB_X50_Y50_N12
\TxOvBitIdx[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[1]~8_combout\ = (TxOvBitIdx(1) & (!\TxOvBitIdx[0]~7\)) # (!TxOvBitIdx(1) & ((\TxOvBitIdx[0]~7\) # (GND)))
-- \TxOvBitIdx[1]~9\ = CARRY((!\TxOvBitIdx[0]~7\) # (!TxOvBitIdx(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(1),
	datad => VCC,
	cin => \TxOvBitIdx[0]~7\,
	combout => \TxOvBitIdx[1]~8_combout\,
	cout => \TxOvBitIdx[1]~9\);

-- Location: FF_X50_Y50_N13
\TxOvBitIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[1]~8_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(1));

-- Location: LCCOMB_X50_Y50_N14
\TxOvBitIdx[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[2]~10_combout\ = (TxOvBitIdx(2) & (\TxOvBitIdx[1]~9\ $ (GND))) # (!TxOvBitIdx(2) & (!\TxOvBitIdx[1]~9\ & VCC))
-- \TxOvBitIdx[2]~11\ = CARRY((TxOvBitIdx(2) & !\TxOvBitIdx[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TxOvBitIdx(2),
	datad => VCC,
	cin => \TxOvBitIdx[1]~9\,
	combout => \TxOvBitIdx[2]~10_combout\,
	cout => \TxOvBitIdx[2]~11\);

-- Location: FF_X50_Y50_N15
\TxOvBitIdx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[2]~10_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(2));

-- Location: LCCOMB_X50_Y50_N16
\TxOvBitIdx[3]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxOvBitIdx[3]~12_combout\ = (TxOvBitIdx(3) & (!\TxOvBitIdx[2]~11\)) # (!TxOvBitIdx(3) & ((\TxOvBitIdx[2]~11\) # (GND)))
-- \TxOvBitIdx[3]~13\ = CARRY((!\TxOvBitIdx[2]~11\) # (!TxOvBitIdx(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => TxOvBitIdx(3),
	datad => VCC,
	cin => \TxOvBitIdx[2]~11\,
	combout => \TxOvBitIdx[3]~12_combout\,
	cout => \TxOvBitIdx[3]~13\);

-- Location: FF_X50_Y50_N17
\TxOvBitIdx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[3]~12_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(3));

-- Location: FF_X50_Y50_N19
\TxOvBitIdx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \TxOvBitIdx[4]~14_combout\,
	sclr => \Message_Handler~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxOvBitIdx(4));

-- Location: LCCOMB_X50_Y50_N8
\Reset_Handler~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Reset_Handler~0_combout\ = ((!TxOvBitIdx(2) & ((!TxOvBitIdx(0)) # (!TxOvBitIdx(1))))) # (!TxOvBitIdx(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(1),
	datab => TxOvBitIdx(3),
	datac => TxOvBitIdx(2),
	datad => TxOvBitIdx(0),
	combout => \Reset_Handler~0_combout\);

-- Location: LCCOMB_X50_Y50_N2
\Reset_Handler~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Reset_Handler~1_combout\ = (\ResetTx~q\ & (((!TxOvBitIdx(4) & \Reset_Handler~0_combout\)) # (!TxOvBitIdx(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(4),
	datab => \ResetTx~q\,
	datac => \Reset_Handler~0_combout\,
	datad => TxOvBitIdx(5),
	combout => \Reset_Handler~1_combout\);

-- Location: LCCOMB_X50_Y50_N0
\Reset_Handler~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Reset_Handler~2_combout\ = (\Reset_Handler~1_combout\) # ((!\Pushed~q\ & !\BTN[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Pushed~q\,
	datab => \BTN[0]~input_o\,
	datad => \Reset_Handler~1_combout\,
	combout => \Reset_Handler~2_combout\);

-- Location: FF_X50_Y50_N1
ResetTx : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \Reset_Handler~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ResetTx~q\);

-- Location: LCCOMB_X50_Y51_N18
\NxTxBitIdx[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitIdx[0]~1_combout\ = (!\Message_Handler~0_combout\ & (!TxBitIdx(0) & \Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Message_Handler~0_combout\,
	datac => TxBitIdx(0),
	datad => \Equal2~0_combout\,
	combout => \NxTxBitIdx[0]~1_combout\);

-- Location: FF_X50_Y51_N19
\TxBitIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxBitIdx[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitIdx(0));

-- Location: LCCOMB_X50_Y51_N16
\TxBitIdx[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxBitIdx[0]~0_combout\ = (\Message_Handler~0_combout\) # (!\Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Message_Handler~0_combout\,
	datad => \Equal2~0_combout\,
	combout => \TxBitIdx[0]~0_combout\);

-- Location: LCCOMB_X50_Y51_N0
\NxTxBitIdx[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitIdx[1]~0_combout\ = (\Equal2~0_combout\ & (!\Message_Handler~0_combout\ & (TxBitIdx(1) $ (TxBitIdx(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Message_Handler~0_combout\,
	datac => TxBitIdx(1),
	datad => TxBitIdx(0),
	combout => \NxTxBitIdx[1]~0_combout\);

-- Location: FF_X50_Y51_N1
\TxBitIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxBitIdx[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitIdx(1));

-- Location: LCCOMB_X50_Y51_N14
\NxTxBitIdx[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitIdx[2]~3_combout\ = (!\TxBitIdx[0]~0_combout\ & (TxBitIdx(2) $ (((TxBitIdx(1) & TxBitIdx(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxBitIdx[0]~0_combout\,
	datab => TxBitIdx(1),
	datac => TxBitIdx(2),
	datad => TxBitIdx(0),
	combout => \NxTxBitIdx[2]~3_combout\);

-- Location: FF_X50_Y51_N15
\TxBitIdx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxBitIdx[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitIdx(2));

-- Location: LCCOMB_X50_Y51_N6
\Add3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = TxBitIdx(3) $ (((TxBitIdx(0) & (TxBitIdx(2) & TxBitIdx(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitIdx(3),
	datab => TxBitIdx(0),
	datac => TxBitIdx(2),
	datad => TxBitIdx(1),
	combout => \Add3~0_combout\);

-- Location: LCCOMB_X50_Y51_N28
\NxTxBitIdx[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxBitIdx[3]~2_combout\ = (\Add3~0_combout\ & (!\Message_Handler~0_combout\ & \Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datab => \Message_Handler~0_combout\,
	datad => \Equal2~0_combout\,
	combout => \NxTxBitIdx[3]~2_combout\);

-- Location: FF_X50_Y51_N29
\TxBitIdx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxBitIdx[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxBitIdx(3));

-- Location: LCCOMB_X50_Y51_N10
\Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = ((TxBitIdx(0)) # ((TxBitIdx(2)) # (!TxBitIdx(1)))) # (!TxBitIdx(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitIdx(3),
	datab => TxBitIdx(0),
	datac => TxBitIdx(2),
	datad => TxBitIdx(1),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X50_Y51_N12
\Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (TxBitIdx(3) & (TxBitIdx(0) & (!TxBitIdx(2) & !TxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitIdx(3),
	datab => TxBitIdx(0),
	datac => TxBitIdx(2),
	datad => TxBitIdx(1),
	combout => \Equal4~0_combout\);

-- Location: IOIBUF_X51_Y54_N29
\SWT~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT,
	o => \SWT~input_o\);

-- Location: LCCOMB_X50_Y51_N2
\TxLine~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~0_combout\ = (TxBitIdx(0) & (!TxBitIdx(2) & TxBitIdx(1))) # (!TxBitIdx(0) & (TxBitIdx(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxBitIdx(0),
	datac => TxBitIdx(2),
	datad => TxBitIdx(1),
	combout => \TxLine~0_combout\);

-- Location: LCCOMB_X50_Y51_N8
\NxTxFrIdx[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxFrIdx[0]~1_combout\ = (!TxFrIdx(0) & !\Message_Handler~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => TxFrIdx(0),
	datad => \Message_Handler~0_combout\,
	combout => \NxTxFrIdx[0]~1_combout\);

-- Location: FF_X50_Y51_N9
\TxFrIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxFrIdx[0]~1_combout\,
	ena => \TxBitIdx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxFrIdx(0));

-- Location: LCCOMB_X50_Y51_N30
\NxTxFrIdx[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxFrIdx[1]~0_combout\ = (!\Message_Handler~0_combout\ & (TxFrIdx(0) $ (TxFrIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => TxFrIdx(0),
	datac => TxFrIdx(1),
	datad => \Message_Handler~0_combout\,
	combout => \NxTxFrIdx[1]~0_combout\);

-- Location: FF_X50_Y51_N31
\TxFrIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxFrIdx[1]~0_combout\,
	ena => \TxBitIdx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => TxFrIdx(1));

-- Location: LCCOMB_X50_Y51_N26
\Mux3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (TxFrIdx(1) & ((TxBitIdx(0) & (TxFrIdx(0) & TxBitIdx(1))) # (!TxBitIdx(0) & ((!TxBitIdx(1)))))) # (!TxFrIdx(1) & (((!TxBitIdx(0) & !TxFrIdx(0))) # (!TxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxFrIdx(1),
	datab => TxBitIdx(0),
	datac => TxFrIdx(0),
	datad => TxBitIdx(1),
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X50_Y51_N20
\Mux3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (TxFrIdx(1) & (TxBitIdx(1) & (TxBitIdx(0) $ (!TxFrIdx(0))))) # (!TxFrIdx(1) & (TxBitIdx(0) & ((!TxBitIdx(1)) # (!TxFrIdx(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxFrIdx(1),
	datab => TxBitIdx(0),
	datac => TxFrIdx(0),
	datad => TxBitIdx(1),
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X50_Y51_N22
\Mux3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = (TxBitIdx(2) & ((\Mux3~3_combout\))) # (!TxBitIdx(2) & (\Mux3~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~2_combout\,
	datab => \Mux3~3_combout\,
	datac => TxBitIdx(2),
	combout => \Mux3~4_combout\);

-- Location: LCCOMB_X50_Y51_N4
\TxLine~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~1_combout\ = (\SWT~input_o\ & ((!\Mux3~4_combout\))) # (!\SWT~input_o\ & (\TxLine~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \TxLine~0_combout\,
	datac => \Mux3~4_combout\,
	combout => \TxLine~1_combout\);

-- Location: LCCOMB_X50_Y51_N24
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!TxBitIdx(3) & (!TxBitIdx(0) & (!TxBitIdx(2) & !TxBitIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxBitIdx(3),
	datab => TxBitIdx(0),
	datac => TxBitIdx(2),
	datad => TxBitIdx(1),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X50_Y50_N30
\NxTxParBit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxParBit~1_combout\ = (\ResetTx~q\ & (\Equal2~0_combout\ & (!\Equal4~0_combout\ & !\Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ResetTx~q\,
	datab => \Equal2~0_combout\,
	datac => \Equal4~0_combout\,
	datad => \Equal3~0_combout\,
	combout => \NxTxParBit~1_combout\);

-- Location: LCCOMB_X50_Y50_N4
\NxTxParBit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxParBit~0_combout\ = ((!TxOvBitIdx(4) & ((!TxOvBitIdx(2)) # (!TxOvBitIdx(3))))) # (!TxOvBitIdx(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => TxOvBitIdx(4),
	datab => TxOvBitIdx(3),
	datac => TxOvBitIdx(2),
	datad => TxOvBitIdx(5),
	combout => \NxTxParBit~0_combout\);

-- Location: LCCOMB_X50_Y50_N26
\NxTxParBit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxTxParBit~2_combout\ = (\NxTxParBit~1_combout\ & (\NxTxParBit~0_combout\ & (\TxParBit~q\ $ (\TxLine~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxTxParBit~1_combout\,
	datab => \NxTxParBit~0_combout\,
	datac => \TxParBit~q\,
	datad => \TxLine~3_combout\,
	combout => \NxTxParBit~2_combout\);

-- Location: FF_X50_Y50_N27
TxParBit : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkTxUART~clkctrl_outclk\,
	d => \NxTxParBit~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TxParBit~q\);

-- Location: LCCOMB_X50_Y50_N28
\TxLine~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~2_combout\ = (\Equal4~0_combout\ & ((!\TxParBit~q\))) # (!\Equal4~0_combout\ & (\TxLine~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datab => \TxLine~1_combout\,
	datac => \TxParBit~q\,
	combout => \TxLine~2_combout\);

-- Location: LCCOMB_X50_Y50_N22
\TxLine~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~3_combout\ = (((!\TxLine~2_combout\ & !\Equal3~0_combout\)) # (!\Equal2~0_combout\)) # (!\ResetTx~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ResetTx~q\,
	datab => \Equal2~0_combout\,
	datac => \TxLine~2_combout\,
	datad => \Equal3~0_combout\,
	combout => \TxLine~3_combout\);

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

ww_TXL <= \TXL~output_o\;
END structure;



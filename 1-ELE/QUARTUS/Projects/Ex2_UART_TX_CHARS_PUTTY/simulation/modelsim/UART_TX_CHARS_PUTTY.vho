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

-- DATE "04/18/2020 15:30:12"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
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

ENTITY 	UART_TX_CHARS_PUTTY IS
    PORT (
	CLK : IN std_logic;
	BTN : IN std_logic;
	SWT : IN std_logic;
	TXL : OUT std_logic
	);
END UART_TX_CHARS_PUTTY;

-- Design Ports Information
-- TXL	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UART_TX_CHARS_PUTTY IS
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
SIGNAL ww_BTN : std_logic;
SIGNAL ww_SWT : std_logic;
SIGNAL ww_TXL : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Clk1kHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ClkUART~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \TXL~output_o\ : std_logic;
SIGNAL \SWT~input_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Add4~1\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \NxCntUART[3]~4_combout\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \NxCntUART[4]~3_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \NxCntUART[5]~2_combout\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \NxCntUART[6]~1_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \NxCntUART[7]~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \NxCntUART[1]~5_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \ClkUART~0_combout\ : std_logic;
SIGNAL \ClkUART~q\ : std_logic;
SIGNAL \ClkUART~clkctrl_outclk\ : std_logic;
SIGNAL \OvBitCnt[0]~18_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~3_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~4_combout\ : std_logic;
SIGNAL \BTN~input_o\ : std_logic;
SIGNAL \Pushed~0_combout\ : std_logic;
SIGNAL \Pushed~q\ : std_logic;
SIGNAL \NxResetD~0_combout\ : std_logic;
SIGNAL \OvBitCnt[8]~35\ : std_logic;
SIGNAL \OvBitCnt[9]~36_combout\ : std_logic;
SIGNAL \OvBitCnt[9]~37\ : std_logic;
SIGNAL \OvBitCnt[10]~38_combout\ : std_logic;
SIGNAL \OvBitCnt[10]~39\ : std_logic;
SIGNAL \OvBitCnt[11]~40_combout\ : std_logic;
SIGNAL \OvBitCnt[11]~41\ : std_logic;
SIGNAL \OvBitCnt[12]~42_combout\ : std_logic;
SIGNAL \OvBitCnt[12]~43\ : std_logic;
SIGNAL \OvBitCnt[13]~44_combout\ : std_logic;
SIGNAL \OvBitCnt[13]~45\ : std_logic;
SIGNAL \OvBitCnt[14]~46_combout\ : std_logic;
SIGNAL \OvBitCnt[14]~47\ : std_logic;
SIGNAL \OvBitCnt[15]~48_combout\ : std_logic;
SIGNAL \OvBitCnt[15]~49\ : std_logic;
SIGNAL \OvBitCnt[16]~50_combout\ : std_logic;
SIGNAL \OvBitCnt[16]~51\ : std_logic;
SIGNAL \OvBitCnt[17]~52_combout\ : std_logic;
SIGNAL \State[1]~0_combout\ : std_logic;
SIGNAL \NxState~0_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan4~2_combout\ : std_logic;
SIGNAL \LessThan4~3_combout\ : std_logic;
SIGNAL \LessThan4~4_combout\ : std_logic;
SIGNAL \LessThan4~5_combout\ : std_logic;
SIGNAL \LessThan4~6_combout\ : std_logic;
SIGNAL \Ncyc[11]~0_combout\ : std_logic;
SIGNAL \LessThan4~7_combout\ : std_logic;
SIGNAL \LessThan4~8_combout\ : std_logic;
SIGNAL \LessThan4~9_combout\ : std_logic;
SIGNAL \LessThan4~10_combout\ : std_logic;
SIGNAL \LessThan4~11_combout\ : std_logic;
SIGNAL \LessThan4~12_combout\ : std_logic;
SIGNAL \NxResetD~1_combout\ : std_logic;
SIGNAL \ResetD~q\ : std_logic;
SIGNAL \NxMsgFrIdx~5_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~6_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~7_combout\ : std_logic;
SIGNAL \OvBitCnt[0]~19\ : std_logic;
SIGNAL \OvBitCnt[1]~20_combout\ : std_logic;
SIGNAL \OvBitCnt[1]~21\ : std_logic;
SIGNAL \OvBitCnt[2]~22_combout\ : std_logic;
SIGNAL \OvBitCnt[2]~23\ : std_logic;
SIGNAL \OvBitCnt[3]~24_combout\ : std_logic;
SIGNAL \OvBitCnt[3]~25\ : std_logic;
SIGNAL \OvBitCnt[4]~26_combout\ : std_logic;
SIGNAL \OvBitCnt[4]~27\ : std_logic;
SIGNAL \OvBitCnt[5]~28_combout\ : std_logic;
SIGNAL \OvBitCnt[5]~29\ : std_logic;
SIGNAL \OvBitCnt[6]~30_combout\ : std_logic;
SIGNAL \OvBitCnt[6]~31\ : std_logic;
SIGNAL \OvBitCnt[7]~32_combout\ : std_logic;
SIGNAL \OvBitCnt[7]~33\ : std_logic;
SIGNAL \OvBitCnt[8]~34_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~0_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~1_combout\ : std_logic;
SIGNAL \NxMsgFrIdx~2_combout\ : std_logic;
SIGNAL \TxLine_Handler~0_combout\ : std_logic;
SIGNAL \TxLine_Handler~1_combout\ : std_logic;
SIGNAL \TxLine_Handler~2_combout\ : std_logic;
SIGNAL \NxFrBitCnt[0]~5_combout\ : std_logic;
SIGNAL \NxFrBitCnt[2]~6_combout\ : std_logic;
SIGNAL \Equal59~0_combout\ : std_logic;
SIGNAL \MsgFrIdx[3]~0_combout\ : std_logic;
SIGNAL \NxFrBitCnt[1]~7_combout\ : std_logic;
SIGNAL \Add9~1_combout\ : std_logic;
SIGNAL \NxFrBitCnt[3]~4_combout\ : std_logic;
SIGNAL \NxParBit~0_combout\ : std_logic;
SIGNAL \NxParBit~1_combout\ : std_logic;
SIGNAL \NxMsgFrIdx[0]~9_combout\ : std_logic;
SIGNAL \Add14~0_combout\ : std_logic;
SIGNAL \NxMsgFrIdx[1]~8_combout\ : std_logic;
SIGNAL \TxLine~11_combout\ : std_logic;
SIGNAL \TxLine~9_combout\ : std_logic;
SIGNAL \TxLine~8_combout\ : std_logic;
SIGNAL \TxLine~20_combout\ : std_logic;
SIGNAL \TxLine~10_combout\ : std_logic;
SIGNAL \TxLine~12_combout\ : std_logic;
SIGNAL \TxLine~13_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \NxCnt1kHz[13]~1_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \NxCnt1kHz[14]~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \NxCnt1kHz[5]~4_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \NxCnt1kHz[7]~3_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \NxCnt1kHz[8]~2_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \NxCnt1kHz[3]~5_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Clk1kHz~0_combout\ : std_logic;
SIGNAL \Clk1kHz~feeder_combout\ : std_logic;
SIGNAL \Clk1kHz~q\ : std_logic;
SIGNAL \Clk1kHz~clkctrl_outclk\ : std_logic;
SIGNAL \Sec[0]~6_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \Msec[0]~10_combout\ : std_logic;
SIGNAL \Msec[0]~11\ : std_logic;
SIGNAL \Msec[1]~12_combout\ : std_logic;
SIGNAL \Msec[1]~13\ : std_logic;
SIGNAL \Msec[2]~14_combout\ : std_logic;
SIGNAL \Msec[2]~15\ : std_logic;
SIGNAL \Msec[3]~16_combout\ : std_logic;
SIGNAL \Msec[3]~17\ : std_logic;
SIGNAL \Msec[4]~18_combout\ : std_logic;
SIGNAL \Msec[4]~19\ : std_logic;
SIGNAL \Msec[5]~20_combout\ : std_logic;
SIGNAL \Msec[5]~21\ : std_logic;
SIGNAL \Msec[6]~22_combout\ : std_logic;
SIGNAL \Msec[6]~23\ : std_logic;
SIGNAL \Msec[7]~24_combout\ : std_logic;
SIGNAL \Msec[7]~25\ : std_logic;
SIGNAL \Msec[8]~26_combout\ : std_logic;
SIGNAL \Msec[8]~27\ : std_logic;
SIGNAL \Msec[9]~28_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \Sec[0]~7\ : std_logic;
SIGNAL \Sec[1]~8_combout\ : std_logic;
SIGNAL \Sec[1]~9\ : std_logic;
SIGNAL \Sec[2]~10_combout\ : std_logic;
SIGNAL \Sec[2]~11\ : std_logic;
SIGNAL \Sec[3]~12_combout\ : std_logic;
SIGNAL \Sec[3]~13\ : std_logic;
SIGNAL \Sec[4]~14_combout\ : std_logic;
SIGNAL \Sec[4]~15\ : std_logic;
SIGNAL \Sec[5]~16_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \Add11~1\ : std_logic;
SIGNAL \Add11~3\ : std_logic;
SIGNAL \Add11~5\ : std_logic;
SIGNAL \Add11~7\ : std_logic;
SIGNAL \Add11~9\ : std_logic;
SIGNAL \Add11~10_combout\ : std_logic;
SIGNAL \Add11~8_combout\ : std_logic;
SIGNAL \Add11~6_combout\ : std_logic;
SIGNAL \Add11~2_combout\ : std_logic;
SIGNAL \Mux5~5_combout\ : std_logic;
SIGNAL \Add11~4_combout\ : std_logic;
SIGNAL \Add11~0_combout\ : std_logic;
SIGNAL \Mux5~6_combout\ : std_logic;
SIGNAL \Mux5~7_combout\ : std_logic;
SIGNAL \Mux5~8_combout\ : std_logic;
SIGNAL \Add9~0_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \Mux5~9_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Min[0]~6_combout\ : std_logic;
SIGNAL \Min[1]~9\ : std_logic;
SIGNAL \Min[2]~11_combout\ : std_logic;
SIGNAL \Min[5]~10_combout\ : std_logic;
SIGNAL \Min[2]~12\ : std_logic;
SIGNAL \Min[3]~13_combout\ : std_logic;
SIGNAL \Min[3]~14\ : std_logic;
SIGNAL \Min[4]~15_combout\ : std_logic;
SIGNAL \Min[4]~16\ : std_logic;
SIGNAL \Min[5]~17_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \Min[0]~7\ : std_logic;
SIGNAL \Min[1]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \Add10~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ : std_logic;
SIGNAL \Add10~1\ : std_logic;
SIGNAL \Add10~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\ : std_logic;
SIGNAL \Add10~3\ : std_logic;
SIGNAL \Add10~5\ : std_logic;
SIGNAL \Add10~7\ : std_logic;
SIGNAL \Add10~9\ : std_logic;
SIGNAL \Add10~10_combout\ : std_logic;
SIGNAL \Add10~6_combout\ : std_logic;
SIGNAL \Add10~8_combout\ : std_logic;
SIGNAL \Mux3~5_combout\ : std_logic;
SIGNAL \Add10~4_combout\ : std_logic;
SIGNAL \Mux3~6_combout\ : std_logic;
SIGNAL \Mux3~7_combout\ : std_logic;
SIGNAL \Mux3~8_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \Mux3~9_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \CharMin[0][2]~9_combout\ : std_logic;
SIGNAL \Mux4~4_combout\ : std_logic;
SIGNAL \CharMin[0][0]~6_combout\ : std_logic;
SIGNAL \CharMin[0][0]~7_combout\ : std_logic;
SIGNAL \CharMin[0][1]~8_combout\ : std_logic;
SIGNAL \Mux4~5_combout\ : std_logic;
SIGNAL \Mux4~6_combout\ : std_logic;
SIGNAL \TxLine~6_combout\ : std_logic;
SIGNAL \TxLine~7_combout\ : std_logic;
SIGNAL \NxMsgFrIdx[2]~11_combout\ : std_logic;
SIGNAL \Add8~0_combout\ : std_logic;
SIGNAL \NxMsgFrIdx[3]~10_combout\ : std_logic;
SIGNAL \TxLine~14_combout\ : std_logic;
SIGNAL \CharSec[0][0]~6_combout\ : std_logic;
SIGNAL \CharSec[0][0]~7_combout\ : std_logic;
SIGNAL \CharSec[0][2]~9_combout\ : std_logic;
SIGNAL \Equal20~0_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \CharSec[0][1]~8_combout\ : std_logic;
SIGNAL \Mux6~5_combout\ : std_logic;
SIGNAL \Mux6~6_combout\ : std_logic;
SIGNAL \TxLine~5_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~9\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~11\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[60]~87_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[60]~86_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~13\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[70]~98_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[70]~97_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~15\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[80]~108_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[80]~109_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\ : std_logic;
SIGNAL \Add13~1\ : std_logic;
SIGNAL \Add13~3\ : std_logic;
SIGNAL \Add13~5\ : std_logic;
SIGNAL \Add13~7\ : std_logic;
SIGNAL \Add13~8_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ : std_logic;
SIGNAL \Add13~9\ : std_logic;
SIGNAL \Add13~11\ : std_logic;
SIGNAL \Add13~12_combout\ : std_logic;
SIGNAL \Add13~10_combout\ : std_logic;
SIGNAL \Add13~2_combout\ : std_logic;
SIGNAL \CharMsec~3_combout\ : std_logic;
SIGNAL \Add13~4_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ : std_logic;
SIGNAL \Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ : std_logic;
SIGNAL \Add13~13\ : std_logic;
SIGNAL \Add13~15\ : std_logic;
SIGNAL \Add13~17\ : std_logic;
SIGNAL \Add13~18_combout\ : std_logic;
SIGNAL \Add13~6_combout\ : std_logic;
SIGNAL \Add13~0_combout\ : std_logic;
SIGNAL \CharMsec~2_combout\ : std_logic;
SIGNAL \Add13~14_combout\ : std_logic;
SIGNAL \Add13~16_combout\ : std_logic;
SIGNAL \CharMsec~4_combout\ : std_logic;
SIGNAL \CharMsec[2][3]~5_combout\ : std_logic;
SIGNAL \CharMsec[2][3]~6_combout\ : std_logic;
SIGNAL \CharMsec[2][3]~7_combout\ : std_logic;
SIGNAL \CharMsec[2][3]~8_combout\ : std_logic;
SIGNAL \CharMsec~9_combout\ : std_logic;
SIGNAL \Equal55~1_combout\ : std_logic;
SIGNAL \Equal54~0_combout\ : std_logic;
SIGNAL \Equal55~0_combout\ : std_logic;
SIGNAL \Equal54~1_combout\ : std_logic;
SIGNAL \Equal54~2_combout\ : std_logic;
SIGNAL \CharMsec~10_combout\ : std_logic;
SIGNAL \Equal50~0_combout\ : std_logic;
SIGNAL \Equal50~1_combout\ : std_logic;
SIGNAL \Equal50~2_combout\ : std_logic;
SIGNAL \Equal51~0_combout\ : std_logic;
SIGNAL \Equal51~1_combout\ : std_logic;
SIGNAL \Equal51~2_combout\ : std_logic;
SIGNAL \CharMsec[2][3]~11_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~13_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~12_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~14_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~15_combout\ : std_logic;
SIGNAL \Equal56~0_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~16_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~17_combout\ : std_logic;
SIGNAL \CharMsec[2][0]~18_combout\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~11\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~13\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~15\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~17\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\ : std_logic;
SIGNAL \Add12~1\ : std_logic;
SIGNAL \Add12~3\ : std_logic;
SIGNAL \Add12~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ : std_logic;
SIGNAL \Add12~5\ : std_logic;
SIGNAL \Add12~7\ : std_logic;
SIGNAL \Add12~8_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ : std_logic;
SIGNAL \Add12~9\ : std_logic;
SIGNAL \Add12~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\ : std_logic;
SIGNAL \Add12~11\ : std_logic;
SIGNAL \Add12~13\ : std_logic;
SIGNAL \Add12~15\ : std_logic;
SIGNAL \Add12~17\ : std_logic;
SIGNAL \Add12~18_combout\ : std_logic;
SIGNAL \Add12~14_combout\ : std_logic;
SIGNAL \Add12~16_combout\ : std_logic;
SIGNAL \Add12~12_combout\ : std_logic;
SIGNAL \Equal41~0_combout\ : std_logic;
SIGNAL \Equal48~0_combout\ : std_logic;
SIGNAL \Add12~0_combout\ : std_logic;
SIGNAL \Add12~2_combout\ : std_logic;
SIGNAL \Add12~6_combout\ : std_logic;
SIGNAL \CharMsec[1][0]~31_combout\ : std_logic;
SIGNAL \CharMsec[1][0]~32_combout\ : std_logic;
SIGNAL \Equal46~0_combout\ : std_logic;
SIGNAL \CharMsec[1][0]~33_combout\ : std_logic;
SIGNAL \CharMsec~20_combout\ : std_logic;
SIGNAL \CharMsec~19_combout\ : std_logic;
SIGNAL \CharMsec~21_combout\ : std_logic;
SIGNAL \CharMsec~23_combout\ : std_logic;
SIGNAL \CharMsec~24_combout\ : std_logic;
SIGNAL \CharMsec[1][3]~25_combout\ : std_logic;
SIGNAL \CharMsec[1][3]~26_combout\ : std_logic;
SIGNAL \CharMsec[1][3]~27_combout\ : std_logic;
SIGNAL \CharMsec~28_combout\ : std_logic;
SIGNAL \CharMsec~29_combout\ : std_logic;
SIGNAL \CharMsec~30_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Equal43~0_combout\ : std_logic;
SIGNAL \CharMsec[1][3]~22_combout\ : std_logic;
SIGNAL \CharMsec~37_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \TxLine~22_combout\ : std_logic;
SIGNAL \TxLine~23_combout\ : std_logic;
SIGNAL \CharMsec[0][0]~35_combout\ : std_logic;
SIGNAL \Equal32~0_combout\ : std_logic;
SIGNAL \CharMsec[0][0]~36_combout\ : std_logic;
SIGNAL \Equal32~1_combout\ : std_logic;
SIGNAL \CharMsec~34_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Mux10~2_combout\ : std_logic;
SIGNAL \TxLine~21_combout\ : std_logic;
SIGNAL \TxLine~15_combout\ : std_logic;
SIGNAL \TxLine~16_combout\ : std_logic;
SIGNAL \TxLine~17_combout\ : std_logic;
SIGNAL \NxParBit~2_combout\ : std_logic;
SIGNAL \ParBit~q\ : std_logic;
SIGNAL \TxLine~4_combout\ : std_logic;
SIGNAL \TxLine~18_combout\ : std_logic;
SIGNAL \TxLine~19_combout\ : std_logic;
SIGNAL Msec : std_logic_vector(9 DOWNTO 0);
SIGNAL OvBitCnt : std_logic_vector(17 DOWNTO 0);
SIGNAL MsgFrIdx : std_logic_vector(3 DOWNTO 0);
SIGNAL Sec : std_logic_vector(5 DOWNTO 0);
SIGNAL Min : std_logic_vector(5 DOWNTO 0);
SIGNAL FrBitCnt : std_logic_vector(3 DOWNTO 0);
SIGNAL State : std_logic_vector(1 DOWNTO 0);
SIGNAL CntUART : std_logic_vector(7 DOWNTO 0);
SIGNAL Cnt1kHz : std_logic_vector(14 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLK <= CLK;
ww_BTN <= BTN;
ww_SWT <= SWT;
TXL <= ww_TXL;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Clk1kHz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk1kHz~q\);

\ClkUART~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ClkUART~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
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

-- Location: IOOBUF_X24_Y0_N30
\TXL~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TxLine~19_combout\,
	devoe => ww_devoe,
	o => \TXL~output_o\);

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

-- Location: LCCOMB_X2_Y38_N14
\Add4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = CntUART(0) $ (VCC)
-- \Add4~1\ = CARRY(CntUART(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => CntUART(0),
	datad => VCC,
	combout => \Add4~0_combout\,
	cout => \Add4~1\);

-- Location: FF_X2_Y38_N15
\CntUART[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(0));

-- Location: LCCOMB_X2_Y38_N16
\Add4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (CntUART(1) & (!\Add4~1\)) # (!CntUART(1) & ((\Add4~1\) # (GND)))
-- \Add4~3\ = CARRY((!\Add4~1\) # (!CntUART(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(1),
	datad => VCC,
	cin => \Add4~1\,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X2_Y38_N18
\Add4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (CntUART(2) & (\Add4~3\ $ (GND))) # (!CntUART(2) & (!\Add4~3\ & VCC))
-- \Add4~5\ = CARRY((CntUART(2) & !\Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntUART(2),
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: FF_X2_Y38_N19
\CntUART[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add4~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(2));

-- Location: LCCOMB_X2_Y38_N20
\Add4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (CntUART(3) & (!\Add4~5\)) # (!CntUART(3) & ((\Add4~5\) # (GND)))
-- \Add4~7\ = CARRY((!\Add4~5\) # (!CntUART(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntUART(3),
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: LCCOMB_X2_Y38_N2
\NxCntUART[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[3]~4_combout\ = (\Add4~6_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Add4~6_combout\,
	datac => \Equal1~0_combout\,
	combout => \NxCntUART[3]~4_combout\);

-- Location: FF_X2_Y38_N3
\CntUART[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(3));

-- Location: LCCOMB_X2_Y38_N22
\Add4~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (CntUART(4) & (\Add4~7\ $ (GND))) # (!CntUART(4) & (!\Add4~7\ & VCC))
-- \Add4~9\ = CARRY((CntUART(4) & !\Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(4),
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: LCCOMB_X2_Y38_N30
\NxCntUART[4]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[4]~3_combout\ = (\Add4~8_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Equal1~0_combout\,
	datac => \Add4~8_combout\,
	combout => \NxCntUART[4]~3_combout\);

-- Location: FF_X2_Y38_N31
\CntUART[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(4));

-- Location: LCCOMB_X2_Y38_N24
\Add4~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (CntUART(5) & (!\Add4~9\)) # (!CntUART(5) & ((\Add4~9\) # (GND)))
-- \Add4~11\ = CARRY((!\Add4~9\) # (!CntUART(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => CntUART(5),
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: LCCOMB_X2_Y38_N4
\NxCntUART[5]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[5]~2_combout\ = (\Add4~10_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Add4~10_combout\,
	datac => \Equal1~0_combout\,
	combout => \NxCntUART[5]~2_combout\);

-- Location: FF_X2_Y38_N5
\CntUART[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(5));

-- Location: LCCOMB_X2_Y38_N26
\Add4~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (CntUART(6) & (\Add4~11\ $ (GND))) # (!CntUART(6) & (!\Add4~11\ & VCC))
-- \Add4~13\ = CARRY((CntUART(6) & !\Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(6),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: LCCOMB_X2_Y38_N10
\NxCntUART[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[6]~1_combout\ = (\Add4~12_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Equal1~0_combout\,
	datac => \Add4~12_combout\,
	combout => \NxCntUART[6]~1_combout\);

-- Location: FF_X2_Y38_N11
\CntUART[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(6));

-- Location: LCCOMB_X2_Y38_N28
\Add4~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = \Add4~13\ $ (CntUART(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => CntUART(7),
	cin => \Add4~13\,
	combout => \Add4~14_combout\);

-- Location: LCCOMB_X2_Y38_N0
\NxCntUART[7]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[7]~0_combout\ = (\Add4~14_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Add4~14_combout\,
	datac => \Equal1~0_combout\,
	combout => \NxCntUART[7]~0_combout\);

-- Location: FF_X2_Y38_N1
\CntUART[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(7));

-- Location: LCCOMB_X2_Y38_N8
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (CntUART(4) & (CntUART(7) & (CntUART(5) & CntUART(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(4),
	datab => CntUART(7),
	datac => CntUART(5),
	datad => CntUART(6),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X2_Y38_N12
\NxCntUART[1]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCntUART[1]~5_combout\ = (\Add4~2_combout\ & ((!\Equal1~0_combout\) # (!\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Add4~2_combout\,
	datac => \Equal1~0_combout\,
	combout => \NxCntUART[1]~5_combout\);

-- Location: FF_X2_Y38_N13
\CntUART[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCntUART[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CntUART(1));

-- Location: LCCOMB_X2_Y38_N6
\Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!CntUART(1) & (CntUART(3) & (CntUART(0) & !CntUART(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(1),
	datab => CntUART(3),
	datac => CntUART(0),
	datad => CntUART(2),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X1_Y38_N14
\ClkUART~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ClkUART~0_combout\ = \ClkUART~q\ $ (((\Equal1~1_combout\ & \Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Equal1~0_combout\,
	datac => \ClkUART~q\,
	combout => \ClkUART~0_combout\);

-- Location: FF_X1_Y38_N15
ClkUART : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \ClkUART~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ClkUART~q\);

-- Location: CLKCTRL_G2
\ClkUART~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ClkUART~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ClkUART~clkctrl_outclk\);

-- Location: LCCOMB_X49_Y50_N14
\OvBitCnt[0]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[0]~18_combout\ = OvBitCnt(0) $ (VCC)
-- \OvBitCnt[0]~19\ = CARRY(OvBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(0),
	datad => VCC,
	combout => \OvBitCnt[0]~18_combout\,
	cout => \OvBitCnt[0]~19\);

-- Location: LCCOMB_X49_Y50_N4
\NxMsgFrIdx~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~3_combout\ = (OvBitCnt(4) & (!OvBitCnt(3) & (OvBitCnt(0) & OvBitCnt(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(4),
	datab => OvBitCnt(3),
	datac => OvBitCnt(0),
	datad => OvBitCnt(7),
	combout => \NxMsgFrIdx~3_combout\);

-- Location: LCCOMB_X49_Y50_N6
\NxMsgFrIdx~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~4_combout\ = (!OvBitCnt(5) & (!OvBitCnt(1) & (!OvBitCnt(6) & OvBitCnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(5),
	datab => OvBitCnt(1),
	datac => OvBitCnt(6),
	datad => OvBitCnt(2),
	combout => \NxMsgFrIdx~4_combout\);

-- Location: IOIBUF_X46_Y54_N29
\BTN~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BTN,
	o => \BTN~input_o\);

-- Location: LCCOMB_X52_Y50_N18
\Pushed~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Pushed~0_combout\ = !\BTN~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BTN~input_o\,
	combout => \Pushed~0_combout\);

-- Location: FF_X52_Y50_N19
Pushed : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \Pushed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Pushed~q\);

-- Location: LCCOMB_X52_Y50_N14
\NxResetD~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxResetD~0_combout\ = (!\BTN~input_o\ & !\Pushed~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BTN~input_o\,
	datad => \Pushed~q\,
	combout => \NxResetD~0_combout\);

-- Location: LCCOMB_X49_Y50_N30
\OvBitCnt[8]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[8]~34_combout\ = (OvBitCnt(8) & (\OvBitCnt[7]~33\ $ (GND))) # (!OvBitCnt(8) & (!\OvBitCnt[7]~33\ & VCC))
-- \OvBitCnt[8]~35\ = CARRY((OvBitCnt(8) & !\OvBitCnt[7]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(8),
	datad => VCC,
	cin => \OvBitCnt[7]~33\,
	combout => \OvBitCnt[8]~34_combout\,
	cout => \OvBitCnt[8]~35\);

-- Location: LCCOMB_X49_Y49_N0
\OvBitCnt[9]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[9]~36_combout\ = (OvBitCnt(9) & (!\OvBitCnt[8]~35\)) # (!OvBitCnt(9) & ((\OvBitCnt[8]~35\) # (GND)))
-- \OvBitCnt[9]~37\ = CARRY((!\OvBitCnt[8]~35\) # (!OvBitCnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(9),
	datad => VCC,
	cin => \OvBitCnt[8]~35\,
	combout => \OvBitCnt[9]~36_combout\,
	cout => \OvBitCnt[9]~37\);

-- Location: FF_X49_Y49_N1
\OvBitCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[9]~36_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(9));

-- Location: LCCOMB_X49_Y49_N2
\OvBitCnt[10]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[10]~38_combout\ = (OvBitCnt(10) & (\OvBitCnt[9]~37\ $ (GND))) # (!OvBitCnt(10) & (!\OvBitCnt[9]~37\ & VCC))
-- \OvBitCnt[10]~39\ = CARRY((OvBitCnt(10) & !\OvBitCnt[9]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(10),
	datad => VCC,
	cin => \OvBitCnt[9]~37\,
	combout => \OvBitCnt[10]~38_combout\,
	cout => \OvBitCnt[10]~39\);

-- Location: FF_X49_Y49_N3
\OvBitCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[10]~38_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(10));

-- Location: LCCOMB_X49_Y49_N4
\OvBitCnt[11]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[11]~40_combout\ = (OvBitCnt(11) & (!\OvBitCnt[10]~39\)) # (!OvBitCnt(11) & ((\OvBitCnt[10]~39\) # (GND)))
-- \OvBitCnt[11]~41\ = CARRY((!\OvBitCnt[10]~39\) # (!OvBitCnt(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(11),
	datad => VCC,
	cin => \OvBitCnt[10]~39\,
	combout => \OvBitCnt[11]~40_combout\,
	cout => \OvBitCnt[11]~41\);

-- Location: FF_X49_Y49_N5
\OvBitCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[11]~40_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(11));

-- Location: LCCOMB_X49_Y49_N6
\OvBitCnt[12]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[12]~42_combout\ = (OvBitCnt(12) & (\OvBitCnt[11]~41\ $ (GND))) # (!OvBitCnt(12) & (!\OvBitCnt[11]~41\ & VCC))
-- \OvBitCnt[12]~43\ = CARRY((OvBitCnt(12) & !\OvBitCnt[11]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(12),
	datad => VCC,
	cin => \OvBitCnt[11]~41\,
	combout => \OvBitCnt[12]~42_combout\,
	cout => \OvBitCnt[12]~43\);

-- Location: FF_X49_Y49_N7
\OvBitCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[12]~42_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(12));

-- Location: LCCOMB_X49_Y49_N8
\OvBitCnt[13]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[13]~44_combout\ = (OvBitCnt(13) & (!\OvBitCnt[12]~43\)) # (!OvBitCnt(13) & ((\OvBitCnt[12]~43\) # (GND)))
-- \OvBitCnt[13]~45\ = CARRY((!\OvBitCnt[12]~43\) # (!OvBitCnt(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(13),
	datad => VCC,
	cin => \OvBitCnt[12]~43\,
	combout => \OvBitCnt[13]~44_combout\,
	cout => \OvBitCnt[13]~45\);

-- Location: FF_X49_Y49_N9
\OvBitCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[13]~44_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(13));

-- Location: LCCOMB_X49_Y49_N10
\OvBitCnt[14]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[14]~46_combout\ = (OvBitCnt(14) & (\OvBitCnt[13]~45\ $ (GND))) # (!OvBitCnt(14) & (!\OvBitCnt[13]~45\ & VCC))
-- \OvBitCnt[14]~47\ = CARRY((OvBitCnt(14) & !\OvBitCnt[13]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(14),
	datad => VCC,
	cin => \OvBitCnt[13]~45\,
	combout => \OvBitCnt[14]~46_combout\,
	cout => \OvBitCnt[14]~47\);

-- Location: FF_X49_Y49_N11
\OvBitCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[14]~46_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(14));

-- Location: LCCOMB_X49_Y49_N12
\OvBitCnt[15]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[15]~48_combout\ = (OvBitCnt(15) & (!\OvBitCnt[14]~47\)) # (!OvBitCnt(15) & ((\OvBitCnt[14]~47\) # (GND)))
-- \OvBitCnt[15]~49\ = CARRY((!\OvBitCnt[14]~47\) # (!OvBitCnt(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(15),
	datad => VCC,
	cin => \OvBitCnt[14]~47\,
	combout => \OvBitCnt[15]~48_combout\,
	cout => \OvBitCnt[15]~49\);

-- Location: FF_X49_Y49_N13
\OvBitCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[15]~48_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(15));

-- Location: LCCOMB_X49_Y49_N14
\OvBitCnt[16]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[16]~50_combout\ = (OvBitCnt(16) & (\OvBitCnt[15]~49\ $ (GND))) # (!OvBitCnt(16) & (!\OvBitCnt[15]~49\ & VCC))
-- \OvBitCnt[16]~51\ = CARRY((OvBitCnt(16) & !\OvBitCnt[15]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(16),
	datad => VCC,
	cin => \OvBitCnt[15]~49\,
	combout => \OvBitCnt[16]~50_combout\,
	cout => \OvBitCnt[16]~51\);

-- Location: FF_X49_Y49_N15
\OvBitCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[16]~50_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(16));

-- Location: LCCOMB_X49_Y49_N16
\OvBitCnt[17]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[17]~52_combout\ = \OvBitCnt[16]~51\ $ (OvBitCnt(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => OvBitCnt(17),
	cin => \OvBitCnt[16]~51\,
	combout => \OvBitCnt[17]~52_combout\);

-- Location: FF_X49_Y49_N17
\OvBitCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[17]~52_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(17));

-- Location: LCCOMB_X52_Y50_N20
\State[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \State[1]~0_combout\ = (!\SWT~input_o\ & (!\BTN~input_o\ & !\Pushed~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \BTN~input_o\,
	datad => \Pushed~q\,
	combout => \State[1]~0_combout\);

-- Location: FF_X52_Y50_N21
\State[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	asdata => \Mux13~0_combout\,
	sload => VCC,
	ena => \State[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(0));

-- Location: LCCOMB_X52_Y50_N30
\NxState~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxState~0_combout\ = (!State(1) & State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(1),
	datad => State(0),
	combout => \NxState~0_combout\);

-- Location: FF_X52_Y50_N31
\State[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxState~0_combout\,
	ena => \State[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(1));

-- Location: LCCOMB_X52_Y50_N8
\Mux13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (!State(0) & !State(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => State(0),
	datac => State(1),
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X49_Y50_N8
\LessThan4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (OvBitCnt(2) & ((OvBitCnt(4) & ((OvBitCnt(1)) # (OvBitCnt(0)))) # (!OvBitCnt(4) & (OvBitCnt(1) & OvBitCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(4),
	datab => OvBitCnt(1),
	datac => OvBitCnt(0),
	datad => OvBitCnt(2),
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X49_Y50_N10
\LessThan4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (OvBitCnt(4) & ((OvBitCnt(3)) # ((\LessThan4~0_combout\) # (!\SWT~input_o\)))) # (!OvBitCnt(4) & (OvBitCnt(3) & (\LessThan4~0_combout\ & !\SWT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(4),
	datab => OvBitCnt(3),
	datac => \LessThan4~0_combout\,
	datad => \SWT~input_o\,
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X49_Y50_N12
\LessThan4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~2_combout\ = (\LessThan4~1_combout\ & (!\SWT~input_o\ & (!OvBitCnt(5) & State(0)))) # (!\LessThan4~1_combout\ & (((!\SWT~input_o\ & State(0))) # (!OvBitCnt(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~1_combout\,
	datab => \SWT~input_o\,
	datac => OvBitCnt(5),
	datad => State(0),
	combout => \LessThan4~2_combout\);

-- Location: LCCOMB_X52_Y50_N6
\LessThan4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~3_combout\ = (OvBitCnt(6) & (!\SWT~input_o\ & (!State(1) & \LessThan4~2_combout\))) # (!OvBitCnt(6) & ((\LessThan4~2_combout\) # ((!\SWT~input_o\ & !State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => OvBitCnt(6),
	datac => State(1),
	datad => \LessThan4~2_combout\,
	combout => \LessThan4~3_combout\);

-- Location: LCCOMB_X52_Y50_N26
\LessThan4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~4_combout\ = (OvBitCnt(7) & (\LessThan4~3_combout\ & ((\SWT~input_o\) # (!\Mux13~0_combout\)))) # (!OvBitCnt(7) & ((\SWT~input_o\) # ((\LessThan4~3_combout\) # (!\Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \Mux13~0_combout\,
	datac => OvBitCnt(7),
	datad => \LessThan4~3_combout\,
	combout => \LessThan4~4_combout\);

-- Location: LCCOMB_X52_Y50_N12
\LessThan4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~5_combout\ = (\LessThan4~4_combout\ & (((!State(1) & !\SWT~input_o\)) # (!OvBitCnt(8)))) # (!\LessThan4~4_combout\ & (!OvBitCnt(8) & (!State(1) & !\SWT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~4_combout\,
	datab => OvBitCnt(8),
	datac => State(1),
	datad => \SWT~input_o\,
	combout => \LessThan4~5_combout\);

-- Location: LCCOMB_X52_Y50_N22
\LessThan4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~6_combout\ = (OvBitCnt(9) & (!\SWT~input_o\ & (\Mux13~0_combout\ & \LessThan4~5_combout\))) # (!OvBitCnt(9) & ((\LessThan4~5_combout\) # ((!\SWT~input_o\ & \Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \Mux13~0_combout\,
	datac => OvBitCnt(9),
	datad => \LessThan4~5_combout\,
	combout => \LessThan4~6_combout\);

-- Location: LCCOMB_X49_Y49_N24
\Ncyc[11]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Ncyc[11]~0_combout\ = (!\SWT~input_o\ & State(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SWT~input_o\,
	datad => State(0),
	combout => \Ncyc[11]~0_combout\);

-- Location: LCCOMB_X49_Y49_N26
\LessThan4~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~7_combout\ = (\Ncyc[11]~0_combout\ & (((\LessThan4~6_combout\ & !OvBitCnt(10))) # (!OvBitCnt(11)))) # (!\Ncyc[11]~0_combout\ & (\LessThan4~6_combout\ & (!OvBitCnt(11) & !OvBitCnt(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~6_combout\,
	datab => \Ncyc[11]~0_combout\,
	datac => OvBitCnt(11),
	datad => OvBitCnt(10),
	combout => \LessThan4~7_combout\);

-- Location: LCCOMB_X49_Y49_N28
\LessThan4~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~8_combout\ = (OvBitCnt(12) & (!\SWT~input_o\ & (\LessThan4~7_combout\ & State(1)))) # (!OvBitCnt(12) & ((\LessThan4~7_combout\) # ((!\SWT~input_o\ & State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(12),
	datab => \SWT~input_o\,
	datac => \LessThan4~7_combout\,
	datad => State(1),
	combout => \LessThan4~8_combout\);

-- Location: LCCOMB_X49_Y49_N30
\LessThan4~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~9_combout\ = (OvBitCnt(14) & (\LessThan4~8_combout\ & (!OvBitCnt(13) & !\SWT~input_o\))) # (!OvBitCnt(14) & (((\LessThan4~8_combout\ & !OvBitCnt(13))) # (!\SWT~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(14),
	datab => \LessThan4~8_combout\,
	datac => OvBitCnt(13),
	datad => \SWT~input_o\,
	combout => \LessThan4~9_combout\);

-- Location: LCCOMB_X49_Y51_N8
\LessThan4~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~10_combout\ = (\LessThan4~9_combout\ & (((!\SWT~input_o\ & !State(0))) # (!OvBitCnt(15)))) # (!\LessThan4~9_combout\ & (!OvBitCnt(15) & (!\SWT~input_o\ & !State(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~9_combout\,
	datab => OvBitCnt(15),
	datac => \SWT~input_o\,
	datad => State(0),
	combout => \LessThan4~10_combout\);

-- Location: LCCOMB_X52_Y50_N24
\LessThan4~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~11_combout\ = (OvBitCnt(16) & (\LessThan4~10_combout\ & (State(1) & !\SWT~input_o\))) # (!OvBitCnt(16) & ((\LessThan4~10_combout\) # ((State(1) & !\SWT~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(16),
	datab => \LessThan4~10_combout\,
	datac => State(1),
	datad => \SWT~input_o\,
	combout => \LessThan4~11_combout\);

-- Location: LCCOMB_X52_Y50_N10
\LessThan4~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~12_combout\ = (OvBitCnt(17) & (!\SWT~input_o\ & (!\Mux13~0_combout\ & \LessThan4~11_combout\))) # (!OvBitCnt(17) & ((\LessThan4~11_combout\) # ((!\SWT~input_o\ & !\Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => OvBitCnt(17),
	datac => \Mux13~0_combout\,
	datad => \LessThan4~11_combout\,
	combout => \LessThan4~12_combout\);

-- Location: LCCOMB_X52_Y50_N0
\NxResetD~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxResetD~1_combout\ = (\SWT~input_o\ & ((\NxResetD~0_combout\) # ((\ResetD~q\ & \LessThan4~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \NxResetD~0_combout\,
	datac => \ResetD~q\,
	datad => \LessThan4~12_combout\,
	combout => \NxResetD~1_combout\);

-- Location: FF_X52_Y50_N1
ResetD : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxResetD~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ResetD~q\);

-- Location: LCCOMB_X52_Y50_N16
\NxMsgFrIdx~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~5_combout\ = ((\NxMsgFrIdx~3_combout\ & (\NxMsgFrIdx~2_combout\ & \NxMsgFrIdx~4_combout\))) # (!\ResetD~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxMsgFrIdx~3_combout\,
	datab => \NxMsgFrIdx~2_combout\,
	datac => \NxMsgFrIdx~4_combout\,
	datad => \ResetD~q\,
	combout => \NxMsgFrIdx~5_combout\);

-- Location: LCCOMB_X52_Y50_N4
\NxMsgFrIdx~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~6_combout\ = (State(1) & (!\Pushed~q\ & (!\BTN~input_o\ & !State(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \Pushed~q\,
	datac => \BTN~input_o\,
	datad => State(0),
	combout => \NxMsgFrIdx~6_combout\);

-- Location: LCCOMB_X52_Y50_N28
\NxMsgFrIdx~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~7_combout\ = (\SWT~input_o\ & (\NxMsgFrIdx~5_combout\)) # (!\SWT~input_o\ & (((\NxMsgFrIdx~6_combout\) # (!\LessThan4~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \NxMsgFrIdx~5_combout\,
	datac => \NxMsgFrIdx~6_combout\,
	datad => \LessThan4~12_combout\,
	combout => \NxMsgFrIdx~7_combout\);

-- Location: FF_X49_Y50_N15
\OvBitCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[0]~18_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(0));

-- Location: LCCOMB_X49_Y50_N16
\OvBitCnt[1]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[1]~20_combout\ = (OvBitCnt(1) & (!\OvBitCnt[0]~19\)) # (!OvBitCnt(1) & ((\OvBitCnt[0]~19\) # (GND)))
-- \OvBitCnt[1]~21\ = CARRY((!\OvBitCnt[0]~19\) # (!OvBitCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(1),
	datad => VCC,
	cin => \OvBitCnt[0]~19\,
	combout => \OvBitCnt[1]~20_combout\,
	cout => \OvBitCnt[1]~21\);

-- Location: FF_X49_Y50_N17
\OvBitCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[1]~20_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(1));

-- Location: LCCOMB_X49_Y50_N18
\OvBitCnt[2]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[2]~22_combout\ = (OvBitCnt(2) & (\OvBitCnt[1]~21\ $ (GND))) # (!OvBitCnt(2) & (!\OvBitCnt[1]~21\ & VCC))
-- \OvBitCnt[2]~23\ = CARRY((OvBitCnt(2) & !\OvBitCnt[1]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(2),
	datad => VCC,
	cin => \OvBitCnt[1]~21\,
	combout => \OvBitCnt[2]~22_combout\,
	cout => \OvBitCnt[2]~23\);

-- Location: FF_X49_Y50_N19
\OvBitCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[2]~22_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(2));

-- Location: LCCOMB_X49_Y50_N20
\OvBitCnt[3]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[3]~24_combout\ = (OvBitCnt(3) & (!\OvBitCnt[2]~23\)) # (!OvBitCnt(3) & ((\OvBitCnt[2]~23\) # (GND)))
-- \OvBitCnt[3]~25\ = CARRY((!\OvBitCnt[2]~23\) # (!OvBitCnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(3),
	datad => VCC,
	cin => \OvBitCnt[2]~23\,
	combout => \OvBitCnt[3]~24_combout\,
	cout => \OvBitCnt[3]~25\);

-- Location: FF_X49_Y50_N21
\OvBitCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[3]~24_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(3));

-- Location: LCCOMB_X49_Y50_N22
\OvBitCnt[4]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[4]~26_combout\ = (OvBitCnt(4) & (\OvBitCnt[3]~25\ $ (GND))) # (!OvBitCnt(4) & (!\OvBitCnt[3]~25\ & VCC))
-- \OvBitCnt[4]~27\ = CARRY((OvBitCnt(4) & !\OvBitCnt[3]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(4),
	datad => VCC,
	cin => \OvBitCnt[3]~25\,
	combout => \OvBitCnt[4]~26_combout\,
	cout => \OvBitCnt[4]~27\);

-- Location: FF_X49_Y50_N23
\OvBitCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[4]~26_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(4));

-- Location: LCCOMB_X49_Y50_N24
\OvBitCnt[5]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[5]~28_combout\ = (OvBitCnt(5) & (!\OvBitCnt[4]~27\)) # (!OvBitCnt(5) & ((\OvBitCnt[4]~27\) # (GND)))
-- \OvBitCnt[5]~29\ = CARRY((!\OvBitCnt[4]~27\) # (!OvBitCnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(5),
	datad => VCC,
	cin => \OvBitCnt[4]~27\,
	combout => \OvBitCnt[5]~28_combout\,
	cout => \OvBitCnt[5]~29\);

-- Location: FF_X49_Y50_N25
\OvBitCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[5]~28_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(5));

-- Location: LCCOMB_X49_Y50_N26
\OvBitCnt[6]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[6]~30_combout\ = (OvBitCnt(6) & (\OvBitCnt[5]~29\ $ (GND))) # (!OvBitCnt(6) & (!\OvBitCnt[5]~29\ & VCC))
-- \OvBitCnt[6]~31\ = CARRY((OvBitCnt(6) & !\OvBitCnt[5]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(6),
	datad => VCC,
	cin => \OvBitCnt[5]~29\,
	combout => \OvBitCnt[6]~30_combout\,
	cout => \OvBitCnt[6]~31\);

-- Location: FF_X49_Y50_N27
\OvBitCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[6]~30_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(6));

-- Location: LCCOMB_X49_Y50_N28
\OvBitCnt[7]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \OvBitCnt[7]~32_combout\ = (OvBitCnt(7) & (!\OvBitCnt[6]~31\)) # (!OvBitCnt(7) & ((\OvBitCnt[6]~31\) # (GND)))
-- \OvBitCnt[7]~33\ = CARRY((!\OvBitCnt[6]~31\) # (!OvBitCnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => OvBitCnt(7),
	datad => VCC,
	cin => \OvBitCnt[6]~31\,
	combout => \OvBitCnt[7]~32_combout\,
	cout => \OvBitCnt[7]~33\);

-- Location: FF_X49_Y50_N29
\OvBitCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[7]~32_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(7));

-- Location: FF_X49_Y50_N31
\OvBitCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \OvBitCnt[8]~34_combout\,
	sclr => \NxMsgFrIdx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => OvBitCnt(8));

-- Location: LCCOMB_X49_Y49_N18
\NxMsgFrIdx~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~0_combout\ = (!OvBitCnt(8) & (!OvBitCnt(10) & (!OvBitCnt(11) & !OvBitCnt(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(8),
	datab => OvBitCnt(10),
	datac => OvBitCnt(11),
	datad => OvBitCnt(9),
	combout => \NxMsgFrIdx~0_combout\);

-- Location: LCCOMB_X49_Y49_N20
\NxMsgFrIdx~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~1_combout\ = (!OvBitCnt(12) & (!OvBitCnt(15) & (!OvBitCnt(13) & !OvBitCnt(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(12),
	datab => OvBitCnt(15),
	datac => OvBitCnt(13),
	datad => OvBitCnt(14),
	combout => \NxMsgFrIdx~1_combout\);

-- Location: LCCOMB_X49_Y49_N22
\NxMsgFrIdx~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx~2_combout\ = (\NxMsgFrIdx~0_combout\ & (\NxMsgFrIdx~1_combout\ & (!OvBitCnt(16) & !OvBitCnt(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxMsgFrIdx~0_combout\,
	datab => \NxMsgFrIdx~1_combout\,
	datac => OvBitCnt(16),
	datad => OvBitCnt(17),
	combout => \NxMsgFrIdx~2_combout\);

-- Location: LCCOMB_X49_Y50_N0
\TxLine_Handler~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine_Handler~0_combout\ = (OvBitCnt(4) & ((OvBitCnt(3)) # ((OvBitCnt(1) & OvBitCnt(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(1),
	datab => OvBitCnt(2),
	datac => OvBitCnt(4),
	datad => OvBitCnt(3),
	combout => \TxLine_Handler~0_combout\);

-- Location: LCCOMB_X49_Y50_N2
\TxLine_Handler~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine_Handler~1_combout\ = (OvBitCnt(7) & ((OvBitCnt(5)) # ((\TxLine_Handler~0_combout\) # (OvBitCnt(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => OvBitCnt(5),
	datab => \TxLine_Handler~0_combout\,
	datac => OvBitCnt(6),
	datad => OvBitCnt(7),
	combout => \TxLine_Handler~1_combout\);

-- Location: LCCOMB_X52_Y50_N2
\TxLine_Handler~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine_Handler~2_combout\ = ((\TxLine_Handler~1_combout\) # ((\SWT~input_o\ & !\ResetD~q\))) # (!\NxMsgFrIdx~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT~input_o\,
	datab => \NxMsgFrIdx~2_combout\,
	datac => \TxLine_Handler~1_combout\,
	datad => \ResetD~q\,
	combout => \TxLine_Handler~2_combout\);

-- Location: LCCOMB_X54_Y46_N2
\NxFrBitCnt[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxFrBitCnt[0]~5_combout\ = (!\NxMsgFrIdx~7_combout\ & !FrBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxMsgFrIdx~7_combout\,
	datac => FrBitCnt(0),
	combout => \NxFrBitCnt[0]~5_combout\);

-- Location: FF_X54_Y46_N3
\FrBitCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxFrBitCnt[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => FrBitCnt(0));

-- Location: LCCOMB_X54_Y46_N20
\NxFrBitCnt[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxFrBitCnt[2]~6_combout\ = (!\MsgFrIdx[3]~0_combout\ & (FrBitCnt(2) $ (((FrBitCnt(1) & FrBitCnt(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => \MsgFrIdx[3]~0_combout\,
	datac => FrBitCnt(2),
	datad => FrBitCnt(0),
	combout => \NxFrBitCnt[2]~6_combout\);

-- Location: FF_X54_Y46_N21
\FrBitCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxFrBitCnt[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => FrBitCnt(2));

-- Location: LCCOMB_X54_Y46_N8
\Equal59~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal59~0_combout\ = (!FrBitCnt(2) & !FrBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => FrBitCnt(2),
	datac => FrBitCnt(1),
	combout => \Equal59~0_combout\);

-- Location: LCCOMB_X54_Y46_N14
\MsgFrIdx[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \MsgFrIdx[3]~0_combout\ = (\NxMsgFrIdx~7_combout\) # ((FrBitCnt(3) & (\Equal59~0_combout\ & FrBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(3),
	datab => \Equal59~0_combout\,
	datac => \NxMsgFrIdx~7_combout\,
	datad => FrBitCnt(0),
	combout => \MsgFrIdx[3]~0_combout\);

-- Location: LCCOMB_X54_Y46_N30
\NxFrBitCnt[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxFrBitCnt[1]~7_combout\ = (!\MsgFrIdx[3]~0_combout\ & (FrBitCnt(1) $ (FrBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MsgFrIdx[3]~0_combout\,
	datac => FrBitCnt(1),
	datad => FrBitCnt(0),
	combout => \NxFrBitCnt[1]~7_combout\);

-- Location: FF_X54_Y46_N31
\FrBitCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxFrBitCnt[1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => FrBitCnt(1));

-- Location: LCCOMB_X54_Y46_N0
\Add9~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~1_combout\ = (FrBitCnt(0) & FrBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => FrBitCnt(0),
	datac => FrBitCnt(1),
	combout => \Add9~1_combout\);

-- Location: LCCOMB_X54_Y46_N10
\NxFrBitCnt[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxFrBitCnt[3]~4_combout\ = (!\MsgFrIdx[3]~0_combout\ & (FrBitCnt(3) $ (((\Add9~1_combout\ & FrBitCnt(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~1_combout\,
	datab => \MsgFrIdx[3]~0_combout\,
	datac => FrBitCnt(3),
	datad => FrBitCnt(2),
	combout => \NxFrBitCnt[3]~4_combout\);

-- Location: FF_X54_Y46_N11
\FrBitCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxFrBitCnt[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => FrBitCnt(3));

-- Location: LCCOMB_X54_Y46_N26
\NxParBit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxParBit~0_combout\ = (FrBitCnt(1)) # ((!FrBitCnt(3) & FrBitCnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(3),
	datab => FrBitCnt(0),
	datac => FrBitCnt(1),
	combout => \NxParBit~0_combout\);

-- Location: LCCOMB_X54_Y46_N12
\NxParBit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxParBit~1_combout\ = (!\TxLine_Handler~2_combout\ & ((\NxParBit~0_combout\) # (FrBitCnt(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine_Handler~2_combout\,
	datac => \NxParBit~0_combout\,
	datad => FrBitCnt(2),
	combout => \NxParBit~1_combout\);

-- Location: LCCOMB_X55_Y47_N6
\NxMsgFrIdx[0]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx[0]~9_combout\ = (!MsgFrIdx(0) & !\NxMsgFrIdx~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => MsgFrIdx(0),
	datad => \NxMsgFrIdx~7_combout\,
	combout => \NxMsgFrIdx[0]~9_combout\);

-- Location: FF_X55_Y47_N7
\MsgFrIdx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxMsgFrIdx[0]~9_combout\,
	ena => \MsgFrIdx[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => MsgFrIdx(0));

-- Location: LCCOMB_X56_Y46_N0
\Add14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~0_combout\ = FrBitCnt(2) $ (((FrBitCnt(1)) # (FrBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => FrBitCnt(0),
	datac => FrBitCnt(2),
	combout => \Add14~0_combout\);

-- Location: LCCOMB_X55_Y47_N2
\NxMsgFrIdx[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx[1]~8_combout\ = (!\NxMsgFrIdx~7_combout\ & (MsgFrIdx(1) $ (MsgFrIdx(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxMsgFrIdx~7_combout\,
	datac => MsgFrIdx(1),
	datad => MsgFrIdx(0),
	combout => \NxMsgFrIdx[1]~8_combout\);

-- Location: FF_X55_Y47_N3
\MsgFrIdx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxMsgFrIdx[1]~8_combout\,
	ena => \MsgFrIdx[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => MsgFrIdx(1));

-- Location: LCCOMB_X56_Y46_N24
\TxLine~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~11_combout\ = (!MsgFrIdx(1) & (!FrBitCnt(2) & (FrBitCnt(1) $ (FrBitCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => FrBitCnt(0),
	datac => MsgFrIdx(1),
	datad => FrBitCnt(2),
	combout => \TxLine~11_combout\);

-- Location: LCCOMB_X56_Y46_N20
\TxLine~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~9_combout\ = (\SWT~input_o\) # (((State(0) & State(1))) # (!\Add14~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(1),
	datac => \SWT~input_o\,
	datad => \Add14~0_combout\,
	combout => \TxLine~9_combout\);

-- Location: LCCOMB_X56_Y46_N10
\TxLine~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~8_combout\ = (MsgFrIdx(1) & ((FrBitCnt(2)) # (FrBitCnt(1) $ (!FrBitCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => FrBitCnt(0),
	datac => MsgFrIdx(1),
	datad => FrBitCnt(2),
	combout => \TxLine~8_combout\);

-- Location: LCCOMB_X56_Y46_N26
\TxLine~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~20_combout\ = (\TxLine~8_combout\) # ((FrBitCnt(1) & (\TxLine~9_combout\ & FrBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => \TxLine~9_combout\,
	datac => FrBitCnt(0),
	datad => \TxLine~8_combout\,
	combout => \TxLine~20_combout\);

-- Location: LCCOMB_X56_Y46_N6
\TxLine~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~10_combout\ = (!\SWT~input_o\ & (State(0) $ (((FrBitCnt(0)) # (State(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SWT~input_o\,
	datac => FrBitCnt(0),
	datad => State(1),
	combout => \TxLine~10_combout\);

-- Location: LCCOMB_X56_Y46_N18
\TxLine~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~12_combout\ = (!MsgFrIdx(0) & ((\TxLine~20_combout\) # ((\TxLine~11_combout\ & \TxLine~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => \TxLine~11_combout\,
	datac => \TxLine~20_combout\,
	datad => \TxLine~10_combout\,
	combout => \TxLine~12_combout\);

-- Location: LCCOMB_X55_Y47_N24
\TxLine~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~13_combout\ = (\TxLine~12_combout\) # ((MsgFrIdx(0) & (!FrBitCnt(0) & !\Add14~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => FrBitCnt(0),
	datac => \Add14~0_combout\,
	datad => \TxLine~12_combout\,
	combout => \TxLine~13_combout\);

-- Location: LCCOMB_X44_Y1_N4
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (CntUART(0) & (Cnt1kHz(1) $ (VCC))) # (!CntUART(0) & (Cnt1kHz(1) & VCC))
-- \Add0~1\ = CARRY((CntUART(0) & Cnt1kHz(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(0),
	datab => Cnt1kHz(1),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: FF_X44_Y1_N5
\Cnt1kHz[1]\ : dffeas
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
	q => Cnt1kHz(1));

-- Location: LCCOMB_X44_Y1_N6
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (Cnt1kHz(2) & (!\Add0~1\)) # (!Cnt1kHz(2) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!Cnt1kHz(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(2),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X44_Y1_N7
\Cnt1kHz[2]\ : dffeas
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
	q => Cnt1kHz(2));

-- Location: LCCOMB_X44_Y1_N8
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (Cnt1kHz(3) & (\Add0~3\ $ (GND))) # (!Cnt1kHz(3) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((Cnt1kHz(3) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(3),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X44_Y1_N10
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (Cnt1kHz(4) & (!\Add0~5\)) # (!Cnt1kHz(4) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!Cnt1kHz(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(4),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X44_Y1_N12
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (Cnt1kHz(5) & (\Add0~7\ $ (GND))) # (!Cnt1kHz(5) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((Cnt1kHz(5) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(5),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X44_Y1_N18
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (Cnt1kHz(8) & (!\Add0~13\)) # (!Cnt1kHz(8) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!Cnt1kHz(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(8),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X44_Y1_N20
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (Cnt1kHz(9) & (\Add0~15\ $ (GND))) # (!Cnt1kHz(9) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((Cnt1kHz(9) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt1kHz(9),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: FF_X44_Y1_N21
\Cnt1kHz[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(9));

-- Location: LCCOMB_X44_Y1_N22
\Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (Cnt1kHz(10) & (!\Add0~17\)) # (!Cnt1kHz(10) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!Cnt1kHz(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(10),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: FF_X44_Y1_N23
\Cnt1kHz[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(10));

-- Location: LCCOMB_X44_Y1_N24
\Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (Cnt1kHz(11) & (\Add0~19\ $ (GND))) # (!Cnt1kHz(11) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((Cnt1kHz(11) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt1kHz(11),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: FF_X44_Y1_N25
\Cnt1kHz[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(11));

-- Location: LCCOMB_X44_Y1_N26
\Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (Cnt1kHz(12) & (!\Add0~21\)) # (!Cnt1kHz(12) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!Cnt1kHz(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(12),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: FF_X44_Y1_N27
\Cnt1kHz[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(12));

-- Location: LCCOMB_X44_Y1_N28
\Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (Cnt1kHz(13) & (\Add0~23\ $ (GND))) # (!Cnt1kHz(13) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((Cnt1kHz(13) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt1kHz(13),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X45_Y1_N18
\NxCnt1kHz[13]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[13]~1_combout\ = (\Add0~24_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Add0~24_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCnt1kHz[13]~1_combout\);

-- Location: FF_X45_Y1_N19
\Cnt1kHz[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[13]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(13));

-- Location: LCCOMB_X44_Y1_N30
\Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = \Add0~25\ $ (Cnt1kHz(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => Cnt1kHz(14),
	cin => \Add0~25\,
	combout => \Add0~26_combout\);

-- Location: LCCOMB_X45_Y1_N28
\NxCnt1kHz[14]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[14]~0_combout\ = (\Add0~26_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Add0~26_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCnt1kHz[14]~0_combout\);

-- Location: FF_X45_Y1_N29
\Cnt1kHz[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(14));

-- Location: LCCOMB_X45_Y1_N10
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (Cnt1kHz(14) & (!Cnt1kHz(11) & (!Cnt1kHz(12) & Cnt1kHz(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(14),
	datab => Cnt1kHz(11),
	datac => Cnt1kHz(12),
	datad => Cnt1kHz(13),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X45_Y1_N20
\NxCnt1kHz[5]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[5]~4_combout\ = (\Add0~8_combout\ & (((!\Equal0~3_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~3_combout\,
	combout => \NxCnt1kHz[5]~4_combout\);

-- Location: FF_X45_Y1_N21
\Cnt1kHz[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(5));

-- Location: LCCOMB_X44_Y1_N14
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (Cnt1kHz(6) & (!\Add0~9\)) # (!Cnt1kHz(6) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!Cnt1kHz(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt1kHz(6),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X44_Y1_N15
\Cnt1kHz[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(6));

-- Location: LCCOMB_X44_Y1_N16
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (Cnt1kHz(7) & (\Add0~11\ $ (GND))) # (!Cnt1kHz(7) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((Cnt1kHz(7) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt1kHz(7),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X45_Y1_N24
\NxCnt1kHz[7]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[7]~3_combout\ = (\Add0~12_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Add0~12_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCnt1kHz[7]~3_combout\);

-- Location: FF_X45_Y1_N25
\Cnt1kHz[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(7));

-- Location: LCCOMB_X45_Y1_N2
\NxCnt1kHz[8]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[8]~2_combout\ = (\Add0~14_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Add0~14_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCnt1kHz[8]~2_combout\);

-- Location: FF_X45_Y1_N3
\Cnt1kHz[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[8]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(8));

-- Location: LCCOMB_X45_Y1_N22
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (Cnt1kHz(8) & (!Cnt1kHz(9) & (Cnt1kHz(7) & !Cnt1kHz(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(8),
	datab => Cnt1kHz(9),
	datac => Cnt1kHz(7),
	datad => Cnt1kHz(10),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X45_Y1_N6
\NxCnt1kHz[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxCnt1kHz[3]~5_combout\ = (\Add0~4_combout\ & (((!\Equal0~0_combout\) # (!\Equal0~1_combout\)) # (!\Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Add0~4_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \NxCnt1kHz[3]~5_combout\);

-- Location: FF_X45_Y1_N7
\Cnt1kHz[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NxCnt1kHz[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt1kHz(3));

-- Location: FF_X44_Y1_N11
\Cnt1kHz[4]\ : dffeas
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
	q => Cnt1kHz(4));

-- Location: LCCOMB_X44_Y1_N0
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!Cnt1kHz(4) & (!Cnt1kHz(6) & (Cnt1kHz(5) & !Cnt1kHz(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt1kHz(4),
	datab => Cnt1kHz(6),
	datac => Cnt1kHz(5),
	datad => Cnt1kHz(3),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X44_Y1_N2
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (CntUART(0) & (\Equal0~2_combout\ & (Cnt1kHz(1) & Cnt1kHz(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => CntUART(0),
	datab => \Equal0~2_combout\,
	datac => Cnt1kHz(1),
	datad => Cnt1kHz(2),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X45_Y1_N12
\Clk1kHz~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Clk1kHz~0_combout\ = \Clk1kHz~q\ $ (((\Equal0~3_combout\ & (\Equal0~1_combout\ & \Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Clk1kHz~q\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Clk1kHz~0_combout\);

-- Location: LCCOMB_X45_Y1_N0
\Clk1kHz~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Clk1kHz~feeder_combout\ = \Clk1kHz~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Clk1kHz~0_combout\,
	combout => \Clk1kHz~feeder_combout\);

-- Location: FF_X45_Y1_N1
Clk1kHz : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Clk1kHz~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Clk1kHz~q\);

-- Location: CLKCTRL_G18
\Clk1kHz~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk1kHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk1kHz~clkctrl_outclk\);

-- Location: LCCOMB_X57_Y44_N16
\Sec[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[0]~6_combout\ = Sec(0) $ (VCC)
-- \Sec[0]~7\ = CARRY(Sec(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Sec(0),
	datad => VCC,
	combout => \Sec[0]~6_combout\,
	cout => \Sec[0]~7\);

-- Location: LCCOMB_X57_Y44_N2
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ((!Sec(2) & ((!Sec(0)) # (!Sec(1))))) # (!Sec(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Sec(2),
	datab => Sec(1),
	datac => Sec(5),
	datad => Sec(0),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X57_Y44_N4
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!\LessThan1~0_combout\ & (Sec(3) & Sec(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan1~0_combout\,
	datac => Sec(3),
	datad => Sec(4),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X62_Y46_N6
\Msec[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[0]~10_combout\ = Msec(0) $ (VCC)
-- \Msec[0]~11\ = CARRY(Msec(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(0),
	datad => VCC,
	combout => \Msec[0]~10_combout\,
	cout => \Msec[0]~11\);

-- Location: FF_X62_Y46_N7
\Msec[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[0]~10_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(0));

-- Location: LCCOMB_X62_Y46_N8
\Msec[1]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[1]~12_combout\ = (Msec(1) & (!\Msec[0]~11\)) # (!Msec(1) & ((\Msec[0]~11\) # (GND)))
-- \Msec[1]~13\ = CARRY((!\Msec[0]~11\) # (!Msec(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(1),
	datad => VCC,
	cin => \Msec[0]~11\,
	combout => \Msec[1]~12_combout\,
	cout => \Msec[1]~13\);

-- Location: FF_X62_Y46_N9
\Msec[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[1]~12_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(1));

-- Location: LCCOMB_X62_Y46_N10
\Msec[2]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[2]~14_combout\ = (Msec(2) & (\Msec[1]~13\ $ (GND))) # (!Msec(2) & (!\Msec[1]~13\ & VCC))
-- \Msec[2]~15\ = CARRY((Msec(2) & !\Msec[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(2),
	datad => VCC,
	cin => \Msec[1]~13\,
	combout => \Msec[2]~14_combout\,
	cout => \Msec[2]~15\);

-- Location: FF_X62_Y46_N11
\Msec[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[2]~14_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(2));

-- Location: LCCOMB_X62_Y46_N12
\Msec[3]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[3]~16_combout\ = (Msec(3) & (!\Msec[2]~15\)) # (!Msec(3) & ((\Msec[2]~15\) # (GND)))
-- \Msec[3]~17\ = CARRY((!\Msec[2]~15\) # (!Msec(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(3),
	datad => VCC,
	cin => \Msec[2]~15\,
	combout => \Msec[3]~16_combout\,
	cout => \Msec[3]~17\);

-- Location: FF_X62_Y46_N13
\Msec[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[3]~16_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(3));

-- Location: LCCOMB_X62_Y46_N14
\Msec[4]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[4]~18_combout\ = (Msec(4) & (\Msec[3]~17\ $ (GND))) # (!Msec(4) & (!\Msec[3]~17\ & VCC))
-- \Msec[4]~19\ = CARRY((Msec(4) & !\Msec[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(4),
	datad => VCC,
	cin => \Msec[3]~17\,
	combout => \Msec[4]~18_combout\,
	cout => \Msec[4]~19\);

-- Location: FF_X62_Y46_N15
\Msec[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[4]~18_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(4));

-- Location: LCCOMB_X62_Y46_N16
\Msec[5]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[5]~20_combout\ = (Msec(5) & (!\Msec[4]~19\)) # (!Msec(5) & ((\Msec[4]~19\) # (GND)))
-- \Msec[5]~21\ = CARRY((!\Msec[4]~19\) # (!Msec(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(5),
	datad => VCC,
	cin => \Msec[4]~19\,
	combout => \Msec[5]~20_combout\,
	cout => \Msec[5]~21\);

-- Location: FF_X62_Y46_N17
\Msec[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[5]~20_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(5));

-- Location: LCCOMB_X62_Y46_N18
\Msec[6]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[6]~22_combout\ = (Msec(6) & (\Msec[5]~21\ $ (GND))) # (!Msec(6) & (!\Msec[5]~21\ & VCC))
-- \Msec[6]~23\ = CARRY((Msec(6) & !\Msec[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(6),
	datad => VCC,
	cin => \Msec[5]~21\,
	combout => \Msec[6]~22_combout\,
	cout => \Msec[6]~23\);

-- Location: FF_X62_Y46_N19
\Msec[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[6]~22_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(6));

-- Location: LCCOMB_X62_Y46_N20
\Msec[7]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[7]~24_combout\ = (Msec(7) & (!\Msec[6]~23\)) # (!Msec(7) & ((\Msec[6]~23\) # (GND)))
-- \Msec[7]~25\ = CARRY((!\Msec[6]~23\) # (!Msec(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(7),
	datad => VCC,
	cin => \Msec[6]~23\,
	combout => \Msec[7]~24_combout\,
	cout => \Msec[7]~25\);

-- Location: FF_X62_Y46_N21
\Msec[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[7]~24_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(7));

-- Location: LCCOMB_X62_Y46_N22
\Msec[8]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[8]~26_combout\ = (Msec(8) & (\Msec[7]~25\ $ (GND))) # (!Msec(8) & (!\Msec[7]~25\ & VCC))
-- \Msec[8]~27\ = CARRY((Msec(8) & !\Msec[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(8),
	datad => VCC,
	cin => \Msec[7]~25\,
	combout => \Msec[8]~26_combout\,
	cout => \Msec[8]~27\);

-- Location: FF_X62_Y46_N23
\Msec[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[8]~26_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(8));

-- Location: LCCOMB_X62_Y46_N24
\Msec[9]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Msec[9]~28_combout\ = \Msec[8]~27\ $ (Msec(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => Msec(9),
	cin => \Msec[8]~27\,
	combout => \Msec[9]~28_combout\);

-- Location: FF_X62_Y46_N25
\Msec[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Msec[9]~28_combout\,
	sclr => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Msec(9));

-- Location: LCCOMB_X62_Y46_N0
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (((!Msec(9)) # (!Msec(8))) # (!Msec(7))) # (!Msec(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(6),
	datab => Msec(7),
	datac => Msec(8),
	datad => Msec(9),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X62_Y46_N26
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!Msec(4) & (((!Msec(0)) # (!Msec(1))) # (!Msec(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(2),
	datab => Msec(4),
	datac => Msec(1),
	datad => Msec(0),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X62_Y46_N28
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!\LessThan0~0_combout\ & (Msec(5) & ((Msec(3)) # (!\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(3),
	datab => \LessThan0~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => Msec(5),
	combout => \LessThan0~2_combout\);

-- Location: FF_X57_Y44_N17
\Sec[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[0]~6_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(0));

-- Location: LCCOMB_X57_Y44_N18
\Sec[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[1]~8_combout\ = (Sec(1) & (!\Sec[0]~7\)) # (!Sec(1) & ((\Sec[0]~7\) # (GND)))
-- \Sec[1]~9\ = CARRY((!\Sec[0]~7\) # (!Sec(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Sec(1),
	datad => VCC,
	cin => \Sec[0]~7\,
	combout => \Sec[1]~8_combout\,
	cout => \Sec[1]~9\);

-- Location: FF_X57_Y44_N19
\Sec[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[1]~8_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(1));

-- Location: LCCOMB_X57_Y44_N20
\Sec[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[2]~10_combout\ = (Sec(2) & (\Sec[1]~9\ $ (GND))) # (!Sec(2) & (!\Sec[1]~9\ & VCC))
-- \Sec[2]~11\ = CARRY((Sec(2) & !\Sec[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Sec(2),
	datad => VCC,
	cin => \Sec[1]~9\,
	combout => \Sec[2]~10_combout\,
	cout => \Sec[2]~11\);

-- Location: FF_X57_Y44_N21
\Sec[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[2]~10_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(2));

-- Location: LCCOMB_X57_Y44_N22
\Sec[3]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[3]~12_combout\ = (Sec(3) & (!\Sec[2]~11\)) # (!Sec(3) & ((\Sec[2]~11\) # (GND)))
-- \Sec[3]~13\ = CARRY((!\Sec[2]~11\) # (!Sec(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(3),
	datad => VCC,
	cin => \Sec[2]~11\,
	combout => \Sec[3]~12_combout\,
	cout => \Sec[3]~13\);

-- Location: FF_X57_Y44_N23
\Sec[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[3]~12_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(3));

-- Location: LCCOMB_X57_Y44_N24
\Sec[4]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[4]~14_combout\ = (Sec(4) & (\Sec[3]~13\ $ (GND))) # (!Sec(4) & (!\Sec[3]~13\ & VCC))
-- \Sec[4]~15\ = CARRY((Sec(4) & !\Sec[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Sec(4),
	datad => VCC,
	cin => \Sec[3]~13\,
	combout => \Sec[4]~14_combout\,
	cout => \Sec[4]~15\);

-- Location: FF_X57_Y44_N25
\Sec[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[4]~14_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(4));

-- Location: LCCOMB_X57_Y44_N26
\Sec[5]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Sec[5]~16_combout\ = Sec(5) $ (\Sec[4]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(5),
	cin => \Sec[4]~15\,
	combout => \Sec[5]~16_combout\);

-- Location: FF_X57_Y44_N27
\Sec[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Sec[5]~16_combout\,
	sclr => \LessThan1~1_combout\,
	ena => \LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Sec(5));

-- Location: LCCOMB_X57_Y44_N6
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = Sec(3) $ (VCC)
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(Sec(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Sec(3),
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X57_Y44_N8
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (Sec(4) & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!Sec(4) & (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!Sec(4) & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Sec(4),
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X57_Y44_N10
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (Sec(5) & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!Sec(5) & (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((Sec(5) & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(5),
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X57_Y44_N12
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X60_Y44_N26
\Mod1|auto_generated|divider|divider|StageOut[21]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X60_Y44_N8
\Mod1|auto_generated|divider|divider|StageOut[21]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Sec(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Sec(5),
	combout => \Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X57_Y44_N0
\Mod1|auto_generated|divider|divider|StageOut[20]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Sec(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Sec(4),
	combout => \Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X60_Y44_N28
\Mod1|auto_generated|divider|divider|StageOut[20]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X60_Y44_N30
\Mod1|auto_generated|divider|divider|StageOut[19]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Sec(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Sec(3),
	combout => \Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X60_Y44_N0
\Mod1|auto_generated|divider|divider|StageOut[19]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X60_Y44_N10
\Mod1|auto_generated|divider|divider|StageOut[18]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Sec(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Sec(2),
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X60_Y44_N4
\Mod1|auto_generated|divider|divider|StageOut[18]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Sec(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Sec(2),
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X60_Y44_N16
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X60_Y44_N18
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X60_Y44_N20
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X60_Y44_N22
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X60_Y44_N24
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X57_Y44_N28
\Mod1|auto_generated|divider|divider|StageOut[28]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Sec(5))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => Sec(5),
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\);

-- Location: LCCOMB_X60_Y44_N6
\Mod1|auto_generated|divider|divider|StageOut[28]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X60_Y44_N2
\Mod1|auto_generated|divider|divider|StageOut[27]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X57_Y44_N30
\Mod1|auto_generated|divider|divider|StageOut[27]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Sec(4))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => Sec(4),
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\);

-- Location: LCCOMB_X56_Y44_N20
\Mod1|auto_generated|divider|divider|StageOut[26]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X60_Y44_N14
\Mod1|auto_generated|divider|divider|StageOut[26]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((Sec(3)))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => Sec(3),
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\);

-- Location: LCCOMB_X56_Y44_N22
\Mod1|auto_generated|divider|divider|StageOut[25]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (Sec(2) & \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Sec(2),
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X60_Y44_N12
\Mod1|auto_generated|divider|divider|StageOut[25]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X56_Y44_N2
\Mod1|auto_generated|divider|divider|StageOut[24]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (Sec(1) & !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Sec(1),
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X56_Y44_N0
\Mod1|auto_generated|divider|divider|StageOut[24]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (Sec(1) & \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Sec(1),
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X59_Y44_N16
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X59_Y44_N18
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X59_Y44_N20
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X59_Y44_N22
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (((\Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (!\Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\);

-- Location: LCCOMB_X59_Y44_N24
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((((\Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\))))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((\Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\) # (GND))))
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # ((\Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\);

-- Location: LCCOMB_X59_Y44_N26
\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X59_Y44_N12
\Mod1|auto_generated|divider|divider|StageOut[35]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[28]~44_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\);

-- Location: LCCOMB_X59_Y44_N6
\Mod1|auto_generated|divider|divider|StageOut[34]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[27]~45_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\);

-- Location: LCCOMB_X59_Y44_N2
\Mod1|auto_generated|divider|divider|StageOut[33]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[26]~46_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\);

-- Location: LCCOMB_X59_Y44_N10
\Mod1|auto_generated|divider|divider|StageOut[32]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\);

-- Location: LCCOMB_X59_Y44_N0
\Mod1|auto_generated|divider|divider|StageOut[31]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (Sec(1))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & 
-- ((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Sec(1),
	datac => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X58_Y44_N16
\Add11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~0_combout\ = (Sec(1) & ((GND) # (!\Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))) # (!Sec(1) & (\Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ (GND)))
-- \Add11~1\ = CARRY((Sec(1)) # (!\Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(1),
	datab => \Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => VCC,
	combout => \Add11~0_combout\,
	cout => \Add11~1\);

-- Location: LCCOMB_X58_Y44_N18
\Add11~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~2_combout\ = (Sec(2) & ((\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ & (!\Add11~1\)) # (!\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ & (\Add11~1\ & VCC)))) # (!Sec(2) & 
-- ((\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ & ((\Add11~1\) # (GND))) # (!\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ & (!\Add11~1\))))
-- \Add11~3\ = CARRY((Sec(2) & (\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\ & !\Add11~1\)) # (!Sec(2) & ((\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\) # (!\Add11~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(2),
	datab => \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\,
	datad => VCC,
	cin => \Add11~1\,
	combout => \Add11~2_combout\,
	cout => \Add11~3\);

-- Location: LCCOMB_X58_Y44_N20
\Add11~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~4_combout\ = ((\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ $ (Sec(3) $ (\Add11~3\)))) # (GND)
-- \Add11~5\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ & (Sec(3) & !\Add11~3\)) # (!\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ & ((Sec(3)) # (!\Add11~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\,
	datab => Sec(3),
	datad => VCC,
	cin => \Add11~3\,
	combout => \Add11~4_combout\,
	cout => \Add11~5\);

-- Location: LCCOMB_X58_Y44_N22
\Add11~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~6_combout\ = (\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((Sec(4) & (!\Add11~5\)) # (!Sec(4) & ((\Add11~5\) # (GND))))) # (!\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((Sec(4) & (\Add11~5\ & VCC)) # 
-- (!Sec(4) & (!\Add11~5\))))
-- \Add11~7\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((!\Add11~5\) # (!Sec(4)))) # (!\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & (!Sec(4) & !\Add11~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datab => Sec(4),
	datad => VCC,
	cin => \Add11~5\,
	combout => \Add11~6_combout\,
	cout => \Add11~7\);

-- Location: LCCOMB_X58_Y44_N24
\Add11~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~8_combout\ = ((Sec(5) $ (\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\ $ (\Add11~7\)))) # (GND)
-- \Add11~9\ = CARRY((Sec(5) & ((!\Add11~7\) # (!\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\))) # (!Sec(5) & (!\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\ & !\Add11~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Sec(5),
	datab => \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datad => VCC,
	cin => \Add11~7\,
	combout => \Add11~8_combout\,
	cout => \Add11~9\);

-- Location: LCCOMB_X58_Y44_N26
\Add11~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~10_combout\ = !\Add11~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add11~9\,
	combout => \Add11~10_combout\);

-- Location: LCCOMB_X58_Y44_N30
\Mux5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~5_combout\ = (!\Add11~10_combout\ & (!\Add11~8_combout\ & (\Add11~6_combout\ & \Add11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~10_combout\,
	datab => \Add11~8_combout\,
	datac => \Add11~6_combout\,
	datad => \Add11~2_combout\,
	combout => \Mux5~5_combout\);

-- Location: LCCOMB_X58_Y44_N8
\Mux5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~6_combout\ = (\Mux5~5_combout\ & ((\Add11~4_combout\ & ((\Add11~0_combout\))) # (!\Add11~4_combout\ & (!FrBitCnt(0) & !\Add11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~5_combout\,
	datab => \Add11~4_combout\,
	datac => FrBitCnt(0),
	datad => \Add11~0_combout\,
	combout => \Mux5~6_combout\);

-- Location: LCCOMB_X58_Y44_N10
\Mux5~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~7_combout\ = (\Add11~0_combout\) # ((\Add11~4_combout\ & ((\Add11~6_combout\))) # (!\Add11~4_combout\ & (\Add11~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~8_combout\,
	datab => \Add11~4_combout\,
	datac => \Add11~6_combout\,
	datad => \Add11~0_combout\,
	combout => \Mux5~7_combout\);

-- Location: LCCOMB_X58_Y44_N4
\Mux5~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~8_combout\ = (\Mux5~6_combout\) # (((FrBitCnt(0) & \Mux5~7_combout\)) # (!\Add14~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Mux5~6_combout\,
	datac => \Add14~0_combout\,
	datad => \Mux5~7_combout\,
	combout => \Mux5~8_combout\);

-- Location: LCCOMB_X59_Y45_N18
\Add9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~0_combout\ = FrBitCnt(0) $ (FrBitCnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datac => FrBitCnt(1),
	combout => \Add9~0_combout\);

-- Location: LCCOMB_X58_Y44_N2
\Mux5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Add11~8_combout\ & (((!\Add11~4_combout\ & \Add11~0_combout\)) # (!\Add9~0_combout\))) # (!\Add11~8_combout\ & (\Add11~4_combout\ $ (((\Add11~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101101001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~8_combout\,
	datab => \Add11~4_combout\,
	datac => \Add9~0_combout\,
	datad => \Add11~0_combout\,
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X58_Y44_N0
\Mux5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\Add11~10_combout\) # (\Add11~6_combout\ $ (\Add11~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~10_combout\,
	datac => \Add11~6_combout\,
	datad => \Add11~2_combout\,
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X58_Y44_N12
\Mux5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = (FrBitCnt(0) & (\Add14~0_combout\ & ((\Mux5~3_combout\) # (\Mux5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Mux5~3_combout\,
	datac => \Add14~0_combout\,
	datad => \Mux5~2_combout\,
	combout => \Mux5~4_combout\);

-- Location: LCCOMB_X58_Y44_N6
\Mux5~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~9_combout\ = (\Mux5~4_combout\) # ((\Mux5~8_combout\ & (FrBitCnt(0) $ (FrBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Mux5~8_combout\,
	datac => FrBitCnt(1),
	datad => \Mux5~4_combout\,
	combout => \Mux5~9_combout\);

-- Location: LCCOMB_X55_Y47_N28
\Mux7~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = ((FrBitCnt(2) & !FrBitCnt(1))) # (!FrBitCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(2),
	datab => FrBitCnt(0),
	datac => FrBitCnt(1),
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X59_Y47_N12
\Min[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[0]~6_combout\ = Min(0) $ (VCC)
-- \Min[0]~7\ = CARRY(Min(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Min(0),
	datad => VCC,
	combout => \Min[0]~6_combout\,
	cout => \Min[0]~7\);

-- Location: LCCOMB_X59_Y47_N14
\Min[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[1]~8_combout\ = (Min(1) & (!\Min[0]~7\)) # (!Min(1) & ((\Min[0]~7\) # (GND)))
-- \Min[1]~9\ = CARRY((!\Min[0]~7\) # (!Min(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Min(1),
	datad => VCC,
	cin => \Min[0]~7\,
	combout => \Min[1]~8_combout\,
	cout => \Min[1]~9\);

-- Location: LCCOMB_X59_Y47_N16
\Min[2]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[2]~11_combout\ = (Min(2) & (\Min[1]~9\ $ (GND))) # (!Min(2) & (!\Min[1]~9\ & VCC))
-- \Min[2]~12\ = CARRY((Min(2) & !\Min[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Min(2),
	datad => VCC,
	cin => \Min[1]~9\,
	combout => \Min[2]~11_combout\,
	cout => \Min[2]~12\);

-- Location: LCCOMB_X57_Y44_N14
\Min[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[5]~10_combout\ = (\LessThan0~2_combout\ & (!\LessThan1~0_combout\ & (Sec(3) & Sec(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \LessThan1~0_combout\,
	datac => Sec(3),
	datad => Sec(4),
	combout => \Min[5]~10_combout\);

-- Location: FF_X59_Y47_N17
\Min[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[2]~11_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(2));

-- Location: LCCOMB_X59_Y47_N18
\Min[3]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[3]~13_combout\ = (Min(3) & (!\Min[2]~12\)) # (!Min(3) & ((\Min[2]~12\) # (GND)))
-- \Min[3]~14\ = CARRY((!\Min[2]~12\) # (!Min(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Min(3),
	datad => VCC,
	cin => \Min[2]~12\,
	combout => \Min[3]~13_combout\,
	cout => \Min[3]~14\);

-- Location: FF_X59_Y47_N19
\Min[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[3]~13_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(3));

-- Location: LCCOMB_X59_Y47_N20
\Min[4]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[4]~15_combout\ = (Min(4) & (\Min[3]~14\ $ (GND))) # (!Min(4) & (!\Min[3]~14\ & VCC))
-- \Min[4]~16\ = CARRY((Min(4) & !\Min[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Min(4),
	datad => VCC,
	cin => \Min[3]~14\,
	combout => \Min[4]~15_combout\,
	cout => \Min[4]~16\);

-- Location: FF_X59_Y47_N21
\Min[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[4]~15_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(4));

-- Location: LCCOMB_X59_Y47_N22
\Min[5]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Min[5]~17_combout\ = Min(5) $ (\Min[4]~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Min(5),
	cin => \Min[4]~16\,
	combout => \Min[5]~17_combout\);

-- Location: FF_X59_Y47_N23
\Min[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[5]~17_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(5));

-- Location: LCCOMB_X59_Y47_N24
\LessThan2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = ((!Min(2) & ((!Min(1)) # (!Min(0))))) # (!Min(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Min(0),
	datab => Min(1),
	datac => Min(5),
	datad => Min(2),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X59_Y47_N10
\LessThan2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (Min(4) & (!\LessThan2~0_combout\ & Min(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Min(4),
	datac => \LessThan2~0_combout\,
	datad => Min(3),
	combout => \LessThan2~1_combout\);

-- Location: FF_X59_Y47_N13
\Min[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[0]~6_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(0));

-- Location: FF_X59_Y47_N15
\Min[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk1kHz~clkctrl_outclk\,
	d => \Min[1]~8_combout\,
	sclr => \LessThan2~1_combout\,
	ena => \Min[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Min(1));

-- Location: LCCOMB_X59_Y47_N0
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = Min(3) $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(Min(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Min(3),
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X59_Y47_N2
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (Min(4) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!Min(4) & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!Min(4) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Min(4),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X59_Y47_N4
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (Min(5) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!Min(5) & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((Min(5) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Min(5),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X59_Y47_N6
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X57_Y47_N28
\Mod0|auto_generated|divider|divider|StageOut[21]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X57_Y47_N0
\Mod0|auto_generated|divider|divider|StageOut[21]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Min(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Min(5),
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X57_Y47_N30
\Mod0|auto_generated|divider|divider|StageOut[20]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\ = (Min(4) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Min(4),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X59_Y47_N8
\Mod0|auto_generated|divider|divider|StageOut[20]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X56_Y47_N16
\Mod0|auto_generated|divider|divider|StageOut[19]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X57_Y47_N24
\Mod0|auto_generated|divider|divider|StageOut[19]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ = (Min(3) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Min(3),
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X57_Y47_N26
\Mod0|auto_generated|divider|divider|StageOut[18]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Min(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Min(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X57_Y47_N20
\Mod0|auto_generated|divider|divider|StageOut[18]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & Min(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => Min(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X57_Y47_N2
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X57_Y47_N4
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X57_Y47_N6
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X57_Y47_N8
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X57_Y47_N10
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X56_Y47_N2
\Mod0|auto_generated|divider|divider|StageOut[24]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & Min(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => Min(1),
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X57_Y47_N22
\Mod0|auto_generated|divider|divider|StageOut[24]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & Min(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => Min(1),
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X58_Y47_N14
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X57_Y47_N14
\Mod0|auto_generated|divider|divider|StageOut[28]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Min(5))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => Min(5),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\);

-- Location: LCCOMB_X56_Y47_N4
\Mod0|auto_generated|divider|divider|StageOut[28]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X57_Y47_N16
\Mod0|auto_generated|divider|divider|StageOut[27]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X59_Y47_N28
\Mod0|auto_generated|divider|divider|StageOut[27]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Min(4))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => Min(4),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\);

-- Location: LCCOMB_X59_Y47_N30
\Mod0|auto_generated|divider|divider|StageOut[26]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Min(3))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => Min(3),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\);

-- Location: LCCOMB_X57_Y47_N18
\Mod0|auto_generated|divider|divider|StageOut[26]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X57_Y47_N12
\Mod0|auto_generated|divider|divider|StageOut[25]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X59_Y47_N26
\Mod0|auto_generated|divider|divider|StageOut[25]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & Min(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => Min(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X58_Y47_N16
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X58_Y47_N18
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X58_Y47_N20
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (!\Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\);

-- Location: LCCOMB_X58_Y47_N22
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((((\Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\))))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((\Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\) # (GND))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\);

-- Location: LCCOMB_X58_Y47_N24
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~9\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X58_Y47_N8
\Mod0|auto_generated|divider|divider|StageOut[31]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (Min(1))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Min(1),
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X57_Y45_N8
\Add10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~0_combout\ = (Min(1) & ((GND) # (!\Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\))) # (!Min(1) & (\Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\ $ (GND)))
-- \Add10~1\ = CARRY((Min(1)) # (!\Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Min(1),
	datab => \Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => VCC,
	combout => \Add10~0_combout\,
	cout => \Add10~1\);

-- Location: LCCOMB_X58_Y47_N26
\Mod0|auto_generated|divider|divider|StageOut[32]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[25]~37_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\);

-- Location: LCCOMB_X57_Y45_N10
\Add10~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~2_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ & ((Min(2) & (!\Add10~1\)) # (!Min(2) & ((\Add10~1\) # (GND))))) # (!\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ & ((Min(2) & (\Add10~1\ & VCC)) # 
-- (!Min(2) & (!\Add10~1\))))
-- \Add10~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ & ((!\Add10~1\) # (!Min(2)))) # (!\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ & (!Min(2) & !\Add10~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\,
	datab => Min(2),
	datad => VCC,
	cin => \Add10~1\,
	combout => \Add10~2_combout\,
	cout => \Add10~3\);

-- Location: LCCOMB_X58_Y47_N4
\Mod0|auto_generated|divider|divider|StageOut[35]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~44_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\);

-- Location: LCCOMB_X58_Y47_N6
\Mod0|auto_generated|divider|divider|StageOut[34]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[27]~45_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\);

-- Location: LCCOMB_X58_Y47_N2
\Mod0|auto_generated|divider|divider|StageOut[33]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~46_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[26]~36_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\);

-- Location: LCCOMB_X57_Y45_N12
\Add10~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~4_combout\ = ((Min(3) $ (\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\ $ (\Add10~3\)))) # (GND)
-- \Add10~5\ = CARRY((Min(3) & ((!\Add10~3\) # (!\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\))) # (!Min(3) & (!\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\ & !\Add10~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Min(3),
	datab => \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\,
	datad => VCC,
	cin => \Add10~3\,
	combout => \Add10~4_combout\,
	cout => \Add10~5\);

-- Location: LCCOMB_X57_Y45_N14
\Add10~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((Min(4) & (!\Add10~5\)) # (!Min(4) & ((\Add10~5\) # (GND))))) # (!\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((Min(4) & (\Add10~5\ & VCC)) # 
-- (!Min(4) & (!\Add10~5\))))
-- \Add10~7\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & ((!\Add10~5\) # (!Min(4)))) # (!\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & (!Min(4) & !\Add10~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datab => Min(4),
	datad => VCC,
	cin => \Add10~5\,
	combout => \Add10~6_combout\,
	cout => \Add10~7\);

-- Location: LCCOMB_X57_Y45_N16
\Add10~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~8_combout\ = ((Min(5) $ (\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ $ (\Add10~7\)))) # (GND)
-- \Add10~9\ = CARRY((Min(5) & ((!\Add10~7\) # (!\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\))) # (!Min(5) & (!\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ & !\Add10~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Min(5),
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datad => VCC,
	cin => \Add10~7\,
	combout => \Add10~8_combout\,
	cout => \Add10~9\);

-- Location: LCCOMB_X57_Y45_N18
\Add10~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~10_combout\ = !\Add10~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add10~9\,
	combout => \Add10~10_combout\);

-- Location: LCCOMB_X57_Y45_N30
\Mux3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~5_combout\ = (\Add10~2_combout\ & (!\Add10~10_combout\ & (\Add10~6_combout\ & !\Add10~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~2_combout\,
	datab => \Add10~10_combout\,
	datac => \Add10~6_combout\,
	datad => \Add10~8_combout\,
	combout => \Mux3~5_combout\);

-- Location: LCCOMB_X57_Y45_N4
\Mux3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~6_combout\ = (\Mux3~5_combout\ & ((\Add10~0_combout\ & ((\Add10~4_combout\))) # (!\Add10~0_combout\ & (!FrBitCnt(0) & !\Add10~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Add10~0_combout\,
	datac => \Mux3~5_combout\,
	datad => \Add10~4_combout\,
	combout => \Mux3~6_combout\);

-- Location: LCCOMB_X57_Y45_N22
\Mux3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~7_combout\ = (\Add10~0_combout\) # ((\Add10~4_combout\ & (\Add10~6_combout\)) # (!\Add10~4_combout\ & ((\Add10~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~4_combout\,
	datab => \Add10~6_combout\,
	datac => \Add10~0_combout\,
	datad => \Add10~8_combout\,
	combout => \Mux3~7_combout\);

-- Location: LCCOMB_X57_Y45_N0
\Mux3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~8_combout\ = (\Mux3~6_combout\) # (((FrBitCnt(0) & \Mux3~7_combout\)) # (!\Add14~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Mux3~6_combout\,
	datac => \Mux3~7_combout\,
	datad => \Add14~0_combout\,
	combout => \Mux3~8_combout\);

-- Location: LCCOMB_X57_Y45_N26
\Mux3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Add10~8_combout\ & (((!\Add10~4_combout\ & \Add10~0_combout\)) # (!\Add9~0_combout\))) # (!\Add10~8_combout\ & (\Add10~4_combout\ $ ((\Add10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~4_combout\,
	datab => \Add10~8_combout\,
	datac => \Add10~0_combout\,
	datad => \Add9~0_combout\,
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X57_Y45_N24
\Mux3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Add10~10_combout\) # (\Add10~2_combout\ $ (\Add10~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~2_combout\,
	datac => \Add10~6_combout\,
	datad => \Add10~10_combout\,
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X57_Y45_N20
\Mux3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = (FrBitCnt(0) & (\Add14~0_combout\ & ((\Mux3~3_combout\) # (\Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Add14~0_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mux3~2_combout\,
	combout => \Mux3~4_combout\);

-- Location: LCCOMB_X57_Y45_N28
\Mux3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~9_combout\ = (\Mux3~4_combout\) # ((\Mux3~8_combout\ & (FrBitCnt(0) $ (FrBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \Mux3~8_combout\,
	datac => FrBitCnt(1),
	datad => \Mux3~4_combout\,
	combout => \Mux3~9_combout\);

-- Location: LCCOMB_X58_Y47_N0
\Equal6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (!\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\,
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X58_Y47_N30
\CharMin[0][2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMin[0][2]~9_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\,
	combout => \CharMin[0][2]~9_combout\);

-- Location: LCCOMB_X59_Y45_N12
\Mux4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~4_combout\ = (FrBitCnt(1) & (((\CharMin[0][2]~9_combout\ & FrBitCnt(0))))) # (!FrBitCnt(1) & (((FrBitCnt(0))) # (!\Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \CharMin[0][2]~9_combout\,
	datac => FrBitCnt(1),
	datad => FrBitCnt(0),
	combout => \Mux4~4_combout\);

-- Location: LCCOMB_X58_Y47_N28
\CharMin[0][0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMin[0][0]~6_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \Mod0|auto_generated|divider|divider|StageOut[32]~43_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[33]~40_combout\,
	combout => \CharMin[0][0]~6_combout\);

-- Location: LCCOMB_X58_Y47_N10
\CharMin[0][0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMin[0][0]~7_combout\ = (\Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\) # ((Min(0)) # (\CharMin[0][0]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datac => Min(0),
	datad => \CharMin[0][0]~6_combout\,
	combout => \CharMin[0][0]~7_combout\);

-- Location: LCCOMB_X58_Y47_N12
\CharMin[0][1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMin[0][1]~8_combout\ = (\Equal6~0_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (Min(1))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Min(1),
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Equal6~0_combout\,
	combout => \CharMin[0][1]~8_combout\);

-- Location: LCCOMB_X59_Y45_N22
\Mux4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~5_combout\ = (\Mux4~4_combout\ & ((\CharMin[0][0]~7_combout\) # ((!\Add9~0_combout\)))) # (!\Mux4~4_combout\ & (((\CharMin[0][1]~8_combout\ & \Add9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~4_combout\,
	datab => \CharMin[0][0]~7_combout\,
	datac => \CharMin[0][1]~8_combout\,
	datad => \Add9~0_combout\,
	combout => \Mux4~5_combout\);

-- Location: LCCOMB_X57_Y45_N6
\Mux4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~6_combout\ = (FrBitCnt(2) & ((FrBitCnt(0) & (!FrBitCnt(1))) # (!FrBitCnt(0) & ((FrBitCnt(1)) # (\Mux4~5_combout\))))) # (!FrBitCnt(2) & (\Mux4~5_combout\ & ((FrBitCnt(0)) # (FrBitCnt(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => FrBitCnt(1),
	datac => FrBitCnt(2),
	datad => \Mux4~5_combout\,
	combout => \Mux4~6_combout\);

-- Location: LCCOMB_X57_Y45_N2
\TxLine~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~6_combout\ = (MsgFrIdx(0) & (((MsgFrIdx(1)) # (\Mux4~6_combout\)))) # (!MsgFrIdx(0) & (\Mux3~9_combout\ & (!MsgFrIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => \Mux3~9_combout\,
	datac => MsgFrIdx(1),
	datad => \Mux4~6_combout\,
	combout => \TxLine~6_combout\);

-- Location: LCCOMB_X55_Y47_N20
\TxLine~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~7_combout\ = (\TxLine~6_combout\ & ((\Mux5~9_combout\) # ((!MsgFrIdx(1))))) # (!\TxLine~6_combout\ & (((\Mux7~1_combout\ & MsgFrIdx(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~9_combout\,
	datab => \Mux7~1_combout\,
	datac => \TxLine~6_combout\,
	datad => MsgFrIdx(1),
	combout => \TxLine~7_combout\);

-- Location: LCCOMB_X55_Y47_N30
\NxMsgFrIdx[2]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx[2]~11_combout\ = (!\NxMsgFrIdx~7_combout\ & (MsgFrIdx(2) $ (((MsgFrIdx(0) & MsgFrIdx(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => MsgFrIdx(1),
	datac => MsgFrIdx(2),
	datad => \NxMsgFrIdx~7_combout\,
	combout => \NxMsgFrIdx[2]~11_combout\);

-- Location: FF_X55_Y47_N31
\MsgFrIdx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxMsgFrIdx[2]~11_combout\,
	ena => \MsgFrIdx[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => MsgFrIdx(2));

-- Location: LCCOMB_X55_Y47_N10
\Add8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add8~0_combout\ = MsgFrIdx(3) $ (((MsgFrIdx(0) & (MsgFrIdx(2) & MsgFrIdx(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => MsgFrIdx(3),
	datac => MsgFrIdx(2),
	datad => MsgFrIdx(1),
	combout => \Add8~0_combout\);

-- Location: LCCOMB_X55_Y47_N18
\NxMsgFrIdx[3]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxMsgFrIdx[3]~10_combout\ = (!\NxMsgFrIdx~7_combout\ & \Add8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NxMsgFrIdx~7_combout\,
	datad => \Add8~0_combout\,
	combout => \NxMsgFrIdx[3]~10_combout\);

-- Location: FF_X55_Y47_N19
\MsgFrIdx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxMsgFrIdx[3]~10_combout\,
	ena => \MsgFrIdx[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => MsgFrIdx(3));

-- Location: LCCOMB_X55_Y47_N26
\TxLine~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~14_combout\ = (MsgFrIdx(2) & (((\TxLine~7_combout\) # (MsgFrIdx(3))))) # (!MsgFrIdx(2) & (\TxLine~13_combout\ & ((!MsgFrIdx(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine~13_combout\,
	datab => \TxLine~7_combout\,
	datac => MsgFrIdx(2),
	datad => MsgFrIdx(3),
	combout => \TxLine~14_combout\);

-- Location: LCCOMB_X59_Y44_N4
\CharSec[0][0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharSec[0][0]~6_combout\ = (\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\,
	combout => \CharSec[0][0]~6_combout\);

-- Location: LCCOMB_X59_Y44_N30
\CharSec[0][0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharSec[0][0]~7_combout\ = (\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\) # ((\CharSec[0][0]~6_combout\) # ((Sec(0)) # (\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datab => \CharSec[0][0]~6_combout\,
	datac => Sec(0),
	datad => \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\,
	combout => \CharSec[0][0]~7_combout\);

-- Location: LCCOMB_X59_Y44_N14
\CharSec[0][2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharSec[0][2]~9_combout\ = (!\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & 
-- \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[32]~43_combout\,
	combout => \CharSec[0][2]~9_combout\);

-- Location: LCCOMB_X59_Y44_N8
\Equal20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal20~0_combout\ = (!\Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\ & !\Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[34]~42_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[33]~40_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[35]~41_combout\,
	combout => \Equal20~0_combout\);

-- Location: LCCOMB_X59_Y45_N28
\Mux6~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (FrBitCnt(0) & ((\CharSec[0][2]~9_combout\) # ((!FrBitCnt(1))))) # (!FrBitCnt(0) & (((!FrBitCnt(1) & !\Equal20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \CharSec[0][2]~9_combout\,
	datac => FrBitCnt(1),
	datad => \Equal20~0_combout\,
	combout => \Mux6~4_combout\);

-- Location: LCCOMB_X59_Y44_N28
\CharSec[0][1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharSec[0][1]~8_combout\ = (\Equal20~0_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((Sec(1)))) # (!\Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datac => Sec(1),
	datad => \Equal20~0_combout\,
	combout => \CharSec[0][1]~8_combout\);

-- Location: LCCOMB_X59_Y45_N14
\Mux6~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~5_combout\ = (\Mux6~4_combout\ & ((\CharSec[0][0]~7_combout\) # ((!\Add9~0_combout\)))) # (!\Mux6~4_combout\ & (((\CharSec[0][1]~8_combout\ & \Add9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharSec[0][0]~7_combout\,
	datab => \Mux6~4_combout\,
	datac => \CharSec[0][1]~8_combout\,
	datad => \Add9~0_combout\,
	combout => \Mux6~5_combout\);

-- Location: LCCOMB_X55_Y47_N12
\Mux6~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~6_combout\ = (FrBitCnt(2) & ((FrBitCnt(1) & (!FrBitCnt(0))) # (!FrBitCnt(1) & ((FrBitCnt(0)) # (\Mux6~5_combout\))))) # (!FrBitCnt(2) & (\Mux6~5_combout\ & ((FrBitCnt(1)) # (FrBitCnt(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => FrBitCnt(0),
	datac => \Mux6~5_combout\,
	datad => FrBitCnt(2),
	combout => \Mux6~6_combout\);

-- Location: LCCOMB_X55_Y47_N0
\TxLine~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~5_combout\ = (MsgFrIdx(0) & ((\Mux7~1_combout\) # ((MsgFrIdx(1))))) # (!MsgFrIdx(0) & (((\Mux6~6_combout\ & !MsgFrIdx(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => \Mux7~1_combout\,
	datac => \Mux6~6_combout\,
	datad => MsgFrIdx(1),
	combout => \TxLine~5_combout\);

-- Location: LCCOMB_X55_Y47_N16
\Mux7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (FrBitCnt(2) & (FrBitCnt(0) $ (FrBitCnt(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(2),
	datab => FrBitCnt(0),
	datac => FrBitCnt(1),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X63_Y43_N18
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ = Msec(5) $ (VCC)
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ = CARRY(Msec(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(5),
	datad => VCC,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\);

-- Location: LCCOMB_X63_Y43_N20
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\ = (Msec(6) & (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ & VCC)) # (!Msec(6) & (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\))
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ = CARRY((!Msec(6) & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(6),
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~1\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\);

-- Location: LCCOMB_X63_Y43_N22
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ = (Msec(7) & ((GND) # (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\))) # (!Msec(7) & (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ $ (GND)))
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\ = CARRY((Msec(7)) # (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(7),
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~3\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\);

-- Location: LCCOMB_X63_Y43_N24
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\ = (Msec(8) & (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\)) # (!Msec(8) & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\) # (GND)))
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ = CARRY((!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\) # (!Msec(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(8),
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~5\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\);

-- Location: LCCOMB_X63_Y43_N26
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ = (Msec(9) & (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ $ (GND))) # (!Msec(9) & (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ & VCC))
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~9\ = CARRY((Msec(9) & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(9),
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~7\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~9\);

-- Location: LCCOMB_X63_Y43_N28
\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ = !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~9\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\);

-- Location: LCCOMB_X62_Y43_N8
\Mod3|auto_generated|divider|divider|StageOut[66]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\ = (Msec(9) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Msec(9),
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\);

-- Location: LCCOMB_X63_Y43_N16
\Mod3|auto_generated|divider|divider|StageOut[66]~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\);

-- Location: LCCOMB_X62_Y43_N10
\Mod3|auto_generated|divider|divider|StageOut[65]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\ = (Msec(8) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(8),
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\);

-- Location: LCCOMB_X62_Y43_N4
\Mod3|auto_generated|divider|divider|StageOut[65]~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\);

-- Location: LCCOMB_X63_Y43_N2
\Mod3|auto_generated|divider|divider|StageOut[64]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\ = (Msec(7) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(7),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\);

-- Location: LCCOMB_X63_Y43_N12
\Mod3|auto_generated|divider|divider|StageOut[64]~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\);

-- Location: LCCOMB_X63_Y43_N6
\Mod3|auto_generated|divider|divider|StageOut[63]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\ = (Msec(6) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Msec(6),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\);

-- Location: LCCOMB_X62_Y43_N30
\Mod3|auto_generated|divider|divider|StageOut[63]~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\);

-- Location: LCCOMB_X63_Y43_N10
\Mod3|auto_generated|divider|divider|StageOut[62]~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\);

-- Location: LCCOMB_X63_Y43_N0
\Mod3|auto_generated|divider|divider|StageOut[62]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & Msec(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datac => Msec(5),
	combout => \Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\);

-- Location: LCCOMB_X61_Y43_N2
\Mod3|auto_generated|divider|divider|StageOut[61]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\ = (Msec(4) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(4),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\);

-- Location: LCCOMB_X61_Y43_N12
\Mod3|auto_generated|divider|divider|StageOut[61]~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\ = (Msec(4) & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(4),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\);

-- Location: LCCOMB_X62_Y43_N14
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\ = (((\Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[61]~76_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[61]~77_combout\,
	datad => VCC,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\);

-- Location: LCCOMB_X62_Y43_N16
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ & (((\Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ & (!\Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[62]~75_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[62]~74_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~1\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\);

-- Location: LCCOMB_X62_Y43_N18
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ & ((((\Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\))))) # (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ & ((\Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\) # (GND))))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\) # ((\Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[63]~72_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[63]~73_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~3\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\);

-- Location: LCCOMB_X62_Y43_N20
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\ & (((!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\)))) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\ & (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\)) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\) # (GND)))))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ = CARRY(((!\Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\ & !\Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\)) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[64]~70_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[64]~71_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~5\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\);

-- Location: LCCOMB_X62_Y43_N22
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & (((\Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & ((((\Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\)))))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ = CARRY((!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & ((\Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[65]~68_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[65]~69_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~7\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\);

-- Location: LCCOMB_X62_Y43_N24
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ & (((\Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ & (!\Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~11\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[66]~66_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[66]~67_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~9\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~11\);

-- Location: LCCOMB_X62_Y43_N26
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ = \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~11\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\);

-- Location: LCCOMB_X63_Y43_N4
\Mod3|auto_generated|divider|divider|StageOut[77]~116\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (Msec(9))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(9),
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\);

-- Location: LCCOMB_X60_Y43_N8
\Mod3|auto_generated|divider|divider|StageOut[77]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\);

-- Location: LCCOMB_X62_Y43_N0
\Mod3|auto_generated|divider|divider|StageOut[76]~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\);

-- Location: LCCOMB_X62_Y43_N6
\Mod3|auto_generated|divider|divider|StageOut[76]~117\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (Msec(8))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => Msec(8),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\);

-- Location: LCCOMB_X63_Y43_N30
\Mod3|auto_generated|divider|divider|StageOut[75]~118\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (Msec(7))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(7),
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\);

-- Location: LCCOMB_X61_Y43_N6
\Mod3|auto_generated|divider|divider|StageOut[75]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\);

-- Location: LCCOMB_X63_Y43_N8
\Mod3|auto_generated|divider|divider|StageOut[74]~119\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (Msec(6))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => Msec(6),
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\);

-- Location: LCCOMB_X61_Y43_N0
\Mod3|auto_generated|divider|divider|StageOut[74]~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\);

-- Location: LCCOMB_X63_Y43_N14
\Mod3|auto_generated|divider|divider|StageOut[73]~120\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (Msec(5))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => Msec(5),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\);

-- Location: LCCOMB_X62_Y43_N2
\Mod3|auto_generated|divider|divider|StageOut[73]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\);

-- Location: LCCOMB_X61_Y43_N20
\Mod3|auto_generated|divider|divider|StageOut[72]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\);

-- Location: LCCOMB_X61_Y43_N18
\Mod3|auto_generated|divider|divider|StageOut[72]~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\ = (Msec(4) & \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(4),
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\);

-- Location: LCCOMB_X61_Y43_N10
\Mod3|auto_generated|divider|divider|StageOut[60]~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[60]~87_combout\ = (Msec(3) & !\Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(3),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[60]~87_combout\);

-- Location: LCCOMB_X61_Y43_N24
\Mod3|auto_generated|divider|divider|StageOut[60]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[60]~86_combout\ = (Msec(3) & \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(3),
	datad => \Mod3|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[60]~86_combout\);

-- Location: LCCOMB_X61_Y43_N16
\Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[60]~87_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[60]~86_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[60]~87_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[60]~86_combout\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\);

-- Location: LCCOMB_X61_Y43_N28
\Mod3|auto_generated|divider|divider|StageOut[71]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\);

-- Location: LCCOMB_X61_Y43_N22
\Mod3|auto_generated|divider|divider|StageOut[71]~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\ = (Msec(3) & \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(3),
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\);

-- Location: LCCOMB_X60_Y43_N12
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\ = (((\Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[71]~88_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[71]~85_combout\,
	datad => VCC,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\);

-- Location: LCCOMB_X60_Y43_N14
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ & (((\Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ & (!\Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[72]~84_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[72]~83_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~1\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\);

-- Location: LCCOMB_X60_Y43_N16
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ & ((((\Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\))))) # (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ & ((\Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\) # (GND))))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\) # ((\Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[73]~82_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~3\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\);

-- Location: LCCOMB_X60_Y43_N18
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\ & (((!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\)))) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\ & (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\)) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\) # (GND)))))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ = CARRY(((!\Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\ & !\Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\)) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[74]~81_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~5\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\);

-- Location: LCCOMB_X60_Y43_N20
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & (((\Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & ((((\Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\)))))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ = CARRY((!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & ((\Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[75]~80_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~7\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\);

-- Location: LCCOMB_X60_Y43_N22
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ & (((\Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ & (!\Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[76]~79_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~9\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\);

-- Location: LCCOMB_X60_Y43_N24
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\ & ((((\Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\))))) # (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\ & ((\Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\) # (GND))))
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~13\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\) # ((\Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[77]~78_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~11\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~13\);

-- Location: LCCOMB_X60_Y43_N26
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ = !\Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~13\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\);

-- Location: LCCOMB_X60_Y43_N0
\Mod3|auto_generated|divider|divider|StageOut[84]~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\);

-- Location: LCCOMB_X62_Y43_N12
\Mod3|auto_generated|divider|divider|StageOut[84]~115\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\) # 
-- ((!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[73]~120_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\);

-- Location: LCCOMB_X60_Y43_N10
\Mod3|auto_generated|divider|divider|StageOut[83]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\);

-- Location: LCCOMB_X61_Y43_N4
\Mod3|auto_generated|divider|divider|StageOut[83]~121\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((Msec(4)))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	datad => Msec(4),
	combout => \Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\);

-- Location: LCCOMB_X60_Y43_N28
\Mod3|auto_generated|divider|divider|StageOut[82]~95\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\);

-- Location: LCCOMB_X61_Y43_N30
\Mod3|auto_generated|divider|divider|StageOut[82]~122\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((Msec(3)))) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\,
	datac => Msec(3),
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\);

-- Location: LCCOMB_X61_Y44_N4
\Mod3|auto_generated|divider|divider|StageOut[81]~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & Msec(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => Msec(2),
	combout => \Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\);

-- Location: LCCOMB_X61_Y44_N16
\Mod3|auto_generated|divider|divider|StageOut[70]~98\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[70]~98_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & Msec(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => Msec(2),
	combout => \Mod3|auto_generated|divider|divider|StageOut[70]~98_combout\);

-- Location: LCCOMB_X61_Y44_N6
\Mod3|auto_generated|divider|divider|StageOut[70]~97\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[70]~97_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & Msec(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => Msec(2),
	combout => \Mod3|auto_generated|divider|divider|StageOut[70]~97_combout\);

-- Location: LCCOMB_X61_Y44_N0
\Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[70]~98_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[70]~97_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod3|auto_generated|divider|divider|StageOut[70]~98_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[70]~97_combout\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16_combout\);

-- Location: LCCOMB_X61_Y44_N2
\Mod3|auto_generated|divider|divider|StageOut[81]~99\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[1]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\);

-- Location: LCCOMB_X64_Y43_N0
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0_combout\ = (((\Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\,
	datad => VCC,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\);

-- Location: LCCOMB_X64_Y43_N2
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\ & (((\Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\ & (!\Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~1\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\);

-- Location: LCCOMB_X64_Y43_N4
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ & ((((\Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\))))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ & ((\Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\) # (GND))))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\) # ((\Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~3\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\);

-- Location: LCCOMB_X64_Y43_N6
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\ & (((!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\)))) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\ & (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\)) # 
-- (!\Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\ & ((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\) # (GND)))))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ = CARRY(((!\Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\ & !\Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\)) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~5\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\);

-- Location: LCCOMB_X60_Y43_N2
\Mod3|auto_generated|divider|divider|StageOut[88]~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\);

-- Location: LCCOMB_X60_Y43_N30
\Mod3|auto_generated|divider|divider|StageOut[88]~111\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[77]~116_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[7]~10_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\);

-- Location: LCCOMB_X62_Y43_N28
\Mod3|auto_generated|divider|divider|StageOut[87]~112\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[76]~117_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\);

-- Location: LCCOMB_X60_Y43_N4
\Mod3|auto_generated|divider|divider|StageOut[87]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[7]~10_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\);

-- Location: LCCOMB_X61_Y43_N8
\Mod3|auto_generated|divider|divider|StageOut[86]~113\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[75]~118_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\);

-- Location: LCCOMB_X61_Y43_N14
\Mod3|auto_generated|divider|divider|StageOut[86]~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\);

-- Location: LCCOMB_X61_Y43_N26
\Mod3|auto_generated|divider|divider|StageOut[85]~114\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ & !\Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[74]~119_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\);

-- Location: LCCOMB_X60_Y43_N6
\Mod3|auto_generated|divider|divider|StageOut[85]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\);

-- Location: LCCOMB_X64_Y43_N8
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ & (((\Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ & ((((\Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\)))))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ = CARRY((!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ & ((\Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~7\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\);

-- Location: LCCOMB_X64_Y43_N10
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ & (((\Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ & (!\Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~9\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\);

-- Location: LCCOMB_X64_Y43_N12
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ & ((((\Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\))))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ & ((\Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\) # (GND))))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\) # ((\Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\) # 
-- (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~11\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\);

-- Location: LCCOMB_X64_Y43_N14
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ & (((\Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ & (!\Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\ & 
-- (!\Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\)))
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~15\ = CARRY((!\Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\ & (!\Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\ & 
-- !\Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\,
	datad => VCC,
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~13\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\,
	cout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~15\);

-- Location: LCCOMB_X64_Y43_N16
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ = \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~15\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\);

-- Location: LCCOMB_X64_Y43_N18
\Mod3|auto_generated|divider|divider|StageOut[95]~104\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[84]~115_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[84]~93_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\);

-- Location: LCCOMB_X64_Y43_N20
\Mod3|auto_generated|divider|divider|StageOut[94]~105\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[83]~94_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[83]~121_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\);

-- Location: LCCOMB_X64_Y43_N22
\Mod3|auto_generated|divider|divider|StageOut[93]~106\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[82]~95_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[82]~122_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\);

-- Location: LCCOMB_X61_Y44_N20
\Mod3|auto_generated|divider|divider|StageOut[92]~107\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\) # 
-- (\Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[2]~0_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[81]~99_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[81]~96_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\);

-- Location: LCCOMB_X61_Y44_N22
\Mod3|auto_generated|divider|divider|StageOut[80]~108\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[80]~108_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & Msec(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => Msec(1),
	combout => \Mod3|auto_generated|divider|divider|StageOut[80]~108_combout\);

-- Location: LCCOMB_X61_Y44_N24
\Mod3|auto_generated|divider|divider|StageOut[80]~109\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[80]~109_combout\ = (!\Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\ & Msec(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|add_sub_8_result_int[9]~14_combout\,
	datad => Msec(1),
	combout => \Mod3|auto_generated|divider|divider|StageOut[80]~109_combout\);

-- Location: LCCOMB_X61_Y44_N10
\Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[80]~108_combout\) # (\Mod3|auto_generated|divider|divider|StageOut[80]~109_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod3|auto_generated|divider|divider|StageOut[80]~108_combout\,
	datad => \Mod3|auto_generated|divider|divider|StageOut[80]~109_combout\,
	combout => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18_combout\);

-- Location: LCCOMB_X61_Y44_N18
\Mod3|auto_generated|divider|divider|StageOut[91]~110\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((Msec(1)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & 
-- (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[1]~18_combout\,
	datab => Msec(1),
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\);

-- Location: LCCOMB_X62_Y45_N6
\Add13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~0_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\ & (Msec(1) $ (VCC))) # (!\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\ & ((Msec(1)) # (GND)))
-- \Add13~1\ = CARRY((Msec(1)) # (!\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\,
	datab => Msec(1),
	datad => VCC,
	combout => \Add13~0_combout\,
	cout => \Add13~1\);

-- Location: LCCOMB_X62_Y45_N8
\Add13~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~2_combout\ = (Msec(2) & ((\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & (!\Add13~1\)) # (!\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & (\Add13~1\ & VCC)))) # (!Msec(2) & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & ((\Add13~1\) # (GND))) # (!\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & (!\Add13~1\))))
-- \Add13~3\ = CARRY((Msec(2) & (\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & !\Add13~1\)) # (!Msec(2) & ((\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\) # (!\Add13~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(2),
	datab => \Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\,
	datad => VCC,
	cin => \Add13~1\,
	combout => \Add13~2_combout\,
	cout => \Add13~3\);

-- Location: LCCOMB_X62_Y45_N10
\Add13~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~4_combout\ = ((\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ $ (Msec(3) $ (\Add13~3\)))) # (GND)
-- \Add13~5\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ & (Msec(3) & !\Add13~3\)) # (!\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ & ((Msec(3)) # (!\Add13~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\,
	datab => Msec(3),
	datad => VCC,
	cin => \Add13~3\,
	combout => \Add13~4_combout\,
	cout => \Add13~5\);

-- Location: LCCOMB_X62_Y45_N12
\Add13~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~6_combout\ = (Msec(4) & ((\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & (!\Add13~5\)) # (!\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & (\Add13~5\ & VCC)))) # (!Msec(4) & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & ((\Add13~5\) # (GND))) # (!\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & (!\Add13~5\))))
-- \Add13~7\ = CARRY((Msec(4) & (\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & !\Add13~5\)) # (!Msec(4) & ((\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\) # (!\Add13~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(4),
	datab => \Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\,
	datad => VCC,
	cin => \Add13~5\,
	combout => \Add13~6_combout\,
	cout => \Add13~7\);

-- Location: LCCOMB_X62_Y45_N14
\Add13~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~8_combout\ = ((\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ $ (Msec(5) $ (\Add13~7\)))) # (GND)
-- \Add13~9\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ & (Msec(5) & !\Add13~7\)) # (!\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ & ((Msec(5)) # (!\Add13~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\,
	datab => Msec(5),
	datad => VCC,
	cin => \Add13~7\,
	combout => \Add13~8_combout\,
	cout => \Add13~9\);

-- Location: LCCOMB_X64_Y43_N30
\Mod3|auto_generated|divider|divider|StageOut[97]~102\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[86]~113_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[86]~91_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\);

-- Location: LCCOMB_X64_Y43_N24
\Mod3|auto_generated|divider|divider|StageOut[96]~103\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[85]~114_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[85]~92_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\);

-- Location: LCCOMB_X62_Y45_N16
\Add13~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~10_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & ((Msec(6) & (!\Add13~9\)) # (!Msec(6) & ((\Add13~9\) # (GND))))) # (!\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & ((Msec(6) & (\Add13~9\ & VCC)) # 
-- (!Msec(6) & (!\Add13~9\))))
-- \Add13~11\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & ((!\Add13~9\) # (!Msec(6)))) # (!\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & (!Msec(6) & !\Add13~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\,
	datab => Msec(6),
	datad => VCC,
	cin => \Add13~9\,
	combout => \Add13~10_combout\,
	cout => \Add13~11\);

-- Location: LCCOMB_X62_Y45_N18
\Add13~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~12_combout\ = ((Msec(7) $ (\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ $ (\Add13~11\)))) # (GND)
-- \Add13~13\ = CARRY((Msec(7) & ((!\Add13~11\) # (!\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\))) # (!Msec(7) & (!\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ & !\Add13~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(7),
	datab => \Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\,
	datad => VCC,
	cin => \Add13~11\,
	combout => \Add13~12_combout\,
	cout => \Add13~13\);

-- Location: LCCOMB_X61_Y45_N10
\CharMsec~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~3_combout\ = (\Add13~8_combout\ & (\Add13~12_combout\ & (!\Add13~10_combout\ & \Add13~2_combout\))) # (!\Add13~8_combout\ & (!\Add13~12_combout\ & (\Add13~10_combout\ & !\Add13~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datab => \Add13~12_combout\,
	datac => \Add13~10_combout\,
	datad => \Add13~2_combout\,
	combout => \CharMsec~3_combout\);

-- Location: LCCOMB_X64_Y43_N26
\Mod3|auto_generated|divider|divider|StageOut[99]~100\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[88]~89_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[88]~111_combout\,
	datac => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\);

-- Location: LCCOMB_X64_Y43_N28
\Mod3|auto_generated|divider|divider|StageOut[98]~101\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ = (\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\) # 
-- ((\Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\)))) # (!\Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (((\Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[87]~90_combout\,
	datab => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	datac => \Mod3|auto_generated|divider|divider|StageOut[87]~112_combout\,
	datad => \Mod3|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	combout => \Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\);

-- Location: LCCOMB_X62_Y45_N20
\Add13~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~14_combout\ = (Msec(8) & ((\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & (!\Add13~13\)) # (!\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & (\Add13~13\ & VCC)))) # (!Msec(8) & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & ((\Add13~13\) # (GND))) # (!\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & (!\Add13~13\))))
-- \Add13~15\ = CARRY((Msec(8) & (\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & !\Add13~13\)) # (!Msec(8) & ((\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\) # (!\Add13~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(8),
	datab => \Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\,
	datad => VCC,
	cin => \Add13~13\,
	combout => \Add13~14_combout\,
	cout => \Add13~15\);

-- Location: LCCOMB_X62_Y45_N22
\Add13~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~16_combout\ = ((Msec(9) $ (\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ $ (\Add13~15\)))) # (GND)
-- \Add13~17\ = CARRY((Msec(9) & ((!\Add13~15\) # (!\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\))) # (!Msec(9) & (!\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ & !\Add13~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Msec(9),
	datab => \Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\,
	datad => VCC,
	cin => \Add13~15\,
	combout => \Add13~16_combout\,
	cout => \Add13~17\);

-- Location: LCCOMB_X62_Y45_N24
\Add13~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~18_combout\ = !\Add13~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add13~17\,
	combout => \Add13~18_combout\);

-- Location: LCCOMB_X61_Y45_N8
\CharMsec~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~2_combout\ = (\Add13~4_combout\ & (!\Add13~18_combout\ & (\Add13~6_combout\ & !\Add13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \Add13~18_combout\,
	datac => \Add13~6_combout\,
	datad => \Add13~0_combout\,
	combout => \CharMsec~2_combout\);

-- Location: LCCOMB_X61_Y45_N4
\CharMsec~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~4_combout\ = (\CharMsec~3_combout\ & (\CharMsec~2_combout\ & (!\Add13~14_combout\ & \Add13~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~3_combout\,
	datab => \CharMsec~2_combout\,
	datac => \Add13~14_combout\,
	datad => \Add13~16_combout\,
	combout => \CharMsec~4_combout\);

-- Location: LCCOMB_X61_Y45_N30
\CharMsec[2][3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][3]~5_combout\ = (\Add13~4_combout\ & (!\Add13~6_combout\ & !\Add13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datac => \Add13~6_combout\,
	datad => \Add13~0_combout\,
	combout => \CharMsec[2][3]~5_combout\);

-- Location: LCCOMB_X61_Y45_N24
\CharMsec[2][3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][3]~6_combout\ = (!\Add13~18_combout\ & (\CharMsec[2][3]~5_combout\ & !\Add13~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add13~18_combout\,
	datac => \CharMsec[2][3]~5_combout\,
	datad => \Add13~16_combout\,
	combout => \CharMsec[2][3]~6_combout\);

-- Location: LCCOMB_X61_Y45_N2
\CharMsec[2][3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][3]~7_combout\ = (\Add13~8_combout\ & (!\Add13~12_combout\ & (\Add13~14_combout\ & !\Add13~10_combout\))) # (!\Add13~8_combout\ & (\Add13~12_combout\ & (!\Add13~14_combout\ & \Add13~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datab => \Add13~12_combout\,
	datac => \Add13~14_combout\,
	datad => \Add13~10_combout\,
	combout => \CharMsec[2][3]~7_combout\);

-- Location: LCCOMB_X61_Y45_N12
\CharMsec[2][3]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][3]~8_combout\ = ((\Add13~8_combout\ $ (\Add13~2_combout\)) # (!\CharMsec[2][3]~7_combout\)) # (!\CharMsec[2][3]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datab => \CharMsec[2][3]~6_combout\,
	datac => \CharMsec[2][3]~7_combout\,
	datad => \Add13~2_combout\,
	combout => \CharMsec[2][3]~8_combout\);

-- Location: LCCOMB_X59_Y45_N0
\CharMsec~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~9_combout\ = (\CharMsec~4_combout\) # (!\CharMsec[2][3]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CharMsec~4_combout\,
	datac => \CharMsec[2][3]~8_combout\,
	combout => \CharMsec~9_combout\);

-- Location: LCCOMB_X59_Y45_N10
\Equal55~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal55~1_combout\ = (\Add13~10_combout\ & (\Add13~8_combout\ & \Add13~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~10_combout\,
	datac => \Add13~8_combout\,
	datad => \Add13~2_combout\,
	combout => \Equal55~1_combout\);

-- Location: LCCOMB_X61_Y45_N6
\Equal54~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal54~0_combout\ = (!\Add13~0_combout\ & (!\Add13~16_combout\ & (!\Add13~18_combout\ & \Add13~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~0_combout\,
	datab => \Add13~16_combout\,
	datac => \Add13~18_combout\,
	datad => \Add13~12_combout\,
	combout => \Equal54~0_combout\);

-- Location: LCCOMB_X59_Y45_N16
\Equal55~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal55~0_combout\ = (!\Add13~4_combout\ & (\Add13~6_combout\ & (\Add13~14_combout\ & \Equal54~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \Add13~6_combout\,
	datac => \Add13~14_combout\,
	datad => \Equal54~0_combout\,
	combout => \Equal55~0_combout\);

-- Location: LCCOMB_X59_Y45_N20
\Equal54~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal54~1_combout\ = (!\Add13~2_combout\ & (\Add13~6_combout\ & (\Add13~14_combout\ & !\Add13~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~2_combout\,
	datab => \Add13~6_combout\,
	datac => \Add13~14_combout\,
	datad => \Add13~4_combout\,
	combout => \Equal54~1_combout\);

-- Location: LCCOMB_X59_Y45_N6
\Equal54~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal54~2_combout\ = (\Equal54~0_combout\ & (\Equal54~1_combout\ & (!\Add13~10_combout\ & !\Add13~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal54~0_combout\,
	datab => \Equal54~1_combout\,
	datac => \Add13~10_combout\,
	datad => \Add13~8_combout\,
	combout => \Equal54~2_combout\);

-- Location: LCCOMB_X59_Y45_N4
\CharMsec~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~10_combout\ = (\CharMsec~4_combout\) # ((\Equal54~2_combout\) # ((\Equal55~1_combout\ & \Equal55~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal55~1_combout\,
	datab => \Equal55~0_combout\,
	datac => \CharMsec~4_combout\,
	datad => \Equal54~2_combout\,
	combout => \CharMsec~10_combout\);

-- Location: LCCOMB_X62_Y45_N26
\Equal50~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal50~0_combout\ = (!\Add13~4_combout\ & (!\Add13~6_combout\ & (!\Add13~2_combout\ & !\Add13~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \Add13~6_combout\,
	datac => \Add13~2_combout\,
	datad => \Add13~10_combout\,
	combout => \Equal50~0_combout\);

-- Location: LCCOMB_X62_Y45_N4
\Equal50~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal50~1_combout\ = (!\Add13~16_combout\ & (!\Add13~12_combout\ & (!\Add13~8_combout\ & !\Add13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~16_combout\,
	datab => \Add13~12_combout\,
	datac => \Add13~8_combout\,
	datad => \Add13~0_combout\,
	combout => \Equal50~1_combout\);

-- Location: LCCOMB_X62_Y45_N30
\Equal50~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal50~2_combout\ = (\Equal50~0_combout\ & (\Equal50~1_combout\ & (!\Add13~18_combout\ & !\Add13~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal50~0_combout\,
	datab => \Equal50~1_combout\,
	datac => \Add13~18_combout\,
	datad => \Add13~14_combout\,
	combout => \Equal50~2_combout\);

-- Location: LCCOMB_X62_Y45_N0
\Equal51~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal51~0_combout\ = (!\Add13~6_combout\ & (\Add13~8_combout\ & (\Add13~2_combout\ & !\Add13~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~6_combout\,
	datab => \Add13~8_combout\,
	datac => \Add13~2_combout\,
	datad => \Add13~12_combout\,
	combout => \Equal51~0_combout\);

-- Location: LCCOMB_X62_Y45_N2
\Equal51~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal51~1_combout\ = (!\Add13~18_combout\ & (\Equal51~0_combout\ & (!\Add13~16_combout\ & !\Add13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~18_combout\,
	datab => \Equal51~0_combout\,
	datac => \Add13~16_combout\,
	datad => \Add13~0_combout\,
	combout => \Equal51~1_combout\);

-- Location: LCCOMB_X62_Y45_N28
\Equal51~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal51~2_combout\ = (!\Add13~4_combout\ & (!\Add13~14_combout\ & (\Add13~10_combout\ & \Equal51~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \Add13~14_combout\,
	datac => \Add13~10_combout\,
	datad => \Equal51~1_combout\,
	combout => \Equal51~2_combout\);

-- Location: LCCOMB_X59_Y45_N30
\CharMsec[2][3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][3]~11_combout\ = ((\CharMsec~10_combout\) # ((\Equal50~2_combout\) # (\Equal51~2_combout\))) # (!\CharMsec[2][3]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[2][3]~8_combout\,
	datab => \CharMsec~10_combout\,
	datac => \Equal50~2_combout\,
	datad => \Equal51~2_combout\,
	combout => \CharMsec[2][3]~11_combout\);

-- Location: LCCOMB_X59_Y45_N24
\Mux8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (FrBitCnt(0) & ((\CharMsec~10_combout\) # ((!FrBitCnt(1))))) # (!FrBitCnt(0) & (((!FrBitCnt(1) & !\CharMsec[2][3]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => \CharMsec~10_combout\,
	datac => FrBitCnt(1),
	datad => \CharMsec[2][3]~11_combout\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X61_Y45_N26
\CharMsec[2][0]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~13_combout\ = (\Add13~12_combout\) # ((\Add13~8_combout\ & ((!\Add13~16_combout\) # (!\Add13~14_combout\))) # (!\Add13~8_combout\ & ((\Add13~14_combout\) # (\Add13~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datab => \Add13~12_combout\,
	datac => \Add13~14_combout\,
	datad => \Add13~16_combout\,
	combout => \CharMsec[2][0]~13_combout\);

-- Location: LCCOMB_X61_Y45_N0
\CharMsec[2][0]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~12_combout\ = (\Add13~4_combout\) # ((\Add13~18_combout\) # ((\Add13~6_combout\) # (\Add13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \Add13~18_combout\,
	datac => \Add13~6_combout\,
	datad => \Add13~0_combout\,
	combout => \CharMsec[2][0]~12_combout\);

-- Location: LCCOMB_X61_Y45_N28
\CharMsec[2][0]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~14_combout\ = (!\CharMsec[2][0]~13_combout\ & (!\CharMsec[2][0]~12_combout\ & (!\Add13~10_combout\ & !\Add13~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[2][0]~13_combout\,
	datab => \CharMsec[2][0]~12_combout\,
	datac => \Add13~10_combout\,
	datad => \Add13~2_combout\,
	combout => \CharMsec[2][0]~14_combout\);

-- Location: LCCOMB_X61_Y45_N22
\CharMsec[2][0]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~15_combout\ = (!\Add13~8_combout\ & (\Add13~4_combout\ & !\Add13~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datac => \Add13~4_combout\,
	datad => \Add13~2_combout\,
	combout => \CharMsec[2][0]~15_combout\);

-- Location: LCCOMB_X61_Y45_N16
\Equal56~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal56~0_combout\ = (!\Add13~0_combout\ & (!\Add13~18_combout\ & (\Add13~6_combout\ & \Add13~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~0_combout\,
	datab => \Add13~18_combout\,
	datac => \Add13~6_combout\,
	datad => \Add13~16_combout\,
	combout => \Equal56~0_combout\);

-- Location: LCCOMB_X61_Y45_N18
\CharMsec[2][0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~16_combout\ = (\Equal54~0_combout\ & (((\Equal56~0_combout\ & !\Add13~12_combout\)) # (!\Add13~6_combout\))) # (!\Equal54~0_combout\ & (\Equal56~0_combout\ & ((!\Add13~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal54~0_combout\,
	datab => \Equal56~0_combout\,
	datac => \Add13~6_combout\,
	datad => \Add13~12_combout\,
	combout => \CharMsec[2][0]~16_combout\);

-- Location: LCCOMB_X61_Y45_N20
\CharMsec[2][0]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~17_combout\ = (\CharMsec[2][0]~15_combout\ & (\CharMsec[2][0]~16_combout\ & (!\Add13~14_combout\ & \Add13~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[2][0]~15_combout\,
	datab => \CharMsec[2][0]~16_combout\,
	datac => \Add13~14_combout\,
	datad => \Add13~10_combout\,
	combout => \CharMsec[2][0]~17_combout\);

-- Location: LCCOMB_X61_Y45_N14
\CharMsec[2][0]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[2][0]~18_combout\ = (\CharMsec[2][0]~14_combout\) # ((\Equal54~2_combout\) # (\CharMsec[2][0]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CharMsec[2][0]~14_combout\,
	datac => \Equal54~2_combout\,
	datad => \CharMsec[2][0]~17_combout\,
	combout => \CharMsec[2][0]~18_combout\);

-- Location: LCCOMB_X59_Y45_N26
\Mux8~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\ & (((!\Add9~0_combout\) # (!\CharMsec[2][0]~18_combout\)))) # (!\Mux8~0_combout\ & (\CharMsec~9_combout\ & ((\Add9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~9_combout\,
	datab => \Mux8~0_combout\,
	datac => \CharMsec[2][0]~18_combout\,
	datad => \Add9~0_combout\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X63_Y46_N8
\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = Msec(7) $ (VCC)
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(Msec(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Msec(7),
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X63_Y46_N10
\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (Msec(8) & (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!Msec(8) & (!\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!Msec(8) & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(8),
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X63_Y46_N12
\Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (Msec(9) & (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!Msec(9) & (!\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((Msec(9) & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Msec(9),
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X63_Y46_N14
\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X63_Y47_N26
\Mod2|auto_generated|divider|divider|StageOut[33]~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\);

-- Location: LCCOMB_X63_Y47_N16
\Mod2|auto_generated|divider|divider|StageOut[33]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\ = (Msec(9) & \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(9),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\);

-- Location: LCCOMB_X63_Y47_N0
\Mod2|auto_generated|divider|divider|StageOut[32]~95\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\);

-- Location: LCCOMB_X63_Y47_N20
\Mod2|auto_generated|divider|divider|StageOut[32]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\ = (Msec(8) & \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(8),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\);

-- Location: LCCOMB_X63_Y47_N28
\Mod2|auto_generated|divider|divider|StageOut[31]~97\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\);

-- Location: LCCOMB_X63_Y47_N18
\Mod2|auto_generated|divider|divider|StageOut[31]~96\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\ = (Msec(7) & \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(7),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\);

-- Location: LCCOMB_X63_Y47_N30
\Mod2|auto_generated|divider|divider|StageOut[30]~98\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\ = (Msec(6) & \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(6),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\);

-- Location: LCCOMB_X63_Y47_N24
\Mod2|auto_generated|divider|divider|StageOut[30]~99\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\ = (Msec(6) & !\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(6),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\);

-- Location: LCCOMB_X63_Y47_N6
\Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[30]~98_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[30]~99_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X63_Y47_N8
\Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[31]~97_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[31]~96_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X63_Y47_N10
\Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[32]~95_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[32]~94_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X63_Y47_N12
\Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[33]~93_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[33]~92_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X63_Y47_N14
\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X63_Y47_N2
\Mod2|auto_generated|divider|divider|StageOut[44]~172\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (Msec(9))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(9),
	datab => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\);

-- Location: LCCOMB_X62_Y47_N24
\Mod2|auto_generated|divider|divider|StageOut[44]~100\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\);

-- Location: LCCOMB_X63_Y47_N4
\Mod2|auto_generated|divider|divider|StageOut[43]~173\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((Msec(8)))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => Msec(8),
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\);

-- Location: LCCOMB_X62_Y47_N14
\Mod2|auto_generated|divider|divider|StageOut[43]~101\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\);

-- Location: LCCOMB_X62_Y47_N16
\Mod2|auto_generated|divider|divider|StageOut[42]~102\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\);

-- Location: LCCOMB_X63_Y47_N22
\Mod2|auto_generated|divider|divider|StageOut[42]~174\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((Msec(7)))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => Msec(7),
	datad => \Mod2|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\);

-- Location: LCCOMB_X62_Y47_N28
\Mod2|auto_generated|divider|divider|StageOut[41]~104\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\);

-- Location: LCCOMB_X62_Y47_N18
\Mod2|auto_generated|divider|divider|StageOut[41]~103\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & Msec(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => Msec(6),
	combout => \Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\);

-- Location: LCCOMB_X62_Y47_N22
\Mod2|auto_generated|divider|divider|StageOut[40]~105\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\ = (Msec(5) & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(5),
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\);

-- Location: LCCOMB_X62_Y47_N0
\Mod2|auto_generated|divider|divider|StageOut[40]~106\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\ = (Msec(5) & !\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(5),
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\);

-- Location: LCCOMB_X62_Y47_N2
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[40]~105_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[40]~106_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X62_Y47_N4
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[41]~104_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[41]~103_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X62_Y47_N6
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[42]~102_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X62_Y47_N8
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[43]~101_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\);

-- Location: LCCOMB_X62_Y47_N10
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((((\Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ & ((\Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[44]~100_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~9\);

-- Location: LCCOMB_X62_Y47_N12
\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~9\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X65_Y47_N16
\Mod2|auto_generated|divider|divider|StageOut[55]~107\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\);

-- Location: LCCOMB_X65_Y47_N20
\Mod2|auto_generated|divider|divider|StageOut[55]~154\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[44]~172_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\);

-- Location: LCCOMB_X62_Y47_N26
\Mod2|auto_generated|divider|divider|StageOut[54]~155\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[43]~173_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\);

-- Location: LCCOMB_X66_Y47_N0
\Mod2|auto_generated|divider|divider|StageOut[54]~108\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\);

-- Location: LCCOMB_X62_Y47_N20
\Mod2|auto_generated|divider|divider|StageOut[53]~156\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[42]~174_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\);

-- Location: LCCOMB_X66_Y47_N2
\Mod2|auto_generated|divider|divider|StageOut[53]~109\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\);

-- Location: LCCOMB_X62_Y47_N30
\Mod2|auto_generated|divider|divider|StageOut[52]~175\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (Msec(6))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => Msec(6),
	datac => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\);

-- Location: LCCOMB_X66_Y47_N4
\Mod2|auto_generated|divider|divider|StageOut[52]~110\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\);

-- Location: LCCOMB_X65_Y47_N12
\Mod2|auto_generated|divider|divider|StageOut[51]~112\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\);

-- Location: LCCOMB_X65_Y47_N18
\Mod2|auto_generated|divider|divider|StageOut[51]~111\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & Msec(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => Msec(5),
	combout => \Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\);

-- Location: LCCOMB_X66_Y47_N14
\Mod2|auto_generated|divider|divider|StageOut[50]~113\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\ = (Msec(4) & \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(4),
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\);

-- Location: LCCOMB_X66_Y47_N8
\Mod2|auto_generated|divider|divider|StageOut[50]~114\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\ = (Msec(4) & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(4),
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\);

-- Location: LCCOMB_X66_Y47_N18
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[50]~113_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[50]~114_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X66_Y47_N20
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[51]~112_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[51]~111_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

-- Location: LCCOMB_X66_Y47_N22
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[52]~110_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

-- Location: LCCOMB_X66_Y47_N24
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[53]~109_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\);

-- Location: LCCOMB_X66_Y47_N26
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ & ((((\Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ & ((\Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[54]~108_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\);

-- Location: LCCOMB_X66_Y47_N28
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ & (((\Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\ & (!\Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~11\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[55]~107_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~9\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~11\);

-- Location: LCCOMB_X66_Y47_N30
\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ = \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~11\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\);

-- Location: LCCOMB_X66_Y49_N30
\Mod2|auto_generated|divider|divider|StageOut[60]~122\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & Msec(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => Msec(3),
	combout => \Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\);

-- Location: LCCOMB_X65_Y49_N12
\Mod2|auto_generated|divider|divider|StageOut[60]~123\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\ = (Msec(3) & !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(3),
	datad => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\);

-- Location: LCCOMB_X66_Y49_N4
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[60]~122_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[60]~123_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

-- Location: LCCOMB_X66_Y49_N0
\Mod2|auto_generated|divider|divider|StageOut[66]~115\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\);

-- Location: LCCOMB_X65_Y47_N22
\Mod2|auto_generated|divider|divider|StageOut[66]~157\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[55]~154_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\);

-- Location: LCCOMB_X66_Y47_N12
\Mod2|auto_generated|divider|divider|StageOut[65]~158\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[4]~6_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[54]~155_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\);

-- Location: LCCOMB_X65_Y49_N16
\Mod2|auto_generated|divider|divider|StageOut[65]~116\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\);

-- Location: LCCOMB_X66_Y49_N26
\Mod2|auto_generated|divider|divider|StageOut[64]~117\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\);

-- Location: LCCOMB_X66_Y47_N6
\Mod2|auto_generated|divider|divider|StageOut[64]~159\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[53]~156_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\);

-- Location: LCCOMB_X66_Y47_N16
\Mod2|auto_generated|divider|divider|StageOut[63]~160\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[52]~175_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\);

-- Location: LCCOMB_X66_Y49_N28
\Mod2|auto_generated|divider|divider|StageOut[63]~118\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\);

-- Location: LCCOMB_X65_Y47_N6
\Mod2|auto_generated|divider|divider|StageOut[62]~119\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\);

-- Location: LCCOMB_X65_Y47_N2
\Mod2|auto_generated|divider|divider|StageOut[62]~176\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (Msec(5))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => Msec(5),
	datad => \Mod2|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\);

-- Location: LCCOMB_X66_Y47_N10
\Mod2|auto_generated|divider|divider|StageOut[61]~120\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\ = (Msec(4) & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Msec(4),
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\);

-- Location: LCCOMB_X65_Y49_N2
\Mod2|auto_generated|divider|divider|StageOut[61]~121\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\);

-- Location: LCCOMB_X66_Y49_N6
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[61]~120_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[61]~121_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

-- Location: LCCOMB_X66_Y49_N8
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[62]~119_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

-- Location: LCCOMB_X66_Y49_N10
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[63]~118_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\);

-- Location: LCCOMB_X66_Y49_N12
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ & ((((\Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ & ((\Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[64]~117_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\);

-- Location: LCCOMB_X66_Y49_N14
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ & (((\Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ & (!\Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[65]~116_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~9\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\);

-- Location: LCCOMB_X66_Y49_N16
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ & ((((\Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ & ((\Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~13\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[66]~115_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~11\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~13\);

-- Location: LCCOMB_X66_Y49_N18
\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ = !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~13\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\);

-- Location: LCCOMB_X65_Y49_N6
\Mod2|auto_generated|divider|divider|StageOut[77]~124\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\);

-- Location: LCCOMB_X66_Y49_N24
\Mod2|auto_generated|divider|divider|StageOut[77]~161\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[6]~10_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[66]~157_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\);

-- Location: LCCOMB_X65_Y49_N8
\Mod2|auto_generated|divider|divider|StageOut[76]~125\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\);

-- Location: LCCOMB_X65_Y49_N28
\Mod2|auto_generated|divider|divider|StageOut[76]~162\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[65]~158_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\);

-- Location: LCCOMB_X65_Y48_N2
\Mod2|auto_generated|divider|divider|StageOut[75]~163\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[64]~159_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[4]~6_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\);

-- Location: LCCOMB_X65_Y49_N10
\Mod2|auto_generated|divider|divider|StageOut[75]~126\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\);

-- Location: LCCOMB_X65_Y49_N20
\Mod2|auto_generated|divider|divider|StageOut[74]~127\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\);

-- Location: LCCOMB_X66_Y49_N2
\Mod2|auto_generated|divider|divider|StageOut[74]~164\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[63]~160_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\);

-- Location: LCCOMB_X65_Y47_N0
\Mod2|auto_generated|divider|divider|StageOut[73]~165\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\) # 
-- ((!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[62]~176_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\);

-- Location: LCCOMB_X62_Y48_N8
\Mod2|auto_generated|divider|divider|StageOut[73]~128\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\);

-- Location: LCCOMB_X65_Y49_N22
\Mod2|auto_generated|divider|divider|StageOut[72]~129\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\);

-- Location: LCCOMB_X65_Y49_N4
\Mod2|auto_generated|divider|divider|StageOut[72]~177\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & (Msec(4))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(4),
	datab => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_6_result_int[7]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\);

-- Location: LCCOMB_X65_Y49_N18
\Mod2|auto_generated|divider|divider|StageOut[71]~131\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\);

-- Location: LCCOMB_X65_Y49_N0
\Mod2|auto_generated|divider|divider|StageOut[71]~130\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\ = (Msec(3) & \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Msec(3),
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\);

-- Location: LCCOMB_X65_Y47_N10
\Mod2|auto_generated|divider|divider|StageOut[70]~133\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\ = (Msec(2) & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(2),
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\);

-- Location: LCCOMB_X65_Y47_N24
\Mod2|auto_generated|divider|divider|StageOut[70]~132\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\ = (Msec(2) & \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(2),
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\);

-- Location: LCCOMB_X65_Y50_N0
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[70]~133_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[70]~132_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\);

-- Location: LCCOMB_X65_Y50_N2
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[71]~131_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[71]~130_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\);

-- Location: LCCOMB_X65_Y50_N4
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[72]~129_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\);

-- Location: LCCOMB_X65_Y50_N6
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[73]~128_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\);

-- Location: LCCOMB_X65_Y50_N8
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ & ((((\Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ & ((\Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[74]~127_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\);

-- Location: LCCOMB_X65_Y50_N10
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ & (((\Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ & (!\Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[75]~126_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~9\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\);

-- Location: LCCOMB_X65_Y50_N12
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ & ((((\Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ & ((\Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[76]~125_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~11\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\);

-- Location: LCCOMB_X65_Y50_N14
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ & (((\Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ & (!\Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~15\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[77]~124_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~13\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~15\);

-- Location: LCCOMB_X65_Y50_N16
\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ = \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~15\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\);

-- Location: LCCOMB_X65_Y49_N30
\Mod2|auto_generated|divider|divider|StageOut[82]~178\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((Msec(3)))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => Msec(3),
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\);

-- Location: LCCOMB_X62_Y48_N10
\Mod2|auto_generated|divider|divider|StageOut[88]~170\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[77]~161_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\);

-- Location: LCCOMB_X65_Y48_N8
\Mod2|auto_generated|divider|divider|StageOut[88]~143\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[8]~14_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\);

-- Location: LCCOMB_X65_Y49_N26
\Mod2|auto_generated|divider|divider|StageOut[87]~171\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[76]~162_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\);

-- Location: LCCOMB_X65_Y50_N26
\Mod2|auto_generated|divider|divider|StageOut[87]~144\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\);

-- Location: LCCOMB_X65_Y49_N14
\Mod2|auto_generated|divider|divider|StageOut[86]~166\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[75]~163_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\);

-- Location: LCCOMB_X65_Y50_N18
\Mod2|auto_generated|divider|divider|StageOut[86]~134\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\);

-- Location: LCCOMB_X66_Y49_N20
\Mod2|auto_generated|divider|divider|StageOut[85]~167\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[74]~164_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\);

-- Location: LCCOMB_X65_Y50_N28
\Mod2|auto_generated|divider|divider|StageOut[85]~135\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\);

-- Location: LCCOMB_X62_Y48_N26
\Mod2|auto_generated|divider|divider|StageOut[84]~136\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\);

-- Location: LCCOMB_X62_Y48_N16
\Mod2|auto_generated|divider|divider|StageOut[84]~168\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[73]~165_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\);

-- Location: LCCOMB_X62_Y50_N16
\Mod2|auto_generated|divider|divider|StageOut[83]~137\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\);

-- Location: LCCOMB_X65_Y49_N24
\Mod2|auto_generated|divider|divider|StageOut[83]~169\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[72]~177_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\);

-- Location: LCCOMB_X65_Y50_N30
\Mod2|auto_generated|divider|divider|StageOut[82]~138\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\);

-- Location: LCCOMB_X65_Y50_N24
\Mod2|auto_generated|divider|divider|StageOut[81]~140\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\);

-- Location: LCCOMB_X62_Y48_N12
\Mod2|auto_generated|divider|divider|StageOut[81]~139\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\ = (Msec(2) & \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Msec(2),
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\);

-- Location: LCCOMB_X62_Y48_N14
\Mod2|auto_generated|divider|divider|StageOut[80]~141\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & Msec(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => Msec(1),
	combout => \Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\);

-- Location: LCCOMB_X62_Y48_N24
\Mod2|auto_generated|divider|divider|StageOut[80]~142\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\ = (!\Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & Msec(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod2|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => Msec(1),
	combout => \Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\);

-- Location: LCCOMB_X63_Y48_N0
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ = (((\Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[80]~141_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[80]~142_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\);

-- Location: LCCOMB_X63_Y48_N2
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (((\Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (!\Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~1\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\);

-- Location: LCCOMB_X63_Y48_N4
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & (((\Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((((\Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\)))))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ = CARRY((!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((\Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\);

-- Location: LCCOMB_X63_Y48_N6
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ & (((\Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ & (!\Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\);

-- Location: LCCOMB_X63_Y48_N8
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ & ((((\Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ & ((\Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~7\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\);

-- Location: LCCOMB_X63_Y48_N10
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ & (((\Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ & (!\Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~9\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\);

-- Location: LCCOMB_X63_Y48_N12
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ & ((((\Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ & ((\Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~11\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\);

-- Location: LCCOMB_X63_Y48_N14
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ & (((\Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ & (!\Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\ = CARRY((!\Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\ & 
-- !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~13\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\);

-- Location: LCCOMB_X63_Y48_N16
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\ & ((((\Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\))))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\ & ((\Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\) # (GND))))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~17\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~15\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~17\);

-- Location: LCCOMB_X63_Y48_N18
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ = !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~17\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\);

-- Location: LCCOMB_X63_Y48_N26
\Mod2|auto_generated|divider|divider|StageOut[93]~149\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[82]~178_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[82]~138_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\);

-- Location: LCCOMB_X63_Y48_N28
\Mod2|auto_generated|divider|divider|StageOut[92]~150\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[81]~139_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[81]~140_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\);

-- Location: LCCOMB_X62_Y48_N20
\Mod2|auto_generated|divider|divider|StageOut[91]~151\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (Msec(1))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & 
-- ((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Msec(1),
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\);

-- Location: LCCOMB_X63_Y44_N6
\Add12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~0_combout\ = (\Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\ & (\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\ $ (VCC))) # (!\Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\ & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\) # (GND)))
-- \Add12~1\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\) # (!\Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[91]~110_combout\,
	datad => VCC,
	combout => \Add12~0_combout\,
	cout => \Add12~1\);

-- Location: LCCOMB_X63_Y44_N8
\Add12~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~2_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ & (!\Add12~1\)) # (!\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ & (\Add12~1\ & 
-- VCC)))) # (!\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ & ((\Add12~1\) # (GND))) # (!\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ & (!\Add12~1\))))
-- \Add12~3\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & (\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\ & !\Add12~1\)) # (!\Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\ & 
-- ((\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\) # (!\Add12~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[92]~107_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\,
	datad => VCC,
	cin => \Add12~1\,
	combout => \Add12~2_combout\,
	cout => \Add12~3\);

-- Location: LCCOMB_X63_Y44_N10
\Add12~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~4_combout\ = ((\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ $ (\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ $ (\Add12~3\)))) # (GND)
-- \Add12~5\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ & ((!\Add12~3\) # (!\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\))) # (!\Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ & !\Add12~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[93]~106_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\,
	datad => VCC,
	cin => \Add12~3\,
	combout => \Add12~4_combout\,
	cout => \Add12~5\);

-- Location: LCCOMB_X62_Y48_N18
\Mod2|auto_generated|divider|divider|StageOut[95]~147\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[84]~136_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[84]~168_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\);

-- Location: LCCOMB_X63_Y48_N24
\Mod2|auto_generated|divider|divider|StageOut[94]~148\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[83]~137_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[83]~169_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\);

-- Location: LCCOMB_X63_Y44_N12
\Add12~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~6_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ & (!\Add12~5\)) # (!\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ & (\Add12~5\ & 
-- VCC)))) # (!\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ & ((\Add12~5\) # (GND))) # (!\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ & (!\Add12~5\))))
-- \Add12~7\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & (\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\ & !\Add12~5\)) # (!\Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\ & 
-- ((\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\) # (!\Add12~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[94]~105_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\,
	datad => VCC,
	cin => \Add12~5\,
	combout => \Add12~6_combout\,
	cout => \Add12~7\);

-- Location: LCCOMB_X63_Y44_N14
\Add12~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~8_combout\ = ((\Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ $ (\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ $ (\Add12~7\)))) # (GND)
-- \Add12~9\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ & (\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\ & !\Add12~7\)) # (!\Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\) # (!\Add12~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[95]~104_combout\,
	datad => VCC,
	cin => \Add12~7\,
	combout => \Add12~8_combout\,
	cout => \Add12~9\);

-- Location: LCCOMB_X63_Y48_N30
\Mod2|auto_generated|divider|divider|StageOut[96]~146\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[85]~135_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[85]~167_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\);

-- Location: LCCOMB_X63_Y44_N16
\Add12~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~10_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & (!\Add12~9\)) # (!\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & (\Add12~9\ & 
-- VCC)))) # (!\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & ((\Add12~9\) # (GND))) # (!\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & (!\Add12~9\))))
-- \Add12~11\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & (\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & !\Add12~9\)) # (!\Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\ & 
-- ((\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\) # (!\Add12~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[96]~103_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\,
	datad => VCC,
	cin => \Add12~9\,
	combout => \Add12~10_combout\,
	cout => \Add12~11\);

-- Location: LCCOMB_X62_Y48_N22
\Mod2|auto_generated|divider|divider|StageOut[99]~153\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[88]~170_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[88]~143_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\);

-- Location: LCCOMB_X63_Y48_N22
\Mod2|auto_generated|divider|divider|StageOut[98]~152\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\) # 
-- ((\Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[87]~171_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[8]~14_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[87]~144_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\);

-- Location: LCCOMB_X63_Y48_N20
\Mod2|auto_generated|divider|divider|StageOut[97]~145\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (((\Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\) # 
-- (\Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\)))) # (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\,
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[10]~18_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[86]~166_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[86]~134_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\);

-- Location: LCCOMB_X63_Y44_N18
\Add12~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~12_combout\ = ((\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\ $ (\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ $ (\Add12~11\)))) # (GND)
-- \Add12~13\ = CARRY((\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\ & (\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\ & !\Add12~11\)) # (!\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\ & 
-- ((\Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\) # (!\Add12~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\,
	datab => \Mod3|auto_generated|divider|divider|StageOut[97]~102_combout\,
	datad => VCC,
	cin => \Add12~11\,
	combout => \Add12~12_combout\,
	cout => \Add12~13\);

-- Location: LCCOMB_X63_Y44_N20
\Add12~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~14_combout\ = (\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & (!\Add12~13\)) # (!\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & (\Add12~13\ & 
-- VCC)))) # (!\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & ((\Add12~13\) # (GND))) # (!\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & (!\Add12~13\))))
-- \Add12~15\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & (\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & !\Add12~13\)) # (!\Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\ & 
-- ((\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\) # (!\Add12~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[98]~101_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\,
	datad => VCC,
	cin => \Add12~13\,
	combout => \Add12~14_combout\,
	cout => \Add12~15\);

-- Location: LCCOMB_X63_Y44_N22
\Add12~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~16_combout\ = ((\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ $ (\Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\ $ (\Add12~15\)))) # (GND)
-- \Add12~17\ = CARRY((\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ & ((!\Add12~15\) # (!\Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\))) # (!\Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\ & 
-- (!\Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\ & !\Add12~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod3|auto_generated|divider|divider|StageOut[99]~100_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\,
	datad => VCC,
	cin => \Add12~15\,
	combout => \Add12~16_combout\,
	cout => \Add12~17\);

-- Location: LCCOMB_X63_Y44_N24
\Add12~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~18_combout\ = !\Add12~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add12~17\,
	combout => \Add12~18_combout\);

-- Location: LCCOMB_X63_Y44_N0
\Equal41~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal41~0_combout\ = (!\Add12~18_combout\ & (!\Add12~14_combout\ & (!\Add12~16_combout\ & !\Add12~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~18_combout\,
	datab => \Add12~14_combout\,
	datac => \Add12~16_combout\,
	datad => \Add12~12_combout\,
	combout => \Equal41~0_combout\);

-- Location: LCCOMB_X60_Y48_N2
\Equal48~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal48~0_combout\ = (!\Add12~4_combout\ & (!\Add12~8_combout\ & (\Add12~10_combout\ & \Equal41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \Add12~8_combout\,
	datac => \Add12~10_combout\,
	datad => \Equal41~0_combout\,
	combout => \Equal48~0_combout\);

-- Location: LCCOMB_X63_Y44_N2
\CharMsec[1][0]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][0]~31_combout\ = (\Add12~4_combout\ & ((\Add12~2_combout\ $ (\Add12~6_combout\)) # (!\Add12~8_combout\))) # (!\Add12~4_combout\ & ((\Add12~8_combout\) # (\Add12~2_combout\ $ (\Add12~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \Add12~8_combout\,
	datac => \Add12~2_combout\,
	datad => \Add12~6_combout\,
	combout => \CharMsec[1][0]~31_combout\);

-- Location: LCCOMB_X63_Y44_N28
\CharMsec[1][0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][0]~32_combout\ = (!\Add12~0_combout\ & (!\CharMsec[1][0]~31_combout\ & (!\Add12~10_combout\ & \Equal41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~0_combout\,
	datab => \CharMsec[1][0]~31_combout\,
	datac => \Add12~10_combout\,
	datad => \Equal41~0_combout\,
	combout => \CharMsec[1][0]~32_combout\);

-- Location: LCCOMB_X63_Y44_N26
\Equal46~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal46~0_combout\ = (!\Add12~2_combout\ & \Add12~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add12~2_combout\,
	datad => \Add12~6_combout\,
	combout => \Equal46~0_combout\);

-- Location: LCCOMB_X63_Y44_N4
\CharMsec[1][0]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][0]~33_combout\ = (\CharMsec[1][0]~32_combout\) # ((\Equal48~0_combout\ & (\Equal46~0_combout\ & !\Add12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal48~0_combout\,
	datab => \CharMsec[1][0]~32_combout\,
	datac => \Equal46~0_combout\,
	datad => \Add12~0_combout\,
	combout => \CharMsec[1][0]~33_combout\);

-- Location: LCCOMB_X60_Y48_N10
\CharMsec~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~20_combout\ = (\Add12~10_combout\ & (!\Add12~6_combout\ & (!\Add12~8_combout\ & !\Add12~4_combout\))) # (!\Add12~10_combout\ & (\Add12~6_combout\ & (\Add12~8_combout\ & \Add12~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~10_combout\,
	datab => \Add12~6_combout\,
	datac => \Add12~8_combout\,
	datad => \Add12~4_combout\,
	combout => \CharMsec~20_combout\);

-- Location: LCCOMB_X60_Y48_N0
\CharMsec~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~19_combout\ = (\Add12~2_combout\ & (\Add12~4_combout\ $ (\Add12~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datac => \Add12~0_combout\,
	datad => \Add12~2_combout\,
	combout => \CharMsec~19_combout\);

-- Location: LCCOMB_X60_Y48_N12
\CharMsec~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~21_combout\ = (\CharMsec~20_combout\ & (\CharMsec~19_combout\ & \Equal41~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~20_combout\,
	datab => \CharMsec~19_combout\,
	datad => \Equal41~0_combout\,
	combout => \CharMsec~21_combout\);

-- Location: LCCOMB_X60_Y48_N26
\CharMsec~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~23_combout\ = (!\Add12~2_combout\ & ((\Add12~4_combout\ & (!\Add12~6_combout\ & !\Add12~0_combout\)) # (!\Add12~4_combout\ & (\Add12~6_combout\ & \Add12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \Add12~6_combout\,
	datac => \Add12~0_combout\,
	datad => \Add12~2_combout\,
	combout => \CharMsec~23_combout\);

-- Location: LCCOMB_X60_Y48_N28
\CharMsec~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~24_combout\ = (\CharMsec~23_combout\ & (\Add12~8_combout\ & (!\Add12~10_combout\ & \Equal41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~23_combout\,
	datab => \Add12~8_combout\,
	datac => \Add12~10_combout\,
	datad => \Equal41~0_combout\,
	combout => \CharMsec~24_combout\);

-- Location: LCCOMB_X60_Y48_N6
\CharMsec[1][3]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][3]~25_combout\ = (\Add12~8_combout\) # (\Add12~6_combout\ $ (\Add12~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add12~6_combout\,
	datac => \Add12~8_combout\,
	datad => \Add12~2_combout\,
	combout => \CharMsec[1][3]~25_combout\);

-- Location: LCCOMB_X60_Y48_N8
\CharMsec[1][3]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][3]~26_combout\ = (\CharMsec[1][3]~25_combout\) # ((\Add12~10_combout\) # (\Add12~0_combout\ $ (\Add12~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[1][3]~25_combout\,
	datab => \Add12~0_combout\,
	datac => \Add12~10_combout\,
	datad => \Add12~4_combout\,
	combout => \CharMsec[1][3]~26_combout\);

-- Location: LCCOMB_X60_Y48_N18
\CharMsec[1][3]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][3]~27_combout\ = (\CharMsec~21_combout\) # ((\CharMsec~24_combout\) # ((!\CharMsec[1][3]~26_combout\ & \Equal41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~21_combout\,
	datab => \CharMsec~24_combout\,
	datac => \CharMsec[1][3]~26_combout\,
	datad => \Equal41~0_combout\,
	combout => \CharMsec[1][3]~27_combout\);

-- Location: LCCOMB_X60_Y48_N4
\CharMsec~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~28_combout\ = (\Add12~4_combout\ & (!\Add12~6_combout\ & !\Add12~0_combout\)) # (!\Add12~4_combout\ & (\Add12~6_combout\ & \Add12~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \Add12~6_combout\,
	datac => \Add12~0_combout\,
	combout => \CharMsec~28_combout\);

-- Location: LCCOMB_X60_Y48_N22
\CharMsec~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~29_combout\ = (\CharMsec~28_combout\ & (\Add12~8_combout\ & !\Add12~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CharMsec~28_combout\,
	datac => \Add12~8_combout\,
	datad => \Add12~2_combout\,
	combout => \CharMsec~29_combout\);

-- Location: LCCOMB_X60_Y48_N24
\CharMsec~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~30_combout\ = (\CharMsec~21_combout\) # ((\CharMsec~29_combout\ & (\Equal41~0_combout\ & !\Add12~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~29_combout\,
	datab => \Equal41~0_combout\,
	datac => \Add12~10_combout\,
	datad => \CharMsec~21_combout\,
	combout => \CharMsec~30_combout\);

-- Location: LCCOMB_X59_Y45_N8
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (FrBitCnt(0) & (((\CharMsec~30_combout\)) # (!FrBitCnt(1)))) # (!FrBitCnt(0) & (!FrBitCnt(1) & (!\CharMsec[1][3]~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(0),
	datab => FrBitCnt(1),
	datac => \CharMsec[1][3]~27_combout\,
	datad => \CharMsec~30_combout\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X60_Y48_N30
\Equal43~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal43~0_combout\ = (\Add12~2_combout\ & (\Add12~6_combout\ & (!\Add12~10_combout\ & \Equal41~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~2_combout\,
	datab => \Add12~6_combout\,
	datac => \Add12~10_combout\,
	datad => \Equal41~0_combout\,
	combout => \Equal43~0_combout\);

-- Location: LCCOMB_X60_Y48_N16
\CharMsec[1][3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[1][3]~22_combout\ = ((\Add12~8_combout\) # (\Add12~0_combout\ $ (\Add12~4_combout\))) # (!\Equal43~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal43~0_combout\,
	datab => \Add12~8_combout\,
	datac => \Add12~0_combout\,
	datad => \Add12~4_combout\,
	combout => \CharMsec[1][3]~22_combout\);

-- Location: LCCOMB_X60_Y48_N20
\CharMsec~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~37_combout\ = ((\CharMsec~20_combout\ & (\CharMsec~19_combout\ & \Equal41~0_combout\))) # (!\CharMsec[1][3]~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec~20_combout\,
	datab => \CharMsec[1][3]~22_combout\,
	datac => \CharMsec~19_combout\,
	datad => \Equal41~0_combout\,
	combout => \CharMsec~37_combout\);

-- Location: LCCOMB_X59_Y45_N2
\Mux9~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\Add9~0_combout\ & ((\Mux9~0_combout\ & (!\CharMsec[1][0]~33_combout\)) # (!\Mux9~0_combout\ & ((\CharMsec~37_combout\))))) # (!\Add9~0_combout\ & (((\Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[1][0]~33_combout\,
	datab => \Add9~0_combout\,
	datac => \Mux9~0_combout\,
	datad => \CharMsec~37_combout\,
	combout => \Mux9~1_combout\);

-- Location: LCCOMB_X56_Y47_N22
\TxLine~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~22_combout\ = (\Add14~0_combout\ & ((\TxLine~5_combout\ & ((\Mux9~1_combout\))) # (!\TxLine~5_combout\ & (\Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine~5_combout\,
	datab => \Mux8~1_combout\,
	datac => \Mux9~1_combout\,
	datad => \Add14~0_combout\,
	combout => \TxLine~22_combout\);

-- Location: LCCOMB_X55_Y47_N14
\TxLine~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~23_combout\ = (MsgFrIdx(1) & (((\Mux7~0_combout\) # (\TxLine~22_combout\)))) # (!MsgFrIdx(1) & (\TxLine~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine~5_combout\,
	datab => \Mux7~0_combout\,
	datac => MsgFrIdx(1),
	datad => \TxLine~22_combout\,
	combout => \TxLine~23_combout\);

-- Location: LCCOMB_X56_Y46_N28
\CharMsec[0][0]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[0][0]~35_combout\ = (Msec(0)) # ((\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\) # (\Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\,
	datad => Msec(0),
	combout => \CharMsec[0][0]~35_combout\);

-- Location: LCCOMB_X63_Y44_N30
\Equal32~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal32~0_combout\ = (!\Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\ & 
-- !\Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[98]~152_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[99]~153_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[95]~147_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[94]~148_combout\,
	combout => \Equal32~0_combout\);

-- Location: LCCOMB_X56_Y46_N30
\CharMsec[0][0]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec[0][0]~36_combout\ = (!\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & (!\CharMsec[0][0]~35_combout\ & (\Equal32~0_combout\ & !\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\,
	datab => \CharMsec[0][0]~35_combout\,
	datac => \Equal32~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\,
	combout => \CharMsec[0][0]~36_combout\);

-- Location: LCCOMB_X56_Y46_N12
\Equal32~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal32~1_combout\ = (!\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\ & (\Equal32~0_combout\ & !\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\,
	datac => \Equal32~0_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\,
	combout => \Equal32~1_combout\);

-- Location: LCCOMB_X56_Y46_N22
\CharMsec~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CharMsec~34_combout\ = (\Equal32~1_combout\ & \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal32~1_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[92]~150_combout\,
	combout => \CharMsec~34_combout\);

-- Location: LCCOMB_X56_Y46_N8
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\) # ((\Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\) # ((FrBitCnt(0)) # (\Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[96]~146_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[93]~149_combout\,
	datac => FrBitCnt(0),
	datad => \Mod2|auto_generated|divider|divider|StageOut[97]~145_combout\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X56_Y46_N2
\Mux10~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (FrBitCnt(1) & (\Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\ & (\Equal32~0_combout\ & !\Mux10~0_combout\))) # (!FrBitCnt(1) & (((\Mux10~0_combout\) # (!\Equal32~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => \Mod2|auto_generated|divider|divider|StageOut[91]~151_combout\,
	datac => \Equal32~0_combout\,
	datad => \Mux10~0_combout\,
	combout => \Mux10~1_combout\);

-- Location: LCCOMB_X56_Y46_N16
\Mux10~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~2_combout\ = (FrBitCnt(0) & ((\Mux10~1_combout\ & (!\CharMsec[0][0]~36_combout\)) # (!\Mux10~1_combout\ & ((\CharMsec~34_combout\))))) # (!FrBitCnt(0) & (((\Mux10~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CharMsec[0][0]~36_combout\,
	datab => FrBitCnt(0),
	datac => \CharMsec~34_combout\,
	datad => \Mux10~1_combout\,
	combout => \Mux10~2_combout\);

-- Location: LCCOMB_X58_Y44_N28
\TxLine~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~21_combout\ = (MsgFrIdx(0) & (((FrBitCnt(0))) # (!FrBitCnt(1)))) # (!MsgFrIdx(0) & (((\Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(1),
	datab => MsgFrIdx(0),
	datac => FrBitCnt(0),
	datad => \Mux10~2_combout\,
	combout => \TxLine~21_combout\);

-- Location: LCCOMB_X55_Y47_N4
\TxLine~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~15_combout\ = (\Add14~0_combout\ & ((MsgFrIdx(1) & ((!FrBitCnt(0)))) # (!MsgFrIdx(1) & (\TxLine~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine~21_combout\,
	datab => MsgFrIdx(1),
	datac => \Add14~0_combout\,
	datad => FrBitCnt(0),
	combout => \TxLine~15_combout\);

-- Location: LCCOMB_X55_Y47_N22
\TxLine~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~16_combout\ = (\TxLine~15_combout\) # ((!MsgFrIdx(0) & (\Mux7~0_combout\ & !MsgFrIdx(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => MsgFrIdx(0),
	datab => \Mux7~0_combout\,
	datac => \TxLine~15_combout\,
	datad => MsgFrIdx(1),
	combout => \TxLine~16_combout\);

-- Location: LCCOMB_X55_Y47_N8
\TxLine~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~17_combout\ = (\TxLine~14_combout\ & (((\TxLine~16_combout\) # (!MsgFrIdx(3))))) # (!\TxLine~14_combout\ & (\TxLine~23_combout\ & ((MsgFrIdx(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine~14_combout\,
	datab => \TxLine~23_combout\,
	datac => \TxLine~16_combout\,
	datad => MsgFrIdx(3),
	combout => \TxLine~17_combout\);

-- Location: LCCOMB_X54_Y46_N24
\NxParBit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NxParBit~2_combout\ = (\NxParBit~1_combout\ & (\ParBit~q\ $ (((\TxLine~4_combout\) # (\TxLine~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NxParBit~1_combout\,
	datab => \TxLine~4_combout\,
	datac => \ParBit~q\,
	datad => \TxLine~17_combout\,
	combout => \NxParBit~2_combout\);

-- Location: FF_X54_Y46_N25
ParBit : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkUART~clkctrl_outclk\,
	d => \NxParBit~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ParBit~q\);

-- Location: LCCOMB_X54_Y46_N4
\TxLine~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~4_combout\ = (FrBitCnt(3) & (\ParBit~q\ & (\Equal59~0_combout\ & !FrBitCnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(3),
	datab => \ParBit~q\,
	datac => \Equal59~0_combout\,
	datad => FrBitCnt(0),
	combout => \TxLine~4_combout\);

-- Location: LCCOMB_X54_Y46_N22
\TxLine~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~18_combout\ = (\Equal59~0_combout\ & (FrBitCnt(0) & ((FrBitCnt(3)) # (\TxLine~17_combout\)))) # (!\Equal59~0_combout\ & (((\TxLine~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => FrBitCnt(3),
	datab => FrBitCnt(0),
	datac => \Equal59~0_combout\,
	datad => \TxLine~17_combout\,
	combout => \TxLine~18_combout\);

-- Location: LCCOMB_X54_Y46_N16
\TxLine~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TxLine~19_combout\ = (\TxLine_Handler~2_combout\) # ((\TxLine~4_combout\) # (\TxLine~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TxLine_Handler~2_combout\,
	datab => \TxLine~4_combout\,
	datac => \TxLine~18_combout\,
	combout => \TxLine~19_combout\);

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

ww_TXL <= \TXL~output_o\;
END structure;



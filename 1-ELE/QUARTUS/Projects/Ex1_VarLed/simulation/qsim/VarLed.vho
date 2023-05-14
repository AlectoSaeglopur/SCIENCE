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

-- DATE "01/02/2020 15:29:42"

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

ENTITY 	VarLed IS
    PORT (
	CLK : IN std_logic;
	BTN : IN std_logic_vector(1 DOWNTO 0);
	SWT : IN std_logic_vector(9 DOWNTO 0);
	LED : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END VarLed;

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
-- SWT[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[4]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[7]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[8]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWT[9]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VarLed IS
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
SIGNAL ww_BTN : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SWT : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_LED : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ClkDw~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
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
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \Cnt10Hz[0]~0_combout\ : std_logic;
SIGNAL \NextCnt10Hz[2]~1_combout\ : std_logic;
SIGNAL \NextCnt10Hz[1]~0_combout\ : std_logic;
SIGNAL \ClkDw~0_combout\ : std_logic;
SIGNAL \ClkDw~feeder_combout\ : std_logic;
SIGNAL \ClkDw~q\ : std_logic;
SIGNAL \ClkDw~clkctrl_outclk\ : std_logic;
SIGNAL \BTN[0]~input_o\ : std_logic;
SIGNAL \BTN[1]~input_o\ : std_logic;
SIGNAL \NextPushed[1]~1_combout\ : std_logic;
SIGNAL \NextPushed[0]~0_combout\ : std_logic;
SIGNAL \SwitchMode~0_combout\ : std_logic;
SIGNAL \NextState[2]~0_combout\ : std_logic;
SIGNAL \State[2]~0_combout\ : std_logic;
SIGNAL \State[2]~1_combout\ : std_logic;
SIGNAL \NextState[1]~1_combout\ : std_logic;
SIGNAL \State[0]~2_combout\ : std_logic;
SIGNAL \LedBlk[3]~0_combout\ : std_logic;
SIGNAL \Add3~1_cout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~5_combout\ : std_logic;
SIGNAL \Add3~7_combout\ : std_logic;
SIGNAL \Add3~6\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \LedBlk[3]~1_combout\ : std_logic;
SIGNAL \LedBlk[3]~2_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \SWT[0]~input_o\ : std_logic;
SIGNAL \LED~0_combout\ : std_logic;
SIGNAL \LED~1_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \SWT[1]~input_o\ : std_logic;
SIGNAL \LED~2_combout\ : std_logic;
SIGNAL \SWT[2]~input_o\ : std_logic;
SIGNAL \Equal3~2_combout\ : std_logic;
SIGNAL \LED~3_combout\ : std_logic;
SIGNAL \SWT[3]~input_o\ : std_logic;
SIGNAL \Equal3~3_combout\ : std_logic;
SIGNAL \LED~4_combout\ : std_logic;
SIGNAL \SWT[4]~input_o\ : std_logic;
SIGNAL \Equal3~4_combout\ : std_logic;
SIGNAL \LED~5_combout\ : std_logic;
SIGNAL \SWT[5]~input_o\ : std_logic;
SIGNAL \Equal3~5_combout\ : std_logic;
SIGNAL \LED~6_combout\ : std_logic;
SIGNAL \SWT[6]~input_o\ : std_logic;
SIGNAL \Equal3~6_combout\ : std_logic;
SIGNAL \LED~7_combout\ : std_logic;
SIGNAL \Equal3~7_combout\ : std_logic;
SIGNAL \SWT[7]~input_o\ : std_logic;
SIGNAL \LED~8_combout\ : std_logic;
SIGNAL \Equal3~8_combout\ : std_logic;
SIGNAL \SWT[8]~input_o\ : std_logic;
SIGNAL \LED~9_combout\ : std_logic;
SIGNAL \Equal3~9_combout\ : std_logic;
SIGNAL \SWT[9]~input_o\ : std_logic;
SIGNAL \LED~10_combout\ : std_logic;
SIGNAL LedBlk : std_logic_vector(3 DOWNTO 0);
SIGNAL State : std_logic_vector(2 DOWNTO 0);
SIGNAL Pushed : std_logic_vector(1 DOWNTO 0);
SIGNAL Cnt10Hz : std_logic_vector(2 DOWNTO 0);

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
LED <= ww_LED;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\ClkDw~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ClkDw~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
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

-- Location: IOOBUF_X51_Y54_N9
\LED[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LED~9_combout\,
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
	i => \LED~10_combout\,
	devoe => ww_devoe,
	o => \LED[9]~output_o\);

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

-- Location: LCCOMB_X45_Y53_N26
\Cnt10Hz[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Cnt10Hz[0]~0_combout\ = !Cnt10Hz(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Cnt10Hz(0),
	combout => \Cnt10Hz[0]~0_combout\);

-- Location: FF_X45_Y53_N27
\Cnt10Hz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Cnt10Hz[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(0));

-- Location: LCCOMB_X45_Y53_N18
\NextCnt10Hz[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[2]~1_combout\ = (Cnt10Hz(0) & (!Cnt10Hz(2) & Cnt10Hz(1))) # (!Cnt10Hz(0) & (Cnt10Hz(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(0),
	datac => Cnt10Hz(2),
	datad => Cnt10Hz(1),
	combout => \NextCnt10Hz[2]~1_combout\);

-- Location: FF_X45_Y53_N19
\Cnt10Hz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(2));

-- Location: LCCOMB_X45_Y53_N4
\NextCnt10Hz[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[1]~0_combout\ = (Cnt10Hz(0) & (!Cnt10Hz(1) & !Cnt10Hz(2))) # (!Cnt10Hz(0) & (Cnt10Hz(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(0),
	datac => Cnt10Hz(1),
	datad => Cnt10Hz(2),
	combout => \NextCnt10Hz[1]~0_combout\);

-- Location: FF_X45_Y53_N5
\Cnt10Hz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(1));

-- Location: LCCOMB_X45_Y53_N2
\ClkDw~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ClkDw~0_combout\ = \ClkDw~q\ $ (((!Cnt10Hz(1) & (Cnt10Hz(0) & Cnt10Hz(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ClkDw~q\,
	datab => Cnt10Hz(1),
	datac => Cnt10Hz(0),
	datad => Cnt10Hz(2),
	combout => \ClkDw~0_combout\);

-- Location: LCCOMB_X45_Y53_N12
\ClkDw~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ClkDw~feeder_combout\ = \ClkDw~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ClkDw~0_combout\,
	combout => \ClkDw~feeder_combout\);

-- Location: FF_X45_Y53_N13
ClkDw : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \ClkDw~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ClkDw~q\);

-- Location: CLKCTRL_G13
\ClkDw~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ClkDw~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ClkDw~clkctrl_outclk\);

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

-- Location: LCCOMB_X50_Y53_N16
\NextPushed[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextPushed[1]~1_combout\ = (!\BTN[1]~input_o\ & ((\BTN[0]~input_o\) # (Pushed(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datab => \BTN[1]~input_o\,
	datad => Pushed(0),
	combout => \NextPushed[1]~1_combout\);

-- Location: FF_X50_Y53_N17
\Pushed[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextPushed[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pushed(1));

-- Location: LCCOMB_X50_Y53_N4
\NextPushed[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextPushed[0]~0_combout\ = (!\BTN[0]~input_o\ & ((Pushed(1)) # ((\BTN[1]~input_o\) # (!Pushed(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datab => Pushed(1),
	datac => Pushed(0),
	datad => \BTN[1]~input_o\,
	combout => \NextPushed[0]~0_combout\);

-- Location: FF_X50_Y53_N5
\Pushed[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextPushed[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pushed(0));

-- Location: LCCOMB_X50_Y53_N22
\SwitchMode~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SwitchMode~0_combout\ = (\BTN[0]~input_o\) # (Pushed(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BTN[0]~input_o\,
	datad => Pushed(0),
	combout => \SwitchMode~0_combout\);

-- Location: LCCOMB_X50_Y53_N20
\NextState[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextState[2]~0_combout\ = (State(1) & (State(2) $ (((State(0) & !\SwitchMode~0_combout\))))) # (!State(1) & ((State(0) & (State(2))) # (!State(0) & (!State(2) & \SwitchMode~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000101101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(0),
	datac => State(2),
	datad => \SwitchMode~0_combout\,
	combout => \NextState[2]~0_combout\);

-- Location: LCCOMB_X50_Y53_N6
\State[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \State[2]~0_combout\ = (\BTN[0]~input_o\ & (!\BTN[1]~input_o\ & ((!Pushed(1))))) # (!\BTN[0]~input_o\ & (((!\BTN[1]~input_o\ & !Pushed(1))) # (!Pushed(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datab => \BTN[1]~input_o\,
	datac => Pushed(0),
	datad => Pushed(1),
	combout => \State[2]~0_combout\);

-- Location: FF_X50_Y53_N21
\State[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextState[2]~0_combout\,
	ena => \State[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(2));

-- Location: LCCOMB_X50_Y53_N24
\State[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \State[2]~1_combout\ = State(2) $ (((!\BTN[0]~input_o\ & !Pushed(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datac => Pushed(0),
	datad => State(2),
	combout => \State[2]~1_combout\);

-- Location: LCCOMB_X50_Y53_N26
\NextState[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextState[1]~1_combout\ = (\SwitchMode~0_combout\ & ((State(1) & ((State(0)))) # (!State(1) & (\State[2]~1_combout\ & !State(0))))) # (!\SwitchMode~0_combout\ & ((State(1) $ (State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SwitchMode~0_combout\,
	datab => \State[2]~1_combout\,
	datac => State(1),
	datad => State(0),
	combout => \NextState[1]~1_combout\);

-- Location: FF_X50_Y53_N27
\State[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextState[1]~1_combout\,
	ena => \State[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(1));

-- Location: LCCOMB_X51_Y53_N2
\State[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \State[0]~2_combout\ = (\State[2]~0_combout\ & (!State(0) & ((State(1)) # (\State[2]~1_combout\)))) # (!\State[2]~0_combout\ & (((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => \State[2]~0_combout\,
	datac => State(0),
	datad => \State[2]~1_combout\,
	combout => \State[0]~2_combout\);

-- Location: FF_X51_Y53_N3
\State[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \State[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(0));

-- Location: LCCOMB_X50_Y53_N30
\LedBlk[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedBlk[3]~0_combout\ = (State(1) & !State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(1),
	datad => State(2),
	combout => \LedBlk[3]~0_combout\);

-- Location: LCCOMB_X51_Y53_N12
\Add3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~1_cout\ = CARRY(LedBlk(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => LedBlk(0),
	datad => VCC,
	cout => \Add3~1_cout\);

-- Location: LCCOMB_X51_Y53_N14
\Add3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (LedBlk(1) & ((State(0) & (\Add3~1_cout\ & VCC)) # (!State(0) & (!\Add3~1_cout\)))) # (!LedBlk(1) & ((State(0) & (!\Add3~1_cout\)) # (!State(0) & ((\Add3~1_cout\) # (GND)))))
-- \Add3~3\ = CARRY((LedBlk(1) & (!State(0) & !\Add3~1_cout\)) # (!LedBlk(1) & ((!\Add3~1_cout\) # (!State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(1),
	datab => State(0),
	datad => VCC,
	cin => \Add3~1_cout\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X51_Y53_N26
\Add3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\Add3~2_combout\ & \LedBlk[3]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~2_combout\,
	datad => \LedBlk[3]~2_combout\,
	combout => \Add3~4_combout\);

-- Location: FF_X51_Y53_N27
\LedBlk[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkDw~clkctrl_outclk\,
	d => \Add3~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedBlk(1));

-- Location: LCCOMB_X51_Y53_N16
\Add3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~5_combout\ = ((State(0) $ (LedBlk(2) $ (!\Add3~3\)))) # (GND)
-- \Add3~6\ = CARRY((State(0) & ((LedBlk(2)) # (!\Add3~3\))) # (!State(0) & (LedBlk(2) & !\Add3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => LedBlk(2),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~5_combout\,
	cout => \Add3~6\);

-- Location: LCCOMB_X51_Y53_N24
\Add3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~7_combout\ = (\LedBlk[3]~2_combout\ & \Add3~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LedBlk[3]~2_combout\,
	datad => \Add3~5_combout\,
	combout => \Add3~7_combout\);

-- Location: FF_X51_Y53_N25
\LedBlk[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkDw~clkctrl_outclk\,
	d => \Add3~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedBlk(2));

-- Location: LCCOMB_X51_Y53_N18
\Add3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = State(0) $ (LedBlk(3) $ (\Add3~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => LedBlk(3),
	cin => \Add3~6\,
	combout => \Add3~8_combout\);

-- Location: LCCOMB_X51_Y53_N10
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\LedBlk[3]~2_combout\ & (((\Add3~8_combout\)))) # (!\LedBlk[3]~2_combout\ & (\LedBlk[3]~0_combout\ & (State(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LedBlk[3]~2_combout\,
	datab => \LedBlk[3]~0_combout\,
	datac => State(0),
	datad => \Add3~8_combout\,
	combout => \Mux0~0_combout\);

-- Location: FF_X51_Y53_N11
\LedBlk[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkDw~clkctrl_outclk\,
	d => \Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedBlk(3));

-- Location: LCCOMB_X51_Y53_N4
\LedBlk[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedBlk[3]~1_combout\ = (!LedBlk(2) & (!LedBlk(0) & !LedBlk(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => LedBlk(2),
	datac => LedBlk(0),
	datad => LedBlk(1),
	combout => \LedBlk[3]~1_combout\);

-- Location: LCCOMB_X51_Y53_N6
\LedBlk[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LedBlk[3]~2_combout\ = (\LedBlk[3]~0_combout\ & ((State(0) & ((LedBlk(3)) # (!\LedBlk[3]~1_combout\))) # (!State(0) & ((\LedBlk[3]~1_combout\) # (!LedBlk(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => LedBlk(3),
	datac => \LedBlk[3]~1_combout\,
	datad => \LedBlk[3]~0_combout\,
	combout => \LedBlk[3]~2_combout\);

-- Location: LCCOMB_X51_Y53_N20
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\LedBlk[3]~2_combout\ & (((!LedBlk(0))))) # (!\LedBlk[3]~2_combout\ & (State(0) & (\LedBlk[3]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \LedBlk[3]~0_combout\,
	datac => LedBlk(0),
	datad => \LedBlk[3]~2_combout\,
	combout => \Mux3~0_combout\);

-- Location: FF_X51_Y53_N21
\LedBlk[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ClkDw~clkctrl_outclk\,
	d => \Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedBlk(0));

-- Location: LCCOMB_X51_Y53_N8
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!LedBlk(0) & (!LedBlk(3) & (!LedBlk(2) & !LedBlk(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(0),
	datab => LedBlk(3),
	datac => LedBlk(2),
	datad => LedBlk(1),
	combout => \Equal3~0_combout\);

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

-- Location: LCCOMB_X50_Y53_N28
\LED~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~0_combout\ = (State(1)) # (State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datac => State(2),
	combout => \LED~0_combout\);

-- Location: LCCOMB_X51_Y53_N28
\LED~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~1_combout\ = (\LED~0_combout\ & (\Equal3~0_combout\)) # (!\LED~0_combout\ & ((State(0) $ (\SWT[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => State(0),
	datac => \SWT[0]~input_o\,
	datad => \LED~0_combout\,
	combout => \LED~1_combout\);

-- Location: LCCOMB_X51_Y53_N22
\Equal3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (LedBlk(0) & (!LedBlk(3) & (!LedBlk(2) & !LedBlk(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(0),
	datab => LedBlk(3),
	datac => LedBlk(2),
	datad => LedBlk(1),
	combout => \Equal3~1_combout\);

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

-- Location: LCCOMB_X51_Y53_N0
\LED~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~2_combout\ = (\LED~0_combout\ & (\Equal3~1_combout\)) # (!\LED~0_combout\ & ((\SWT[1]~input_o\ $ (State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~1_combout\,
	datab => \SWT[1]~input_o\,
	datac => State(0),
	datad => \LED~0_combout\,
	combout => \LED~2_combout\);

-- Location: IOIBUF_X51_Y54_N1
\SWT[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(2),
	o => \SWT[2]~input_o\);

-- Location: LCCOMB_X54_Y53_N28
\Equal3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~2_combout\ = (!LedBlk(2) & (LedBlk(1) & (!LedBlk(3) & !LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~2_combout\);

-- Location: LCCOMB_X51_Y53_N30
\LED~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~3_combout\ = (\LED~0_combout\ & (((\Equal3~2_combout\)))) # (!\LED~0_combout\ & (\SWT[2]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[2]~input_o\,
	datab => State(0),
	datac => \Equal3~2_combout\,
	datad => \LED~0_combout\,
	combout => \LED~3_combout\);

-- Location: IOIBUF_X54_Y54_N29
\SWT[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(3),
	o => \SWT[3]~input_o\);

-- Location: LCCOMB_X54_Y53_N2
\Equal3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~3_combout\ = (!LedBlk(2) & (LedBlk(1) & (!LedBlk(3) & LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~3_combout\);

-- Location: LCCOMB_X54_Y53_N0
\LED~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~4_combout\ = (\LED~0_combout\ & (((\Equal3~3_combout\)))) # (!\LED~0_combout\ & (\SWT[3]~input_o\ $ (((State(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[3]~input_o\,
	datab => \Equal3~3_combout\,
	datac => State(0),
	datad => \LED~0_combout\,
	combout => \LED~4_combout\);

-- Location: IOIBUF_X54_Y54_N22
\SWT[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(4),
	o => \SWT[4]~input_o\);

-- Location: LCCOMB_X54_Y53_N18
\Equal3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~4_combout\ = (LedBlk(2) & (!LedBlk(1) & (!LedBlk(3) & !LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~4_combout\);

-- Location: LCCOMB_X54_Y53_N16
\LED~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~5_combout\ = (\LED~0_combout\ & (((\Equal3~4_combout\)))) # (!\LED~0_combout\ & (\SWT[4]~input_o\ $ (((State(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[4]~input_o\,
	datab => \Equal3~4_combout\,
	datac => State(0),
	datad => \LED~0_combout\,
	combout => \LED~5_combout\);

-- Location: IOIBUF_X49_Y54_N1
\SWT[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(5),
	o => \SWT[5]~input_o\);

-- Location: LCCOMB_X54_Y53_N22
\Equal3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~5_combout\ = (LedBlk(2) & (!LedBlk(1) & (!LedBlk(3) & LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~5_combout\);

-- Location: LCCOMB_X54_Y53_N20
\LED~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~6_combout\ = (\LED~0_combout\ & (((\Equal3~5_combout\)))) # (!\LED~0_combout\ & (State(0) $ ((\SWT[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SWT[5]~input_o\,
	datac => \Equal3~5_combout\,
	datad => \LED~0_combout\,
	combout => \LED~6_combout\);

-- Location: IOIBUF_X54_Y54_N15
\SWT[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(6),
	o => \SWT[6]~input_o\);

-- Location: LCCOMB_X54_Y53_N26
\Equal3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~6_combout\ = (LedBlk(2) & (LedBlk(1) & (!LedBlk(3) & !LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~6_combout\);

-- Location: LCCOMB_X54_Y53_N4
\LED~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~7_combout\ = (\LED~0_combout\ & (((\Equal3~6_combout\)))) # (!\LED~0_combout\ & (State(0) $ ((\SWT[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SWT[6]~input_o\,
	datac => \Equal3~6_combout\,
	datad => \LED~0_combout\,
	combout => \LED~7_combout\);

-- Location: LCCOMB_X54_Y53_N6
\Equal3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~7_combout\ = (LedBlk(2) & (LedBlk(1) & (!LedBlk(3) & LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~7_combout\);

-- Location: IOIBUF_X58_Y54_N29
\SWT[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(7),
	o => \SWT[7]~input_o\);

-- Location: LCCOMB_X54_Y53_N8
\LED~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~8_combout\ = (\LED~0_combout\ & (\Equal3~7_combout\)) # (!\LED~0_combout\ & ((\SWT[7]~input_o\ $ (State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~7_combout\,
	datab => \SWT[7]~input_o\,
	datac => State(0),
	datad => \LED~0_combout\,
	combout => \LED~8_combout\);

-- Location: LCCOMB_X54_Y53_N10
\Equal3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~8_combout\ = (!LedBlk(2) & (!LedBlk(1) & (LedBlk(3) & !LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~8_combout\);

-- Location: IOIBUF_X56_Y54_N1
\SWT[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(8),
	o => \SWT[8]~input_o\);

-- Location: LCCOMB_X54_Y53_N24
\LED~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~9_combout\ = (\LED~0_combout\ & (\Equal3~8_combout\)) # (!\LED~0_combout\ & ((\SWT[8]~input_o\ $ (State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~8_combout\,
	datab => \SWT[8]~input_o\,
	datac => State(0),
	datad => \LED~0_combout\,
	combout => \LED~9_combout\);

-- Location: LCCOMB_X54_Y53_N14
\Equal3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~9_combout\ = (!LedBlk(2) & (!LedBlk(1) & (LedBlk(3) & LedBlk(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedBlk(2),
	datab => LedBlk(1),
	datac => LedBlk(3),
	datad => LedBlk(0),
	combout => \Equal3~9_combout\);

-- Location: IOIBUF_X69_Y54_N1
\SWT[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWT(9),
	o => \SWT[9]~input_o\);

-- Location: LCCOMB_X54_Y53_N12
\LED~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LED~10_combout\ = (\LED~0_combout\ & (((\Equal3~9_combout\)))) # (!\LED~0_combout\ & (State(0) $ (((\SWT[9]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \Equal3~9_combout\,
	datac => \SWT[9]~input_o\,
	datad => \LED~0_combout\,
	combout => \LED~10_combout\);

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
END structure;



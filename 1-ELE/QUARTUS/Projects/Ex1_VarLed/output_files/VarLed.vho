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

-- DATE "01/01/2020 21:14:41"

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
	LED : OUT std_logic_vector(9 DOWNTO 0)
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
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BTN[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL \BTN[0]~input_o\ : std_logic;
SIGNAL \BTN[1]~input_o\ : std_logic;
SIGNAL \NextPushed[1]~1_combout\ : std_logic;
SIGNAL \NextPushed[0]~0_combout\ : std_logic;
SIGNAL \SwitchMode~0_combout\ : std_logic;
SIGNAL \NextState[2]~0_combout\ : std_logic;
SIGNAL \State[2]~0_combout\ : std_logic;
SIGNAL \NextState[1]~1_combout\ : std_logic;
SIGNAL \NextState[0]~2_combout\ : std_logic;
SIGNAL \SWT[0]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux13~1_combout\ : std_logic;
SIGNAL \Mux13~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \NextCnt10Hz[0]~9_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \NextCnt10Hz[6]~8_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \NextCnt10Hz[8]~7_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \NextCnt10Hz[9]~6_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \NextCnt10Hz[11]~5_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \NextCnt10Hz[14]~4_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \NextCnt10Hz[18]~3_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \NextCnt10Hz[19]~2_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \NextCnt10Hz[22]~10_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Mux13~3_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux12~1_combout\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux11~3_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Mux10~2_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \SWT[1]~input_o\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \SWT[2]~input_o\ : std_logic;
SIGNAL \Equal3~2_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \SWT[3]~input_o\ : std_logic;
SIGNAL \Equal3~3_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \SWT[4]~input_o\ : std_logic;
SIGNAL \Equal3~4_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \SWT[5]~input_o\ : std_logic;
SIGNAL \Equal3~5_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Equal3~6_combout\ : std_logic;
SIGNAL \SWT[6]~input_o\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \SWT[7]~input_o\ : std_logic;
SIGNAL \Equal3~7_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \SWT[8]~input_o\ : std_logic;
SIGNAL \Equal3~8_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Equal3~9_combout\ : std_logic;
SIGNAL \SWT[9]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL LedOn : std_logic_vector(3 DOWNTO 0);
SIGNAL State : std_logic_vector(2 DOWNTO 0);
SIGNAL Cnt10Hz : std_logic_vector(22 DOWNTO 0);
SIGNAL Pushed : std_logic_vector(1 DOWNTO 0);

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

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N12
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
	i => \Mux9~0_combout\,
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
	i => \Mux8~1_combout\,
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
	i => \Mux7~0_combout\,
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
	i => \Mux6~0_combout\,
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
	i => \Mux5~0_combout\,
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
	i => \Mux4~0_combout\,
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
	i => \Mux3~0_combout\,
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
	i => \Mux2~0_combout\,
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
	i => \Mux1~0_combout\,
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
	i => \Mux0~0_combout\,
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

-- Location: LCCOMB_X51_Y51_N16
\NextPushed[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextPushed[1]~1_combout\ = (!\BTN[1]~input_o\ & ((\BTN[0]~input_o\) # (Pushed(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datac => \BTN[0]~input_o\,
	datad => Pushed(0),
	combout => \NextPushed[1]~1_combout\);

-- Location: FF_X51_Y51_N17
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

-- Location: LCCOMB_X51_Y51_N12
\NextPushed[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextPushed[0]~0_combout\ = (!\BTN[0]~input_o\ & ((\BTN[1]~input_o\) # ((Pushed(1)) # (!Pushed(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[0]~input_o\,
	datab => \BTN[1]~input_o\,
	datac => Pushed(0),
	datad => Pushed(1),
	combout => \NextPushed[0]~0_combout\);

-- Location: FF_X51_Y51_N13
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

-- Location: LCCOMB_X51_Y51_N18
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

-- Location: LCCOMB_X51_Y51_N24
\NextState[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextState[2]~0_combout\ = (State(0) & (State(2) $ (((State(1) & !\SwitchMode~0_combout\))))) # (!State(0) & ((State(1) & (State(2))) # (!State(1) & (!State(2) & \SwitchMode~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000101101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => State(1),
	datac => State(2),
	datad => \SwitchMode~0_combout\,
	combout => \NextState[2]~0_combout\);

-- Location: LCCOMB_X51_Y51_N10
\State[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \State[2]~0_combout\ = (\BTN[1]~input_o\ & (((!\BTN[0]~input_o\ & !Pushed(0))))) # (!\BTN[1]~input_o\ & (((!\BTN[0]~input_o\ & !Pushed(0))) # (!Pushed(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BTN[1]~input_o\,
	datab => Pushed(1),
	datac => \BTN[0]~input_o\,
	datad => Pushed(0),
	combout => \State[2]~0_combout\);

-- Location: FF_X51_Y51_N25
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

-- Location: LCCOMB_X51_Y51_N14
\NextState[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextState[1]~1_combout\ = (State(0) & (\SwitchMode~0_combout\ $ ((!State(1))))) # (!State(0) & ((\SwitchMode~0_combout\ & (!State(1) & State(2))) # (!\SwitchMode~0_combout\ & (State(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SwitchMode~0_combout\,
	datac => State(1),
	datad => State(2),
	combout => \NextState[1]~1_combout\);

-- Location: FF_X51_Y51_N15
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

-- Location: LCCOMB_X51_Y51_N6
\NextState[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextState[0]~2_combout\ = (!State(0) & ((State(1)) # (\SwitchMode~0_combout\ $ (!State(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SwitchMode~0_combout\,
	datab => State(1),
	datac => State(0),
	datad => State(2),
	combout => \NextState[0]~2_combout\);

-- Location: FF_X51_Y51_N7
\State[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextState[0]~2_combout\,
	ena => \State[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => State(0));

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

-- Location: LCCOMB_X51_Y51_N8
\Mux8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (State(1)) # (State(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(1),
	datad => State(2),
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X52_Y51_N16
\Mux13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (State(0)) # ((!LedOn(1) & (!LedOn(2) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(1),
	datab => LedOn(2),
	datac => State(0),
	datad => LedOn(0),
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X52_Y51_N22
\Mux13~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~1_combout\ = (\Mux13~0_combout\) # (!LedOn(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(3),
	datad => \Mux13~0_combout\,
	combout => \Mux13~1_combout\);

-- Location: LCCOMB_X52_Y51_N4
\Mux13~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~2_combout\ = (!LedOn(0) & State(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => LedOn(0),
	datad => State(1),
	combout => \Mux13~2_combout\);

-- Location: LCCOMB_X52_Y48_N10
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = Cnt10Hz(0) $ (VCC)
-- \Add0~1\ = CARRY(Cnt10Hz(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X52_Y48_N6
\NextCnt10Hz[0]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[0]~9_combout\ = (\Add0~0_combout\ & ((!\Equal0~4_combout\) # (!\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datac => \Equal0~6_combout\,
	datad => \Equal0~4_combout\,
	combout => \NextCnt10Hz[0]~9_combout\);

-- Location: FF_X52_Y48_N7
\Cnt10Hz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(0));

-- Location: LCCOMB_X52_Y48_N12
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (Cnt10Hz(1) & (!\Add0~1\)) # (!Cnt10Hz(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!Cnt10Hz(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X52_Y48_N13
\Cnt10Hz[1]\ : dffeas
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
	q => Cnt10Hz(1));

-- Location: LCCOMB_X52_Y48_N14
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (Cnt10Hz(2) & (\Add0~3\ $ (GND))) # (!Cnt10Hz(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((Cnt10Hz(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X52_Y48_N15
\Cnt10Hz[2]\ : dffeas
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
	q => Cnt10Hz(2));

-- Location: LCCOMB_X52_Y48_N16
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (Cnt10Hz(3) & (!\Add0~5\)) # (!Cnt10Hz(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!Cnt10Hz(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: FF_X52_Y48_N17
\Cnt10Hz[3]\ : dffeas
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
	q => Cnt10Hz(3));

-- Location: LCCOMB_X52_Y48_N18
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (Cnt10Hz(4) & (\Add0~7\ $ (GND))) # (!Cnt10Hz(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((Cnt10Hz(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: FF_X52_Y48_N19
\Cnt10Hz[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(4));

-- Location: LCCOMB_X52_Y48_N20
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (Cnt10Hz(5) & (!\Add0~9\)) # (!Cnt10Hz(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!Cnt10Hz(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X52_Y48_N21
\Cnt10Hz[5]\ : dffeas
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
	q => Cnt10Hz(5));

-- Location: LCCOMB_X52_Y48_N22
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (Cnt10Hz(6) & (\Add0~11\ $ (GND))) # (!Cnt10Hz(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((Cnt10Hz(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X52_Y48_N2
\NextCnt10Hz[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[6]~8_combout\ = (\Add0~12_combout\ & ((!\Equal0~4_combout\) # (!\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~6_combout\,
	datac => \Add0~12_combout\,
	datad => \Equal0~4_combout\,
	combout => \NextCnt10Hz[6]~8_combout\);

-- Location: FF_X52_Y48_N3
\Cnt10Hz[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[6]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(6));

-- Location: LCCOMB_X52_Y48_N0
\Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!Cnt10Hz(4) & (Cnt10Hz(6) & (!Cnt10Hz(5) & !Cnt10Hz(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(4),
	datab => Cnt10Hz(6),
	datac => Cnt10Hz(5),
	datad => Cnt10Hz(3),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X52_Y48_N4
\Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!Cnt10Hz(2) & (!Cnt10Hz(1) & (!Cnt10Hz(0) & \Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(2),
	datab => Cnt10Hz(1),
	datac => Cnt10Hz(0),
	datad => \Equal0~5_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X52_Y48_N24
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (Cnt10Hz(7) & (!\Add0~13\)) # (!Cnt10Hz(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!Cnt10Hz(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: FF_X52_Y48_N25
\Cnt10Hz[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(7));

-- Location: LCCOMB_X52_Y48_N26
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (Cnt10Hz(8) & (\Add0~15\ $ (GND))) # (!Cnt10Hz(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((Cnt10Hz(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X51_Y47_N16
\NextCnt10Hz[8]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[8]~7_combout\ = (\Add0~16_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datac => \Equal0~6_combout\,
	datad => \Add0~16_combout\,
	combout => \NextCnt10Hz[8]~7_combout\);

-- Location: FF_X51_Y47_N17
\Cnt10Hz[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[8]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(8));

-- Location: LCCOMB_X52_Y48_N28
\Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (Cnt10Hz(9) & (!\Add0~17\)) # (!Cnt10Hz(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!Cnt10Hz(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X52_Y48_N8
\NextCnt10Hz[9]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[9]~6_combout\ = (\Add0~18_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datac => \Equal0~6_combout\,
	datad => \Add0~18_combout\,
	combout => \NextCnt10Hz[9]~6_combout\);

-- Location: FF_X52_Y48_N9
\Cnt10Hz[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[9]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(9));

-- Location: LCCOMB_X52_Y48_N30
\Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (Cnt10Hz(10) & (\Add0~19\ $ (GND))) # (!Cnt10Hz(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((Cnt10Hz(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: FF_X52_Y48_N31
\Cnt10Hz[10]\ : dffeas
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
	q => Cnt10Hz(10));

-- Location: LCCOMB_X52_Y47_N0
\Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (Cnt10Hz(11) & (!\Add0~21\)) # (!Cnt10Hz(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!Cnt10Hz(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X52_Y47_N26
\NextCnt10Hz[11]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[11]~5_combout\ = (\Add0~22_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~6_combout\,
	datad => \Add0~22_combout\,
	combout => \NextCnt10Hz[11]~5_combout\);

-- Location: FF_X52_Y47_N27
\Cnt10Hz[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[11]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(11));

-- Location: LCCOMB_X52_Y47_N2
\Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (Cnt10Hz(12) & (\Add0~23\ $ (GND))) # (!Cnt10Hz(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((Cnt10Hz(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: FF_X52_Y47_N3
\Cnt10Hz[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(12));

-- Location: LCCOMB_X52_Y47_N4
\Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (Cnt10Hz(13) & (!\Add0~25\)) # (!Cnt10Hz(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!Cnt10Hz(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: FF_X52_Y47_N5
\Cnt10Hz[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(13));

-- Location: LCCOMB_X52_Y47_N6
\Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (Cnt10Hz(14) & (\Add0~27\ $ (GND))) # (!Cnt10Hz(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((Cnt10Hz(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X52_Y47_N28
\NextCnt10Hz[14]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[14]~4_combout\ = (\Add0~28_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~6_combout\,
	datad => \Add0~28_combout\,
	combout => \NextCnt10Hz[14]~4_combout\);

-- Location: FF_X52_Y47_N29
\Cnt10Hz[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(14));

-- Location: LCCOMB_X51_Y47_N30
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!Cnt10Hz(12) & (Cnt10Hz(14) & (Cnt10Hz(11) & !Cnt10Hz(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(12),
	datab => Cnt10Hz(14),
	datac => Cnt10Hz(11),
	datad => Cnt10Hz(13),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X52_Y47_N8
\Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (Cnt10Hz(15) & (!\Add0~29\)) # (!Cnt10Hz(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!Cnt10Hz(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: FF_X52_Y47_N9
\Cnt10Hz[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(15));

-- Location: LCCOMB_X52_Y47_N10
\Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (Cnt10Hz(16) & (\Add0~31\ $ (GND))) # (!Cnt10Hz(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((Cnt10Hz(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: FF_X52_Y47_N11
\Cnt10Hz[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(16));

-- Location: LCCOMB_X52_Y47_N12
\Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (Cnt10Hz(17) & (!\Add0~33\)) # (!Cnt10Hz(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!Cnt10Hz(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: FF_X52_Y47_N13
\Cnt10Hz[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(17));

-- Location: LCCOMB_X52_Y47_N14
\Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (Cnt10Hz(18) & (\Add0~35\ $ (GND))) # (!Cnt10Hz(18) & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((Cnt10Hz(18) & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X51_Y47_N6
\NextCnt10Hz[18]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[18]~3_combout\ = (\Add0~36_combout\ & ((!\Equal0~4_combout\) # (!\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~6_combout\,
	datac => \Add0~36_combout\,
	datad => \Equal0~4_combout\,
	combout => \NextCnt10Hz[18]~3_combout\);

-- Location: FF_X51_Y47_N7
\Cnt10Hz[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[18]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(18));

-- Location: LCCOMB_X52_Y47_N16
\Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (Cnt10Hz(19) & (!\Add0~37\)) # (!Cnt10Hz(19) & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!Cnt10Hz(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X52_Y47_N30
\NextCnt10Hz[19]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[19]~2_combout\ = (\Add0~38_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~6_combout\,
	datad => \Add0~38_combout\,
	combout => \NextCnt10Hz[19]~2_combout\);

-- Location: FF_X52_Y47_N31
\Cnt10Hz[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(19));

-- Location: LCCOMB_X52_Y47_N18
\Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (Cnt10Hz(20) & (\Add0~39\ $ (GND))) # (!Cnt10Hz(20) & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((Cnt10Hz(20) & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: FF_X52_Y47_N19
\Cnt10Hz[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(20));

-- Location: LCCOMB_X52_Y47_N20
\Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (Cnt10Hz(21) & (!\Add0~41\)) # (!Cnt10Hz(21) & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!Cnt10Hz(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Cnt10Hz(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: FF_X52_Y47_N21
\Cnt10Hz[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Add0~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(21));

-- Location: LCCOMB_X52_Y47_N22
\Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = \Add0~43\ $ (!Cnt10Hz(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => Cnt10Hz(22),
	cin => \Add0~43\,
	combout => \Add0~44_combout\);

-- Location: LCCOMB_X52_Y47_N24
\NextCnt10Hz[22]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \NextCnt10Hz[22]~10_combout\ = (\Add0~44_combout\ & ((!\Equal0~6_combout\) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datac => \Add0~44_combout\,
	datad => \Equal0~6_combout\,
	combout => \NextCnt10Hz[22]~10_combout\);

-- Location: FF_X52_Y47_N25
\Cnt10Hz[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NextCnt10Hz[22]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Cnt10Hz(22));

-- Location: LCCOMB_X51_Y47_N28
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (Cnt10Hz(19) & (Cnt10Hz(22) & (!Cnt10Hz(21) & !Cnt10Hz(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(19),
	datab => Cnt10Hz(22),
	datac => Cnt10Hz(21),
	datad => Cnt10Hz(20),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X51_Y47_N8
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (Cnt10Hz(18) & (!Cnt10Hz(17) & (!Cnt10Hz(15) & !Cnt10Hz(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(18),
	datab => Cnt10Hz(17),
	datac => Cnt10Hz(15),
	datad => Cnt10Hz(16),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X51_Y47_N2
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!Cnt10Hz(7) & (Cnt10Hz(8) & (!Cnt10Hz(10) & Cnt10Hz(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Cnt10Hz(7),
	datab => Cnt10Hz(8),
	datac => Cnt10Hz(10),
	datad => Cnt10Hz(9),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X51_Y47_N12
\Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~2_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\ & \Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X52_Y51_N2
\Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Equal0~4_combout\ & \Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~4_combout\,
	datad => \Equal0~6_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X52_Y51_N0
\Mux13~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~3_combout\ = (State(2)) # ((\Mux13~1_combout\ & (\Mux13~2_combout\ & \Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux13~1_combout\,
	datab => State(2),
	datac => \Mux13~2_combout\,
	datad => \Equal0~7_combout\,
	combout => \Mux13~3_combout\);

-- Location: FF_X52_Y51_N1
\LedOn[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Mux13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedOn(0));

-- Location: LCCOMB_X52_Y51_N30
\Mux12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = LedOn(1) $ (State(0) $ (LedOn(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => LedOn(1),
	datac => State(0),
	datad => LedOn(0),
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X52_Y51_N20
\Mux11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (State(0) & \Equal3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => State(0),
	datad => \Equal3~0_combout\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X52_Y51_N6
\Mux11~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = ((\Mux11~0_combout\) # ((!\Equal0~6_combout\) # (!\Equal0~4_combout\))) # (!\Mux13~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux13~1_combout\,
	datab => \Mux11~0_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~6_combout\,
	combout => \Mux11~1_combout\);

-- Location: LCCOMB_X52_Y51_N18
\Mux12~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux12~1_combout\ = (State(1) & (!State(2) & (\Mux12~0_combout\ & !\Mux11~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(2),
	datac => \Mux12~0_combout\,
	datad => \Mux11~1_combout\,
	combout => \Mux12~1_combout\);

-- Location: FF_X52_Y51_N19
\LedOn[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Mux12~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedOn(1));

-- Location: LCCOMB_X52_Y51_N8
\Mux11~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = LedOn(2) $ (((LedOn(1) & (!State(0) & LedOn(0))) # (!LedOn(1) & (State(0) & !LedOn(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(1),
	datab => LedOn(2),
	datac => State(0),
	datad => LedOn(0),
	combout => \Mux11~2_combout\);

-- Location: LCCOMB_X52_Y51_N28
\Mux11~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~3_combout\ = (State(2)) # ((State(1) & (\Mux11~2_combout\ & !\Mux11~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(2),
	datac => \Mux11~2_combout\,
	datad => \Mux11~1_combout\,
	combout => \Mux11~3_combout\);

-- Location: FF_X52_Y51_N29
\LedOn[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Mux11~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedOn(2));

-- Location: LCCOMB_X52_Y51_N12
\Add4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = LedOn(3) $ (((LedOn(2)) # ((LedOn(1)) # (LedOn(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(3),
	datab => LedOn(2),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X52_Y51_N14
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (LedOn(3) & (!LedOn(2) & (!LedOn(1) & !LedOn(0)))) # (!LedOn(3) & (LedOn(2) & (LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(3),
	datab => LedOn(2),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X52_Y51_N26
\Mux10~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (State(0) & (((\Equal3~0_combout\)) # (!\Add4~0_combout\))) # (!State(0) & (((\Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~0_combout\,
	datab => \Mux10~0_combout\,
	datac => State(0),
	datad => \Equal3~0_combout\,
	combout => \Mux10~1_combout\);

-- Location: LCCOMB_X52_Y51_N10
\Mux10~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~2_combout\ = (State(1) & (!State(2) & (\Mux10~1_combout\ & \Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(1),
	datab => State(2),
	datac => \Mux10~1_combout\,
	datad => \Equal0~7_combout\,
	combout => \Mux10~2_combout\);

-- Location: FF_X52_Y51_N11
\LedOn[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Mux10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => LedOn(3));

-- Location: LCCOMB_X52_Y51_N24
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!LedOn(3) & (!LedOn(2) & (!LedOn(1) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(3),
	datab => LedOn(2),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X51_Y51_N4
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~0_combout\)))) # (!\Mux8~0_combout\ & (State(0) $ ((\SWT[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SWT[0]~input_o\,
	datac => \Mux8~0_combout\,
	datad => \Equal3~0_combout\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X54_Y51_N4
\Equal3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (!LedOn(2) & (!LedOn(3) & (!LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
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

-- Location: LCCOMB_X51_Y51_N30
\Mux8~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\ & (((\Equal3~1_combout\)))) # (!\Mux8~0_combout\ & (State(0) $ (((\SWT[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \Mux8~0_combout\,
	datac => \Equal3~1_combout\,
	datad => \SWT[1]~input_o\,
	combout => \Mux8~1_combout\);

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

-- Location: LCCOMB_X54_Y51_N14
\Equal3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~2_combout\ = (!LedOn(2) & (!LedOn(3) & (LedOn(1) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~2_combout\);

-- Location: LCCOMB_X51_Y51_N28
\Mux7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~2_combout\)))) # (!\Mux8~0_combout\ & (State(0) $ ((\SWT[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \SWT[2]~input_o\,
	datac => \Mux8~0_combout\,
	datad => \Equal3~2_combout\,
	combout => \Mux7~0_combout\);

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

-- Location: LCCOMB_X54_Y51_N28
\Equal3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~3_combout\ = (!LedOn(2) & (!LedOn(3) & (LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~3_combout\);

-- Location: LCCOMB_X54_Y51_N30
\Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~3_combout\)))) # (!\Mux8~0_combout\ & (\SWT[3]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[3]~input_o\,
	datab => \Mux8~0_combout\,
	datac => State(0),
	datad => \Equal3~3_combout\,
	combout => \Mux6~0_combout\);

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

-- Location: LCCOMB_X54_Y51_N24
\Equal3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~4_combout\ = (LedOn(2) & (!LedOn(3) & (!LedOn(1) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~4_combout\);

-- Location: LCCOMB_X54_Y51_N2
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~4_combout\)))) # (!\Mux8~0_combout\ & (\SWT[4]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[4]~input_o\,
	datab => \Mux8~0_combout\,
	datac => State(0),
	datad => \Equal3~4_combout\,
	combout => \Mux5~0_combout\);

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

-- Location: LCCOMB_X54_Y51_N0
\Equal3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~5_combout\ = (LedOn(2) & (!LedOn(3) & (!LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~5_combout\);

-- Location: LCCOMB_X54_Y51_N10
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~5_combout\)))) # (!\Mux8~0_combout\ & (\SWT[5]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[5]~input_o\,
	datab => State(0),
	datac => \Mux8~0_combout\,
	datad => \Equal3~5_combout\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X54_Y51_N12
\Equal3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~6_combout\ = (LedOn(2) & (!LedOn(3) & (LedOn(1) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~6_combout\);

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

-- Location: LCCOMB_X54_Y51_N22
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Mux8~0_combout\ & (\Equal3~6_combout\)) # (!\Mux8~0_combout\ & ((State(0) $ (\SWT[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~6_combout\,
	datab => \Mux8~0_combout\,
	datac => State(0),
	datad => \SWT[6]~input_o\,
	combout => \Mux3~0_combout\);

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

-- Location: LCCOMB_X54_Y51_N20
\Equal3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~7_combout\ = (LedOn(2) & (!LedOn(3) & (LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~7_combout\);

-- Location: LCCOMB_X54_Y51_N26
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~7_combout\)))) # (!\Mux8~0_combout\ & (\SWT[7]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[7]~input_o\,
	datab => \Mux8~0_combout\,
	datac => State(0),
	datad => \Equal3~7_combout\,
	combout => \Mux2~0_combout\);

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

-- Location: LCCOMB_X54_Y51_N16
\Equal3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~8_combout\ = (!LedOn(2) & (LedOn(3) & (!LedOn(1) & !LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
	combout => \Equal3~8_combout\);

-- Location: LCCOMB_X54_Y51_N18
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~8_combout\)))) # (!\Mux8~0_combout\ & (\SWT[8]~input_o\ $ ((State(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SWT[8]~input_o\,
	datab => \Mux8~0_combout\,
	datac => State(0),
	datad => \Equal3~8_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X54_Y51_N8
\Equal3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~9_combout\ = (!LedOn(2) & (LedOn(3) & (!LedOn(1) & LedOn(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => LedOn(2),
	datab => LedOn(3),
	datac => LedOn(1),
	datad => LedOn(0),
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

-- Location: LCCOMB_X51_Y51_N2
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Mux8~0_combout\ & (((\Equal3~9_combout\)))) # (!\Mux8~0_combout\ & (State(0) $ (((\SWT[9]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => State(0),
	datab => \Equal3~9_combout\,
	datac => \Mux8~0_combout\,
	datad => \SWT[9]~input_o\,
	combout => \Mux0~0_combout\);

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



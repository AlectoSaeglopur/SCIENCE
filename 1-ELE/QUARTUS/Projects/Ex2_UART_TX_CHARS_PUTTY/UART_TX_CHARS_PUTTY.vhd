
-----
--| Title: UART TRANSMISSION OF ASCII CHARACTERS BASED ON MAX10 FPGA (DE10-LITE BOARD) [0]
--| Author: Filippo Valmori
--| Date: 05/04/2020
-----

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;


entity UART_TX_CHARS_PUTTY is port (

	-- I/O LIST --
	CLK : in std_logic;																			-- 50 MHz built-it input clock
	BTN : in std_logic;																			-- Built-in button
	SWT : in std_logic;																			-- Built-in switch
	TXL : out std_logic);																		-- UART TX line (GPIO2)

end UART_TX_CHARS_PUTTY;


architecture STRUCT of UART_TX_CHARS_PUTTY is

	-- PARAMETERS --
	constant UART_RATE : natural := 100000;														-- UART baud rate [b/s] (e.g. 100000 means 100 kb/s)													
	constant EnablePB : natural := 1;															-- Set to 0 or 1 respectively for disablig or enabling the transmission of (even) parity bit
	constant TxScFct : natural := 2;															-- Delays scale factor (e.g. setting 5 means transmitting every 1s/5 = 200ms in mode A)	[1]

	-- THRESHOLDS FOR DERIVED CLOCKS --
	constant THR_UART : natural := 25000000/UART_RATE;		 									-- Counter threshold for UART clock (i.e. 50MHz/UART_RATE*DUTY_CYCLE_50%) [2]
	constant THR_1KHZ : natural := 25000;														-- Counter threshold for 1 kHz clock (same formula as line above)

	-- UART PROTOCOL --
	constant Ndata : natural := 7;																-- Number of info bits per frame
	constant START : std_logic := '0';															-- START bit value
	constant STOP : std_logic := '1';															-- STOP bit value
	constant Nbpf : natural := Ndata+2+EnablePB;												-- Overall number of bits per frame (assuming one STOP bit)
	constant Nfpm : natural := 15;																-- Number of frames per message

	-- STATES AND DELAYS --
	constant Nst : natural := 4;																-- Number of Tx states/modes
	constant NcycMin : natural := UART_RATE/TxScFct;											-- Minimum number of UART cycles between consecutive messages (when SWT='0')
	constant NcycMed : natural := 3*NcycMin;													-- Medium number of UART cycles between consecutive messages (when SWT='0')
	constant NcycMax : natural := 5*NcycMin;													-- Maximum number of UART cycles between consecutive messages (when SWT='0')
	type delay_array is array (0 to Nst-2) of natural range 0 to NcycMax;
	constant Delays : delay_array := (NcycMin, NcycMed, NcycMax);								-- Delays between consecutive automatic printings (when SWT='0')

	-- CHARACTERS AND ALPHABET --
	constant Ch_A : std_logic_vector(6 downto 0) := "1000001";									-- ASCII code for character "A" (0x41)
	constant Ch_B : std_logic_vector(6 downto 0) := "1000010";									-- ASCII code for character "B" (0x42)
	constant Ch_C : std_logic_vector(6 downto 0) := "1000011";									-- ASCII code for character "C" (0x43)
	constant Ch_D : std_logic_vector(6 downto 0) := "1000100";									-- ASCII code for character "D" (0x44)
	constant Ch_0 : std_logic_vector(6 downto 0) := "0110000";									-- ASCII code for character "0" (0x30)
	constant Ch_1 : std_logic_vector(6 downto 0) := "0110001";									-- ASCII code for character "1" (0x31)
	constant Ch_2 : std_logic_vector(6 downto 0) := "0110010";									-- ASCII code for character "2" (0x32)
	constant Ch_3 : std_logic_vector(6 downto 0) := "0110011";									-- ASCII code for character "3" (0x33)
	constant Ch_4 : std_logic_vector(6 downto 0) := "0110100";									-- ASCII code for character "4" (0x34)
	constant Ch_5 : std_logic_vector(6 downto 0) := "0110101";									-- ASCII code for character "5" (0x35)
	constant Ch_6 : std_logic_vector(6 downto 0) := "0110110";									-- ASCII code for character "6" (0x36)
	constant Ch_7 : std_logic_vector(6 downto 0) := "0110111";									-- ASCII code for character "7" (0x37)
	constant Ch_8 : std_logic_vector(6 downto 0) := "0111000";									-- ASCII code for character "8" (0x38)
	constant Ch_9 : std_logic_vector(6 downto 0) := "0111001";									-- ASCII code for character "9" (0x39)
	constant Ch_LF : std_logic_vector(6 downto 0) := "0001010";									-- ASCII code for Line Feed, aka "\n" (0x0A)
	constant Ch_CR : std_logic_vector(6 downto 0) := "0001101";									-- ASCII code for Carriage Return, aka "\r" (0x0D)
	constant Ch_Colon : std_logic_vector(6 downto 0) := "0111010";								-- ASCII code for character ":" (0x3A)
	constant Ch_Vert : std_logic_vector(6 downto 0) := "1111100";								-- ASCII code for character "|" (0x7C)
	constant Ch_Space : std_logic_vector(6 downto 0) := "0100000";								-- ASCII code for character " " (0x20)
	type char_array is array (0 to Nst-1) of std_logic_vector(6 downto 0);						-- Customized type for modes characters
	constant Alphabet : char_array := (Ch_A, Ch_B, Ch_C, Ch_D);									-- Array with the ID of all four modes
	
	-- SIGNALS DEFINITION --
	signal State : natural range 0 to (Nst-2) := 0;												-- Current Tx state (when SWT='0')
	signal NxState : natural range 0 to (Nst-2);
	signal Pushed : std_logic := '0';															-- Debouncer for BTN
	signal NxPushed : std_logic;
	signal CntUART : natural range 0 to THR_UART-1 := 0;										-- Counter for UART clock cycles
	signal NxCntUART : natural range 0 to THR_UART-1;
	signal ClkUART : std_logic := '0'; 															-- UART clock
	signal NxClkUART : std_logic;
	signal Ncyc : natural range 0 to NcycMax;													-- Current number of UART cycles between consecutive messages (when SWT='0')
	signal StChar : std_logic_vector(6 downto 0);												-- Character representing current state
	signal OvBitCnt : natural range 0 to NcycMax := 0;											-- Overall bits/cycles counter within message
	signal NxOvBitCnt : natural range 0 to NcycMax;
	signal TxLine : std_logic;																	-- Tx signal
	signal MsgFrIdx : natural range 0 to (Nfpm-1) := 0;											-- Frame index within a single message
	signal NxMsgFrIdx : natural range 0 to (Nfpm-1);
	signal FrBitCnt : natural range 0 to (Nbpf-1) := 0;											-- Bit index within a single frame
	signal NxFrBitCnt : natural range 0 to (Nbpf-1);
	signal CalcPB : std_logic := '0';															-- Trigger that enables the parity bit estimate for current frame
	signal ParBit : std_logic := '0';															-- Parity bit value for the current frame
	signal NxParBit : std_logic;
	signal ResetCA : std_logic;																	-- Reset when passing from state A to C (if SWT='0')
	signal ResetD : std_logic := '1';															-- Reset signal between consecutive button pushes in state D (if SWT='1')
	signal NxResetD : std_logic;
	signal ResetD_New : std_logic;																-- Component of ResetD relative to new button pushes
	signal ResetD_End : std_logic;																-- Component of ResetD relative to message transmission end
	signal Cnt1kHz : natural range 0 to THR_1KHZ-1 := 0;											-- Counter for 1 kHz clock cycles
	signal NxCnt1kHz : natural range 0 to THR_1KHZ-1;
	signal Clk1kHz : std_logic := '0';															-- 1 kHz clock
	signal NxClk1kHz : std_logic;
	signal Msec : natural range 0 to 999 := 0;													-- Milliseconds counter
	signal NxMsec : natural range 0 to 999; 
	signal Sec : natural range 0 to 59 := 0;													-- Seconds counter
	signal NxSec : natural range 0 to 59;
	signal Min : natural range 0 to 59 := 0;													-- Minutes counter
	signal NxMin : natural range 0 to 59;
	type msec_array is array (0 to 2) of std_logic_vector(6 downto 0);							-- Customized type for millisecond digits
	type min_sec_array is array (0 to 1) of std_logic_vector(6 downto 0);						-- Customized type for second and minute digits
	signal CharMsec : msec_array;																-- Millisecond characters
	signal CharSec : min_sec_array;																-- Second characters
	signal CharMin : min_sec_array;																-- Minute characters
	
begin
	
	-- [SQN] Process to update some signals as a function of the main clock (50 MHz) --
	Clock_50MHz_Reg : process ( CLK ) begin
		if ( CLK'event and CLK='1' ) then
			Cnt1kHz <= NxCnt1kHz;
			Clk1kHz <= NxClk1kHz;
			CntUART <= NxCntUART;
			ClkUART <= NxClkUART;
		end if;
	end process;
	
	
	-- [CMB] Process for generating the 1 kHz clock from the 50 MHz one --
	Downclocking_1kHz : process ( Cnt1kHz, Clk1kHz ) begin
		if ( Cnt1kHz = THR_1KHZ-1 ) then
			NxCnt1kHz <= 0;
			NxClk1kHz <= not(Clk1kHz);
		else
			NxCnt1kHz <= Cnt1kHz+1;
			NxClk1kHz <= Clk1kHz;
		end if;
	end process;


	-- [SQN] Process for synchronously updating signals at 1 kHz	--
	Clk1_kHz_Reg : process ( Clk1kHz ) begin
		if ( rising_edge( Clk1kHz ) ) then
			Msec <= NxMsec;
			Sec <= NxSec;
			Min <= NxMin;
		end if;
	end process;


	-- [CMB] Process for updating time --
	Time_Clk1kHz : process ( Msec, Sec, Min ) begin
		if ( Msec < 999 ) then
			NxMsec <= Msec+1;
			NxSec <= Sec;
			NxMin <= Min;
		else
			NxMsec <= 0;
			if ( Sec < 59 ) then
				NxSec <= Sec+1;
				NxMin <= Min;
			else
				NxSec <= 0;
				if ( Min < 59 ) then
					NxMin <= Min+1;
				else
					NxMin <= 0;
				end if;
			end if;
		 end if;
	end process;
	

	-- [CMB] Process for generating the UART clock from the 50 MHz one	--
	Downclocking_UART : process ( CntUART, ClkUART ) begin
		if ( CntUart = THR_UART-1 ) then
			NxCntUART <= 0;
			NxClkUART <= not(ClkUART);
		else
			NxCntUART <= CntUART+1;
			NxClkUART <= ClkUART;
		end if;
	end process;

	
	-- [SQN] Process for synchronously updating signals at UART frequency	--
	Clk_UART_Reg : process ( ClkUART ) begin
		if ( rising_edge( ClkUART ) ) then
			OvBitCnt <= NxOvBitCnt;
			MsgFrIdx <= NxMsgFrIdx;
			FrBitCnt <= NxFrBitCnt;
			Pushed <= NxPushed;
			State <= NxState;
			ParBit <= NxParBit;
			ResetD <= NxResetD;
		end if;
	end process;


	-- [CMB] Process for updating NxState and NxPushed signals --
	State_Handler : process ( SWT, BTN, Pushed, State ) begin
		if ( SWT = '0' ) then
			if ( BTN = '0' and Pushed = '0' ) then												-- NB: BTN = '0' means the button is pushed
				if ( State = Nst-2 ) then
					NxState <= 0;
				else
					NxState <= (State+1);
				end if;
				NxPushed <= '1';
			else
				NxState <= State;
				NxPushed <= not(BTN);
			end if;
		else
			NxState <= State;
			if ( BTN = '0' and Pushed = '0' ) then
				NxPushed <= '1';
			else
				NxPushed <= not(BTN);
			end if;
		end if;
	end process;


	-- [CMB] Process for updating ResetCA, ResetD_New and ResetD_End signals --
	Reset_Handler : process ( SWT, BTN, Pushed, State, OvBitCnt, Ncyc, ResetD ) begin
		if ( (SWT = '1') or ((BTN = '0') and (Pushed = '0') and (State = Nst-2)) ) then
			ResetCA <= '1';
		else
			ResetCA <= '0';
		end if;
		if ( (SWT = '1') and  (BTN = '0') and (Pushed = '0') ) then
			ResetD_New <= '0';
		else
			ResetD_New <= '1';
		end if;
		if ( (SWT = '1') and ((OvBitCnt < Ncyc-1) and (ResetD = '0')) ) then
			ResetD_End <= '0';
		else
			ResetD_End <= '1';
		end if;	
	end process;

	
	-- [CMB] Process for updating the message counters --
	Message_Handler : process ( SWT, Ncyc, OvBitCnt, FrBitCnt, MsgFrIdx, ResetCA, ResetD ) begin
		if ( SWT = '0' ) then
			if ( (OvBitCnt >= Ncyc-1) or (ResetCA = '1')  ) then
				NxOvBitCnt <= 0;
				NxFrBitCnt <= 0;
				NxMsgFrIdx <= 0;
			else
				NxOvBitCnt <= OvBitCnt+1;
				if ( FrBitCnt = (Nbpf-1) ) then
					NxFrBitCnt <= 0;
					NxMsgFrIdx <= MsgFrIdx+1;
				else
					NxFrBitCnt <= FrBitCnt+1;
					NxMsgFrIdx <= MsgFrIdx;
				end if;
			end if;
		else
			if ( (OvBitCnt = Ncyc-1) or ( ResetD = '1' ) ) then
				NxOvBitCnt <= 0;
				NxFrBitCnt <= 0;
				NxMsgFrIdx <= 0;
			else
				NxOvBitCnt <= OvBitCnt+1;
				if ( FrBitCnt = (Nbpf-1) ) then
					NxFrBitCnt <= 0;
					NxMsgFrIdx <= MsgFrIdx+1;
				else
					NxFrBitCnt <= FrBitCnt+1;
					NxMsgFrIdx <= MsgFrIdx;
				end if;
			end if;
		end if;
	end process;


	-- [CMB] Process for getting time characters to print over UART --
	Time_Chars_Handler : process ( Min, Sec, Msec ) begin
		if ( (Min mod 10) = 0 ) then
			CharMin(0) <= Ch_0;
		elsif ( (Min mod 10) = 1 ) then
			CharMin(0) <= Ch_1;
		elsif ( (Min mod 10) = 2 ) then
			CharMin(0) <= Ch_2;
		elsif ( (Min mod 10) = 3 ) then
			CharMin(0) <= Ch_3;
		elsif ( (Min mod 10) = 4 ) then
			CharMin(0) <= Ch_4;
		elsif ( (Min mod 10) = 5 ) then
			CharMin(0) <= Ch_5;
		elsif ( (Min mod 10) = 6 ) then
			CharMin(0) <= Ch_6;
		elsif ( (Min mod 10) = 7 ) then
			CharMin(0) <= Ch_7;
		elsif ( (Min mod 10) = 8 ) then
			CharMin(0) <= Ch_8;
		else
			CharMin(0) <= Ch_9;
		end if;
		if ( Min - (Min mod 10) = 0 ) then
			CharMin(1) <= Ch_0;
		elsif ( Min - (Min mod 10) = 10 ) then
			CharMin(1) <= Ch_1;
		elsif ( Min - (Min mod 10) = 20 ) then
			CharMin(1) <= Ch_2;
		elsif ( Min - (Min mod 10) = 30 ) then
			CharMin(1) <= Ch_3;
		elsif ( Min - (Min mod 10) = 40 ) then
			CharMin(1) <= Ch_4;
		else
			CharMin(1) <= Ch_5;
		end if;
		if ( (Sec mod 10) = 0 ) then
			CharSec(0) <= Ch_0;
		elsif ( (Sec mod 10) = 1 ) then
			CharSec(0) <= Ch_1;
		elsif ( (Sec mod 10) = 2 ) then
			CharSec(0) <= Ch_2;
		elsif ( (Sec mod 10) = 3 ) then
			CharSec(0) <= Ch_3;
		elsif ( (Sec mod 10) = 4 ) then
			CharSec(0) <= Ch_4;
		elsif ( (Sec mod 10) = 5 ) then
			CharSec(0) <= Ch_5;
		elsif ( (Sec mod 10) = 6 ) then
			CharSec(0) <= Ch_6;
		elsif ( (Sec mod 10) = 7 ) then
			CharSec(0) <= Ch_7;
		elsif ( (Sec mod 10) = 8 ) then
			CharSec(0) <= Ch_8;
		else
			CharSec(0) <= Ch_9;
		end if;
		if ( Sec - (Sec mod 10) = 0 ) then
			CharSec(1) <= Ch_0;
		elsif ( Sec - (Sec mod 10) = 10 ) then
			CharSec(1) <= Ch_1;
		elsif ( Sec - (Sec mod 10) = 20 ) then
			CharSec(1) <= Ch_2;
		elsif ( Sec - (Sec mod 10) = 30 ) then
			CharSec(1) <= Ch_3;
		elsif ( Sec - (Sec mod 10) = 40 ) then
			CharSec(1) <= Ch_4;
		else
			CharSec(1) <= Ch_5;
		end if;
		if ( (Msec mod 10) = 0 ) then
			CharMsec(0) <= Ch_0;
		elsif ( (Msec mod 10) = 1 ) then
			CharMsec(0) <= Ch_1;
		elsif ( (Msec mod 10) = 2 ) then
			CharMsec(0) <= Ch_2;
		elsif ( (Msec mod 10) = 3 ) then
			CharMsec(0) <= Ch_3;
		elsif ( (Msec mod 10) = 4 ) then
			CharMsec(0) <= Ch_4;
		elsif ( (Msec mod 10) = 5 ) then
			CharMsec(0) <= Ch_5;
		elsif ( (Msec mod 10) = 6 ) then
			CharMsec(0) <= Ch_6;
		elsif ( (Msec mod 10) = 7 ) then
			CharMsec(0) <= Ch_7;
		elsif ( (Msec mod 10) = 8 ) then
			CharMsec(0) <= Ch_8;
		else
			CharMsec(0) <= Ch_9;
		end if;
		if ( (Msec mod 100)-(Msec mod 10) = 0 ) then
			CharMsec(1) <= Ch_0;
		elsif ( (Msec mod 100)-(Msec mod 10) = 10 ) then
			CharMsec(1) <= Ch_1;
		elsif ( (Msec mod 100)-(Msec mod 10) = 20 ) then
			CharMsec(1) <= Ch_2;
		elsif ( (Msec mod 100)-(Msec mod 10) = 30 ) then
			CharMsec(1) <= Ch_3;
		elsif ( (Msec mod 100)-(Msec mod 10) = 40 ) then
			CharMsec(1) <= Ch_4;
		elsif ( (Msec mod 100)-(Msec mod 10) = 50 ) then
			CharMsec(1) <= Ch_5;
		elsif ( (Msec mod 100)-(Msec mod 10) = 60 ) then
			CharMsec(1) <= Ch_6;
		elsif ( (Msec mod 100)-(Msec mod 10) = 70 ) then
			CharMsec(1) <= Ch_7;
		elsif ( (Msec mod 100)-(Msec mod 10) = 80 ) then
			CharMsec(1) <= Ch_8;
		else
			CharMsec(1) <= Ch_9;
		end if;
		if ( Msec-(Msec mod 100) = 0 ) then
			CharMsec(2) <= Ch_0;
		elsif ( Msec-(Msec mod 100) = 100 ) then
			CharMsec(2) <= Ch_1;
		elsif ( Msec-(Msec mod 100) = 200 ) then
			CharMsec(2) <= Ch_2;
		elsif ( Msec-(Msec mod 100) = 300 ) then
			CharMsec(2) <= Ch_3;
		elsif ( Msec-(Msec mod 100) = 400 ) then
			CharMsec(2) <= Ch_4;
		elsif ( Msec-(Msec mod 100) = 500 ) then
			CharMsec(2) <= Ch_5;
		elsif ( Msec-(Msec mod 100) = 600 ) then
			CharMsec(2) <= Ch_6;
		elsif ( Msec-(Msec mod 100) = 700 ) then
			CharMsec(2) <= Ch_7;
		elsif ( Msec-(Msec mod 100) = 800 ) then
			CharMsec(2) <= Ch_8;
		else
			CharMsec(2) <= Ch_9;
		end if;
	end process;
	

	-- [CMB] Process for handling the TxLine signal	--
	TxLine_Handler : process ( SWT, ResetD, OvBitCnt, FrBitCnt, MsgFrIdx, ParBit, StChar,
			CharMin, CharSec, CharMsec ) begin
		if ( (SWT = '1' and ResetD = '1') or (OvBitCnt > (Nbpf*Nfpm-1)) ) then					-- Message is over, keep Tx line idle (i.e. equal to STOP bit or at high impedance 'Z')
			TxLine <= STOP;
		elsif ( FrBitCnt = 0 ) then																-- Frame is beginning, send START bit
			TxLine <= START;
		elsif ( FrBitCnt = (Nbpf-1) ) then														-- Frame is ending, send STOP bit
			TxLine <= STOP;
		elsif ( (EnablePB = 1) and (FrBitCnt = (Nbpf-2)) ) then
			TxLine <= ParBit;
		else																					-- i.e. UART message range
			if ( MsgFrIdx = 0 ) then
				TxLine <= StChar(FrBitCnt-1);
			elsif ( MsgFrIdx = 1 ) then
				TxLine <= Ch_Space(FrBitCnt-1);
			elsif ( MsgFrIdx = 2 ) then
				TxLine <= Ch_Vert(FrBitCnt-1);
			elsif ( MsgFrIdx = 3 ) then
				TxLine <= Ch_Space(FrBitCnt-1);
			elsif ( MsgFrIdx = 4 ) then
				TxLine <= CharMin(1)(FrBitCnt-1);
			elsif ( MsgFrIdx = 5 ) then
				TxLine <= CharMin(0)(FrBitCnt-1);
			elsif ( MsgFrIdx = 6 ) then
				TxLine <= Ch_Colon(FrBitCnt-1);
			elsif ( MsgFrIdx = 7 ) then
				TxLine <= CharSec(1)(FrBitCnt-1);
			elsif ( MsgFrIdx = 8 ) then
				TxLine <= CharSec(0)(FrBitCnt-1);
			elsif ( MsgFrIdx = 9 ) then
				TxLine <= Ch_Colon(FrBitCnt-1);
			elsif ( MsgFrIdx = 10 ) then
				TxLine <= CharMsec(2)(FrBitCnt-1);
			elsif ( MsgFrIdx = 11 ) then
				TxLine <= CharMsec(1)(FrBitCnt-1);
			elsif ( MsgFrIdx = 12 ) then
				TxLine <= CharMsec(0)(FrBitCnt-1);
			elsif ( MsgFrIdx = 13 ) then
				TxLine <= Ch_CR(FrBitCnt-1);
			else
				TxLine <= Ch_LF(FrBitCnt-1);
			end if;
		end if;
	end process;


	-- [CMB] Process for estimating the parity bit of each frame --
	ParityBit_Calculator : process ( CalcPB, ParBit, TxLine ) begin
		if ( CalcPB = '1' ) then
			NxParBit <= ParBit xor TxLine;
		else
			NxParBit <= '0';
		end if;
	end process;


	-- [CMB] Process for updating signals Ncyc and StChar --
	Ncyc_StChar_Update : process ( SWT, State ) begin
		if ( SWT = '0' ) then
			Ncyc <= Delays(State);
			StChar <= Alphabet(State);
		else
			Ncyc <= Nbpf*Nfpm;
			StChar <= Alphabet(Nst-1);
		end if;
	end process;


	-- [CMB] Process for handling the CalcPB signal	--
	ParityBit_Trigger : process ( SWT, ResetD, OvBitCnt, FrBitCnt ) begin
		if ( (SWT = '1' and ResetD = '1') or (OvBitCnt > (Nbpf*Nfpm-1)) or (FrBitCnt = 0)
				or (FrBitCnt = (Nbpf-1)) or ((EnablePB = 1) and (FrBitCnt = (Nbpf-2))) ) then
			CalcPB <= '0';
		else																					-- Enable the parity bit estimate only within info bits range
			CalcPB <= '1';
		end if;
	end process;

	
	-- Fixed assignments --
	NxResetD <= (ResetD_New and ResetD_End);
	TXL <= TxLine;

end STRUCT;



----- NOTES -----

-- [0] This code make FPGA transmit ASCII characters over GPIO according to UART protocol in order to be displayed via PuTTY terminal. 
--     When the switch (SWT) is in position '0', by default (i.e. when TxScFct = 1) message transmissions are automatic every 1 second
--     (state A). By pushing the button (BTN) once or twice, the transmission period changes respectively to 3 seconds (state B) or 5
--     seconds (state C). When SWT is in position '1' (state D) instead, the transmissions become manual and triggered only by pushing
-- 	   BTN. Each message contains 15 frames, which specify the current state and the transmission time (e.g. "A | 01:23:456\r\n").

-- [1] The only parameters settable by user in this project/code are the TX baud rate, the parity bit enable/disable flag and the scale
--	   factor to speed up automatic printings in modes A, B and C (e.g. TxScFct = 5 causes Ta = 200ms, Tb = 600ms and Tc = 1s). Of course,
--     TxScFct cannot be chosen too high in relation to the selected baud rate (i.e. the time needed to transmit all bits of a single
--     message shall be rather less than the period between consecutive printings).

-- [2] In order to simulate transmission, set THR_UART = 6.

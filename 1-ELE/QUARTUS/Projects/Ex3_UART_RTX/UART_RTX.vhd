
-----
--| Title: UART RECEPTION/TRANSMISSION BASED ON MAX10 FPGA (DE10-LITE BOARD) [0]
--| Author: Filippo Valmori
--| Date: 11/04/2020
-----


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;


entity UART_RTX is port (

	-- I/O LIST --
	CLK : in std_logic;                                                                         -- 50 MHz built-it input clock
	RXL : in std_logic;                                                                         -- UART RX line (GPIO6)
	BTN : in std_logic_vector(1 downto 0);                                                      -- Built-in buttons
	SWT : in std_logic;                                                                         -- Built-in switch
	LED : out std_logic_vector(9 downto 0);                                                     -- Built-in LEDs
	TXL : out std_logic);                                                                       -- UART TX line (GPIO2)

end UART_RTX;


architecture STRUCT of UART_RTX is

	-- PARAMETERS --
	constant UART_TX_RATE : natural := 100000;													-- UART Tx baud rate (from FPGA to MCU) [b/s] [3]
	constant UART_RX_RATE : natural := 100000;													-- UART Rx baud rate (from MCU to FPGA) [b/s] [2]

	-- THRESHOLDS FOR DERIVED CLOCKS --
	constant THR_UART_TX : natural := 25000000/UART_TX_RATE;		 							-- Counter threshold for Tx UART clock (i.e. 50MHz/UART_RATE*DUTY_CYCLE_50%) [1]
	constant THR_UART_RX : natural := 50000000/UART_RX_RATE;									-- Counter threshold for Rx UART sampling instants for all bits after the first one
	constant THR_UART_HALF : natural := THR_UART_RX/2;											-- Counter threshold for Rx UART sampling instant for first bit only

	-- UART PROTOCOL --
	constant START : std_logic := '0';															-- START bit value
	constant STOP : std_logic := '1';															-- STOP bit value
	constant Nbpf : natural := 11;																-- Number of bits per frame for both Tx and Rx (i.e. 1-START + 8-DATA + 1-EVEN-PARITY + 1-STOP)
	constant NfpmTx : natural := 4;																-- Number of frames per message in Tx
	constant NbpmTx : natural := Nbpf*NfpmTx;													-- Number of bits per message in Tx
	constant NfpmRx : natural := 3;																-- Number of frames per message in Rx

	-- TX SIGNALS AND CONSTANTS --
	constant TxByte0 : std_logic_vector(7 downto 0) := "11010011";								-- 1st frame of message to be transmitted to MCU (0xD3)
	constant TxByte1 : std_logic_vector(7 downto 0) := "10010001";								-- 2nd frame of message to be transmitted to MCU (0x91)
	constant TxByte2 : std_logic_vector(7 downto 0) := "10100000";								-- 3rd frame of message to be transmitted to MCU (0xA0)
	constant TxByte3 : std_logic_vector(7 downto 0) := "11000100";								-- 4th frame of message to be transmitted to MCU (0xC4)
	type word is array (0 to NfpmTx-1) of std_logic_vector(7 downto 0);
	constant TxBuf : word := (TxByte0, TxByte1, TxByte2, TxByte3);								-- Tx buffer (with fixed content)
	signal Pushed : std_logic := '0';															-- Debouncer for BTN[0]
	signal NxPushed : std_logic;
	signal CntTxUART : natural range 0 to THR_UART_TX-1 := 0;									-- Counter for UART Tx clock cycles
	signal NxCntTxUART : natural range 0 to THR_UART_TX-1;
	signal ClkTxUART : std_logic := '0'; 														-- UART Tx clock
	signal NxClkTxUART : std_logic;
	signal TxOvBitIdx : natural range 0 to NbpmTx-1 := 0;										-- Overall bits/cycles counter within message in Tx
	signal NxTxOvBitIdx : natural range 0 to NbpmTx-1;
	signal TxLine : std_logic;																	-- UART Tx line
	signal TxFrIdx : natural range 0 to (NfpmTx-1) := 0;										-- Frame index within a single message in Tx
	signal NxTxFrIdx : natural range 0 to (NfpmTx-1);
	signal TxBitIdx : natural range 0 to (Nbpf-1) := 0;											-- Bit index within a single frame (data+header) in Tx
	signal NxTxBitIdx : natural range 0 to (Nbpf-1);
	signal TxCalcPB : std_logic := '0';															-- Flag for enabling parity bit estimate for current frame in Tx
	signal TxParBit : std_logic := '0';															-- Parity bit value for the current frame in Tx
	signal NxTxParBit : std_logic;
	signal ResetTx : std_logic := '1';															-- Internal Tx reset signal between consecutive transmissions
	signal NxResetTx : std_logic;

	-- RX SIGNALS AND CONSTANTS --
	constant NstRx : natural := 6;																-- Number of states inside Rx state machine (SM)
	signal RxSt : natural range 0 to NstRx-1 := 0;												-- Current Rx state
	signal NxRxSt : natural range 0 to NstRx-1;													-- Next Rx state
	signal CntRxUART : natural range 0 to THR_UART_RX-1 := 0;									-- Counter for UART Rx clock cycles
	signal NxCntRxUART : natural range 0 to THR_UART_RX-1;
	signal RxBitIdx : natural range 0 to 7 := 0;												-- Bit index within a single frame (only data) in Rx
	signal NxRxBitIdx : natural range 0 to 7;
	signal RxFrIdx : natural range 0 to NfpmRx-1 := 0;											-- Frame index in Rx
	signal NxRxFrIdx : natural range 0 to NfpmRx-1;
	signal RxParBit : std_logic := '0';															-- Parity bit value for the current frame in Rx
	signal NxRxParBit : std_logic;
	signal UpLeds : std_logic := '0';															-- Flag for updating or not LEDs state in Rx
	signal NxUpLeds : std_logic;
	type rxbuffer is array (0 to NfpmRx-1) of std_logic_vector(7 downto 0);
	signal RxBuf : rxbuffer := (others => (others => '0'));										-- Rx buffer (with fixed content)
	signal NxRxBuf : rxbuffer;

begin

	----- SHARED SECTION -----
	
	-- [SQN] Process for synchronously updating signals directly related to main clock (50 MHz) --
	Clock_50MHz_Reg : process ( CLK ) begin

		if ( CLK'event and CLK='1' ) then
			CntTxUART <= NxCntTxUART;
			ClkTxUART <= NxClkTxUART;
			CntRxUART <= NxCntRxUART;
			RxBuf <= NxRxBuf;
			if ( BTN(1) = '0' ) then															-- Reset all Rx signals if BTN[1] is pressed
				RxBitIdx <= 0;
				RxFrIdx <= 0;
				RxSt <= 0;
				RxParBit <= '0';
				UpLeds <= '0';
			else
				RxBitIdx <= NxRxBitIdx;
				RxFrIdx <= NxRxFrIdx;
				RxSt <= NxRxSt;
				RxParBit <= NxRxParBit;
				UpLeds <= NxUpLeds;
			end if;

		end if;
	end process;



	----- TX SECTION -----
	
	-- [CMB] Process for generating the Tx UART clock from the 50 MHz one --
	Downclocking_Tx_UART : process ( CntTxUART, ClkTxUART ) begin
		if ( CntTxUart = THR_UART_TX-1 ) then
			NxCntTxUART <= 0;
			NxClkTxUART <= not(ClkTxUART);
		else
			NxCntTxUART <= CntTxUART+1;
			NxClkTxUART <= ClkTxUART;
		end if;
	end process;

	
	-- [SQN] Process for synchronously updating signals at Tx UART frequency	--
	Clk_UART_Reg : process ( ClkTxUART ) begin
		if ( rising_edge( ClkTxUART ) ) then
			TxOvBitIdx <= NxTxOvBitIdx;
			TxFrIdx <= NxTxFrIdx;
			TxBitIdx <= NxTxBitIdx;
			Pushed <= NxPushed;
			TxParBit <= NxTxParBit;
			ResetTx <= NxResetTx;
		end if;
	end process;


	-- [CMB] Process acting as debouncer for BTN[0] --
	Debouncer_Handler : process ( BTN, Pushed ) begin
		if ( BTN(0) = '0' and Pushed = '0' ) then
			NxPushed <= '1';
		else
			NxPushed <= not(BTN(0));
		end if;
	end process;


	-- [CMB] Process for updating all Tx reset signals --
	Reset_Handler : process ( BTN(0), Pushed, TxOvBitIdx, ResetTx ) begin
		if ( ((BTN(0) = '0') and (Pushed = '0')) or												-- Disable Tx reset upon BTN[0] pushing or while transmitting a message towards MCU
				((TxOvBitIdx < NbpmTx-1) and (ResetTx = '0')) ) then
			NxResetTx <= '0';
		else
			NxResetTx <= '1';
		end if;

	end process;

	
	-- [CMB] Process for updating the message counters --
	Message_Handler : process ( TxOvBitIdx, TxBitIdx, TxFrIdx, ResetTx ) begin
		if ( (TxOvBitIdx = NbpmTx-1) or ( ResetTx = '1' ) ) then
			NxTxOvBitIdx <= 0;
			NxTxBitIdx <= 0;
			NxTxFrIdx <= 0;
		else
			NxTxOvBitIdx <= TxOvBitIdx+1;
			if ( TxBitIdx = (Nbpf-1) ) then
				NxTxBitIdx <= 0;
				NxTxFrIdx <= TxFrIdx+1;
			else
				NxTxBitIdx <= TxBitIdx+1;
				NxTxFrIdx <= TxFrIdx;
			end if;
		end if;
	end process;
	

	-- [CMB] Process for handling TxLine signal	--
	TxLine_Handler : process ( SWT, ResetTx, TxBitIdx, TxFrIdx, TxParBit ) begin
		if ( (ResetTx = '1') or (TxBitIdx = (Nbpf-1)) ) then									-- If frame is ending or message is over, set line as STOP/IDLE (assuming IDLE as '1')
			TxLine <= STOP;
		elsif ( TxBitIdx = 0 ) then																-- If frame is beginning, send START bit
			TxLine <= START;
		elsif ( TxBitIdx = (Nbpf-2) ) then														-- After data bits, send parity bit
			TxLine <= TxParBit;
		else																					-- Send data bits of current frame
			if ( SWT = '1' ) then
				TxLine <= TxBuf(TxFrIdx)(TxBitIdx-1);											-- If SWT='1', send correct data bits
			else
				TxLine <= TxBuf(0)(TxBitIdx-1);													-- If SWT='0', send wrong data bits (in order to simulate communication corruption between FPGA and MCU)
			end if;
			
		end if;
	end process;


	-- [CMB] Process for estimating the parity bit of each frame --
	ParityBit_Calculator : process ( TxCalcPB, TxParBit, TxLine ) begin
		if ( TxCalcPB = '1' ) then
			NxTxParBit <= (TxParBit xor TxLine);												-- Iteratively estimate parity bit when TxCalcPB signal is enabled
		else
			NxTxParBit <= '0';
		end if;
	end process;


	-- [CMB] Process for handling the TxCalcPB signal	--
	ParityBit_Trigger : process ( ResetTx, TxOvBitIdx, TxBitIdx ) begin
		if ( (ResetTx = '1') or (TxOvBitIdx > (NbpmTx-1)) or (TxBitIdx = 0) or					-- If TxLine is in IDLE state or transmitting header bits, disable TxCalcPB signal
				(TxBitIdx = (Nbpf-1)) or ( (TxBitIdx = (Nbpf-2))) ) then
			TxCalcPB <= '0';
		else																					-- If TxLine is transmitting frame data bits, enable TxCalcPB signal
			TxCalcPB <= '1';
		end if;
	end process;

	
	-- Fixed assignments --
	TXL <= not(TxLine);																			-- Drive output pin (NOT gate is necessary due to 3.3V-to-5V conversion network)

	

	----- RX SECTION -----

	-- [CMB] Process for handling Rx state machine (SM).
	Rx_SM_Handler : process ( RXL, RxSt, CntRxUART, RxBitIdx, RxBuf, UpLeds, RxFrIdx, RxParBit ) begin

		if ( RxSt = 0 ) then																	-- STATE#0 (S0): Just wait for RX line to go low
			NxCntRxUART <= 0;
			NxRxBitIdx <= 0;
			NxRxFrIdx <= RxFrIdx;
			NxRxParBit <= '0';
			NxRxBuf <= RxBuf;
			if ( RXL = START ) then
				NxRxSt <= 1;																	-- If line goes low, move to S1
			else
				NxRxSt <= 0;																	-- If line remains high, stay in S0
			end if;
			
		elsif ( RxSt = 1 ) then																	-- STATE#1 (S1): Wait half Rx UART period to sample START bit
			NxRxBuf <= RxBuf;
			NxRxParBit <= '0';
			if ( CntRxUART = THR_UART_HALF-1 ) then												-- If it's time to sample, check Rx line
				NxCntRxUART <= 0;
				NxRxBitIdx <= 0;
				if ( RXL = START ) then															-- If Rx line matches START bit value, move to S2
					NxRxSt <= 2;
					NxRxFrIdx <= RxFrIdx;
				else																			-- If Rx is no longer low, reset counters and move to S0
					NxRxSt <= 0;
					NxRxFrIdx <= 0;
				end if;
			else																				-- If it's not time to sample yet, keep staying in S1 and increment UART counter
				NxRxSt <= 1;
				NxCntRxUART <= CntRxUART+1;
				NxRxBitIdx <= 0;
				NxRxFrIdx <= RxFrIdx;
			end if;

		elsif ( RxSt = 2 ) then																	-- STATE#2 (S2): Sample data bits
			NxRxFrIdx <= RxFrIdx;
			if ( CntRxUART = THR_UART_RX-1 ) then												-- If it's time to sample, check Rx line
				NxRxBuf <= RxBuf;
				NxRxBuf(RxFrIdx)(RxBitIdx) <= RXL;												-- Store current data bit into Rx buffer
				NxRxParBit <= (RxParBit xor RXL);
				NxCntRxUART <= 0;
				if ( RxBitIdx = 7 ) then														-- If data bits within current frame are over, move to S3 
					NxRxBitIdx <= 0;
					NxRxSt <= 3;
				else																			-- If data bits within current frame are not over, stay in S2 
					NxRxBitIdx <= RxBitIdx+1;
					NxRxSt <= 2;
				end if;
			else																				-- If it's not time to sample yet, keep staying in S2 and increment UART counter
				NxCntRxUART <= CntRxUART+1;
				NxRxSt <= 2;
				NxRxBuf <= RxBuf;
				NxRxBitIdx <= RxBitIdx;
				NxRxParBit <= RxParBit;
			end if;

		elsif ( RxSt = 3 ) then																	-- STATE#3 (S3): Sample parity bit
			NxRxBitIdx <= 0;
			NxRxParBit <= RxParBit;
			NxRxBuf <= RxBuf;
			if ( CntRxUART = THR_UART_RX-1 ) then												-- If it's time to sample, check Rx line
				NxCntRxUART <= 0;
				if ( RXL = RxParBit ) then														-- If sampled parity bit is equal to the one estimated by FPGA circuitry, move to S4
					NxRxSt <= 4;
					NxRxFrIdx <= RxFrIdx;
				else																			-- If parity bits do not match, reset counters and move to S0
					NxRxSt <= 0;
					NxRxFrIdx <= 0;
				end if;
			else																				-- If it's not time to sample yet, keep staying in S3 and increment UART counter
				NxCntRxUART <= CntRxUART+1;
				NxRxFrIdx <= RxFrIdx;
				NxRxSt <= 3;
			end if;
				
		elsif ( RxSt = 4 ) then																	-- STATE#4 (S4): Sample stop bit
			NxRxBitIdx <= 0;
			NxRxBuf <= RxBuf;
			NxRxParBit <= RxParBit;
			if ( CntRxUART = THR_UART_RX-1 ) then												-- If it's time to sample, check Rx line
				NxCntRxUART <= 0;
				if ( RXL = STOP ) then
					if ( RxFrIdx = NfpmRx-1 ) then												-- If Rx line matches STOP bit value and message is over, move to S5
						NxRxSt <= 5;
						NxRxFrIdx <= RxFrIdx;
					else																		-- If Rx line matches STOP bit value and message is not over, move to S0 and wait for next frame
						NxRxSt <= 0;
						NxRxFrIdx <= RxFrIdx+1;
					end if;
				else																			-- If STOP bits does not match, reset counters and move to S0
					NxRxSt <= 0;
					NxRxFrIdx <= 0;
				end if;
			else																				-- If it's not time to sample yet, keep staying in S4 and increment UART counter
				NxCntRxUART <= CntRxUART+1;
				NxRxSt <= 4;
				NxRxFrIdx <= RxFrIdx;
			end if;

		else																					-- STATE#5 (S5): Reset all counters, trigger LEDS update check and move to S0
			NxRxSt <= 0;
			NxCntRxUART <= 0;
			NxRxBuf <= RxBuf;
			NxRxParBit <= '0';
			NxRxFrIdx <= 0;
			NxRxBitIdx <= 0;
		end if;

	end process;


	-- [CMB] Process for enabling LEDs update
	Leds_Update_Handler : process ( RxSt, RxBuf, UpLeds ) begin

		if ( RxSt = 5 ) then																	-- If Rx SM is in S5, check Rx buffer content
			if ( (RxBuf(0) = RxBuf(1)) and (RxBuf(0) = RxBuf(2)) ) then 						-- If Rx buffer content is consistent, enable LEDs update
				NxUpLeds <= '1';
			else
				NxUpLeds <= '0';
			end if;
		else
			NxUpLeds <= UpLeds;
		end if;

	end process;


	-- [CMB] Process for updating or resetting LEDs state
	Leds_Switching_On_Off : process ( UpLeds, RxBuf ) begin

		if ( UpLeds = '1' ) then
			LED(7 downto 0) <= RxBuf(0)(7 downto 0);
		else
			LED(7 downto 0) <= (others => '1');
		end if;

	end process;


	-- Fixed assignments --
	LED(8) <= 'Z';
	LED(9) <= 'Z';

end STRUCT;



----- NOTES -----

-- [0] By pushing BTN[0], the transmission of 4 info bytes from FPGA to MCU is triggered. In particular, as long as SWT='1' the content 
-- 	   of the transmitted data bytes is 0xD391A0C4, whose reception on MCU side triggers in turn the transmission towards the FPGA of a
-- 	   3-frame message (with all bytes equal) containing the new LEDs configuration. After their reception, the FPGA checks their
-- 	   consistency and then updates the LEDs state with the configuration value specified by the MCU. Otherwise, as long as SWT='0' the
-- 	   data bytes transmitted by FPGA do not match the word expected by MCU, which in fact rejects it by, in turn, sending a wrong
-- 	   message to the FPGA, whose reception resets the FPGA LEDs configuration as all on. Moreover, in case of corrupted reception or
-- 	   pushing of BTN[1], which acts as reset for FPGA Rx buffer and counter, LEDs are reset in the same way and all Rx signals flushed.

-- [1] THR_UART_TX is divided by 2 (in respect of THR_UART_RX) because is related to the update of the Tx UART clock signal (to be
--     set high after T/2 and back low after other T/2), whereas THR_UART_RX is directly related to UART period (as consecutive
--     falling edges of Rx UART clock).

-- [2] In order to simulate Rx section operation, set THR_UART_RX = 6.

-- [3] The only parameters settable by user in this project/code are the TX and Rx baud rates. By default they are both set to 100 kb/s,
--	   however they can have different values each other ranging from 1kb/s to 1Mb/s.
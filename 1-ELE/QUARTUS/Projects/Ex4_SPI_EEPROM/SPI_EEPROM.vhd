
-----
--| Title: SPI RECEPTION/TRANSMISSION AS MASTER BASED ON MAX10 FPGA (DE10-LITE BOARD) [0]
--| Author: Filippo Valmori
--| Date: 24/05/2021
-----


library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;
  use IEEE.numeric_std.all;


entity SPI_EEPROM is port (
    -- I/O LIST --
	CLK : in std_logic;                                                                       -- 50 MHz built-it input clock
	SDI : in std_logic;                                                                       -- SPI RX line (SDI -> GPIO_[1])
	SDO : out std_logic;                                                                      -- SPI TX line (SDO -> GPIO_[5])
	SCS : out std_logic;                                                                      -- SPI CS line (SCS -> GPIO_[2])
	SCK : out std_logic;                                                                      -- SPI CLOCK line (SCK -> GPIO_[6])
	-- DBG_RXBUF : out std_logic_vector(23 downto 0);                                            -- to debug RxBuf (set dimension equal to ELEN*8-1) [SIMULATION ONLY]
	--	DGB_STREG : out std_logic_vector(7 downto 0);                                             -- to debug StatusReg [SIMULATION ONLY]
	BTN : in std_logic_vector(1 downto 0);                                                    -- Built-in buttons
	SWT : in std_logic_vector(1 downto 0);                                                    -- Built-in switches
	LED : out std_logic_vector(9 downto 0);                                                   -- Built-in LEDs
	SEG0 : out std_logic_vector(7 downto 0);                                                  -- 7-segment displays [e.g. SEG0->HEX0]
	SEG1 : out std_logic_vector(7 downto 0);
	SEG2 : out std_logic_vector(7 downto 0);
	SEG3 : out std_logic_vector(7 downto 0);
	SEG4 : out std_logic_vector(7 downto 0);
	SEG5 : out std_logic_vector(7 downto 0));
end SPI_EEPROM;


architecture STRUCT of SPI_EEPROM is

   -- PARAMETERS --
	constant SPI_RATE : natural := 100000;                                                    -- SPI baud rate (for both reading and writing) [b/s] [2]
	constant EADDR : std_logic_vector(7 downto 0) := "01100000";                              -- EEPROM address where to read/write [NB: keep the 4 LSb to '0' for writing]
	constant ELEN : natural := 3;                                              	 				-- Number of bytes to be read/written from/to EEPROM during a single cycle (NB: max. 16, from EEPROM datasheet)
	constant EVAL : std_logic_vector(7 downto 0) := "11001001";                               -- Value to be written into EEPROM (e.g. "11001001" means 0xC9)

    -- THRESHOLD FOR DERIVED CLOCKS --
	constant THR_SCK : natural := 25000000/SPI_RATE;                                          -- Counter threshold for SPI clock (i.e. 50MHz/UART_RATE*DUTY_CYCLE_50%)

   -- EEPROM KEYS --
   constant WRITE_INSTR : std_logic_vector(7 downto 0) := "00000010";                        -- WRITE instruction (0x02)
	constant READ_INSTR : std_logic_vector(7 downto 0) := "00000011";                         -- READ instruction (0x03)
	constant WREN_INSTR : std_logic_vector(7 downto 0) := "00000110";                         -- WREN instruction (0x06)
	constant RDSR_INSTR : std_logic_vector(7 downto 0) := "00000101";                         -- RDSR instruction (0x05)
	constant WRSR_INSTR : std_logic_vector(7 downto 0) := "00000001";                         -- WRSR instruction (0x01)
	
	-- BUTTONS --
	constant PRESSED : std_logic := '0';
	constant RELEASED : std_logic := '1';
	constant FALSE : std_logic := '0';
	constant TRUE : std_logic := '1';
	
	-- SWITCHES --
	constant DOWN : std_logic := '0';
	constant UP : std_logic := '1';
	
	-- LCD DIGITS --
	constant Print0 : std_logic_vector(7 downto 0) := "11000000";										-- Hexadecimal value for 0x00
	constant Print1 : std_logic_vector(7 downto 0) := "11111001";
	constant Print2 : std_logic_vector(7 downto 0) := "10100100";
	constant Print3 : std_logic_vector(7 downto 0) := "10110000";
	constant Print4 : std_logic_vector(7 downto 0) := "10011001";
	constant Print5 : std_logic_vector(7 downto 0) := "10010010";
	constant Print6 : std_logic_vector(7 downto 0) := "10000010";
	constant Print7 : std_logic_vector(7 downto 0) := "11111000";
	constant Print8 : std_logic_vector(7 downto 0) := "10000000";
	constant Print9 : std_logic_vector(7 downto 0) := "10010000";
	constant PrintA : std_logic_vector(7 downto 0) := "10001000";
	constant PrintB : std_logic_vector(7 downto 0) := "10000011";
	constant PrintC : std_logic_vector(7 downto 0) := "11000110";
	constant PrintD : std_logic_vector(7 downto 0) := "10100001";
	constant PrintE : std_logic_vector(7 downto 0) := "10000110";
	constant PrintF : std_logic_vector(7 downto 0) := "10001110";
	
	-- RESET --
	constant RESET : std_logic_vector(7 downto 0) := "11111111"; 										-- RxBuffer and status registe initialization/reset value
	
	-- STATE MACHINE --
	constant MAXBPC : natural := 16;																				-- Maximum number of bytes that can be read/written from/to EEPROM in a single cycle (from EEPROM datasheet)
	constant NSTATES : natural := 20;																			-- Overall number of read/write state machine
	constant SIDLE : natural := 0;																				-- SM IDLE state
	constant SRD1 : natural := 1;																					-- SM READ#1 state
	constant SRD2 : natural := 2;
	constant SRD3 : natural := 3;
	constant SRD4 : natural := 4;
	constant SWR1 : natural := 5;																					-- SM WRITE#1 state
	constant SWR2 : natural := 6;
	constant SWR3 : natural := 7;
	constant SWR4 : natural := 8;
	constant SWR5 : natural := 9;
	constant SWR6 : natural := 10;
	constant SWR7 : natural := 11;
	constant SWR8 : natural := 12;
	constant SWR9 : natural := 13;
	constant SWR10 : natural := 14;
	constant SWR11 : natural := 15;
	constant SWR12 : natural := 16;
	constant SWR13 : natural := 17;
	constant SWR14 : natural := 18;
	constant SWR15 : natural := 19;
	
   -- SIGNALS --
	signal LedR : std_logic := '0';																				-- Reading LED value
	signal NxLedR : std_logic;
	signal LedW : std_logic := '0';																				-- Writing LED value
	signal NxLedW : std_logic;
   signal Pushed : std_logic_vector(1 downto 0) := (others => '0');                 			-- Debouncer varable for BTNs
	signal NxPushed : std_logic_vector(1 downto 0);
	signal SckLine : std_logic;                                                       			-- SCK line (towards EEPROM)
	signal NxSckLine : std_logic;
	signal SckCnt : natural range 0 to THR_SCK-1 := 0;                                     	-- Counter for SCK clock cycles
	signal NxSckCnt : natural range 0 to THR_SCK-1;
	signal SckEn : std_logic := '0';                                                       	-- SCK enable [NB: shall be initialized as low]
	signal NxSckEn : std_logic;
	signal ScsLine : std_logic := '1';                                                       	-- SCS line (chip select toward EEPROM) [NB: shall be initialized as high]
	signal NxScsLine : std_logic;
	signal SdoLine : std_logic := '0';                                                      	-- SDO line (Tx toward EEPROM) [NB: don't care its initial value]
	signal NxSdoLine : std_logic;
	signal State : natural range 0 to NSTATES-1 := SIDLE;												 	-- Current state machine state
	signal NxState : natural range 0 to NSTATES-1;
	signal TxBitCnt : natural range 0 to 7 := 7;                                          		-- Bit counter within the current byte during Tx/Rx
	signal NxTxBitCnt : natural range 0 to 7;
	signal TxByteCnt : natural range 0 to MAXBPC-1 := 0;                                      -- Byte counter within the current byte during Tx/Rx
	signal NxTxByteCnt : natural range 0 to MAXBPC-1;
	type buf is array (0 to MAXBPC-1) of std_logic_vector(7 downto 0);
	signal RxBuf : buf := (others => RESET);																	-- RX buffer
	signal NxRxBuf : buf;
	signal StatusReg : std_logic_vector(7 downto 0) := RESET;											-- EEPROM status register
	signal NxStatusReg : std_logic_vector(7 downto 0);
	signal IncrWrVal : natural range 0 to 255 := 0;															-- Byte value to be written into EEPROM in incremental mode (SWT[1]=0)
	signal NxIncrWrVal : natural range 0 to 255;
	signal IncrWrValCv : std_logic_vector(7 downto 0);														-- Convertion of "IncrWrVal" from integer to logic vector
	

begin

	----- MAIN CLOCK SECTION -----
	
	-- [SQN] Process for synchronously updating signals directly related to main clock (50 MHz) --
	Clock_50MHz : process ( CLK ) begin
		if ( CLK'event and (CLK = '1') ) then
			SckLine <= NxSckLine;
			SckCnt <= NxSckCnt;
		end if;
	end process;
	
	
	-- [CMB] Process for generating SCK clock from main 50 MHz clock --
	Downclocking_SCK : process ( SckLine, SckCnt ) begin
		if ( SckCnt = THR_SCK-1 ) then
			NxSckCnt <= 0;
			NxSckLine <= not(SckLine);
		else
			NxSckCnt <= SckCnt+1;
			NxSckLine <= SckLine;
		end if;
	end process;
	
	
	----- SPI CLOCK SECTION -----
	
	-- [SQN] Process for synchronously updating signals at SCK frequency	--
	Clock_SCK : process ( SckLine ) begin
		if ( rising_edge( SckLine ) ) then																		-- use SCK's rising edge to sample from SDI line
			if ( State = SRD4 ) then
				RxBuf <= NxRxBuf;																						-- update RxBuf while reading from EEPROM 
			elsif ( (State = SWR3) or (State = SWR10) ) then
				StatusReg <= NxStatusReg;																			-- update RegStatus as check while writing into EEPROM
			elsif( SWT(0) = DOWN) then
				RxBuf <= (others => RESET);
				StatusReg <= RESET;
			end if;	
		elsif ( falling_edge( SckLine ) ) then																	-- use SCK's falling edge to update output signal
			Pushed <= NxPushed;
			SckEn <= NxSckEn;
			ScsLine <= NxScsLine;
			SdoLine <= NxSdoLine;
			State <= NxState;
			TxBitCnt <= NxTxBitCnt;
			TxByteCnt <= NxTxByteCnt;
			LedR <= NxLedR;
			LedW <= NxLedW;
			if( (State = SWR14) and (NxTxBitCnt = 7) ) then
				IncrWrVal <= NxIncrWrVal+1;
			elsif( SWT(0) = DOWN ) then
				IncrWrVal <= 0;
			else
				IncrWrVal <= NxIncrWrVal;
			end if;
		end if;
	end process;
	
	
	-- [CMB] Process acting as debouncer for BTNs --
	Debouncer_Handler : process ( BTN, Pushed ) begin
		if ( BTN(0) = PRESSED and Pushed(0) = FALSE ) then													-- debouncer for reading button (BTN[0])
			NxPushed(0) <= TRUE;
		else
			NxPushed(0) <= not(BTN(0));
		end if;
		if ( BTN(1) = PRESSED and Pushed(1) = FALSE ) then													-- debouncer for writing button (BTN[1])
			NxPushed(1) <= TRUE;
		else
			NxPushed(1) <= not(BTN(1));
		end if;
	end process;
	
	
	-- [CMB] Process for managing the reading/writing FPGA internal state machine --
	SM_Handler : process (Pushed, State, BTN, TxBitCnt, TxByteCnt, ScsLine, SdoLine, SckEn, RxBuf, SDI, LedR, LedW, StatusReg, SWT, IncrWrValCv, IncrWrVal ) begin
		-- READING PROCEDURE --
		if ( (State = SIDLE) and (BTN(0) = PRESSED) and (Pushed(0) = FALSE) ) then 				-- READING PROCEDURE (pt.0 - detect BTN[0] pressure, pull down CS line and enable SCK output)
			NxState <= SRD1;
			NxScsLine <= '0';																							-- [NB: "ScsLine" and "SckEn" are both updated here (i.e. at the same time), but their new values are actually changed on the next SCK's falling edge (thus EEPROM sees the CS change half-cycle before the first SCK rising edge)]
			NxSckEn <= '1';
			NxSdoLine <= READ_INSTR(TxBitCnt);
			NxTxBitCnt <= TxBitCnt-1;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= not(LedR);
			NxLedW <= LedW;
		elsif ( State = SRD1 ) then																				-- READING PROCEDURE (pt.1 - send READ instruction byte)
			NxSdoLine <= READ_INSTR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxLedR <= LedR;
			NxLedW <= LedW;
			NxStatusReg <= StatusReg;
			if ( TxBitCnt = 0 ) then
				NxState <= SRD2;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SRD2 ) then																				-- READING PROCEDURE (pt.2 - send address byte)
			NxSdoLine <= EADDR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				NxState <= SRD3;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SRD3 ) then																				-- READING PROCEDURE (pt.3 - wait a cycle to sync from falling to rising edge before starting sampling SDI)
			NxState <= SRD4;
			NxScsLine <= ScsLine;
			NxSdoLine <= SdoLine;
			NxSckEn <= SckEn;
			NxTxBitCnt <= TxBitCnt;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxLedR <= LedR;
			NxLedW <= LedW;
			NxStatusReg <= StatusReg;
		elsif ( State = SRD4 ) then																				-- READING PROCEDURE (pt.4 - read/store EEPROM received data on SDI into internal Rx buffer)
			NxSdoLine <= '0';																							-- [NB: don't really care SDO's value while reading SDI]
			NxRxBuf <= RxBuf;
			NxRxBuf(TxByteCnt)(TxBitCnt) <= SDI;												
			NxLedR <= LedR;
			NxLedW <= LedW;
			NxStatusReg <= StatusReg;
			if ( TxBitCnt = 0 ) then
				if ( TxByteCnt = ELEN-1 ) then
					NxState <= SIDLE;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= 0;
					NxScsLine <= '1';
					NxSckEn <= '0';
				else
					NxState <= State;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= TxByteCnt+1;
					NxScsLine <= ScsLine;
					NxSckEn <= SckEn;
				end if;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
				NxTxByteCnt <= TxByteCnt;
				NxScsLine <= ScsLine;
				NxSckEn <= SckEn;
				NxLedR <= LedR;
			end if;
			
		-- WRITING PROCEDURE --
		elsif ( (State = SIDLE) and (BTN(1) = PRESSED) and (Pushed(1) = FALSE) ) then		 		-- WRITING PROCEDURE (pt.0 - detect BTN[1] pressure, pull down CS line and enable SCK output)
			NxState <= SWR1;
			NxScsLine <= '0';
			NxSckEn <= '1';
			NxSdoLine <= RDSR_INSTR(TxBitCnt);
			NxTxBitCnt <= TxBitCnt-1;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= not(LedW);
		elsif ( State = SWR1 ) then																				-- WRITING PROCEDURE (pt.1 - send RDSR instruction byte)
			NxSdoLine <= RDSR_INSTR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				NxState <= SWR2;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SWR2 ) then																         	-- WRITING PROCEDURE (pt.2 - wait a cycle to sync from falling to rising edge before starting sampling SDI)
			NxState <= SWR3;
			NxScsLine <= ScsLine;
			NxSdoLine <= '0';
			NxSckEn <= SckEn;
			NxTxBitCnt <= TxBitCnt;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		elsif ( State = SWR3 ) then																				-- WRITING PROCEDURE (pt.3 - read/store EEPROM received status register on SDI into internal variable)
			NxSdoLine <= SdoLine;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxStatusReg(TxBitCnt) <= SDI;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
					NxState <= SWR4;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= 0;
					NxScsLine <= '1';
					NxSckEn <= '0';
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
				NxTxByteCnt <= TxByteCnt;
				NxScsLine <= ScsLine;
				NxSckEn <= SckEn;
				NxLedR <= LedR;
			end if;
		elsif ( State = SWR4 ) then																				-- WRITING PROCEDURE (pt.4 - pull up CS and disabled SCK for a single SPI cycle)
			if( StatusReg(0) = '0' ) then																			-- check that "WIP" flag (StatusReg[0]) is deasserted before going on
				NxState <= SWR5;
				NxScsLine <= '0';
				NxSckEn <= '1';
				NxSdoLine <= WREN_INSTR(TxBitCnt);
				NxTxBitCnt <= TxBitCnt-1;
			else
				NxState <= SIDLE;
				NxScsLine <= ScsLine;
				NxSckEn <= SckEn;
				NxSdoLine <= SdoLine;
				NxTxBitCnt <= TxBitCnt;
			end if;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		elsif ( State = SWR5 ) then																				-- WRITING PROCEDURE (pt.5 - send WREN instruction byte to enable EEPROM writin latch)	
			NxSdoLine <= WREN_INSTR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				NxState <= SWR6;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SWR6 ) then																				-- WRITING PROCEDURE (pt.6 - pull up CS and disabled SCK for a single SPI cycle)
			NxSdoLine <= '0';
			NxScsLine <= '1';
			NxSckEn <= '0';
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			NxState <= SWR7;
			NxTxBitCnt <= 7;
		elsif ( State = SWR7 ) then																				-- WRITING PROCEDURE (pt.7 - pull down CS enable SCK)
			NxState <= SWR8;
			NxScsLine <= '0';
			NxSckEn <= '1';
			NxSdoLine <= RDSR_INSTR(TxBitCnt);
			NxTxBitCnt <= TxBitCnt-1;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		elsif ( State = SWR8 ) then																				-- WRITING PROCEDURE (pt.8 - send RDSR instruction byte)
			NxSdoLine <= RDSR_INSTR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				NxState <= SWR9;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SWR9 ) then																				-- WRITING PROCEDURE (pt.9 - wait a cycle to sync from falling to rising edge before starting sampling SDI)
			NxState <= SWR10;
			NxScsLine <= ScsLine;
			NxSdoLine <= '0';
			NxSckEn <= SckEn;
			NxTxBitCnt <= TxBitCnt;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		elsif ( State = SWR10 ) then																				-- WRITING PROCEDURE (pt.10 - read/store EEPROM received status register on SDI into internal variable)
			NxSdoLine <= SdoLine;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxStatusReg(TxBitCnt) <= SDI;												
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
					NxState <= SWR11;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= 0;
					NxScsLine <= '1';
					NxSckEn <= '0';
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
				NxTxByteCnt <= TxByteCnt;
				NxScsLine <= ScsLine;
				NxSckEn <= SckEn;
				NxLedR <= LedR;
			end if;
		elsif ( State = SWR11 ) then																				-- WRITING PROCEDURE (pt.11 - pull up CS and disabled SCK for a single SPI cycle)
			if( StatusReg(1) = '1' ) then    																	-- check that "WEL" flag (StatusReg[1]) is asserted before going on
				NxState <= SWR12;
				NxScsLine <= '0';
				NxSckEn <= '1';
				NxSdoLine <= WRITE_INSTR(TxBitCnt);
				NxTxBitCnt <= TxBitCnt-1;
			else
				NxState <= SIDLE;
				NxScsLine <= ScsLine;
				NxSckEn <= SckEn;
				NxSdoLine <= SdoLine;
				NxTxBitCnt <= TxBitCnt;
			end if;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		elsif ( State = SWR12 ) then																				-- WRITING PROCEDURE (pt.12 - send WRITE instruction byte)
			NxSdoLine <= WRITE_INSTR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxLedR <= LedR;
			NxLedW <= LedW;
			NxStatusReg <= StatusReg;
			if ( TxBitCnt = 0 ) then
				NxState <= SWR13;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SWR13 ) then																				-- WRITING PROCEDURE (pt.13 - send address byte)
			NxSdoLine <= EADDR(TxBitCnt);
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				NxState <= SWR14;
				NxTxBitCnt <= 7;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
			end if;
		elsif ( State = SWR14 ) then																				-- WRITING PROCEDURE (pt.14 - send data to be written)
			if ( swt(1) = '0' ) then
				NxSdoLine <= IncrWrValCv(TxBitCnt);
			else
				NxSdoLine <= EVAL(TxBitCnt);
			end if;
			NxScsLine <= ScsLine;
			NxSckEn <= SckEn;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
			if ( TxBitCnt = 0 ) then
				if ( TxByteCnt = ELEN-1 ) then
					NxState <= SWR15;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= 0;
				else
					NxState <= State;
					NxTxBitCnt <= 7;
					NxTxByteCnt <= TxByteCnt+1;
				end if;
			else
				NxState <= State;
				NxTxBitCnt <= TxBitCnt-1;
				NxTxByteCnt <= TxByteCnt;
			end if;
		elsif ( State = SWR15 ) then																				-- WRITING PROCEDURE (pt.15 - pull up CS, disable SCK and move back to IDLE)
			NxScsLine <= '1';
			NxSdoLine <= '0';
			NxState <= SIDLE;
			NxSckEn <= '0';
			NxTxBitCnt <= 7;
			NxTxByteCnt <= 0;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		else																												-- IDLE STATE
			NxScsLine <= ScsLine;
			NxSdoLine <= SdoLine;
			NxState <= State;
			NxSckEn <= SckEn;
			NxTxBitCnt <= TxBitCnt;
			NxTxByteCnt <= TxByteCnt;
			NxRxBuf <= RxBuf;
			NxStatusReg <= StatusReg;
			NxLedR <= LedR;
			NxLedW <= LedW;
		end if;
		NxIncrWrVal <= IncrWrVal;
	end process;


	-- [CMB] Process for converting data into hexadecimal format for 7-segment display (just first x3 bytes of RxBuf) --
	Driver_7SD : process ( RxBuf ) begin
		if ( RxBuf(0)(7 downto 4) = "0000" ) then
			SEG5 <= Print0;
		elsif ( RxBuf(0)(7 downto 4) = "0001" ) then
			SEG5 <= Print1;
		elsif ( RxBuf(0)(7 downto 4) = "0010" ) then
			SEG5 <= Print2;			
		elsif ( RxBuf(0)(7 downto 4) = "0011" ) then
			SEG5 <= Print3;
		elsif ( RxBuf(0)(7 downto 4) = "0100" ) then
			SEG5 <= Print4;	
		elsif ( RxBuf(0)(7 downto 4) = "0101" ) then
			SEG5 <= Print5;
		elsif ( RxBuf(0)(7 downto 4) = "0110" ) then
			SEG5 <= Print6;
		elsif ( RxBuf(0)(7 downto 4) = "0111" ) then
			SEG5 <= Print7;
		elsif ( RxBuf(0)(7 downto 4) = "1000" ) then
			SEG5 <= Print8;
		elsif ( RxBuf(0)(7 downto 4) = "1001" ) then
			SEG5 <= Print9;
		elsif ( RxBuf(0)(7 downto 4) = "1010" ) then
			SEG5 <= PrintA;
		elsif ( RxBuf(0)(7 downto 4) = "1011" ) then
			SEG5 <= PrintB;
		elsif ( RxBuf(0)(7 downto 4) = "1100" ) then
			SEG5 <= PrintC;			
		elsif ( RxBuf(0)(7 downto 4) = "1101" ) then
			SEG5 <= PrintD;
		elsif ( RxBuf(0)(7 downto 4) = "1110" ) then
			SEG5 <= PrintE;
		else
			SEG5 <= PrintF;
		end if;
		if ( RxBuf(0)(3 downto 0) = "0000" ) then
			SEG4 <= Print0;
		elsif ( RxBuf(0)(3 downto 0) = "0001" ) then
			SEG4 <= Print1;
		elsif ( RxBuf(0)(3 downto 0) = "0010" ) then
			SEG4 <= Print2;			
		elsif ( RxBuf(0)(3 downto 0) = "0011" ) then
			SEG4 <= Print3;
		elsif ( RxBuf(0)(3 downto 0) = "0100" ) then
			SEG4 <= Print4;	
		elsif ( RxBuf(0)(3 downto 0) = "0101" ) then
			SEG4 <= Print5;
		elsif ( RxBuf(0)(3 downto 0) = "0110" ) then
			SEG4 <= Print6;
		elsif ( RxBuf(0)(3 downto 0) = "0111" ) then
			SEG4 <= Print7;
		elsif ( RxBuf(0)(3 downto 0) = "1000" ) then
			SEG4 <= Print8;
		elsif ( RxBuf(0)(3 downto 0) = "1001" ) then
			SEG4 <= Print9;
		elsif ( RxBuf(0)(3 downto 0) = "1010" ) then
			SEG4 <= PrintA;
		elsif ( RxBuf(0)(3 downto 0) = "1011" ) then
			SEG4 <= PrintB;
		elsif ( RxBuf(0)(3 downto 0) = "1100" ) then
			SEG4 <= PrintC;			
		elsif ( RxBuf(0)(3 downto 0) = "1101" ) then
			SEG4 <= PrintD;
		elsif ( RxBuf(0)(3 downto 0) = "1110" ) then
			SEG4 <= PrintE;
		else
			SEG4 <= PrintF;
		end if;
		if ( RxBuf(1)(7 downto 4) = "0000" ) then
			SEG3 <= Print0;
		elsif ( RxBuf(1)(7 downto 4) = "0001" ) then
			SEG3 <= Print1;
		elsif ( RxBuf(1)(7 downto 4) = "0010" ) then
			SEG3 <= Print2;			
		elsif ( RxBuf(1)(7 downto 4) = "0011" ) then
			SEG3 <= Print3;
		elsif ( RxBuf(1)(7 downto 4) = "0100" ) then
			SEG3 <= Print4;	
		elsif ( RxBuf(1)(7 downto 4) = "0101" ) then
			SEG3 <= Print5;
		elsif ( RxBuf(1)(7 downto 4) = "0110" ) then
			SEG3 <= Print6;
		elsif ( RxBuf(1)(7 downto 4) = "0111" ) then
			SEG3 <= Print7;
		elsif ( RxBuf(1)(7 downto 4) = "1000" ) then
			SEG3 <= Print8;
		elsif ( RxBuf(1)(7 downto 4) = "1001" ) then
			SEG3 <= Print9;
		elsif ( RxBuf(1)(7 downto 4) = "1010" ) then
			SEG3 <= PrintA;
		elsif ( RxBuf(1)(7 downto 4) = "1011" ) then
			SEG3 <= PrintB;
		elsif ( RxBuf(1)(7 downto 4) = "1100" ) then
			SEG3 <= PrintC;			
		elsif ( RxBuf(1)(7 downto 4) = "1101" ) then
			SEG3 <= PrintD;
		elsif ( RxBuf(1)(7 downto 4) = "1110" ) then
			SEG3 <= PrintE;
		else
			SEG3 <= PrintF;
		end if;
		if ( RxBuf(1)(3 downto 0) = "0000" ) then
			SEG2 <= Print0;
		elsif ( RxBuf(1)(3 downto 0) = "0001" ) then
			SEG2 <= Print1;
		elsif ( RxBuf(1)(3 downto 0) = "0010" ) then
			SEG2 <= Print2;			
		elsif ( RxBuf(1)(3 downto 0) = "0011" ) then
			SEG2 <= Print3;
		elsif ( RxBuf(1)(3 downto 0) = "0100" ) then
			SEG2 <= Print4;	
		elsif ( RxBuf(1)(3 downto 0) = "0101" ) then
			SEG2 <= Print5;
		elsif ( RxBuf(1)(3 downto 0) = "0110" ) then
			SEG2 <= Print6;
		elsif ( RxBuf(1)(3 downto 0) = "0111" ) then
			SEG2 <= Print7;
		elsif ( RxBuf(1)(3 downto 0) = "1000" ) then
			SEG2 <= Print8;
		elsif ( RxBuf(1)(3 downto 0) = "1001" ) then
			SEG2 <= Print9;
		elsif ( RxBuf(1)(3 downto 0) = "1010" ) then
			SEG2 <= PrintA;
		elsif ( RxBuf(1)(3 downto 0) = "1011" ) then
			SEG2 <= PrintB;
		elsif ( RxBuf(1)(3 downto 0) = "1100" ) then
			SEG2 <= PrintC;			
		elsif ( RxBuf(1)(3 downto 0) = "1101" ) then
			SEG2 <= PrintD;
		elsif ( RxBuf(1)(3 downto 0) = "1110" ) then
			SEG2 <= PrintE;
		else
			SEG2 <= PrintF;
		end if;
		if ( RxBuf(2)(7 downto 4) = "0000" ) then
			SEG1 <= Print0;
		elsif ( RxBuf(2)(7 downto 4) = "0001" ) then
			SEG1 <= Print1;
		elsif ( RxBuf(2)(7 downto 4) = "0010" ) then
			SEG1 <= Print2;			
		elsif ( RxBuf(2)(7 downto 4) = "0011" ) then
			SEG1 <= Print3;
		elsif ( RxBuf(2)(7 downto 4) = "0100" ) then
			SEG1 <= Print4;	
		elsif ( RxBuf(2)(7 downto 4) = "0101" ) then
			SEG1 <= Print5;
		elsif ( RxBuf(2)(7 downto 4) = "0110" ) then
			SEG1 <= Print6;
		elsif ( RxBuf(2)(7 downto 4) = "0111" ) then
			SEG1 <= Print7;
		elsif ( RxBuf(2)(7 downto 4) = "1000" ) then
			SEG1 <= Print8;
		elsif ( RxBuf(2)(7 downto 4) = "1001" ) then
			SEG1 <= Print9;
		elsif ( RxBuf(2)(7 downto 4) = "1010" ) then
			SEG1 <= PrintA;
		elsif ( RxBuf(2)(7 downto 4) = "1011" ) then
			SEG1 <= PrintB;
		elsif ( RxBuf(2)(7 downto 4) = "1100" ) then
			SEG1 <= PrintC;			
		elsif ( RxBuf(2)(7 downto 4) = "1101" ) then
			SEG1 <= PrintD;
		elsif ( RxBuf(2)(7 downto 4) = "1110" ) then
			SEG1 <= PrintE;
		else
			SEG1 <= PrintF;
		end if;
		if ( RxBuf(2)(3 downto 0) = "0000" ) then
			SEG0 <= Print0;
		elsif ( RxBuf(2)(3 downto 0) = "0001" ) then
			SEG0 <= Print1;
		elsif ( RxBuf(2)(3 downto 0) = "0010" ) then
			SEG0 <= Print2;			
		elsif ( RxBuf(2)(3 downto 0) = "0011" ) then
			SEG0 <= Print3;
		elsif ( RxBuf(2)(3 downto 0) = "0100" ) then
			SEG0 <= Print4;	
		elsif ( RxBuf(2)(3 downto 0) = "0101" ) then
			SEG0 <= Print5;
		elsif ( RxBuf(2)(3 downto 0) = "0110" ) then
			SEG0 <= Print6;
		elsif ( RxBuf(2)(3 downto 0) = "0111" ) then
			SEG0 <= Print7;
		elsif ( RxBuf(2)(3 downto 0) = "1000" ) then
			SEG0 <= Print8;
		elsif ( RxBuf(2)(3 downto 0) = "1001" ) then
			SEG0 <= Print9;
		elsif ( RxBuf(2)(3 downto 0) = "1010" ) then
			SEG0 <= PrintA;
		elsif ( RxBuf(2)(3 downto 0) = "1011" ) then
			SEG0 <= PrintB;
		elsif ( RxBuf(2)(3 downto 0) = "1100" ) then
			SEG0 <= PrintC;			
		elsif ( RxBuf(2)(3 downto 0) = "1101" ) then
			SEG0 <= PrintD;
		elsif ( RxBuf(2)(3 downto 0) = "1110" ) then
			SEG0 <= PrintE;
		else
			SEG0 <= PrintF;
		end if;
	end process;

	
	----- FIXED ASSIGNMENTS -----
	
	IncrWrValCv <= std_logic_vector(to_unsigned(IncrWrVal,8));											-- convertion from integer to logic vector

	
	----- OUTPUT ASSIGNMENTS -----
	
	SCK <= (SckLine and SckEn);
	SCS <= ScsLine;
	SDO <= SdoLine;
	LED(9 downto 2) <= StatusReg;
	LED(1) <= LedW;
	LED(0) <= LedR;	
	-- DBG_RXBUF(23 downto 16) <= RxBuf(0)(7 downto 0);														-- [SIMULATION ONLY]
	-- DBG_RXBUF(15 downto 8) <= RxBuf(1)(7 downto 0);														   -- [SIMULATION ONLY]
	-- DBG_RXBUF(7 downto 0) <= RxBuf(2)(7 downto 0);															-- [SIMULATION ONLY]
	-- DGB_STREG <= StatusReg;																							-- [SIMULATION ONLY]

end STRUCT;M 



----- NOTES -----

-- [0] The EEPROM used for this project is the 25LC020A by Microchip.

-- [1] Set "THR_SCK" = 3 and "ELEN" = 2 during Wr/Rd simulations. There are two different simulation for checking the reading and writing
--     procedures (copy and rename them "Waveform.vwf" to make them executable by Quartus, after removing the previous existing "Waveform.vwf" file).

-- [2] From EEPROM datasheet, max. SPI rate is 5 MHz. In this project it has been tested successfully up to 1 Mb/s.

-- [3] Operation : 
--     a. By pressing KEY0 (aka BTN[0]) and KEY1 (aka BTN[1]) the reading and writing procedures are triggered respectively. Moreover,
--        each pressure toggles the corresponding LED[0] or LED[1].
--     b. The x8 LEDs from LED[9] to LED[2] show the content of the last EEPROM's status register read (from the last writing procedure).
--     c. When SWT[1] is up, the byte-value written into the EEPROM is fixed (specified by the "EVAL" parameter). On the other hand,
--        when SWT[1] is down, the byte-value written into EEPROM is incremental (i.e. 0x00, 0x01, 0x02) and not reset between consecutive
--        writing procedures.
--     d. By pulling down and then up again SWT[0], the contents of "RxBuf" (and in turn the value printed on the 7-segment display) and 
--        ""StatusReg" are reset to the default value RESET. Moreover, the incremental-writing value is reset to zero.
--     e. The byte-length read/written from/into the EEPROM is fixed and specified by the "ELEN" parameter. It makes sense to use ELEN=3 here
--        (since there are just x6 LCD digits in the built-in display), but the VHL design can actually handle all values of ELEN from 1 to 16.
--     f. The EEPROM address for reading/writing is fixed and specified by the "EADDR" parameter.
--     g. Note that also When SWT[1] is up (i.e. written value fixed to EVAL), the internal counter "IncrWrVal" is incremented at every push
--        of KEY1 (i.e. writing button).
--     h. To avoid undesired communications with the EEPROM (since FPGA lines are not controlled), disconnect EEPROM's VCC pin during FPGA
--        re-programmation.

-- [4] Remember that EPPROM's SDI shall be connected to FPGA's SDO and viceversa.

-- [5] The warning related to the LCD digits is ok, since the "point-segment" is correctly kept fixed to VDD/'1'.

-- [6] I/O REQUIREMENTS 
--     In IDLE state, CS shall be kept high and SCK low, whereas SDO level is not important. 

-- [7] TIME REQUIREMENTS 
--     a. FCKL = 5 MHz (max SCK frequency, i.e. min TCKL = 200 ns and max Rb = 2.5 MHz),
--     b. TCSS = 100 ns (min time between CS low and first SCK rising edge) -> fulfilled by waiting a dummy SCK cycle, 
--     c. TCSH = 200 ns (min time between last SCK rising edge and CS back high) -> fulfilled by waiting a dummy SCK cycle, 
--     d. TCSD = 50 ns (min time between CS low-high-low sequence between two consecutive transmissions) -> fulfilled by waiting a dummy SCK cycle, 
--     e. TSU = 20 ns (min data setup time before sampling SDI -> fulfilled by changing data on EEPROM’s SDI at SCK’s falling edges, 
--     f. THD = 40 ns (min data hold time after sampling SDI) -> fulfilled by changing data on EEPROM’s SDI at SCK’s falling edges. 

-- [8] EEPROM OPERATION 
--     a. EEPROM samples its own SDI line on the rising edge of SCK, 
--     b. EEPROM sets data on its own SDI line on the falling edge of SCK (thus, FPGA shall sample data on the rising edge of SCK), 
--     c. During the reading procedure, EEPROM writes data on its own SDO starting from the very next SCK rising edge after the READ instruction
--        has been received. 

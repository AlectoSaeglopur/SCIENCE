
-- ButtonsTN#0 and BTN#1 ( KEY0 and KEY1) allow to move up and down with the FSM modes: 
-- [0] DirSwt : Leds driven directly by respective switches (SWT=1->LED=1)
-- [1] InvSwt : Leds driven inversely by respective switches (SWT=0->LED=1)
-- [2] FrwBlk : Leds driven for forward blinking autonomously at 10 Hz
-- [3] BckBlk : Leds driven for backward blinking autonomously at 10 Hz
-- [4] BncBlk : Leds driven for blicking back and forth autonomously at 10 Hz
-- [5] SwtBlk : Leds driven for blicking simultaneously and autonomously at 10 Hz if activated by SWT



library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;



entity VarLed is port (

	CLK : in std_logic;                                                                             -- 50 MHz built-it clock
	BTN : in std_logic_vector(1 downto 0);                                                          -- Buttons [Serigraphy correspondance: BTN(0)->KEY0 and BTN(1)->KEY1]
	SWT : in std_logic_vector(9 downto 0);                                                          -- Switches [e.g. SWT(3)->SW3]
	LED : out std_logic_vector(9 downto 0);                                                         -- LEDs [e.g. LED(8)->LEDR8] (NB: keep in mind in the DE10-Lite board the Led number increment moving right to left!)
	SEG0 : out std_logic_vector(7 downto 0);                                                        -- 7-segment displays [e.g. SEG0->HEX0]
	SEG1 : out std_logic_vector(7 downto 0);
	SEG2 : out std_logic_vector(7 downto 0);
	SEG3 : out std_logic_vector(7 downto 0);
	SEG4 : out std_logic_vector(7 downto 0);
	SEG5 : out std_logic_vector(7 downto 0);
	GPIO1 : out std_logic);

end VarLed;



architecture Structure1 of VarLed is

	constant Nstates : natural := 6;                                                                -- Number of modes foressen by the finite state machine (FSM)
	constant THR10HZ : natural := 2500000;                                                          -- CLK/NEWCLK*DUTY = 50MHz/10Hz*50% = 2500000 (use 5 for waveform simulation purposes)
	signal Pushed : std_logic_vector(1 downto 0) := (others => '0');                                -- Signal acting as debouncer for buttons [initialization alternative: "00"]	
	signal NextPushed : std_logic_vector(1 downto 0);                                               -- NB: typically the "next" signals shall not be initialized!
	signal State : natural range 0 to Nstates-1 := 0;                                               -- Signal representing the current FSM mode (#0 up to #Nstates-1)
	signal NextState : natural range 0 to Nstates-1;
	signal Cnt10Hz : natural range 0 to THR10HZ := 0;                                               -- Signal acting as counter for 10 Hz cycles
	signal NextCnt10Hz : natural range 0 to THR10HZ;
	signal Clk10Hz : std_logic := '0';                                                              -- 10 Hz clock signal
	signal NextClk10Hz : std_logic;
	signal BncDir : std_logic := '1';                                                               -- Signal for storing the direction of bouncing in mode #4 (0->L2R, 1->R2L)
	signal NextBncDir : std_logic; 
	signal LedBlkNo : natural range 0 to 9 := 0;                                                    -- Signal storing the number of the LED currently on in the blinking modes
	signal NextLedBlkNo : natural range 0 to 9;
	signal BlkLeds : std_logic_vector(9 downto 0);                                                  -- Final LED signals from the blinking side of the circuit
	signal StdLeds : std_logic_vector(9 downto 0);                                                  -- Final LED signals from the steady side of the circuit
	constant Print0 : std_logic_vector(7 downto 0) := "11000000";
	constant Print1 : std_logic_vector(7 downto 0) := "11111001";
	constant Print2 : std_logic_vector(7 downto 0) := "10100100";
	constant Print3 : std_logic_vector(7 downto 0) := "10110000";
	constant Print4 : std_logic_vector(7 downto 0) := "10011001";
	constant Print5 : std_logic_vector(7 downto 0) := "10010010";
	constant Print6 : std_logic_vector(7 downto 0) := "10000010";
	constant Print7 : std_logic_vector(7 downto 0) := "11111000";
	constant Print8 : std_logic_vector(7 downto 0) := "10000000";
	constant Print9 : std_logic_vector(7 downto 0) := "10010000";
	constant PrintPnt : std_logic_vector(7 downto 0) := "01111111";
	constant PrintVoid : std_logic_vector(7 downto 0) :="11111111";
	constant PrintH : std_logic_vector(7 downto 0) := "10001001";
	signal Dsec : natural range 0 to 9 := 0;                                                        -- Tenth of seconds since last boot
	signal NextDsec : natural range 0 to 9; 
	signal Sec : natural range 0 to 59 := 0;                                                        -- Seconds since last boot
	signal NextSec : natural range 0 to 59;
	signal Min : natural range 0 to 59 := 0;                                                        -- Minutes since last boot
	signal NextMin : natural range 0 to 59;
	

begin

	Clock50MHz : process ( CLK ) begin                                                              -- Process to update some signals as a function of the main clock (50 MHz)
	
		if ( CLK'event and CLK='1' ) then
			State <= NextState;
			Pushed <= NextPushed;
			Cnt10Hz <= NextCnt10Hz;
			Clk10Hz <= NextClk10Hz;
		end if;
		
	end process;

	
	
	SwitchMode : process ( BTN, Pushed, State ) begin                                               -- Process for switching between FSM modes when a button is pressed (managing also debouncers)
	
		if ( BTN(0) = '0' and Pushed(0) = '0' ) then                                                -- Increment state/mode if KEY0 has been pressed (thus, the press of KEY0 takes priority over that of KEY1)
			if ( State = Nstates-1 ) then
				NextState <= 0;
			else
				NextState <= State+1;
			end if;
			NextPushed(0) <= '1';
			NextPushed(1) <= '0';
		elsif ( BTN(1) = '0' and Pushed(1) = '0' ) then										-- Decrement state/mode if KEY1 has been pressed 
			if ( State = 0 ) then
				NextState <= Nstates-1;
			else
				NextState <= State-1;
			end if;
			NextPushed(0) <= '0';
			NextPushed(1) <= '1';
		else
			NextState <= State;
			NextPushed(0) <= not(BTN(0));															-- Remenber that BTN = '0' means the button is pushed
			NextPushed(1) <= not(BTN(1));
		end if;	
		
	end process;
	

	
	Downclocking10Hz : process ( Cnt10Hz, Clk10Hz ) begin									-- Process for generating the 10 Hz clock from the 50 MHz one				
	
		if ( Cnt10Hz = THR10HZ ) then
			NextCnt10Hz <= 0;
			NextClk10Hz <= not(Clk10Hz);
		else
			NextCnt10Hz <= Cnt10Hz+1;
			NextClk10Hz <= Clk10Hz;
		end if;
		
	end process;



	Clock10Hz : process ( Clk10Hz ) begin														-- Process to update some signals as a function of the derived clock (10 Hz)
	
		if ( rising_edge( Clk10Hz ) ) then	
			LedBlkNo <= NextLedBlkNo;
			BncDir <= NextBncDir;
			Dsec <= NextDsec;
			Sec <= NextSec;
			Min <= NextMin;
		end if;
		
	end process;



	BlkDriver : process ( State, LedBlkNo, BncDir, Clk10Hz, SWT ) begin				-- Process handling the blinkin part of the circuit (i.e. modes from #2 to #5)

		if ( State = 2 ) then
			if ( LedBlkNo < 9 ) then
				NextLedBlkNo <= LedBlkNo+1;
			else
				NextLedBlkNo <= 0;
			end if;
			NextBncDir <= '1';
			
		elsif ( State = 3 ) then
			if ( LedBlkNo > 0 ) then
				NextLedBlkNo <= LedBlkNo-1;
			else
				NextLedBlkNo <= 9;
			end if;
			NextBncDir <= '1';
			
		elsif ( State = 4 ) then
			if ( BncDir = '1' ) then
				if ( LedBlkNo = 9 ) then
					NextLedBlkNo <= LedBlkNo-1;
					NextBncDir <= not(BncDir);
				else
					NextLedBlkNo <= LedBlkNo+1;
					NextBncDir <= BncDir;
				end if;
			else
				if ( LedBlkNo = 0 ) then
					NextLedBlkNo <= LedBlkNo+1;
					NextBncDir <= not(BncDir);
				else
					NextLedBlkNo <= LedBlkNo-1;
					NextBncDir <= BncDir;
				end if;
			end if;
			
		else
			NextLedBlkNo <= 0;
			NextBncDir <= '1';
		end if;	
		
		if ( State = 2 or State = 3 or State = 4 ) then
			for I in 0 to 9 loop
				if ( LedBlkNo = I ) then
					BlkLeds(I) <= '1';
				else
					BlkLeds(I) <= '0';
				end if;
			end loop;
			
		elsif ( State = 5 ) then
			for I in 0 to 9 loop
				BlkLeds(I) <= Clk10Hz and SWT(I);
			end loop;
	
		else
			BlkLeds <= "0000000000";
		end if;
	
	end process;



	StdDriver : process ( State, SWT ) begin													-- Process handling the steady part of the circuit (i.e. modes #0 and #1)
			
--		case State is																					-- This switch-block is an alternative to the if-else below, see the changes in the RTL viewer!
--		
--			when 0 =>
--				StdLeds <= SWT(9 downto 0);
--				
--			when 1 =>
--				StdLeds <= not(SWT(9 downto 0));
--					
--			when others =>
--				StdLeds <= "0000000000";
--
--		end case;

		if ( State = 0 )	then
			StdLeds <= SWT(9 downto 0);
		elsif ( State = 1 )	then
			StdLeds <= not(SWT(9 downto 0));
		else
			StdLeds <= "0000000000";
		end if;
	
	end process;



	DriverLeds : process ( State, StdLeds, BlkLeds ) begin								-- Process for choosing which part of circuit (BlkDriver or StdDriver) has to drive board LEDs as a function of the current FSM mode
	
		if ( State < 2 ) then
			LED <= StdLeds;
		else
			LED <= BlkLeds;
		end if;
	
	end process;

	
	
	UpdateTime : process ( Dsec, Sec, Min ) begin											-- Process for updating time since last board boot
	
		if ( Dsec < 9 ) then
			NextDsec <= Dsec+1;
			NextSec <= Sec;
			NextMin <= Min;
		else
			NextDsec <= 0;
			if ( Sec < 59 ) then
				NextSec <= Sec+1;
				NextMin <= Min;
			else
				NextSec <= 0;
				if ( Min < 59 ) then
					NextMin <= Min+1;
				else
					NextMin <= 0;
				end if;
			end if;
		 end if;
		
	end process;
	
	
	
	Driver7SD : process ( State, Dsec, Sec, Min ) begin									-- Process for printing the current mode and time in the 7-segment displays	
		if ( State = 0 ) then
			SEG0 <= Print0;
		elsif ( State = 1 ) then
			SEG0 <= Print1;
		elsif ( State = 2 ) then
			SEG0 <= Print2;
		elsif ( State = 3 ) then
			SEG0 <= Print3;
		elsif ( State = 4 ) then
			SEG0 <= Print4;
		elsif ( State = 5 ) then
			SEG0 <= Print5;
		else
			SEG0 <= PrintH;
		end if;
	
		if ( Dsec = 0 ) then
			SEG1 <= Print0 and PrintPnt;
		elsif ( Dsec = 1 ) then
			SEG1 <= Print1 and PrintPnt;
		elsif ( Dsec = 2 ) then
			SEG1 <= Print2 and PrintPnt;
		elsif ( Dsec = 3 ) then
			SEG1 <= Print3 and PrintPnt;
		elsif ( Dsec = 4 ) then
			SEG1 <= Print4 and PrintPnt;
		elsif ( Dsec = 5 ) then
			SEG1 <= Print5 and PrintPnt;
		elsif ( Dsec = 6 ) then
			SEG1 <= Print6 and PrintPnt;
		elsif ( Dsec = 7 ) then
			SEG1 <= Print7 and PrintPnt;
		elsif ( Dsec = 8 ) then
			SEG1 <= Print8 and PrintPnt;
		elsif ( Dsec = 9 ) then
			SEG1 <= Print9 and PrintPnt;
		else
			SEG1 <= PrintH;
		end if;
		
		if ( (Sec mod 10) = 0 ) then
			SEG2 <= Print0;
		elsif ( (Sec mod 10) = 1 ) then
			SEG2 <= Print1;
		elsif ( (Sec mod 10) = 2 ) then
			SEG2 <= Print2;
		elsif ( (Sec mod 10) = 3 ) then
			SEG2 <= Print3;
		elsif ( (Sec mod 10) = 4 ) then
			SEG2 <= Print4;
		elsif ( (Sec mod 10) = 5 ) then
			SEG2 <= Print5;
		elsif ( (Sec mod 10) = 6 ) then
			SEG2 <= Print6;
		elsif ( (Sec mod 10) = 7 ) then
			SEG2 <= Print7;
		elsif ( (Sec mod 10) = 8 ) then
			SEG2 <= Print8;
		elsif ( (Sec mod 10) = 9 ) then
			SEG2 <= Print9;
		else
			SEG2 <= PrintH;
		end if;
		
		if ( Sec - (Sec mod 10) = 0 ) then
			SEG3 <= Print0;
		elsif ( Sec - (Sec mod 10) = 10 ) then
			SEG3 <= Print1;
		elsif ( Sec - (Sec mod 10) = 20 ) then
			SEG3 <= Print2;
		elsif ( Sec - (Sec mod 10) = 30 ) then
			SEG3 <= Print3;
		elsif ( Sec - (Sec mod 10) = 40 ) then
			SEG3 <= Print4;
		elsif ( Sec - (Sec mod 10) = 50 ) then
			SEG3 <= Print5;
		else
			SEG3 <= PrintH;
		end if;
		
		if ( (Min mod 10) = 0 ) then
			SEG4 <= Print0;
		elsif ( (Min mod 10) = 1 ) then
			SEG4 <= Print1;
		elsif ( (Min mod 10) = 2 ) then
			SEG4 <= Print2;
		elsif ( (Min mod 10) = 3 ) then
			SEG4 <= Print3;
		elsif ( (Min mod 10) = 4 ) then
			SEG4 <= Print4;
		elsif ( (Min mod 10) = 5 ) then
			SEG4 <= Print5;
		elsif ( (Min mod 10) = 6 ) then
			SEG4 <= Print6;
		elsif ( (Min mod 10) = 7 ) then
			SEG4 <= Print7;
		elsif ( (Min mod 10) = 8 ) then
			SEG4 <= Print8;
		elsif ( (Min mod 10) = 9 ) then
			SEG4 <= Print9;
		else
			SEG4 <= PrintH;
		end if;
		
		if ( Min - (Min mod 10) = 0 ) then
			SEG5 <= Print0;
		elsif ( Min - (Min mod 10) = 10 ) then
			SEG5 <= Print1;
		elsif ( Min - (Min mod 10) = 20 ) then
			SEG5 <= Print2;
		elsif ( Min - (Min mod 10) = 30 ) then
			SEG5 <= Print3;
		elsif ( Min - (Min mod 10) = 40 ) then
			SEG5 <= Print4;
		elsif ( Min - (Min mod 10) = 50 ) then
			SEG5 <= Print5;
		else
			SEG5 <= PrintH;
		end if;		
		
	end process;
	
	GPIO1 <= Clk10Hz;

end Structure1;

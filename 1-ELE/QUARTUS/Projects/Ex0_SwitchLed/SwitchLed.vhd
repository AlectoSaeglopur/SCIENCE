
-- BTN (serigraphy KEY0) allow to switch among FSM modes: 
-- [0] DirSwt : Leds driven directly by respective switches (SWT=1->LED=1)
-- [1] InvSwt : Leds driven inversely by respective switches (SWT=0->LED=1)

	
library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;



entity SwLed is port (
	
	CLK : in std_logic;
	BTN : in std_logic;
	SWT : in std_logic_vector(9 downto 0);
	LED : out std_logic_vector(9 downto 0));
	
end SwLed;



--architecture Structure of SwLed is
--
--	signal State : std_logic := '0';
--	signal NextState : std_logic := '0';
--	signal Pushed : std_logic := '0';
--	signal NextPushed : std_logic := '0';
--	signal Leds : std_logic_vector(9 downto 0);
--
--begin
--
---- SEQUENTIAL SECTION -- 
--
--	FlipFlop	: process ( CLK, NextPushed, NextState ) begin
--
--		if (CLK'event and CLK='1') then												
--			State <= NextState;
--			Pushed <= NextPushed;
--		end if;
--
--	end process;
--
--
---- COMBINATORY SECTION --
--
--	process ( SWT, State, Pushed, BTN ) begin
--
--		for I in 0 to 9 loop
--			Leds(I) <= SWT(I) xor State;
--		end loop;
--
--		if ( BTN = '0' ) then
--			NextPushed <= '1';
--			NextState <= State xor not(Pushed);
--		else
--			NextState <= State;
--			NextPushed <= '0';
--		end if;
--
--	end process;
--	
--	LED <= Leds;
--
--end Structure;





architecture Structure of SwLed is

	signal State : std_logic := '0';
	signal NextState : std_logic := '0';
	signal Pushed : std_logic := '0';
	signal NextPushed : std_logic := '0';
--	signal Leds : std_logic_vector(9 downto 0);

begin

-- SEQUENTIAL SECTION -- 

	FlipFlop	: process ( CLK ) begin

		if (CLK'event and CLK='1') then												
			State <= NextState;
			Pushed <= NextPushed;
		end if;

	end process;


-- COMBINATORY SECTION --

	LED <= SWT when State = '0' else
			  not(SWT);

	NextPushed <= '0' when BTN = '1' else
					'1';
						
	NextState <= State when BTN = '1' else
					 State xor not(Pushed);
	
--	LED <= Leds;

end Structure;


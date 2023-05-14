
# DEFINITION AND CONSTRAINTS FOR 50Hz MAIN CLOCK (uncertainty is set as 1% of period)
create_clock -name CLK -period 20 -waveform {10 20} [get_ports {CLK}]
set_clock_uncertainty -from { CLK } -hold 0.2
set_clock_uncertainty -from { CLK } -setup 0.2

# DEFINITION AND CONSTRAINTS FOR UART DERIVED CLOCK (division factor depends on the actual rate used, e.g. 500 is for 100 kb/s)
create_generated_clock -name ClkUART -source [get_ports {CLK}] -divide_by 500 -duty_cycle 50 -phase 0 -offset 0 [get_registers {ClkUART}]

# DEFINITION AND CONSTRAINTS FOR 1kHz DERIVED CLOCK
create_generated_clock -name Clk1kHz -source [get_ports {CLK}] -divide_by 50000 -duty_cycle 50 -phase 0 -offset 0 [get_registers {Clk1kHz}]

# AUTOMATICALLY GET UNCERTAINTY FOR DERIVED CLOCKS
derive_clock_uncertainty
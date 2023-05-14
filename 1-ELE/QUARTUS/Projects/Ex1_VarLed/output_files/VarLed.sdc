create_clock -name CLK -period 20 -waveform {10 20} [get_ports {CLK}]
set_clock_uncertainty -from { CLK } -hold 1
set_clock_uncertainty -from { CLK } -setup 1
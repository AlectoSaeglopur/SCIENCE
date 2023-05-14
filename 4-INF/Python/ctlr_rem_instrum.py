
"""
" Script for remotely control instrumentation through Python.
" Filippo Valmori
" 16/05/2022
"""

### LIBRARIES ###

import pyvisa                                                   # pip install pyvisa
from time import sleep



### PARAMETERS ###

Adr = 'ASRL9::INSTR'                                            # address used for RS-232 communication (check with "list_resources() results)
# Adr = 'USB0::0x2A8D::0x1766::MY61264924::0::INSTR'              # address used for USB communication (check with "list_resources() results)
TerChar = '\n'                                                  # Termination character (NB: use '\n' or '\r')
CmdDly = 2.0                                                    # delay between each command [s] (NB: just for testing purpose!)



### PROCESING ###

RM = pyvisa.ResourceManager()                                   # get resource manager (RM) info
List = RM.list_resources()                                      # get list of available interfaces (see NB#2 below)
print('\n * RESOURCE LIST >>',str(List))
# print('\n * EXTRA INFO >>',RM.list_resources_info())            # retrieve additional info
if Adr not in List :
    print('\n * ERROR : INTERFACE NOT CONFIGURED!')
    exit()
Dev = RM.open_resource(Adr)                                     # access to instrument specified by input address

Dev.read_termination = TerChar                                  # set reading termination character
Dev.write_termination = TerChar                                 # set writing termination character
ID = Dev.query('*IDN?')
print('\n * DEVICE ID >>',str(ID))


if '33120A' in ID :                                             # >>> HP's 33120A signal generator <<<

    Dev.write('SYST:REM')                                       # set the device in remote mode
    Dev.write('*RST')                                           # reset device to default state
    sleep(CmdDly)                                               # wait some second before executing next command
    Dev.write('APPL:SQU 50,2.0,0.5')                            # set square wave at 50 Hz with 2 V amplitude and 500 mV DC-offset
    sleep(CmdDly)
    Dev.write('VOLT 1.5')                                       # set voltage level to 1.5 V
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values('VOLT?')                     # read back voltage level from instrument [V]
    print('\n >> Voltage readback :',str(RdVal[0]),'V')
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values('FREQ?')                     # read back frequency value from instrument [Hz]
    print('\n >> Frequency readback :',str(RdVal[0]),'Hz')
    sleep(CmdDly)
    Dev.write('SWE:TIME 4')                                     # set sweep time (4 s)
    sleep(0.1)                                                  # 100 ms delay to allow previous command execution [NOT NEEDED]
    Dev.write('FREQ:START 10; STOP 500; MODE SWEEP')            # multiple command to set starting/final frequency (10 and 500 Hz) and launch sweep mode
    sleep(CmdDly)
    Dev.write('SYST:LOC')                                       # reset the device in local mode

elif 'E3634A' in ID :                                           # >>> Keysight's E3634A power supply <<<

    Dev.write('OUTP OFF')                                       # switch off channel
    Dev.write('SYST:REM')                                       # set the device in remote mode
    sleep(CmdDly)
    Dev.write('VOLT 7')                                         # set voltage to 7 V
    sleep(CmdDly)
    Dev.write('OUTP ON')                                        # switch on channel
    sleep(CmdDly)
    Dev.write('*RCL 1')                                         # set voltage to 7 V
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values('VOLT?')                     # read back voltage level from instrument [V]
    print('\n >> Voltage readback :',str(RdVal[0]),'V')
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values('MEAS:VOLT?')                # read voltage measure from instrument [V]
    print('\n >> Voltage measure :',str(RdVal[0]),'V')
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values('MEAS:CURR?')                # read current measure from instrument [A]
    print('\n >> Current measure :',str(RdVal[0]),'A')
    sleep(CmdDly)
    Dev.write('SYST:LOC')                                       # reset the device in local mode
    sleep(CmdDly)
    Dev.write('*RST')                                           # reset device settings
    sleep(CmdDly)

elif 'DSO-X 3024T' in ID :                                      # >>> Keysight's DSOX3024T oscilloscope <<<

    Dev.write('*RST')                                           # perform reset to factory default setup
    sleep(CmdDly)
    OrigTO = Dev.timeout                                        # read and store current default timeout value [ms]
    print('\n >> Default timeout =',str(OrigTO),'ms')
    Dev.timeout = 60e3                                          # set new timeout to 60 s
    RdVal = Dev.query('*TST?')                                  # execute self-test (NB: it takes about 40 s)
    if str(RdVal) == '0' :                                      # 0-outcome means test completed successfully
        print('\n >> Self-test PASSED!')
    else :
        print('\n >> Self-test FAILED!')
    sleep(CmdDly)
    Dev.timeout = OrigTO                                        # restore original timeout
    Dev.write(':AUT')                                           # autoscale the device
    sleep(CmdDly)
    Dev.write(':VIEW CHAN3')                                    # enable channel #3
    sleep(CmdDly)
    Dev.write(':BLAN CHAN3')                                    # disable channel #3
    sleep(CmdDly)
    Dev.write(':STOP')                                          # stop acquisition
    sleep(CmdDly)
    Dev.write(':RUN')                                           # run/resume acquisition
    Dev.write(':CHAN1:INV ON')                                  # set channel #1 input as inverted (i.e. signal displayed with opposite sign)
    sleep(CmdDly)
    Dev.write(':CHAN1:INV OFF')                                 # reset channel #1 input as not-inverted
    sleep(CmdDly)
    Dev.write(':CHAN1:OFFS -200 mV')                            # set channel #1 vertical offset to -200 mV
    sleep(CmdDly)
    Dev.write(':CHAN1:OFFS 0 V')                                # reset channel #1 vertical offset to 0 V
    sleep(CmdDly)
    RdVal = Dev.query_ascii_values(':CHAN1:SCAL?')              # read current channel #1 vertical scale [V]
    print('\n >> Ch#1 vertical scale readback =',str(RdVal[0]),'V/div')
    sleep(CmdDly)
    Dev.write(':CHAN1:SCAL 100 mV')                             # set channel #1 vertical scale to 100 mV/division
    sleep(CmdDly)
    Dev.write(':CHAN1:SCAL '+str(RdVal[0])+' V')                # reset channel #1 vertical scale to original value

Dev.close()                                                     # release instrument
RM.close()                                                      # close RM session



### NOTES ###

"""
" 0. One-time software setup (refer to "watchme.mp4" video) :
"    * Download and install Python (version >= 3.6),
"    * Download and install Visual Studio Build Tools,
"    * Download and install Cmake,
"    * Download and install Keysight's IO Libraries Suite
"    * Install the "pyvisa" library via pip.
" 1. Every-time hardware setup :
"    * Use a USB-A to USB-B or USB-A to DB9 (RS-232) cable to connect the PC with the instrument. -> NB: in case of
"      DB9 cable, make sure the pinout is correct by checking the numbers on that!
"    * NB#0 -> It is recommended to physically connect a specific instrument always to the same PC's COM (e.g. left
"      USB port only for USB-to-USB oscilloscope, 1st right USB port only for USB-to-RS-232 for power supply, etc.).
"      This simplifies the management, otherwise each time the old instrument shall be removed and the new one re-added
"      in the "Keysight Connection Expert" software.
" 2. Every-time software setup :
"    * Switch on the instrument and detect the employed COM via "Device Manager".
"    * Use "Keysight Connection Expert" to check the basic communication between PC and instrument. For example:
"      - In case the used COM is not present, add it through the "+ Add" button,
"      - Once the instrument is detected in the left-bar, right-click it and go to "Edit". Check all the communication
"        parameters (baud rate, etc.) are set properly in accordance with instrument's manual and then verify the
"        connection by clicking the "Test this VISA address" button. If the outcome is successful, copy the address at
"        the right of the aforementioned button into the "Adr" parameter of "ctrl_rem_instrum.py"; otherwise try to
"        modify the settings, to change the PC' USB port or to remove and add again the instrument in the left-bar of
"        "Keysight Connection Expert".
"    * Finally run "ctlr_rem_instrum.py".
"    * NB#1 -> All the Python instructions for remotely controlling the instrument can be find in its user guide (SCPI).
"    * NB#2 -> In "ctlr_rem_instrum.py" the function "list_resources()" returns a list of all the interfaces/addresses
"           configured in the "Keysight Connection Expert" software. However, note that once configured, these interfaces
"           appear any time the function is called, even though no instrument is actually connected to them!
"    * NB#3 -> Note that all the "sleep(CmdDly)" instructions have been included only for visual test purpose. They are
"           not necessary for the correct execution of the pyvisa previous command. In fact, each command triggers a
"           Python internal timeout (2 s by default) and if no data nor acknowledge is received by this time the script
"           generates a timeout exception.
"""
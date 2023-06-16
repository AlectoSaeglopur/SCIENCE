
"""
" File containing the TX and RX parsing functions for communicating
" with the MCU.
"""

### LIBRARIES ###

from re import finditer
from numpy import copy



#### DEFINES ###

VERB =  False                                                                           # Verbose option for error registers
P2M = 112                                                                               # PC-to-MCU direction ID (112 = 0x70)
M2P = 192                                                                               # PC-to-MCU direction ID (192 = 0xC0)
ACT_RD =  4                                                                             # READ action ID (4 = 0x04)
ACT_RM =  6                                                                             # READ-MULTIPLE action ID (6 = 0x06)
ACT_EX =  11                                                                            # EXECUTE action ID (11 = 0x0B)
ACT_WR =  13                                                                            # WRITE action ID (13 = 0x0D)
LEN_INFO_TM = 4                                                                         # expected length of TM info field [B]
ACK_ID = 41251                                                                          # Acknowledge ID for EX and WR commands (0xA123)
NACK_ID = 42070                                                                         # Not-acknowledge ID for EX and WR commands (0xA456)
CntRp = 0                                                                               # Counter for sequentially reading parameters from EEPROM or UDID words
Vdd = 3.3                                                                               # MCU ADC max voltage reference [V]
Vth = 0.761                                                                             # MCU temperature diode/sensor reference votage drop [V]
Kd = -1.5e-3                                                                            # MCU diode/sensor temperature coefficient [V/C]
Tofs = 50                                                                               # MCU sensor reference temperature [C]
AdcRes = 12                                                                             # MCU ADC resolution [b]
Tkc = 2732                                                                              # Kelvin to Celsius degrees offset [dK]
RC_DC_BUF_SZ = 5                                                                        # RCD algorithm buffer size [NB: shall match with MCU value]
PWM_OFST = 5000-2                                                                       # RCD algorithm offet [NB: shall match with MCU value]
PWM_SENS = 385                                                                          # RCD algorithm sensitivity [NB: shall match with MCU value]

# RD+RM dictionary #
AdrMapR = dict([ \
                # Master status registers (0x00 - 0x8F) #
                ('mst_temperature',b'\x00'), \
                ('extsen1_temperature',b'\x01'), \
                ('extsen2_temperature',b'\x02'), \
                ('extsen3_temperature',b'\x03'), \
                ('extsen4_temperature',b'\x04'), \
                ('mst_relative_time',b'\x05'), \
                ('eeprom_parameters',b'\x06'), \
                ('csl_status',b'\x07'), \
                ('dac_value',b'\x08'), \
                ('mst_crc',b'\x09'), \
                ('devid',b'\x0A'), \
                ('UDID',b'\x0B'), \
                ('RCD_SUM',b'\x0C'), \
                ('RCD_DT',b'\x0D'), \
                ('RCD_DH',b'\x0E'), \

                ('EM_STAT0',b'\x20'), \
                ('EM_STAT1',b'\x21'), \
                ('EM_STAT2',b'\x22'), \
                ('EM_STAT3',b'\x23'), \
                ('EM_VLT1',b'\x24'), \
                ('EM_VLT2',b'\x25'), \
                ('EM_VLT3',b'\x26'), \
                ('EM_CUR1',b'\x27'), \
                ('EM_CUR2',b'\x28'), \
                ('EM_CUR3',b'\x29'), \
                ('EM_CURN',b'\x2A'), \
                ('EM_PWAT',b'\x2B'), \
                ('EM_PWA1',b'\x2C'), \
                ('EM_PWA2',b'\x2D'), \
                ('EM_PWA3',b'\x2E'), \
                ('EM_PWRT',b'\x2F'), \
                ('EM_PWR1',b'\x30'), \
                ('EM_PWR2',b'\x31'), \
                ('EM_PWR3',b'\x32'), \
                ('EM_PWFT',b'\x33'), \
                ('EM_PWF1',b'\x34'), \
                ('EM_PWF2',b'\x35'), \
                ('EM_PWF3',b'\x36'), \
                ('EM_FREQ',b'\x37'), \
                ('EM_THDV1',b'\x38'), \
                ('EM_THDV2',b'\x39'), \
                ('EM_THDV3',b'\x3A'), \
                ('EM_THDI1',b'\x3B'), \
                ('EM_THDI2',b'\x3C'), \
                ('EM_THDI3',b'\x3D'), \
                ('EM_TEMP',b'\x3E'), \

                ('REG_RCON',b'\x50'), \
                ('REG_MBISTCON',b'\x51'), \
                ('REG_INTCON1',b'\x52'), \
                ('REG_INTCON4',b'\x53'), \
                ('REG_ANSELA',b'\x54'), \
                ('REG_ANSELB',b'\x55'), \
                ('REG_ANSELC',b'\x56'), \
                ('REG_ANSELD',b'\x57'), \
                ('REG_ANSELE',b'\x58'), \
                ('REG_TRISA',b'\x59'), \
                ('REG_TRISB',b'\x5A'), \
                ('REG_TRISC',b'\x5B'), \
                ('REG_TRISD',b'\x5C'), \
                ('REG_TRISE',b'\x5D'), \
                ('REG_PORTA',b'\x5E'), \
                ('REG_PORTB',b'\x5F'), \
                ('REG_PORTC',b'\x60'), \
                ('REG_PORTD',b'\x61'), \
                ('REG_PORTE',b'\x62'), \

                # Master parameters (0x90 - 0xAF) #
                ('MB_MODE',b'\x90'), \
                ('modbus_id',b'\x91'), \
                ('modbus_rate',b'\x92'), \
                ('MB_PARI',b'\x93'), \
                ('EM_VREF_GAIN',b'\x94'), \
                ('EM_IREF_GAIN',b'\x95'), \
                ('UNDRV_THR',b'\x96'), \
                ('OVERV_THR',b'\x97'), \
                ('RCD_CUR',b'\x98'), \
                ('RCD_PER',b'\x99'), \
                ('RCD_OFS',b'\x9A'), \
                ('RCD_SEN',b'\x9B'), \
                ('MIN_TEMP_THR',b'\x9C'), \
                ('MAX_TEMP_THR',b'\x9D'), \

                # Master error registers (0xB0 - 0xBF) #
                ('M_ERR_SOA',b'\xB0'), \
                ('M_ERR_UART',b'\xB1'), \
                ('M_ERR_SPI',b'\xB2'), \
                ('M_ERR_EEPROM',b'\xB3'), \
                ('M_ERR_TRAP',b'\xB4'), \
                ('M_ERR_TEMP',b'\xB5'), \
                ('M_ERR_RCD',b'\xB6'), \
                ('M_ERR_SLAVE',b'\xB7'), \
                ('M_ERR_EM',b'\xB8'), \
                ('M_ERR_CSL',b'\xB9'), \
                ('M_ERR_COMM',b'\xBA'), \
                ('M_ERR_SM',b'\xBB'), \
                ('M_ERR_VAR',b'\xBC'), \

                # Slave status registers (0xC0 - 0xDF) #
                ('S_TIMEB',b'\xC0'), \
                ('S_CRC',b'\xC1'), \
                ('S_SCIV1',b'\xC2'), \
                ('S_SCIV2',b'\xC3'), \
                ('S_SCIV3',b'\xC4'), \
                ('S_SCIV4',b'\xC5'), \
                ('S_OLC1',b'\xC6'), \
                ('S_OLC2',b'\xC7'), \
                ('S_OLC3',b'\xC8'), \
                ('S_OLC4',b'\xC9'), \

                # Slave parameters (0xE0 - 0xEF) #
                ('SOA_IRNG',b'\xE0'), \
                ('ITHR_OL',b'\xE1'), \
                ('ITHR_SC',b'\xE2'), \
                ('CTHR_SC',b'\xE3'), \
                ('SOA_ADC_OFS',b'\xE4'), \
                
                # Slave error registers (0xF0 - 0xFF) #
                ('S_ERR_SOA',b'\xF0'), \
                ('S_ERR_TRAP',b'\xF1'), \
                ('S_ERR_TEMP',b'\xF2'), \
                ('S_ERR_SM',b'\xF3'), \
                ('S_ERR_VAR',b'\xF4') \
                ])

# EX dictionary #
AdrMapE = dict([ \
                # Master registers #
                ('mst_reset',b'\xE0'), \
                ('mst_clear_errors',b'\xE1'), \
                # Slave registers #
                ('slv_reset',b'\xF0'), \
                ('slv_clear_errors',b'\xF1') \
                ])

# WR dictionary #
AdrMapW = dict([ \
                # Master registers (only) #
                ('MB_MODE',b'\x00'), \
                ('modbus_id',b'\x01'), \
                ('modbus_rate',b'\x02'), \
                ('MB_PARI',b'\x03'), \
                ('SOA_IRNG',b'\x04'), \
                ('ITHR_OL',b'\x05'), \
                ('EM_VREF_GAIN',b'\x06'), \
                ('EM_IREF_GAIN',b'\x07'), \
                ('UNDRV_THR',b'\x08'), \
                ('OVERV_THR',b'\x09'), \
                ('RCD_CUR',b'\x0A'), \
                ('RCD_PER',b'\x0B'), \
                ('RCD_OFS',b'\x0C'), \
                ('RCD_SEN',b'\x0D'), \
                ('MIN_TEMP_THR',b'\x0E'), \
                ('MAX_TEMP_THR',b'\x0F'), \
                ('ITHR_SC',b'\x10'), \
                ('SOA_ADC_OFS',b'\x11') \
                ])



#### TC FUNCTIONS ###

"""
" Function to check and convert command address and action.
"""
def ConvTx( AdrStr, ActStr ) :
    AdrId = b'\xFF'
    Check = False
    global CntRp
    if ActStr == 'RD' :
        ActId =  ACT_RD
        if AdrStr in AdrMapR.keys() :                                                   # check if address string is present in RD mapping dictionary
            AdrId = AdrMapR[AdrStr]                                                     # retrieve corresponding address byte
            Check = True
            if (AdrStr == 'eeprom_parameters') or (AdrStr == 'UDID') :
                CntRp = 0
    elif ActStr == 'RM' :
        ActId =  ACT_RM
        if AdrStr in AdrMapR.keys() :                                                   # check if address string is present in RM mapping dictionary
            AdrId = AdrMapR[AdrStr]                                                     # retrieve corresponding address byte
            Check = True
            if AdrStr == ('eeprom_parameters') or (AdrStr == 'UDID') :
                CntRp = 0
    elif ActStr == 'EX' :
        ActId =  ACT_EX
        if AdrStr in AdrMapE.keys() :                                                   # check if address string is present in EX mapping dictionary
            AdrId = AdrMapE[AdrStr]                                                     # retrieve corresponding address byte
            Check = True
    elif ActStr == 'WR' :
        ActId =  ACT_WR
        if AdrStr in AdrMapW.keys() :                                                   # check if address string is present in WR mapping dictionary
            AdrId = AdrMapW[AdrStr]                                                     # retrieve corresponding address byte
            Check = True
    else :
        ActId = 'INVALID'
    if Check == True :
        ActId = (ActId+P2M).to_bytes(1,'big')    
    return Check, AdrId, ActId


"""
" Function to encapsulate RD-RM-EX commands to be transmitted by padding dummy bytes.
"""
def EncapsMsgDummy( ActId, AdrId ) :
    Msg = ActId+AdrId
    Msg += b'\x00\x00\x00\x00'                                                          # pad x4 dummy bytes to reach fixed length of 6 bytes
    return Msg


"""
" Function to encapsulate WR commands to be transmitted by padding the data to be written.
"""
def EncapsMsgWR( ActId, AdrId, DataVal ) :
    Msg = ActId+AdrId
    if DataVal < 0 :
        DataVal = -DataVal+32768                                                        # in case of negative value set MSb to 1 (i.e. DataVal = abs(DataVal)+0x8000) -> used only for "SOA_ADC_OFS"
    DataId = DataVal.to_bytes(4,'big')                                                  # convert 4-byte data field
    Msg += DataId                                                                       # append data field to message
    #print(' x'+str(hex(int.from_bytes(Msg, "big"))[2:].upper()))
    return Msg


"""
" Function for parsing commands to be transmitted to the MCU.
"""
def TxParser( StrTc, VerbFlag ) :
    global VERB
    VERB = VerbFlag                                                                     # update verbose flag from main script
    TxFlag = False                                                                      # default TX flag
    BytesTc = b'\xFF\xFF'                                                               # default byte-message
    Nrep = 1                                                                            # default number of repetitions
    Delay = 0                                                                           # default delay [s]
    SepIdx = [i.start() for i in finditer(' ',StrTc)]                                   # retrieve indeces of all ' ' separators within user string command
    Nsep = len(SepIdx)                                                                  # number of ' ' separators
    if VERB == True : print(' >> TX | Nsep = '+str(Nsep))
    if Nsep <= 0 :
        if VERB == True : print(' >> TX | INVALID TC : Not enough separators.')
    else :
        ActStr = StrTc[:SepIdx[0]]                                                      # retrieve action string from user command
        if VERB == True : print(' >> TX | ActStr = '+ActStr)
        if Nsep == 1 :
            AdrStr = StrTc[SepIdx[0]+1:]
        else :
            AdrStr = StrTc[SepIdx[0]+1:SepIdx[1]]                                       # retrieve address string from user command
        Chk, AdrId, ActId = ConvTx(AdrStr,ActStr)                                       # check correctness of and convert address and action
        if Chk :
            if ActStr == 'RD' :
                if Nsep == 1 :
                    BytesTc = EncapsMsgDummy(ActId,AdrId)                               # encapsulate TC bytes for RD action
                    TxFlag = True
                elif VERB == True : print(' >> TX | INVALID TC : Wrong number of fields for RD command (expected 1).')
            elif ActStr == 'RM' :
                if Nsep == 3 :
                    BytesTc = EncapsMsgDummy(ActId,AdrId)                               # encapsulate TC bytes for RM action
                    Nrep = int(StrTc[SepIdx[1]+1:SepIdx[2]])                            # retrieve number of repetitions
                    Delay = float(StrTc[SepIdx[2]+1:])                                  # retrieve interval of repetition [s]
                    TxFlag = True
                elif VERB == True : print(' >> TX | INVALID TC : Wrong number of fields for RM command (expected 3).')
            elif ActStr == 'EX' :
                if Nsep == 1 :
                    BytesTc = EncapsMsgDummy(ActId,AdrId)                               # encapsulate TC bytes for EX action
                    TxFlag = True
                elif VERB == True : print(' >> TX | INVALID TC : Wrong number of fields for EX command (expected 1).')
            elif ActStr == 'WR' :
                if Nsep == 2 :
                    BytesTc = EncapsMsgWR(ActId,AdrId,int(StrTc[SepIdx[1]+1:]))         # encapsulate TC bytes for WR action
                    TxFlag = True
                elif VERB == True : print(' >> TX | INVALID TC : Wrong number of fields for WR command (expected 2).')
        elif VERB == True : print(' >> TX | INVALID TC : Wrong action or address.')
        if VERB == True : print(' >> TX | ('+str(len(BytesTc))+'.B) = x'+
            str(BytesTc.hex())+'\n -----')                                              # print final raw TC in hexadecimal format
    return TxFlag, BytesTc, Nrep, Delay



#### TM FUNCTIONS ###

"""
" Function to convert and interpret RD and RDM telemetry message.
"""
def ConvRdMsg( RegName, DataBuf, ActInt ) :
    global CntRp, PWM_OFST, PWM_SENS
    if ActInt == ACT_RM :
        ActStr = 'RM '
    else :
        ActStr = 'RD '

    DataVal = DataBuf[LEN_INFO_TM-1]
    for j in range(LEN_INFO_TM-1) :                                                     # NB: conversion to unsigned (in case signed interpretation is needed, implement 2-complement operation for the specific case!)
        DataVal += DataBuf[j]*256**(LEN_INFO_TM-1-j)                                    # convert received byte buffer into corresponding single value

    # General info [MST] #
    if (RegName == 'mst_temperature') :                                                 ### 0x00. MCU MASTER CORE BUILT-IN TEMPERATURE SENSOR MEASURE ###
        Vadc = Vdd*DataVal/(2**AdcRes)                                                  # retrieve corresponding voltage at ADC channel input [V]
        Meas = str(round((Vadc-Vth)/Kd+Tofs,1))                                         # convert voltage to temperature (and round result to have only one decimal digit) [C]
        LogRx = ActStr+RegName+' = '+Meas+' C'

    elif (RegName == 'extsen1_temperature') or (RegName == 'extsen2_temperature') or \
        (RegName == 'extsen3_temperature') or (RegName == 'extsen4_temperature') :      ### 0x01-0x04. EXTERNAL TEMPERATURE SENSORS MEASURE ###
        Meas = str(round((DataVal-Tkc)/10,1))                                           # convert from Kelvin to Celsius
        LogRx = ActStr+RegName+' = '+Meas+' C'

    elif (RegName == 'mst_relative_time') :                                             ### 0x05. TIME ELAPSED SINCE LAST MASTER RESET ###
        Meas = DataVal                                                                  # save number of cycles (NB: actual time depends on MCU CCP2 setting)
        Days = DataVal//(24*3600)
        DataVal = DataVal%(24*3600)
        Hours = DataVal//3600
        DataVal %= 3600
        Minutes = DataVal//60
        DataVal %= 60
        Seconds = DataVal
        LogRx = ActStr+RegName+' = '+str(Days)+'d . '+str( \
            Hours)+'h : '+str(Minutes)+'m : '+str(Seconds)+'s ('+str(Meas)+')'

    elif (RegName == 'eeprom_parameters') :                                             ### 0x06. EEPROM PARAMETERS OF MASTER CORE ###
        Meas = str(DataVal)
        ParName = list(AdrMapW.keys())[CntRp]                                           # retrieve parameter name
        CntRp += 1
        LogRx = ActStr+RegName+'#'+str(CntRp)+' | '+ParName+' = '+Meas

    elif (RegName == 'csl_status') :                                                      ### 0x07. CSL STATUS ###
        if DataVal == 0 :
            Meas = 'Initializing'
        elif DataVal == 1 :
            Meas = 'Open'
        elif DataVal == 2 :
            Meas = 'Closed'
        elif DataVal == 3 :
            Meas = 'Faulty'
        elif DataVal == 4 :
            Meas = 'Invalid'
        LogRx = ActStr+RegName+' = '+Meas+' ('+str(DataVal)+')'

    elif (RegName == 'dac_value') :                                                       ### 0x08. LAST DAC VALUE SET IN SAFETY MODE ###
        Meas = Vdd*DataVal/(2**AdcRes)
        LogRx = ActStr+RegName+' = '+str(round(Meas,3))+' V ('+str(DataVal)+')'

    elif (RegName == 'mst_crc') :                                                         ### 0x09. MASTER STORED AND CALCULATED FW CRC VALUES (FLASH) ###
        Meas = hex(DataVal>>16)                                                         # retrieve stored-in-flash CRC
        DataVal = hex(DataVal%(2**16))                                                  # retrieve run-time-calculated CRC
        LogRx = ActStr+RegName+' : STO = 0x'+str(Meas[2:].upper())+ \
            ' | CAL = 0x'+str(DataVal[2:].upper())

    elif (RegName == 'devid') :                                                         ### 0x0A. DEVID VALUE FROM MCU FLASH ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper())

    elif (RegName == 'UDID') :                                                          ### 0x0B. UDID VALUE FROM MCU FLASH ###
        CntRp += 1
        Meas = format(DataVal,"06X")                                                    # convert value in hexadecimal and pad 0s to have always a 6-digit representation
        LogRx = ActStr+RegName+'#'+str(CntRp)+' = 0x'+Meas

    elif (RegName == 'RCD_SUM') :                                                       ### 0x0C. RCD BUFFER SUM FOR TRIPPING ###
        Meas = (DataVal/RC_DC_BUF_SZ-PWM_OFST)*PWM_SENS/1000                            # convert PWM estimate to current measure [mA]
        LogRx = ActStr+RegName+' = '+str(DataVal)+' ('+str(round(Meas,1))+' mA)'

    elif (RegName == 'RCD_DT') :                                                        ### 0x0D. RCD PWM HIGH-TO-HIGH CYCLE MEASURE ###
        Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)

    elif (RegName == 'RCD_DH') :                                                        ### 0x0E. RCD PWM HIGH-TO-LOW CYCLE MEASURE ###
        Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)

        
    # Energy meter [MST] #
    elif (RegName == 'EM_STAT0') or (RegName == 'EM_STAT1') or \
        (RegName == 'EM_STAT2') or (RegName == 'EM_STAT3') :                            ### 0x20-0x23. STATUS REGISTERS FROM ENERGY METER ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper())

    elif (RegName == 'EM_VLT1') or (RegName == 'EM_VLT2') or \
        (RegName == 'EM_VLT3') :                                                        ### 0x24-0x26. PHASE VOLTAGE MEASURES FROM ENERGY METER ###
        Meas = str(DataVal/100)
        LogRx = ActStr+RegName+' = '+Meas+' Vrms'

    elif (RegName == 'EM_CUR1') or (RegName == 'EM_CUR2') or \
        (RegName == 'EM_CUR3') or (RegName == 'EM_CURN') :                              ### 0x27-0x2A. PHASE CURRENT MEASURES FROM ENERGY METER ###
        Meas = str(DataVal/1000)
        LogRx = ActStr+RegName+' = '+Meas+' Arms'

    elif (RegName == 'EM_PWAT') :                                                       ### 0x2B. TOTAL (SUM) ACTIVE POWER FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -4*(2**16-DataVal)                                                   # apply two-complement to retrieve negative value
        else :
            Meas = 4*DataVal                                                            # multiplying by 4 yields the sum of all phases
        LogRx = ActStr+RegName+' = '+str(Meas)+' W'

    elif (RegName == 'EM_PWA1') or (RegName == 'EM_PWA2') or \
        (RegName == 'EM_PWA3')  :                                                       ### 0x2C-0x2E. PHASE ACTIVE POWER FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -(2**16-DataVal)                                                     # apply two-complement to retrieve negative value
        else :
            Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)+' W'

    elif (RegName == 'EM_PWRT') :                                                       ### 0x2F. TOTAL (SUM) REACTIVE POWER FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -4*(2**16-DataVal)                                                   # apply two-complement to retrieve negative value
        else :
            Meas = 4*DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)+' VAR'

    elif (RegName == 'EM_PWR1') or (RegName == 'EM_PWR2') or \
        (RegName == 'EM_PWR3')  :                                                       ### 0x30-0x32. PHASE REACTIVE POWER FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -(2**16-DataVal)                                                     # apply two-complement to retrieve negative value
        else :
            Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)+' VAR'

    elif (RegName == 'EM_PWFT') or (RegName == 'EM_PWF1') or \
        (RegName == 'EM_PWF2') or (RegName == 'EM_PWF3')  :                             ### 0x33-0x36. TOTAL (MEAN) AND PHASE POWER FACTOR FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -0.001*(2**16-DataVal)                                               # apply two-complement to retrieve negative value
        else :
            Meas = 0.001*DataVal
        LogRx = ActStr+RegName+' = '+str(round(Meas,3))

    elif (RegName == 'EM_FREQ') :                                                       ### 0x37. MAIN FREQUENCY FROM ENERGY METER ###
        Meas = DataVal/100                                                              # value from EM is expressed in x0.01 Hz
        LogRx = ActStr+RegName+' = '+str(round(Meas,2))+' Hz'

    elif (RegName == 'EM_THDV1') or (RegName == 'EM_THDV2') or \
        (RegName == 'EM_THDV3') or (RegName == 'EM_THDI1') or \
        (RegName == 'EM_THDI2') or (RegName == 'EM_THDI3') :                            ### 0x38-0x3D. VOLTAGE AND CURRENT TOTAL HARMONIC DISTORTION FROM ENERGY METER ###
        Meas = DataVal/100                                                              # value from EM is expressed in x0.01 %
        LogRx = ActStr+RegName+' = '+str(round(Meas,2))+' %'

    elif (RegName == 'EM_TEMP') :                                                       ### 0x3E. CHIP TEMPERATURE FROM ENERGY METER ###
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -(DataVal-2**15)
        else :
            Meas = DataVal                                                              # value from EM is expressed in C with MSb as sign
        LogRx = ActStr+RegName+' = '+str(Meas)+' C'


    # dsPIC registers [MST] #
    elif (RegName == 'REG_RCON') :                                                      ### 0x50. RESET CONTROL REGISTER (RCON) ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Power-on reset\n    * '+str((DataVal>>1)&1)+' : Brown-out reset' \
                '\n    * '+str((DataVal>>2)&1)+' : Wake-up from Idle mode\n    * '+str((DataVal>>3)&1)+' : Wake-up from Sleep mode' \
                '\n    * '+str((DataVal>>4)&1)+' : Watchdog timeout reset\n    * '+str((DataVal>>6)&1)+' : Software reset' \
                '\n    * '+str((DataVal>>7)&1)+' : MCLR pin reset\n    * '+str((DataVal>>7)&1)+' : Configuration mismatch reset' \
                '\n    * '+str((DataVal>>14)&1)+' : Opcode or W-register reset\n    * '+str((DataVal>>15)&1)+' : Trap reset'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'REG_MBISTCON') :                                                  ### 0x51. MEMORY BUILT-IN SELF TEST CONTROL REGISTER (MBISTCON) ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Enabled (self-cleared after execution)\n    * '+str((DataVal>>4)&1)+' : Status (1/0=failed/passed)' \
                '\n    * '+str((DataVal>>7)&1)+' : Executed\n    * '+str((DataVal>>8)&1)+' : Fault inject'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'REG_INTCON1') :                                                   ### 0x52. INTERRUPT CONTROL REGISTER #1 (INTCON1) ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str((DataVal>>1)&1)+' : Oscillator failure trap flag\n    * '+str((DataVal>>2)&1)+' : Stack error trap flag' \
                '\n    * '+str((DataVal>>3)&1)+' : Address error trap flag\n    * '+str((DataVal>>4)&1)+' : Math error trap flag' \
                '\n    * '+str((DataVal>>6)&1)+' : Divide-by-zero error trap flag\n    * '+str((DataVal>>7)&1)+' : Shift accumulator error trap flag' \
                '\n    * '+str((DataVal>>8)&1)+' : Catastrophic overflow trap enabled\n    * '+str((DataVal>>9)&1)+' : Accumulator B overflow trap enabled' \
                '\n    * '+str((DataVal>>10)&1)+' : Accumulator A overflow trap enabled\n    * '+str((DataVal>>11)&1)+' : Accumulator B catastrophic overflow trap flag' \
                '\n    * '+str((DataVal>>12)&1)+' : Accumulator A catastrophic overflow trap flag\n    * '+str((DataVal>>13)&1)+' : Accumulator B overflow trap flag' \
                '\n    * '+str((DataVal>>14)&1)+' : Accumulator A overflow trap flag\n    * '+str((DataVal>>15)&1)+' : Interrupt nesting disabled'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'REG_INTCON4') :                                                   ### 0x53. INTERRUPT CONTROL REGISTER #4 (INTCON4) ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Software generated trap flag\n    * '+str((DataVal>>1)&1)+' : Double ECC error flag'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'REG_ANSELA') or (RegName == 'REG_ANSELB') or \
        (RegName == 'REG_ANSELC') or (RegName == 'REG_ANSELD') or \
        (RegName == 'REG_ANSELE') :                                                     ### 0x54-0x58. MCU ANALOG/DIGITAL PORT REGISTER (ANSELA/B/C/D/E) ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+' (1/0=ana/dig)')

    elif (RegName == 'REG_TRISA') or (RegName == 'REG_TRISB') or \
        (RegName == 'REG_TRISC') or (RegName == 'REG_TRISD') or \
        (RegName == 'REG_TRISE') :                                                      ### 0x59-0x5D. MCU INPUT/OUTPUT PORT REGISTER (TRISA/B/C/D/E) ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+' (1/0=in/out)')

    elif (RegName == 'REG_PORTA') or (RegName == 'REG_PORTB') or \
        (RegName == 'REG_PORTC') or (RegName == 'REG_PORTD') or \
        (RegName == 'REG_PORTE') :                                                      ### 0x5E-0x62. MCU HIGH/LOW PORT REGISTER (PORTA/B/C/D/E) ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+' (1/0=high/low)')


    # Parameters [MST] #
    elif (RegName == 'MB_MODE') :                                                       ### 0x90. MODBUS MODE ###
        if DataVal == 0 :
            Meas = 'RTU'
        elif DataVal == 1 :
            Meas = 'ASCII'
        else :
            Meas = 'INVALID ('+str(DataVal)+')'
        LogRx = ActStr+RegName+' = '+Meas
    
    elif (RegName == 'modbus_id') :                                                     ### 0x91. MODBUS SLAVE ID ###
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas

    elif (RegName == 'modbus_rate') :                                                   ### 0x92. MODBUS BAUD RATE ###
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas+' b/s'

    elif (RegName == 'MB_PARI') :                                                       ### 0x93. MODBUS PARITY ###
        if DataVal == 0 :
            Meas = 'ODD'
        elif DataVal == 1 :
            Meas = 'EVEN'
        elif DataVal == 2 :
            Meas = 'NONE'
        else :
            Meas = 'INVALID ('+str(DataVal)+')'
        LogRx = ActStr+RegName+' = '+Meas

    elif (RegName == 'EM_VREF_GAIN') :                                                  ### 0x94. REFERENCE FOR EM VOLTAGE GAIN CALIBRATION ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' V'

    elif (RegName == 'EM_IREF_GAIN') :                                                  ### 0x95. REFERENCE FOR EM CURRENT GAIN CALIBRATION ###
        Meas = str(round(DataVal/1000,3))
        LogRx = ActStr+RegName+' = '+Meas+' A'

    elif (RegName == 'UNDRV_THR') :                                                     ### 0x96. UNDERVOLTAGE ERROR THRESHOLD ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' V'

    elif (RegName == 'OVERV_THR') :                                                     ### 0x97. OVERVOLTAGE ERROR THRESHOLD ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' V'

    elif (RegName == 'RCD_CUR') :                                                       ### 0x98. RCD NOMINAL CURRENT ###
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas+' mA'                                         # NB: assuming RCD for DC residual current detection

    elif (RegName == 'RCD_PER') :                                                       ### 0x99. RCD PERCENTAGE TRIPPING THRESHOLD ###
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas+' %'

    elif (RegName == 'RCD_OFS') :                                                       ### 0x9A. RCD PWM DUTY-CYCLE OFFSET ###
        PWM_OFST = DataVal                                                              # update GUI offset to match the actual one used by MCU (needed if RCD_SUM is read)
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -(2**16-DataVal)                                                     # apply two-complement to retrieve negative value
        else :
            Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(round(Meas/100,2))+' % ('+str(Meas)+')'

    elif (RegName == 'RCD_SEN') :                                                       ### 0x9B. RCD PWM SENSITIVITY ###
        PWM_SENS = DataVal                                                              # update GUI sensitivity to match the actual one used by MCU (needed if RCD_SUM is read)
        if (DataVal>>15) != 0 :                                                         # check MSb for measure sign
            Meas = -(2**16-DataVal)                                                     # apply two-complement to retrieve negative value
        else :
            Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(round(Meas/10,1))+' mA/% ('+str(Meas)+')'

    elif (RegName == 'MIN_TEMP_THR') :                                                  ### 0x9C. MINIMUM TEMPERATURE ERROR THRESHOLD ###
        Meas = (DataVal-Tkc)/10                                                         # dK-to-C convertion
        LogRx = ActStr+RegName+' = '+str(round(Meas,1))+' C ('+str(DataVal)+')'

    elif (RegName == 'MAX_TEMP_THR') :                                                  ### 0x9D. MAXIMUM TEMPERATURE ERROR THRESHOLD ###
        Meas = (DataVal-Tkc)/10                                                         # dK-to-C convertion
        LogRx = ActStr+RegName+' = '+str(round(Meas,1))+' C ('+str(DataVal)+')'
        


    # Error registers [MST] #
    elif (RegName == 'M_ERR_SOA') :                                                     ### 0xB0. MASTER ERROR REGISTER : S/C AND O/L EVENTS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : S/C event on line #1\n    * '+str((DataVal>>1)&1)+' : S/C event on line #2' \
                '\n    * '+str((DataVal>>2)&1)+' : S/C event on line #3\n    * '+str((DataVal>>3)&1)+' : S/C event on line #4' \
                '\n    * '+str((DataVal>>4)&1)+' : O/L event on line #1\n    * '+str((DataVal>>5)&1)+' : O/L event on line #2' \
                '\n    * '+str((DataVal>>6)&1)+' : O/L event on line #3\n    * '+str((DataVal>>7)&1)+' : O/L event on line #4'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_UART') :                                                    ### 0xB1. MASTER ERROR REGISTER : UART ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : UART1 RX overflow\n    * '+str((DataVal>>1)&1)+' : UART1 wrong RX stop bit' \
                '\n    * '+str((DataVal>>2)&1)+' : UART1 wrong RX parity bit\n    * '+str((DataVal>>3)&1)+' : UART2 RX overflow' \
                '\n    * '+str((DataVal>>4)&1)+' : UART2 wrong RX stop bit\n    * '+str((DataVal>>5)&1)+' : UART2 wrong RX parity bit'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_SPI') :                                                     ### 0xB2. MASTER ERROR REGISTER : SPI ###
        Meas = hex(DataVal)
        if VERB :
                ExtrLog = '\n    * '+str(DataVal&1)+' : SPI2 unknown RX ISR\n    * '+str((DataVal>>1)&1)+' : SPI2 wrong starting state' \
                '\n    * '+str((DataVal>>2)&1)+' : SPI2 frame error\n    * '+str((DataVal>>3)&1)+' : SPI2 TX underrun' \
                '\n    * '+str((DataVal>>4)&1)+' : SPI2 RX overflow'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_EEPROM') :                                                  ### 0xB3. MASTER ERROR REGISTER : EEPROM ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Invalid reading address\n    * '+str((DataVal>>1)&1)+' : Invalid reading length'  \
                '\n    * '+str((DataVal>>2)&1)+' : Invalid writing address\n    * '+str((DataVal>>3)&1)+' : Invalid writing length'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_TRAP') :                                                    ### 0xB4. MASTER ERROR REGISTER : TRAPS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Accumulator A overflow\n    * '+str((DataVal>>1)&1)+' : Accumulator B overflow'  \
                '\n    * '+str((DataVal>>2)&1)+' : Accumulator A catastrophic overflow\n    * '+str((DataVal>>3)&1)+' : Accumulator B catastrophic overflow' \
                '\n    * '+str((DataVal>>4)&1)+' : Shift accumulator\n    * '+str((DataVal>>5)&1)+' : Divide-by-zero' \
                '\n    * '+str((DataVal>>6)&1)+' : Shift accumulator\n    * '+str((DataVal>>7)&1)+' : Divide-by-zero' \
                '\n    * '+str((DataVal>>8)&1)+' : Math\n    * '+str((DataVal>>9)&1)+' : Address' \
                '\n    * '+str((DataVal>>10)&1)+' : Stack\n    * '+str((DataVal>>11)&1)+' : Oscillator failure' \
                '\n    * '+str((DataVal>>12)&1)+' : Double ECC\n    * '+str((DataVal>>13)&1)+' : Software-generated' \
                '\n    * '+str((DataVal>>10)&1)+' : NVM address\n    * '+str((DataVal>>11)&1)+' : DMA address' \
                '\n    * '+str((DataVal>>10)&1)+' : DO stack overflow\n    * '+str((DataVal>>11)&1)+' : Auxiliary PLL loss of lock'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_TEMP') :                                                    ### 0xB5. MASTER ERROR REGISTER : TEMPERATURE SENSORS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Unexpected state during interrupt\n    * '+str((DataVal>>1)&1)+' : No edges on TDT timeout'  \
                '\n    * '+str((DataVal>>2)&1)+' : Too few edges on TDT timeout\n    * '+str((DataVal>>3)&1)+' : Unexpected timeout' \
                '\n    * '+str((DataVal>>4)&1)+' : CCP overflow\n    * '+str((DataVal>>5)&1)+' : Out-of-bound measure' \
                '\n    * '+str((DataVal>>6)&1)+' : Wrong final pulse duration\n    * '+str((DataVal>>7)&1)+' : Wrong overall cycle duration' \
                '\n    * '+str((DataVal>>8)&1)+' : Wrong high pulse duration\n    * '+str((DataVal>>9)&1)+' : No initial tempreature acknowledge from Slave' \
                '\n    * '+str((DataVal>>10)&1)+' : Wrong checksum received from Slave over MSI-C'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_RCD') :                                                     ### 0xB6. MASTER ERROR REGISTER : RCD ###
        Meas = hex(DataVal)
        if VERB :
                ExtrLog = '\n    * '+str(DataVal&1)+' : DC residual current event detected\n    * '+str((DataVal>>1)&1)+' : AC residual current event detected' \
                '\n    * '+str((DataVal>>2)&1)+' : Inconsistent PWM cycle duration\n    * '+str((DataVal>>3)&1)+' : PWM input capture buffer overflow' \
                '\n    * '+str((DataVal>>4)&1)+' : Invalid autocalibration state\n    * '+str((DataVal>>5)&1)+' : RC event caused by average exceeding threshold' \
                '\n    * '+str((DataVal>>6)&1)+' : RC event caused by no PWM edge detected\n    * '+str((DataVal>>7)&1)+' : RC event caused by PWM overrated waveform' \
                '\n    * '+str((DataVal>>8)&1)+' : RC event caused by CCP7 overflow'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_SLAVE') :                                                   ### 0xB7. MASTER ERROR REGISTER : SLAVE + MSI ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Slave core general reset\n    * '+str((DataVal>>1)&1)+' : Slave core watchdog reset' \
                '\n    * '+str((DataVal>>2)&1)+' : Slave operating in low-power mode\n    * '+str((DataVal>>3)&1)+' : Slave PRAM write verification issue' \
                '\n    * '+str((DataVal>>4)&1)+' : Slave operating in debug mode\n    * '+str((DataVal>>5)&1)+' : Corrupted entering-SM checksum received from Slave over MSI-A' \
                '\n    * '+str((DataVal>>6)&1)+' : Corrupted exiting-SM checksum received from Slave over MSI-B\n    * '+str((DataVal>>7)&1)+' : Corrupted SOA checksum received from Slave over MSI-E'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_EM') :                                                      ### 0xB8. MASTER ERROR REGISTER : ENERGY METER ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Overvoltage event on line #1\n    * '+str((DataVal>>1)&1)+' : Undervoltage event on line #1'  \
                '\n    * '+str((DataVal>>2)&1)+' : Overvoltage event on line #2\n    * '+str((DataVal>>3)&1)+' : Undervoltage event on line #2' \
                '\n    * '+str((DataVal>>4)&1)+' : Overvoltage event on line #3\n    * '+str((DataVal>>5)&1)+' : Undervoltage event on line #3' \
                '\n    * '+str((DataVal>>6)&1)+' : Invalid reading address\n    * '+str((DataVal>>7)&1)+' : Invalid writing address' \
                '\n    * '+str((DataVal>>8)&1)+' : Unknown power mode\n    * '+str((DataVal>>9)&1)+' : Writing timeout expired'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_CSL') :                                                     ### 0xB9. MASTER ERROR REGISTER : CSL ###
        Meas = hex(DataVal)
        if VERB :
                ExtrLog = '\n    * '+str(DataVal&1)+' : Wrong CAN_TRIP line readback\n    * '+str((DataVal>>1)&1)+' : Wrong TRIP_REQ readback' \
                '\n    * '+str((DataVal>>2)&1)+' : Inconsistent PWM cycle duration\n    * '+str((DataVal>>3)&1)+' : WM input capture buffer overflow' \
                '\n    * '+str((DataVal>>4)&1)+' : invalid autocalibration state'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_COMM') :                                                    ### 0xBA. MASTER ERROR REGISTER : MODBUS + USER INTERFACE ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : MODBUS initialization exception\n    * '+str((DataVal>>1)&1)+' : Invalid command direction ID received from UI' \
                '\n    * '+str((DataVal>>2)&1)+' : Invalid command action ID received from UI\n    * '+str((DataVal>>3)&1)+' : Invalid RD address received from UI'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_SM') :                                                      ### 0xBB. MASTER ERROR REGISTER : SAFETY MODE ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : FEEL_G line wrong readback during SM\n    * '+str((DataVal>>1)&1)+' : SOA_TRIP line generic issue during SM'  \
                '\n    * '+str((DataVal>>2)&1)+' : No SOA_TRIP edges detected during SM\n    * '+str((DataVal>>3)&1)+' : Too many SOA_TRIP edges detected during SM' \
                '\n    * '+str((DataVal>>4)&1)+' : RC_TRIP line generic issue during SM\n    * '+str((DataVal>>5)&1)+' : No RC_TRIP edges detected during SM' \
                '\n    * '+str((DataVal>>6)&1)+' : Too many RC_TRIP edges detected during SM\n    * '+str((DataVal>>7)&1)+' : Generic PSRES issue during SM' \
                '\n    * '+str((DataVal>>8)&1)+' : No PSRES edges detected during SM\n    * '+str((DataVal>>9)&1)+' : Too many PSRES edges detected during SM' \
                '\n    * '+str((DataVal>>10)&1)+' : Generic entering-SM acknowledge from Slave issue over MSI-A\n    * '+str((DataVal>>11)&1)+' : Generic exiting-SM message Slave issue over MSI-B'  \
                '\n    * '+str((DataVal>>12)&1)+' : Missed Slave-exiting-SM acknowledge during SM'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'M_ERR_VAR') :                                                     ### 0xBC. MASTER ERROR REGISTER : VARIOUS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Band-gap voltage check above threshold\n    * '+str((DataVal>>1)&1)+' : Band-gap voltage check below threshold'  \
                '\n    * '+str((DataVal>>2)&1)+' : Unrecognized state value in main-loop\n    * '+str((DataVal>>3)&1)+' : Flash memory FW CRC mismatch' \
                '\n    * '+str((DataVal>>4)&1)+' : Flash memory configuration registers mismatch\n    * '+str((DataVal>>5)&1)+' : RCON anomalous reset error detected' \
                '\n    * '+str((DataVal>>6)&1)+' : UDID mismatch\n    * '+str((DataVal>>7)&1)+' : DEVID mismatch' \
                '\n    * '+str((DataVal>>8)&1)+' : BIST not executed\n    * '+str((DataVal>>9)&1)+' : BIST failed' \
                '\n    * '+str((DataVal>>10)&1)+' : Single ECC detection\n    * '+str((DataVal>>11)&1)+' : New SM kick triggered while main state machine is not in SM_OFF' \
                '\n    * '+str((DataVal>>12)&1)+' : MSI-E invalid checksum for Slave error registers response\n    * '+str((DataVal>>13)&1)+' : MSI-E invalid data length for Slave error registers response' \
                '\n    * '+str((DataVal>>14)&1)+' : Slave parameters not acknowledged during initialization\n    * '+str((DataVal>>15)&1)+' : Clock failure detected by FSCM' \
                '\n    * '+str((DataVal>>16)&1)+' : Oscillator PLL out-of-lock'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)


    # General info [SLV]
    elif (RegName == 'S_TIMEB') :                                                       ### 0xC0. TIME ELAPSED SINCE LAST SLAVE RESET ###
        Meas = DataVal                                                                  # save number of cycles (NB: actual time depends on MCU CCP2 setting)
        Days = DataVal//(24*3600)
        DataVal = DataVal%(24*3600)
        Hours = DataVal//3600                                                           # NB: "%" and "//" are respectively the modulo and floor-division operators
        DataVal %= 3600                                     
        Minutes = DataVal//60
        DataVal %= 60
        Seconds = DataVal
        LogRx = ActStr+RegName+' = '+str(Days)+'d . '+str(Hours)+'h : '+str(Minutes)+'m : '+str(Seconds)+'s ('+str(Meas)+')'

    elif (RegName == 'S_CRC') :                                                         ### 0xC1. CALCULATED CRC OF PRAM FIRMWARE ###
        Meas = hex(DataVal)
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper())

    elif (RegName == 'S_SCIV1') or (RegName == 'S_SCIV2') or \
        (RegName == 'S_SCIV3') or (RegName == 'S_SCIV4') :                              ### 0xC2-0xC5. S/C ALGORITHM INTEGRATION VALUE ###
        Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)

    elif (RegName == 'S_OLC1') or (RegName == 'S_OLC2') or \
        (RegName == 'S_OLC3') or (RegName == 'S_OLC4') :                                ### 0xC6-0xC9. O/L ALGORITHM COUNTER VALUE ###
        Meas = DataVal
        LogRx = ActStr+RegName+' = '+str(Meas)

    # Parameters [SLV] #
    elif (RegName == 'SOA_IRNG') :                                                      ### 0xE0. SLAVE SOA CURRENT RANGE PARAMETER ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' xIn'

    elif (RegName == 'ITHR_OL') :                                                       ### 0xE1. SLAVE O/L TRIPPING CURRENT THRESHOLD ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' xIn'
    
    elif (RegName == 'ITHR_SC') :                                                       ### 0xE2. SLAVE S/C TRIPPING CURRENT THRESHOLD ###
        Meas = str(round(DataVal/100,2))
        LogRx = ActStr+RegName+' = '+Meas+' xIn'

    elif (RegName == 'CTHR_SC') :                                                       ### 0xE3. SLAVE S/C TRIPPING COUNTER THRESHOLD ###
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas

    elif (RegName == 'SOA_ADC_OFS') :                                                   ### 0xE4. SLAVE S/C AND O/L ADC MEASUREMENT OFFSET ###
        if DataVal >= 32768 :                                                           # check if value is negative from the MSb
            DataVal = 32768-DataVal
        Meas = str(DataVal)
        LogRx = ActStr+RegName+' = '+Meas+' AdcLev'

    # Error registers [SLV]
    elif (RegName == 'S_ERR_SOA') :                                                     ### 0xF0. SLAVE ERROR REGISTER : S/C + O/L EVENTS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : S/C event on line #1\n    * '+str((DataVal>>1)&1)+' : S/C event on line #2' \
                '\n    * '+str((DataVal>>2)&1)+' : S/C event on line #3\n    * '+str((DataVal>>3)&1)+' : S/C event on line #4' \
                '\n    * '+str((DataVal>>4)&1)+' : O/L event on line #1\n    * '+str((DataVal>>5)&1)+' : O/L event on line #2' \
                '\n    * '+str((DataVal>>6)&1)+' : O/L event on line #3\n    * '+str((DataVal>>7)&1)+' : O/L event on line #4'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'S_ERR_TRAP') :                                                    ### 0xF1. SLAVE ERROR REGISTER : TRAPS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Accumulator A overflow\n    * '+str((DataVal>>1)&1)+' : Accumulator B overflow'  \
                '\n    * '+str((DataVal>>2)&1)+' : Accumulator A catastrophic overflow\n    * '+str((DataVal>>3)&1)+' : Accumulator B catastrophic overflow' \
                '\n    * '+str((DataVal>>4)&1)+' : Shift accumulator\n    * '+str((DataVal>>5)&1)+' : Divide-by-zero' \
                '\n    * '+str((DataVal>>6)&1)+' : Shift accumulator\n    * '+str((DataVal>>7)&1)+' : Divide-by-zero' \
                '\n    * '+str((DataVal>>8)&1)+' : Math\n    * '+str((DataVal>>9)&1)+' : Address' \
                '\n    * '+str((DataVal>>10)&1)+' : Stack\n    * '+str((DataVal>>11)&1)+' : Oscillator failure' \
                '\n    * '+str((DataVal>>12)&1)+' : Double ECC\n    * '+str((DataVal>>13)&1)+' : Software-generated'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'S_ERR_TEMP') :                                                    ### 0xF2. SLAVE ERROR REGISTER : TEMPERATURE SENSORS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Multiple initial O/L temperatures received\n    * '+str((DataVal>>1)&1)+' : No initial O/L temperature received' \
                '\n    * '+str((DataVal>>2)&1)+' : Invalid temperature checksum received'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'S_ERR_SM') :                                                      ### 0xF3. SLAVE ERROR REGISTER : SAFETY MODE ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : Generic Master/MSI issue\n    * '+str((DataVal>>1)&1)+' : Received invalid checksum from Master over MSI-B'  \
                '\n    * '+str((DataVal>>2)&1)+' : Unexpected SM state in MSI-A ISR\n    * '+str((DataVal>>3)&1)+' : No exit-SM permission reply from Master' \
                '\n    * '+str((DataVal>>4)&1)+' : Too few VI1 ADC readings\n    * '+str((DataVal>>5)&1)+' : Too few VI2 ADC readings' \
                '\n    * '+str((DataVal>>6)&1)+' : Too few VI3 ADC readings\n    * '+str((DataVal>>7)&1)+' : Too few VI4 ADC readings' \
                '\n    * '+str((DataVal>>8)&1)+' : VI1 above threshold\n    * '+str((DataVal>>9)&1)+' : VI1 below threshold' \
                '\n    * '+str((DataVal>>10)&1)+' : VI2 above threshold\n    * '+str((DataVal>>11)&1)+' : VI2 below threshold' \
                '\n    * '+str((DataVal>>12)&1)+' : VI3 above threshold\n    * '+str((DataVal>>13)&1)+' : VI3 below threshold' \
                '\n    * '+str((DataVal>>14)&1)+' : VI4 above threshold\n    * '+str((DataVal>>15)&1)+' : VI4 below threshold' \
                '\n    * '+str((DataVal>>16)&1)+' : Invalid enter-SM request over MSI-A\n    * '+str((DataVal>>17)&1)+' : FEEL_B line wrong readback'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)

    elif (RegName == 'S_ERR_VAR') :                                                     ### 0xF4. SLAVE ERROR REGISTER : VARIOUS ###
        Meas = hex(DataVal)
        if VERB :
            ExtrLog = '\n    * '+str(DataVal&1)+' : PRAM CRC mismatch\n    * '+str((DataVal>>1)&1)+' : Unknown state in main-loop'  \
                '\n    * '+str((DataVal>>2)&1)+' : RCON anomalous reset error detected\n    * '+str((DataVal>>3)&1)+' : BIST not executed' \
                '\n    * '+str((DataVal>>4)&1)+' : BIST failed\n    * '+str((DataVal>>5)&1)+' : Band-gap voltage check below threshold' \
                '\n    * '+str((DataVal>>6)&1)+' : Band-gap voltage check above threshold\n    * '+str((DataVal>>7)&1)+' : SC/OL ADCs missed trigger' \
                '\n    * '+str((DataVal>>8)&1)+' : UI unexpected event occured over MSI-D\n    * '+str((DataVal>>9)&1)+' : UI invalid action requested by Master over MSI-D' \
                '\n    * '+str((DataVal>>10)&1)+' : UI invalid reading address requested by Master over MSI-D\n    * '+str((DataVal>>11)&1)+' : UI invalid writing address requested by Master over MSI-D' \
                '\n    * '+str((DataVal>>12)&1)+' : Maximum timeout expired while initializing parameters\n    * '+str((DataVal>>13)&1)+' : Clock failure detected by FSCM' \
                '\n    * '+str((DataVal>>14)&1)+' : Oscillator PLL out-of-lock\n    * '+str((DataVal>>15)&1)+' : Missed O/L algorithm execution cycle'
        else :
            ExtrLog = ''
        LogRx = ActStr+RegName+' = 0x'+str(Meas[2:].upper()+ExtrLog)
    else :
        if VERB :
            print('TM ERROR : Command not mapped in "ConvRdMsg" function.')

    return LogRx, Meas


"""
" Function to convert and interpret RD and RDM telemetry message.
"""
def ConvAckMsg( RegName, DataBuf, ActInt ) :
    if ActInt == ACT_EX :
        ActStr = 'EX '
    else :
        ActStr = 'WR '
    DataVal = DataBuf[LEN_INFO_TM-1]
    for j in range(LEN_INFO_TM-1) :                                                     # NB: conversion to unsigned (in case signed interpretation is needed, implement 2-complement operation for the specific case!)
        DataVal += DataBuf[j]*256*(LEN_INFO_TM-1-j)                                     # convert received byte buffer into corresponding single value
    if DataVal == ACK_ID :
        LogRx = ActStr+RegName+' = ACK'
    elif DataVal == NACK_ID :
        LogRx = ActStr+RegName+' = NACK'
    else :
        LogRx = ActStr+RegName+' = UNKNOWN ('+str(DataVal)+')'
    return LogRx, DataVal


"""
" Function for parsing messages received by the MCU.
"""
def RxParser( RxMsg, VerbFlag ) :
    global VERB
    VERB = VerbFlag
    Check = False
    LogRx = '-'
    Val = 0
    RxVect = list(bytearray.fromhex(RxMsg.decode()))                                    # convert from byte array to integer array
    if VERB == True : print(' >> RX | ('+str(len(RxMsg))+'.B) = x'+
            str(RxMsg.hex())+'\n -----')                                                # print final raw TC in hexadecimal format
    if (RxVect[0] & 240) != M2P :                                                       # check direction ID
        if VERB == True : print('TM ERROR : Invalid direction ID.')
    else :
        Act = RxVect[0] & 15                                                            # retrieve TM action
        Data = RxVect[2:]                                                               # retrieve TM data field
        AdrByte = RxVect[1].to_bytes(1,'big')                                           # retrieve TM address
        if (Act == ACT_RD) or (Act == ACT_RM) :                                         # RD or RM message
            if AdrByte in AdrMapR.values() :                                            # check if address byte is in dictionary
                Lvals = list(AdrMapR.values())
                for j in range(len(Lvals)) :
                    if Lvals[j] == AdrByte :
                        break
                Lkeys = list(AdrMapR.keys())
                AdrStr = Lkeys[j]                                                       # retrieve corresponding address string
                LogRx, Val = ConvRdMsg(AdrStr,Data,Act)
                Check = True
            elif VERB == True : print('TM ERROR : Invalid address.')
        elif Act == ACT_EX :                                                            # EX message
            if AdrByte in AdrMapE.values() :
                Lvals = list(AdrMapE.values())
                for j in range(len(Lvals)) :
                    if Lvals[j] == AdrByte :
                        break
                Lkeys = list(AdrMapE.keys())
                AdrStr = Lkeys[j]
                LogRx, Val = ConvAckMsg(AdrStr,Data,Act)
                Check = True
            elif VERB == True : print('TM ERROR : Invalid address.')
        elif Act == ACT_WR :                                                            # WR message
            if AdrByte in AdrMapW.values() :
                Lvals = list(AdrMapW.values())
                for j in range(len(Lvals)) :
                    if Lvals[j] == AdrByte :
                        break
                Lkeys = list(AdrMapW.keys())
                AdrStr = Lkeys[j]
                LogRx, Val = ConvAckMsg(AdrStr,Data,Act)
                Check = True
            elif VERB == True : print('TM ERROR : Invalid address.')
        else :
            if VERB == True : print('TM ERROR : Invalid action.')
            Check = False
    return Check, LogRx, Val

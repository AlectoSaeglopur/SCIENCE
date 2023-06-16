"""
" Title: PXS GUI WITH TKINTER
" Author: Filippo Valmori
" Date: 13/06/2023
" Reference: [1] TutorialsPoint -> https://www.tutorialspoint.com/python/python_gui_programming.htm
"""

### LIBRARIES ###

import sys, os
import tkinter as tk                                                                # include tkinter library (assuming Python3 is used)
import tkinter.ttk as ttk
from time import sleep, time
from datetime import datetime
from pxs_gui_parser_v2 import TxParser, RxParser
from serial import Serial, PARITY_EVEN, PARITY_ODD, PARITY_NONE                     # requires "pip install pyserial"



#### PARAMETERS ###

TerX = b'\n'                                                                        # expected RX termination sequence
DataLen = 12                                                                        # expected RX message data length [B] -> NB: each byte represents an ASCII character, thus x1 info byte = x2 ASCII chars (see byte-to-char conversion in PXS firmware)
ExpLen = DataLen+len(TerX)                                                          # overall expected RX message length [B]



#### VARIABLES ###

FSM = 'DISCONNECTED'                                                                # current FSM state ('DISCONNECTED', 'CONNECTING' or 'CONNECTED')
LoopSt = True                                                                       # main loop state (set to FALSE to close GUI when requested)
SerPar = {  'COM': '',                                                              # serial COM to connect to
            'Rate': -1,                                                             # serial baud-rate [b/s]
            'Nstop': -1,                                                            # serial number of stop bits
            'Parity': -1,                                                           # serial parity
            'Tout': 20e-3,                                                          # serial timeout [s] -> DO NOT CHANGE
            'Fid': -1 }                                                             # serial file ID

SerVar = {  'RxCnt': 0,                                                             # index for counting the overall number of received messages
            'TxIdx': 0,                                                             # index for counting the overall number of transmitted commands
            'PcIdx': 0,                                                             # index over list of pending commands
            'Nrep': 0,                                                              # counter on the number of repetitions
            'TxFlag': False,                                                        # TX flag needed to efficiently cancel commands already sent in "pending_commands.txt"
            'Time1' : -1,                                                           # time reference for RM transmission
            'Delay' : -1,                                                           # delay for RM transmission
            'TcBytes' : -1 }                                                        # packet content for RM transmission


### BUILT-IN FUNCTIONS ###

# Function to initialize GUI.
def init( top, gui, *args, **kwargs ) :
    global w, top_level, root
    w = gui
    top_level = top
    root = top

# Function to start GUI (containing main loop for FSM).
def vp_start_gui( ) :
    global w, root
    root = tk.Tk()
    top = PxsGuiClass(root)                                                     # create actual instance of PxsGuiClass
    init(root,top)
    #root.mainloop()
    while LoopSt :
        root.update()
        if FSM == 'CONNECTING' :
            Exe_Uart_Connect(top)
        elif FSM == 'CONNECTED' :
            Exe_Uart(top)

# Function to create toplevel (starting point when module is imported by another module).
def create_PxsGuiClass( rt, *args, **kwargs ) :
    global w, w_win, root
    root = rt
    w = tk.PxsGuiClass(root)
    GUI_v2_support.set_Tk_var()
    top = PxsGuiClass(w)
    GUI_v2_support.init(w, top, *args, **kwargs)
    return (w, top)

# Function to close GUI and release shell.
def destroy_window( ) :
    global top_level
    top_level.destroy()
    top_level = None

# Function to establish UART serial connection between PC and MCU.
def Exe_Uart_Connect( top ) :
    global FSM, SerPar, SerVar
    try :
        SerPar['Fid'] = Serial(port=SerPar['COM'], baudrate=SerPar['Rate'],
        bytesize=8, parity=SerPar['Parity'], stopbits=SerPar['Nstop'],
        timeout=SerPar['Tout'])                                                     # configure and open new COM port
        SerVar['RxCnt'] = 0                                                         # index for counting the overall number of received messages
        SerVar['TxIdx'] = 0                                                         # index for counting the overall number of transmitted commands
        SerVar['PcIdx'] = 0                                                         # index over list of pending commands
        SerVar['Nrep'] = 0                                                          # counter on the number of repetitions
        SerVar['TxFlag'] = False                                                    # TX flag needed to efficiently cancel commands already sent in "pending_commands.txt"
        fid = open("tx_history.txt", "w")                                           # open file in write/overwrite mode to clear it and remove previous history
        fid.close()
        fid = open("rx_history.txt", "w")
        fid.close()
        fid = open("pending_cmds.txt", "w")
        fid.close()
        FSM = 'CONNECTED'
        top.Update_MsgBox('CONNECT : Connected to '+str(SerPar['COM'])+' @ '+
            str(SerPar['Rate']/1e3)+' kb/s')
    except :
        FSM = 'DISCONNECTED'
        top.Update_MsgBox('CONNECT : Error (COM not available or invalid parameters)')

# Function to execute UART RX/RX routine.
def Exe_Uart( top ) :
    global SerVar
    # Check new telemetry received from MCU #
    while SerPar['Fid'].in_waiting != 0 :                                           # check if any data has been received over COM from MCU
        TimeRx = datetime.now().strftime('%H:%M:%S.%f')[:-3]                        # save RX time
        BytesRx = SerPar['Fid'].read_until(expected=TerX)                           # read bytes until the termination sequence is detected or timeout (from 1st byte reception) expires
        LenRx = len(BytesRx)                                                        # retrieve length of Rx message [B]
        if BytesRx[-len(TerX):] != TerX :                                           # check termination of new message
            top.Update_MsgBox('INVALID RX (timeout) : Len = '+str(LenRx)+
                ' | 0x'+str(BytesRx.hex().upper()))
        elif LenRx != ExpLen :                                                      # check length of new message
            top.Update_MsgBox('INVALID RX (length) : Len = '+str(LenRx)+
                ' | 0x'+str(BytesRx.hex().upper()))
        else :
            SerVar['RxCnt'] += 1                                                    # increase counter of RX messages
            BytesRx = BytesRx[:-len(TerX)]                                          # remove termination sequence
            Check, LogRx, RxVal = RxParser(BytesRx,top.Read_Verbose())              # invoke RX parser in "pxs_gui_parser.py"
            LogRx = 'RX #'+ str(SerVar['RxCnt'])+' @ '+str( \
                TimeRx)+' >> '+LogRx
            top.Update_MsgBox(LogRx)                                                # print decoded telemetry
            fid = open("rx_history.txt", "a")                                       # open file in write/append mode
            fid.write(LogRx+'\n')                                                   # write new command into RX history file as new line
            fid.close()
    # Check new telecommands to transmit from user #
    if SerVar['Nrep'] == 0 :
        fid = open("pending_cmds.txt", "r")                                         # open file in read mode
        RdLines = fid.readlines()                                                   # read file containing pending commands not yet sent
        fid.close()
        Nrows = len(RdLines)
        if Nrows > SerVar['PcIdx'] :                                                # readcheck if there are new commands from user
            SerVar['TxIdx'] += 1                                                    # increase counter of valid TX messages
            CmdId = RdLines[SerVar['PcIdx']]                                        # read next command to be sent
            CmdId = CmdId[:-1]                                                      # remove final '\n' character
            SerVar['PcIdx'] += 1
            TimeTx = datetime.now().strftime('%H:%M:%S.%f')[:-3]                    # save TX time
            LogTx = 'TX #'+ str(SerVar['TxIdx'])+' @ '+str(
                TimeTx)+' << '+str(CmdId)
            SerVar['TxFlag'], SerVar['TcBytes'], SerVar['Nrep'], SerVar['Delay'] = TxParser(
                CmdId,top.Read_Verbose())                                           # invoke TX parser in "pxs_gui_parser.py"           
            if SerVar['TxFlag'] == False :
                LogTx += ' << INVALID COMMAND!'
                SerVar['Nrep'] = 0
            else :
                SerPar['Fid'].write(SerVar['TcBytes'])                              # if message is valid, send it to MCU
                SerVar['Nrep'] -= 1                                                 # decrease number of repetions to be tranmitted
                SerPar['Time1'] = time()                                            # get current time for repetition delay
                sleep(0.001)                                                        # wait 1 ms before transmitting a new command (if in queue)
            fid = open("tx_history.txt", "a")                                       # open file in write/append mode
            fid.write(LogTx+'\n')                                                   # write new command into TX history file as new line
            fid.close()
            top.Update_MsgBox(LogTx)
        elif SerVar['TxFlag'] == True :                                             # if all pending commands so far have been just sent...
            SerVar['TxFlag'] = False
            fid = open("pending_cmds.txt", "w")                                     # clear file (to avoid reading huge content in case of history with several commands
            fid.close()
            SerVar['PcIdx'] = 0
    elif SerVar['TxFlag'] == True :
        Time2 = time()
        if (Time2-SerPar['Time1']) > SerVar['Delay'] :                              # check if repetition delay is expired
            SerPar['Fid'].write(SerVar['TcBytes'])                                  # retransmit TC to MCU
            SerVar['Nrep'] -= 1                                                     # decrease number of repetions to be tranmitted
            SerPar['Time1'] = time()                                                # update reference time for next repetition



### WINDOW CLASS ###

class PxsGuiClass:

    def __init__(self, top=None):

        ### TOPLEVEL WINDOW ###
        _bgcolor = '#d9d9d9'
        _fgcolor = '#000000'
        _compcolor = '#d9d9d9'
        _ana1color = '#d9d9d9'
        _ana2color = '#ececec'
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('winnative')
        self.style.configure('.',background=_bgcolor)
        self.style.configure('.',foreground=_fgcolor)
        self.style.configure('.',font="TkDefaultFont")
        self.style.map('.',background=[('selected', _compcolor), ('active',_ana2color)])


        ###  CLASS PRIVATE METHODS ###
            
        # Function invoked when VERBOSE checkbox is un/ticked to dis/enable verbose mode.
        def Verbose_callback( ) :
            self.C_Verbose_FlagA.set(not(self.C_Verbose_FlagA.get()))                                         # invert checkbutton state upon pressure
            if self.C_Verbose_FlagA.get() == True :
                self.Update_MsgBox('VERBOSE : Verbose mode ON')
            else :
                self.Update_MsgBox('VERBOSE : Verbose mode OFF')
            

        # Function invoked when CONNECT button is pressed to create serial connection (private).
        def Connect_callback( ) :
            global FSM, SerPar
            if FSM == 'DISCONNECTED' :
                SerPar['COM'] = self.E_Com.get()                                        # retrieve parameters info and store that into global structure
                SerPar['Rate'] = int(1e3*float(self.E_Rate.get()))
                SerPar['Nstop'] = int(self.E_Nstop.get())
                if self.M_Parity.get() == 'EVEN' :
                    SerPar['Parity'] = PARITY_EVEN 
                elif self.M_Parity.get() == 'ODD' :
                    SerPar['Parity'] = PARITY_ODD
                else :
                    SerPar['Parity'] = PARITY_NONE
                FSM = 'CONNECTING'
            else :
                self.Update_MsgBox(' CONNECT : Error (already connected)')

        # Function invoked when DISCONNECT button is pressed to break serial connection (private).
        def Disconnect_callback( ) :
            global FSM, SerPar
            FSM = 'DISCONNECTED'
            try :
                SerPar['Fid'].close()                                                   # close COM if open
                self.Update_MsgBox(' DISCONNECT : Disconnected from '+SerPar['COM'])
                SerPar['Fid'] = ''                                                      # cancel FID field content
            except :
                self.Update_MsgBox(' DISCONNECT : Error (already disconnected)')

        # Functio invoked when CLEAR button is pressed to clear message-box (private).
        def Clear_callback( ) :
            self.T_MsgBox.configure(state='normal')
            self.T_MsgBox.delete('1.0',"end")                                           # clear message box
            self.T_MsgBox.configure(state='disabled')
            os.system("cls")                                                            # clear main process shell

        # Function invoked when EXIT button is pressed to top execution and close GUI.
        def Exit_callback( ) :
            global LoopSt
            try :
                self.SerPar['Fid'].close()                                              # close COM if open...
            except :
                pass                                                                    # ...otherwise simply go on
            LoopSt = False                                                              # deassert loop flag to stop GUI execution at next main-loop cycle
            
        # Function invoked when RD button is pressed to transmit a single-read command (private).
        def RdTx_callback( ) :
            global FSM
            if FSM == 'CONNECTED' :
                cmd = 'RD '+self.M_RdCmd.get()
                fid = open("pending_cmds.txt", "a")                                     # open file in write/append mode and get file ID
                fid.write(cmd+'\n')                                                     # write new command into file as new line
                fid.close()
            else :
                self.Update_MsgBox(' RD : Error (must connect first)')

        # Function invoked when RM button is pressed to transmit a multiple-read command (private).
        def RmTx_callback( ) :
            global FSM
            if FSM == 'CONNECTED' :
                Nrep = self.E_Nrep.get()
                Dly = self.E_Dly.get()
                cmd = 'RM '+self.M_RdCmd.get()+' '+str(Nrep)+' '+str(Dly)
                fid = open("pending_cmds.txt", "a")                                     # open file in write/append mode and get file ID
                fid.write(cmd+'\n')                                                     # write new command into file as new line
                fid.close()
            else :
                self.Update_MsgBox(' RM : Error (must connect first)')

        # Function invoked when WR button is pressed to transmit a write command (private).
        def WrTx_callback( ) :
            global FSM
            if FSM == 'CONNECTED' :
                Val = self.E_WrVal.get()
                cmd = 'WR '+self.M_WrCmd.get()+' '+str(Val)
                fid = open("pending_cmds.txt", "a")                                     # open file in write/append mode and get file ID
                fid.write(cmd+'\n')                                                     # write new command into file as new line
                fid.close()
            else :
                self.Update_MsgBox(' WR : Error (must connect first)')

        # Function invoked when EX button is pressed to transmit an execute command (private).
        def ExTx_callback( ) :
            global FSM
            if FSM == 'CONNECTED' :
                cmd = 'EX '+self.M_ExCmd.get()
                fid = open("pending_cmds.txt", "a")                                     # open file in write/append mode and get file ID
                fid.write(cmd+'\n')                                                     # write new command into file as new line
                fid.close()
            else :
                self.Update_MsgBox(' EX : Error (must connect first)')


        ### WINDOW APPEARANCE ###
        
        top.geometry("1000x600+587+261")                                                # set main window dimensions and position
        top.minsize(120, 1)                                                             # minimum rescalable size [NOT ESSENTIAL]
        top.maxsize(3844, 1061)                                                         # maximum rescalable size [NOT ESSENTIAL]
        top.resizable(1, 1)
        top.title("PXS GUI - Filippo Valmori")                                          # set main window title
        top.configure(background='whitesmoke')                                          # set main window color

        # 1. SETTINGS #

        self.F_Stg = tk.LabelFrame(top)                                                 # create control-panel frame
        self.F_Stg.place(relx=0.03, rely=0.03, relheight=0.313, relwidth=0.29)
        self.F_Stg.configure(relief='groove')
        self.F_Stg.configure(foreground="black")
        self.F_Stg.configure(text='''SETTINGS''',font=("Verdana",10,"bold"))
        self.F_Stg.configure(background='whitesmoke')

        self.L_Com = tk.Label(top,anchor='w')                                           # create COM setting label
        self.L_Com.place(relx=0.05, rely=0.08, relheight=0.03, relwidth=0.112)
        self.L_Com.configure(background='whitesmoke')
        self.L_Com.configure(foreground='black')                                        # set text color
        self.L_Com.configure(text='''Interface''',font=("Verdana", 9))
        self.L_Com.configure(padx=0)
        self.E_Com = tk.Entry(top)                                                      # create COM setting entry
        self.E_Com.place(relx=0.19, rely=0.08, height=20, relwidth=0.05)
        self.E_Com.configure(background="white")
        self.E_Com.configure(font="TkFixedFont")
        self.E_Com.configure(foreground="#000000")
        self.E_Com.configure(insertbackground="black")
        self.E_Com.insert(tk.END,'COM2')

        self.L_Rate = tk.Label(top,anchor='w')                                          # create baud-rate setting label
        self.L_Rate.place(relx=0.05, rely=0.13, relheight=0.03, relwidth=0.112)
        self.L_Rate.configure(background='whitesmoke')
        self.L_Rate.configure(foreground="#000000")
        self.L_Rate.configure(text='''Baud rate [kb/s]''',font=("Verdana",9))
        self.L_Rate.configure(padx=0)
        self.E_Rate = tk.Entry(top)                                                     # create baud-rate setting entry
        self.E_Rate.place(relx=0.19, rely=0.13, height=20, relwidth=0.07)
        self.E_Rate.configure(background="white")
        self.E_Rate.configure(font="TkFixedFont")
        self.E_Rate.configure(foreground="#000000")
        self.E_Rate.configure(insertbackground="black")
        self.E_Rate.insert(tk.END, 450.0)

        self.L_Nstop = tk.Label(top,anchor='w')                                         # create number-of-stop-bits setting label
        self.L_Nstop.place(relx=0.05, rely=0.18, relheight=0.03, relwidth=0.072)
        self.L_Nstop.configure(background='whitesmoke')
        self.L_Nstop.configure(foreground="#000000")
        self.L_Nstop.configure(text='''Nstop [b]''',font=("Verdana",9))
        self.L_Nstop.configure(padx=0)
        self.E_Nstop = tk.Entry(top)                                                    # create number-of-stop-bits setting entry
        self.E_Nstop.place(relx=0.19, rely=0.18, height=20, relwidth=0.013)
        self.E_Nstop.configure(background="white")
        self.E_Nstop.configure(font="TkFixedFont")
        self.E_Nstop.configure(foreground="#000000")
        self.E_Nstop.configure(insertbackground="black")
        self.E_Nstop.insert(tk.END, int(1))

        self.L_Parity = tk.Label(top,anchor='w')                                        # create parity setting label
        self.L_Parity.place(relx=0.05, rely=0.23, relheight=0.03, relwidth=0.052)
        self.L_Parity.configure(background='whitesmoke')
        self.L_Parity.configure(foreground="#000000")
        self.L_Parity.configure(text='''Parity''',font=("Verdana",9))
        self.L_Parity.configure(padx=0)
        self.M_Parity_Val = tk.StringVar()
        self.M_Parity = ttk.Combobox(top, width=10, textvariable=self.M_Parity_Val)     # create parity setting menu
        self.M_Parity.place(relx=0.19, rely=0.23, height=20, relwidth=0.065)
        self.M_Parity['values'] = ( 'EVEN','ODD','NONE')
        self.M_Parity.current(0)

        self.L_Verbose = tk.Label(top,anchor='w')                                       # create verbose setting label
        self.L_Verbose.place(relx=0.05, rely=0.28, relheight=0.03, relwidth=0.067)
        self.L_Verbose.configure(background='whitesmoke')
        self.L_Verbose.configure(foreground="#000000")

        self.L_Verbose.configure(text='''Verbose''',font=("Verdana",9))
        self.L_Verbose.configure(padx=0)
        self.C_Verbose_FlagA = tk.IntVar()
        self.C_Verbose_FlagB = tk.IntVar()
        self.C_Verbose = tk.Checkbutton(top, variable=self.C_Verbose_FlagA,
            command=Verbose_callback)                                                   # create verbose setting checkbox
        self.C_Verbose.place(relx=0.19, rely=0.28, relheight=0.03, relwidth=0.015)
        self.C_Verbose.configure(activebackground="#ececec")
        self.C_Verbose.configure(activeforeground="#000000")
        self.C_Verbose.configure(background='whitesmoke')
        self.C_Verbose.configure(foreground="#000000")
        self.C_Verbose.configure(justify='left')
        self.C_Verbose.configure(variable=self.C_Verbose_FlagB)
        

        # 2. COMMANDS #

        self.F_Set = tk.LabelFrame(top)                                                 # create commands-list frame
        self.F_Set.place(relx=0.03, rely=0.38, relheight=0.58, relwidth=0.29)
        self.F_Set.configure(relief='groove')
        self.F_Set.configure(foreground="black")
        self.F_Set.configure(text='''COMMANDS''',font=("Verdana",10,"bold"))
        self.F_Set.configure(background='whitesmoke')

        # 2a. RD/RM #

        self.B_RdTx = tk.Button(top, command=RdTx_callback)                             # create RD button
        self.B_RdTx.place(relx=0.248, rely=0.442, relheight=0.035, relwidth=0.05)
        self.B_RdTx.configure(activebackground="#ececec")
        self.B_RdTx.configure(activeforeground="#000000")
        self.B_RdTx.configure(background='deepskyblue')
        self.B_RdTx.configure(foreground="#000000")
        self.B_RdTx.configure(pady="0")
        self.B_RdTx.configure(text='''RD''',font=("Verdana", 8,"bold"))

        self.M_RdCmd_Val = tk.StringVar()                                               # create read-commands menu
        self.M_RdCmd = ttk.Combobox(top, textvariable=self.M_RdCmd_Val)
        self.M_RdCmd.place(relx=0.05, rely=0.442, relheight=0.04, relwidth=0.181)
        self.M_RdCmd.configure(font=("Verdana",9))
        self.M_RdCmd.set('-')
        self.M_RdCmd['values'] = (  'mst_temperature',
                                    'extsen4_temperature',
                                    'mst_relative_time',
                                    'eeprom_parameters',
                                    'csl_status',
                                    'dac_value',
                                    'mst_crc',
                                    'devid',
                                    'modbus_rate' )
        
        self.B_RmTx = tk.Button(top, command=RmTx_callback)                             # create RM button
        self.B_RmTx.place(relx=0.248, rely=0.51, relheight=0.035, relwidth=0.05)
        self.B_RmTx.configure(activebackground="#ececec")
        self.B_RmTx.configure(activeforeground="#000000")
        self.B_RmTx.configure(background='deepskyblue')
        self.B_RmTx.configure(foreground="#000000")
        self.B_RmTx.configure(pady="0")
        self.B_RmTx.configure(text='''RM''',font=("Verdana", 8,"bold"))

        self.L_Nrep = tk.Label(top,anchor='w')                                           # create COM setting label
        self.L_Nrep.place(relx=0.05, rely=0.51, relheight=0.03, relwidth=0.05)
        self.L_Nrep.configure(background='whitesmoke')
        self.L_Nrep.configure(foreground='black')                                        # set text color
        self.L_Nrep.configure(text='''Nrep''',font=("Verdana", 9))
        self.L_Nrep.configure(padx=0)
        self.E_Nrep = tk.Entry(top)                                                      # create COM setting entry
        self.E_Nrep.place(relx=0.09, rely=0.511, height=20, relwidth=0.03)
        self.E_Nrep.configure(background="white")
        self.E_Nrep.configure(font="TkFixedFont")
        self.E_Nrep.configure(foreground="#000000")
        self.E_Nrep.configure(insertbackground="black")
        self.E_Nrep.insert(tk.END,1)

        self.L_Dly = tk.Label(top,anchor='w')                                           # create COM setting label
        self.L_Dly.place(relx=0.13, rely=0.51, relheight=0.03, relwidth=0.05)
        self.L_Dly.configure(background='whitesmoke')
        self.L_Dly.configure(foreground='black')                                        # set text color
        self.L_Dly.configure(text='''Dly [s]''',font=("Verdana", 9))
        self.L_Dly.configure(padx=0)
        self.E_Dly = tk.Entry(top)                                                      # create COM setting entry
        self.E_Dly.place(relx=0.18, rely=0.511, height=20, relwidth=0.05)
        self.E_Dly.configure(background="white")
        self.E_Dly.configure(font="TkFixedFont")
        self.E_Dly.configure(foreground="#000000")
        self.E_Dly.configure(insertbackground="black")
        self.E_Dly.insert(tk.END,0.5)

        self.S_RdWr = ttk.Separator(root, orient='horizontal')                          # create RDM-to-WR sections separator
        self.S_RdWr.place(relx=0.054, rely=0.60, relwidth=0.24)

        # 2b. WR #

        self.B_WrTx = tk.Button(top, command=WrTx_callback)                             # create WR button
        self.B_WrTx.place(relx=0.248, rely=0.643, relheight=0.035, relwidth=0.05)
        self.B_WrTx.configure(activebackground="#ececec")
        self.B_WrTx.configure(activeforeground="#000000")
        self.B_WrTx.configure(background='deepskyblue')
        self.B_WrTx.configure(foreground="#000000")
        self.B_WrTx.configure(pady="0")
        self.B_WrTx.configure(text='''WR''',font=("Verdana", 8,"bold"))

        self.M_WrCmd_Val = tk.StringVar()                                               # create write-commands menu
        self.M_WrCmd = ttk.Combobox(top, textvariable=self.M_WrCmd_Val)
        self.M_WrCmd.place(relx=0.05, rely=0.643, relheight=0.04, relwidth=0.181)
        self.M_WrCmd.configure(font=("Verdana",9))
        self.M_WrCmd.set('-')
        self.M_WrCmd['values'] = (  'modbus_id',
                                    'modbus_rate' )
        
        self.L_WrVal = tk.Label(top,anchor='w')                                         # create write-value  label
        self.L_WrVal.place(relx=0.05, rely=0.71, relheight=0.03, relwidth=0.05)
        self.L_WrVal.configure(background='whitesmoke')
        self.L_WrVal.configure(foreground='black')                                      # set text color
        self.L_WrVal.configure(text='''Value''',font=("Verdana", 9))
        self.L_WrVal.configure(padx=0)
        self.E_WrVal = tk.Entry(top)                                                    # create COM setting entry
        self.E_WrVal.place(relx=0.096, rely=0.71, height=20, relwidth=0.07)
        self.E_WrVal.configure(background="white")
        self.E_WrVal.configure(font="TkFixedFont")
        self.E_WrVal.configure(foreground="#000000")
        self.E_WrVal.configure(insertbackground="black")
        self.E_WrVal.insert(tk.END,0)

        self.S_WrEx = ttk.Separator(root, orient='horizontal')                          # create RDM-to-WR sections separator
        self.S_WrEx.place(relx=0.054, rely=0.78, relwidth=0.24)

        # 2c. EX #

        self.B_ExTx = tk.Button(top, command=ExTx_callback)                             # create EX button
        self.B_ExTx.place(relx=0.248, rely=0.825, relheight=0.035, relwidth=0.05)
        self.B_ExTx.configure(activebackground="#ececec")
        self.B_ExTx.configure(activeforeground="#000000")
        self.B_ExTx.configure(background='deepskyblue')
        self.B_ExTx.configure(foreground="#000000")
        self.B_ExTx.configure(pady="0")
        self.B_ExTx.configure(text='''EX''',font=("Verdana", 8,"bold"))

        self.M_ExCmd_Val = tk.StringVar()                                               # create write-commands menu
        self.M_ExCmd = ttk.Combobox(top, textvariable=self.M_ExCmd_Val)
        self.M_ExCmd.place(relx=0.05, rely=0.825, relheight=0.04, relwidth=0.181)
        self.M_ExCmd.configure(font=("Verdana",9))
        self.M_ExCmd.set('-')
        self.M_ExCmd['values'] = (  'mst_reset',
                                    'mst_clear_errors',
                                    'slv_reset',
                                    'slv_clear_errors' )
        

        # 3. MESSAGES #

        self.F_Txt = tk.LabelFrame(top)                                                 # create control-panel frame
        self.F_Txt.place(relx=0.35, rely=0.03, relheight=0.735, relwidth=0.62)
        self.F_Txt.configure(relief='groove')
        self.F_Txt.configure(foreground="black")
        self.F_Txt.configure(text='''MESSAGES''',font=("Verdana",10,"bold"))
        self.F_Txt.configure(background='whitesmoke')

        self.S_MsgBox = tk.Scrollbar(root,orient=tk.VERTICAL)                           # create scrollbar for message text-box
        self.S_MsgBox.pack(side=tk.RIGHT, fill=tk.Y)                                    # set scrollbar position and direction [NOT NEEDED IF LINE BELOW IS UNCOMMENTED]
        self.S_MsgBox.place(relx=0.93,rely=0.08, relheight=0.64)                        # set scrollbar diension and postion
        self.T_MsgBox = tk.Text(top,wrap=tk.NONE, yscrollcommand=self.S_MsgBox.set)     # create message text-box
        self.T_MsgBox.place(relx=0.375, rely=0.08, relheight=0.64, relwidth=0.555)
        self.T_MsgBox.configure(background="white")
        self.T_MsgBox.configure(font=('Verdana',9))
        self.T_MsgBox.configure(foreground="black")
        self.T_MsgBox.configure(insertbackground="black")
        self.T_MsgBox.configure(selectbackground="#c4c4c4")
        self.T_MsgBox.configure(wrap="word")
        self.T_MsgBox.configure(state='disabled')
        self.S_MsgBox.config(command=self.T_MsgBox.yview)


        #  CONTROLS #

        self.F_Ctrl = tk.LabelFrame(top)                                                # create control-panel frame
        self.F_Ctrl.place(relx=0.35, rely=0.80, relheight=0.1595, relwidth=0.62)
        self.F_Ctrl.configure(relief='groove')
        self.F_Ctrl.configure(foreground="black")
        self.F_Ctrl.configure(text='''CONTROLS''',font=("Verdana",10,"bold"))
        self.F_Ctrl.configure(background='whitesmoke')

        self.B_Connect = tk.Button(top, command=Connect_callback)                       # create connect button
        self.B_Connect.place(relx=0.38, rely=0.855, relheight=0.06, relwidth=0.115)
        self.B_Connect.configure(activebackground="#ececec")
        self.B_Connect.configure(activeforeground="#000000")
        self.B_Connect.configure(background='lime')
        self.B_Connect.configure(foreground="#000000")
        self.B_Connect.configure(pady="0")
        self.B_Connect.configure(text='''CONNECT''',font=("Verdana", 9,"bold"))

        self.B_Disconnect = tk.Button(top, command=Disconnect_callback)                 # create disconnect button
        self.B_Disconnect.place(relx=0.525, rely=0.855, relheight=0.06, relwidth=0.115)
        self.B_Disconnect.configure(activebackground="#ececec")
        self.B_Disconnect.configure(activeforeground="#000000")
        self.B_Disconnect.configure(background='orange')
        self.B_Disconnect.configure(foreground="#000000")
        self.B_Disconnect.configure(pady="0")
        self.B_Disconnect.configure(text='''DISCONNECT''',font=("Verdana", 9,"bold"))

        self.B_Clear = tk.Button(top, command=Clear_callback)                           # create clear button
        self.B_Clear.place(relx=0.675, rely=0.855, relheight=0.06, relwidth=0.115)
        self.B_Clear.configure(activebackground="#ececec")
        self.B_Clear.configure(activeforeground="#000000")
        self.B_Clear.configure(background='yellow')
        self.B_Clear.configure(foreground="#000000")
        self.B_Clear.configure(pady="0")
        self.B_Clear.configure(text='''CLEAR''',font=("Verdana", 9,"bold"))

        self.B_Exit = tk.Button(top, command=Exit_callback)                             # create new button
        self.B_Exit.place(relx=0.825, rely=0.855, relheight=0.06, relwidth=0.115)
        self.B_Exit.configure(activebackground="#ececec")
        self.B_Exit.configure(activeforeground="#000000")
        self.B_Exit.configure(background='red')
        self.B_Exit.configure(foreground="#000000")
        self.B_Exit.configure(pady="0")
        self.B_Exit.configure(text='''EXIT''',font=("Verdana", 9,"bold"))


    ###  CLASS PUCLIC METHODS ###

    # Function to update text-message box (public).
    def Update_MsgBox( self, Str ) :
        self.T_MsgBox.configure(state='normal')                                         # enable writing mode
        self.T_MsgBox.insert(tk.END,' \u2022 ' + Str + '\n')                            # add new content to mesage box
        self.T_MsgBox.configure(state='disabled')                                       # disable writing mode (read-only)
        self.T_MsgBox.update()                                                          # refresh message box
        self.T_MsgBox.see("end")                                                        # automatically scroll down to latest line

    # Function to red current VERBOSE checkbox value (public).
    def Read_Verbose( self ) :
        return self.C_Verbose_FlagA.get()


if __name__ == '__main__':
    vp_start_gui()



### NOTES ###

# 0. No additional packages need to be installed (only Tkinter, which is already included in Python installation).



### @todo ###

# 1. add additional tabs
# 2. add real time plots

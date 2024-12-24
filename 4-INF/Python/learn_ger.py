
### LIBRARIES ###

from collections import namedtuple                                                                      # to create pseudo-structures as in C
from numpy import inf, zeros
from os import system                                                                                   # to call "clear" or "cls" shell functions
from pandas import isna, read_excel                                                                     # requires "pis install numpy && pip install pandas && pip install xlrd && pip install openpyxl"
from random import randint                                                                              # to generate random values
from re import search, finditer, IGNORECASE
from sys import argv, platform                                                                          # to check current OS and terminal input arguments



### PARAMETERS ###

TabId = 'DLG'                                                                                           # excel sheet tab to be loaded (see allowed values in "valid_tabs")
LngId = 'G2M'                                                                                           # language translation direction (see allowed values in "valid_lngs")
ModId = 'RDS'                                                                                           # execution mode (see allowed values in "valid_mods")
MinDlg = 1                                                                                              # lower dialogue number to be processed (NB: set "1" not to skip any lower dialogue)
MaxDlg = 100                                                                                            # upper dialogue number to be processed (NB: set "100" not to skip any upper dialogue)
LskNdl = 0                                                                                              # Number of lines to be skipped at the beginning of non-dialogue tab (NB: set "0" not to skip any lower line)
UskNdl = 0                                                                                              # Number of lines to be skipped at the end of non-dialogue tab (NB: set "0" not to skip any upper line)



### CONSTANTS ###

sheet_struct = namedtuple('sheet_struct',['name','data','nrows','history'])                             # structure with fields needed to handle loaded sheet/tab
valid_tabs = ["DLG", "ADJ", "APC", "NOU", "VER", "EXP", "SEN", "AUS"]                                   # list of valid values for "TabId" parameter
valid_lngs = ["M2G", "G2M"]                                                                             # list of valid values for "LngId" parameter >> see NOTE#1
valid_mods = ["RDD", "RDS", "SQF", "SQB"]                                                               # list of valid values for "ModId" parameter
len_par = 3                                                                                             # number of characters of each parameter-entry (e.g. "VER", "SQF", etc)

DlgSri = [2,10,17,25,36,46,54,66,76,84,94,99,105,113,126,136,145,                                       
         152,161,172,182,194,205,215,225,232,244,255,273,286,296,
         307,315,323,334,350,363,373,385,398,410,422,434,449,463,
         477,488,501,514,531,544,556,568,582,597,613,631,643,662,
         676,692,710,728,754,768,780]                                                                   # starting row-indeces of all dialogues in the Excel file >> see NOTE#2

col_dlg_mtr = 1                                                                                         # mother-tongue column-index in dialog sheet
col_dlg_ger = 2                                                                                         # german column-index in dialog sheet
col_dlg_not = 3                                                                                         # notes column-index in dialog sheet
col_non_dlg_ger = 1                                                                                     # german column-index in non-dialog sheets
col_non_dlg_pro = 2                                                                                     # pronunciation column-index in non-dialog sheets
col_non_dlg_mtr = 3                                                                                     # mother-tongue column-index in non-dialog sheets
col_non_dlg_not = 4                                                                                     # notes column-index in non-dialog sheets
no_columns = 4                                                                                          # maximum number of columns among all Excel sheets

len_par = 3                                                                                             # number of characters of each parameter-entry (e.g. "VER", "SQF", etc)

idx_session = {
  "std": 0,                                                                                             # standard session index
  "fnd": 1                                                                                              # "find"-session index
}

find_cmd = {
    "id" : 'find',                                                                                      # "find"-command ID
    "ext_n" : ' --n'                                                                                    # "find"-command extra flag for including notes to results
}

update_cmd = {
    "id" : 'update',                                                                                    # "update"-command ID
}



### GLOBAL VARIABLES ###

break_flag = False
active_sessions = []
idx_display = zeros(no_columns,dtype=int)
find_arg = {
    "pattern" : '',
    "extra" : ''
}



### FUNCTIONS ###

def override_params( args ) :
    """ Function to override parameters according to terminal extra arguments."""
    global TabId, LngId, ModId
    Nargs = len(args)
    if Nargs > 0 :
        for j in range(Nargs) :
            val = args[j].upper()
            if val in valid_tabs :
                TabId = val
            elif val in valid_lngs :
                LngId = val
            elif val in valid_mods :
                ModId = val


def check_parameters( ) :
    """ Function to check parameters correctness. """
    global MinDlg, MaxDlg, LskNdl, UskNdl
    Ndlg = len(DlgSri)-1                                                                                # calculate number of available dialogues
    if MaxDlg > Ndlg :
        MaxDlg = Ndlg                                                                                   # reset "MaxDlg" to maximum available
    if LskNdl < 0:
        LskNdl = 0                                                                                      # reset "LskNdl" to miminum allowed
    if UskNdl < 0:
        UskNdl = 0                                                                                      # reset "UskNdl" to miminum allowed
    if MinDlg < 1 or MinDlg > MaxDlg :
        raise Exception('>> Invalid "MinDlg/MaxDlg": shall be between 1 and "Ndlg".')
    if TabId not in valid_tabs :
        raise Exception('>> Invalid "TabId": value shall be part of "valid_tabs".')
    if LngId not in valid_lngs :
        raise Exception('>> Invalid "LngId": value shall be part of "valid_lngs".')
    if ModId not in valid_mods :
        raise Exception('>> Invalid "ModId": value shall be part of "valid_mods".')
    if not(all(len(item) == len_par for item in valid_tabs)) :
        raise Exception('>> Invalid length of entries in "valid_tabs".')
    if not(all(len(item) == len_par for item in valid_mods)) :
        raise Exception('>> Invalid length of entries in "valid_tabs".')
    if not(all(len(item) == len_par for item in valid_lngs)) :
        raise Exception('>> Invalid length of entries in "valid_tabs".')


def clear_shell( ) :
    """ Function to clear shell. """
    CurOS = platform[:3]                                                                                # get first x3 letters of current OS
    if CurOS == 'win' :
        system("cls")                                                                                   # clear Windows shell
    elif CurOS == 'lin' :
        system("reset")
        system("clear")                                                                                 # clear Ubuntu/Android shell


def check_exit_condition( keys ) :
    """ Function to check exit/quit condition. """
    if keys.lower() == 'q' :
        clear_shell()
        exit()


def check_end_condition( ) :
    """ Function to check if all items of the current tab have been already processed. """
    if ((TabId == 'DLG') and (ModId == 'RDS') and (len(active_sessions[idx_session['std']].history) >= DlgSri[MaxDlg]-DlgSri[MinDlg-1]-3*(MaxDlg-(MinDlg-1)))) or \
        ((TabId == 'DLG') and (ModId == 'SQF') and (MinDlg-1+len(active_sessions[idx_session['std']].history) >= MaxDlg)) or \
        ((TabId == 'DLG') and (ModId == 'SQB') and (MaxDlg-1-len(active_sessions[idx_session['std']].history) < MinDlg-1)) or \
        ((TabId == 'DLG') and (ModId == 'RDD') and (len(active_sessions[idx_session['std']].history) >= MaxDlg-MinDlg+1)) or \
        ((TabId != 'DLG') and (len(active_sessions[idx_session['std']].history) >= active_sessions[idx_session['std']].nrows-LskNdl-UskNdl)) :
            print('\n>> END: entries in "'+TabId+'"-tab are over!')
            exit()


def set_idx_display( ) :
    """ Function to set the order of columns to display. """
    if len(active_sessions) == 1 :                                                                      # if not in a FIND-session...
        if TabId == 'DLG' :
            if LngId == 'M2G' :
                idx_display[0] = col_dlg_mtr
                idx_display[1] = col_dlg_ger
                idx_display[2] = col_dlg_not
                idx_display[3] = -1
            else :
                idx_display[0] = col_dlg_ger
                idx_display[1] = col_dlg_mtr
                idx_display[2] = col_dlg_not
                idx_display[3] = -1
        else :
            if LngId == 'M2G' :
                idx_display[0] = col_non_dlg_mtr
                idx_display[1] = col_non_dlg_ger
                idx_display[2] = col_non_dlg_pro
                idx_display[3] = col_non_dlg_not
            else :
                idx_display[0] = col_non_dlg_ger
                idx_display[1] = col_non_dlg_pro
                idx_display[2] = col_non_dlg_mtr
                idx_display[3] = col_non_dlg_not


def read_tab( tab_id ) :
    """ Function to load a new sheet/tab from Excel file. """
    global break_flag
    data = read_excel (r'Deutsch.xlsx',tab_id,skiprows=0,header=None)                                   # read specific sheet from Excel file (NB: "r" needed to address special character, such as "\")
    nrows = data.shape[0]-2                                                                             # get number of rows (skipping first x2 header-rows)
    history = []                                                                                        # reset history
    new_sheet = sheet_struct(tab_id,data,nrows,history)                                                 # create new structure for handling new session
    active_sessions.append(new_sheet)                                                                   # append new sessions to global list
    break_flag = False                                                                                  # reset break flag
   

def wait_for_input_keys( ):
    """ Function to wait for user input and parsing find/update-requests. """
    global break_flag
    keys = input('\n >> NEXT...\n')
    check_exit_condition(keys)
    if check_find_request(keys) | check_update_request(keys) :                                          # if a valid request arrived...
        break_flag = True                                                                               # assert break flag


def check_find_pending( ) :
    """ Function to check if a new FIND request is pending. """
    flag = False
    if len(active_sessions) > 1 :
        flag = True
    return flag


def execute_find( ) :
    """ Function to execute a FIND request. """
    Nres = 0
    if active_sessions[idx_session['fnd']].name == 'DLG' :
        for i in range(1,active_sessions[idx_session['fnd']].nrows-1) :
            TxtMtr = active_sessions[idx_session['fnd']].data.loc[i,col_dlg_mtr]
            TxtGer = active_sessions[idx_session['fnd']].data.loc[i,col_dlg_ger]
            TxtNot = active_sessions[idx_session['fnd']].data.loc[i,col_dlg_not]
            if not(isna(TxtGer)) and not(isna(TxtMtr)) :                                                # if cells are not blank...
                if search(find_arg["pattern"],TxtGer,IGNORECASE) or search(find_arg["pattern"],TxtMtr,IGNORECASE) :
                    Nres = Nres+1
                    print('#' + str(Nres) + ' [' + str(i) + ']\n')
                    print(TxtGer + '\n')
                    print(TxtMtr + '\n')
                    print("-------\n")
            if find_arg["extra"] == find_cmd["ext_n"] and not(isna(TxtNot)) and search(find_arg["pattern"],TxtNot,IGNORECASE) :
                    Nres = Nres+1
                    print('#' + str(Nres) + ' [' + str(i) + ']\n')
                    print(TxtNot + '\n')
                    print("-------\n")
    else : 
        for i in range(1,active_sessions[idx_session['fnd']].nrows-1) :
            TxtMtr = active_sessions[idx_session['fnd']].data.loc[i,col_non_dlg_mtr]
            TxtGer = active_sessions[idx_session['fnd']].data.loc[i,col_non_dlg_ger]
            TxtNot = active_sessions[idx_session['fnd']].data.loc[i,col_non_dlg_not]
            if not(isna(TxtGer)) and not(isna(TxtMtr)) :
                if search(find_arg["pattern"],TxtGer,IGNORECASE) or search(find_arg["pattern"],TxtMtr,IGNORECASE) :
                    Nres = Nres+1
                    print('#' + str(Nres) + ' [' + str(i) + ']\n')
                    print(TxtGer + '\n')
                    print(TxtMtr + '\n')
                    if find_arg["extra"] != find_cmd["ext_n"] and not(isna(TxtNot)) :
                        print(TxtNot + '\n')
                    print("-------\n")
            if find_arg["extra"] == find_cmd["ext_n"] and not(isna(TxtNot)) and search(find_arg["pattern"],TxtNot,IGNORECASE) :
                    Nres = Nres+1
                    print('#' + str(Nres) + ' [' + str(i) + ']\n')
                    print(TxtNot + '\n')
                    print("-------\n")
    print(str(Nres) + ' results found for "'+ find_arg["pattern"]+'" in "'+active_sessions[idx_session['fnd']].name+'" tab.\n')
    active_sessions.pop()
    find_arg["pattern"] = ''
    find_arg["extra"] = ''
    wait_for_input_keys()


def check_find_request( keys ):
    """ Function to parse find-request commands. """
    flag = False
    msg_len = len(keys)
    cmd_req = keys[0:len(find_cmd["id"])]
    space_idx = [i.start() for i in finditer(' ',keys)]
    if msg_len >= 10 and cmd_req == find_cmd["id"] and len(space_idx) >= 2 :                            # e.g. "find adj ganz" or "find dlg anfangen --n" 
        tab_req = keys[len(find_cmd["id"])+1:len(find_cmd["id"])+len_par+1].upper()
        if tab_req in valid_tabs :
            global TabId, find_arg
            TabId = tab_req
            flag = True
            if keys[-len(find_cmd["ext_n"]):] == find_cmd["ext_n"] :
                find_arg["pattern"] = keys[len(find_cmd["id"])+ len(tab_req)+2:msg_len-len(find_cmd["ext_n"])]
                find_arg["extra"] = find_cmd["ext_n"]
            else :
                find_arg["pattern"] = keys[len(find_cmd["id"])+ len(tab_req)+2:msg_len]
                find_arg["extra"] = ''
    return flag


def check_update_request( keys ):
    """ Function to parse update-request commands. """
    flag = False
    msg_req = keys[0:len(update_cmd["id"])]
    msg_len = len(keys)
    space_idx = [i.start() for i in finditer(' ',keys)]
    if len(space_idx) >= 2 and msg_req == update_cmd["id"] and len(keys) >= len(update_cmd["id"])+len_par+5:
        param = keys[len(update_cmd["id"])+1:len(update_cmd["id"])+len_par+1].lower()
        value = keys[len(update_cmd["id"])+len_par+2:].upper()
        if (param == 'tab') and (value in valid_tabs) :                                                 # to update "TabId"
            global TabId
            TabId = value
            active_sessions.pop()
            flag = True
        elif (param == 'lng') and (value in valid_lngs) :                                               # to update "LngId"
            global LngId
            LngId = value
            active_sessions.pop()
            flag = True
        elif (param == 'mod') and (value in valid_mods) :                                               # to update "ModId"
            global ModId
            ModId = value
            active_sessions.pop()
            flag = True
        elif (param == 'dlm') and (len(space_idx) == 3) :                                               # to update "MinDlg" and "MinDlg"
            global MinDlg, MaxDlg
            MinDlg = int(keys[space_idx[1]+1:space_idx[2]])
            MaxDlg = int(keys[space_idx[2]+1:])
            active_sessions.pop()
            flag = True
        elif (param == 'nsk') and (len(space_idx) == 3) :                                               # to update "LskNdl" and "UskNdl"
            global LskNdl, UskNdl
            LskNdl = int(keys[space_idx[1]+1:space_idx[2]])
            UskNdl = int(keys[space_idx[2]+1:])
            active_sessions.pop()
            flag = True
    return flag


def print_header( idx ) :
    """ Function to print header in standard execution. """
    print('*** ' + '[' + str(len(active_sessions[idx_session['std']].history)+1) + '|' + str(idx+1) + '] ***\n')


def execute_dialogue_rds_mode_cycle( ) :
    """ Function to process a new item of dialogue tab in random-sentence mode. """
    check_end_condition()
    while True :
        idx_item = randint(DlgSri[MinDlg-1],DlgSri[MaxDlg]-4)                                           # generate random row-index
        if not(isna(active_sessions[idx_session['std']].data.loc[idx_item,2])) and not(idx_item+1 in DlgSri) and not(idx_item in active_sessions[idx_session['std']].history) :      # avoid blank, title and already processed indeces 
            print_header(idx_item)
            print('> ' + active_sessions[idx_session['std']].data.loc[idx_item,idx_display[0]])
            keys = input('\n -----\n')
            check_exit_condition(keys)
            print('> ' + active_sessions[idx_session['std']].data.loc[idx_item,idx_display[1]] + '\n')
            return idx_item


def execute_dialogue_seq_mode_cycle( ) :
    """ Function to process a new item of dialogue tab in sequencial (backward/forward) mode. """
    check_end_condition()
    if ModId == 'SQF' :
        idx_item = MinDlg-1+len(active_sessions[idx_session['std']].history)
    elif ModId == 'SQB' :
        idx_item = MaxDlg-1-len(active_sessions[idx_session['std']].history)
    print_header(idx_item)
    DlgLen = DlgSri[idx_item+1]-DlgSri[idx_item]-3
    for i in range(DlgLen) :
        print('> ' + active_sessions[idx_session['std']].data.loc[DlgSri[idx_item]+i,idx_display[0]])
        keys = input('')
        check_exit_condition(keys)
        print('> ' + active_sessions[idx_session['std']].data.loc[DlgSri[idx_item]+i,idx_display[1]] + '\n\n-----\n')
    print(active_sessions[idx_session['std']].data.loc[DlgSri[idx_item],idx_display[2]] + '\n')
    return idx_item


def execute_dialogue_rdd_mode_cycle( ):
    """ Function to process a new item of dialogue tab in random-dialogue mode. """
    check_end_condition()
    while True :
        idx_item = randint(MinDlg-1,MaxDlg-1)
        if not(idx_item in active_sessions[idx_session['std']].history) :
            print_header(idx_item)
            DlgLen = DlgSri[idx_item+1]-DlgSri[idx_item]-3
            for i in range(DlgLen) :
                print('> ' + active_sessions[idx_session['std']].data.loc[DlgSri[idx_item]+i,idx_display[0]])
                keys = input('')
                check_exit_condition(keys)
                print('> ' + active_sessions[idx_session['std']].data.loc[DlgSri[idx_item]+i,idx_display[1]] + '\n\n-----\n')
            print(active_sessions[idx_session['std']].data.loc[DlgSri[idx_item],idx_display[2]] + '\n')
            return idx_item


def parse_dialogue_tab_cycle( ) :
    """ Function to parse a new item of dialogue tab. """
    if ModId == 'RDS' :                                                                                 # i.e. random-sentence mode (RDS)
        idx_item = execute_dialogue_rds_mode_cycle()
    elif ModId == 'SQF' or ModId == 'SQB' :                                                             # i.e. forward/backward-sequential mode (SQF/SQB)
        idx_item = execute_dialogue_seq_mode_cycle()
    elif ModId == 'RDD' :                                                                               # i.e. random-dialogue mode (RDD)
        idx_item = execute_dialogue_rdd_mode_cycle()
    active_sessions[idx_session['std']].history.append(idx_item)


def execute_non_dialogue_seq_mode_cycle( ) :
    """ Function to process a new item of current non-dialogue tab in sequential mode. """
    check_end_condition()
    while True :
        if ModId == 'SQF' :
            idx_item = len(active_sessions[idx_session['std']].history)+LskNdl+2
        elif ModId == 'SQB' :
            idx_item = active_sessions[idx_session['std']].nrows-UskNdl-len(active_sessions[idx_session['std']].history)+1
        print_header(idx_item)
        for j in range(no_columns) :
            field = active_sessions[idx_session['std']].data.loc[idx_item,idx_display[j]]
            if not(isna(field)) :
                print(field+'\n')
            if j < len(idx_display)-1 :
                keys = input(' -----\n')
                check_exit_condition(keys)
        return idx_item


def execute_non_dialogue_rdm_mode_cycle( ) :
    """ Function to process a new item of current non-dialogue tab in random mode. """
    check_end_condition()
    while True :
        idx_item = randint(LskNdl+2,active_sessions[idx_session['std']].nrows-UskNdl+1)
        if not(idx_item in active_sessions[idx_session['std']].history) :
            print_header(idx_item)
            for j in range(no_columns) :
                field = active_sessions[idx_session['std']].data.loc[idx_item,idx_display[j]]
                if not(isna(field)) :
                    print(field+'\n')
                if j < len(idx_display)-1 :
                    keys = input(' -----\n')
                    check_exit_condition(keys)
            return idx_item


def parse_non_dialogue_tab_cycle( ) :
    """ Function to parse a new item of a non-dialogue tab. """
    if ModId == 'RDS' or ModId == 'RDD' :                                                               # i.e. random-sentence/dialogue mode (RDS/RDD)
        idx_item = execute_non_dialogue_rdm_mode_cycle()
    elif ModId == 'SQF' or ModId == 'SQB' :                                                             # i.e. forward/backward-sequential mode (SQF/SQB)
        idx_item = execute_non_dialogue_seq_mode_cycle()
    active_sessions[idx_session['std']].history.append(idx_item)


def debug_operation( ) :
    """ Function to debug all main parameters and global variable at run-time. """
    print('TabId = ' + TabId)
    print('LngId = ' + LngId)
    print('ModId = ' + ModId)
    print('MinDlg = ' + str(MinDlg) + ' | MaxDlg = ' + str(MaxDlg))
    print('LskNdl = ' + str(LskNdl) + ' | UskNdl = ' + str(UskNdl))
    print(' ...............\n ')



### MAIN ###

override_params(argv[1:])                                                                               # check for parameters-override request
while 1 :
    check_parameters()
    read_tab(TabId)
    set_idx_display()
    while not(break_flag) :
        clear_shell()
        #debug_operation()
        if check_find_pending() :
            execute_find()
        else :
            if active_sessions[idx_session['std']].name == 'DLG' :                                      # if current session is handling the dialogue tab...
                parse_dialogue_tab_cycle()
            else :
                parse_non_dialogue_tab_cycle()
            wait_for_input_keys()



### NOTES ###

# 0. To run the script, open a terminal and type "cls && python learn_ger.py". By adding extra arguments the terminal command
#    it is possible to override the value of some parameters specified in the PARAMETERS section. For instance, typing
#    "python learn_ger.py sqf ver" forces "TabId = VER" and "ModId = SQF", regardless of their hard-coded values. 

# 1. Entering 'q' at any moment forces execution to stop and terminal to clear.

# 2. Whenever the message " >> NEXT..." appears, it is possible to enter "find" of "update" commands. The "update"
#    command allows to modify at run-time each parameter. For example:
#    - "update tab ver" or "update tab dlg" causes "TabId = VER" or "TabId = DLG";
#    - "update lng m2g" or "update lng g2m" causes "LngId = M2G" or "LngId = G2M";"
#    - "update mod rdd" or "update mod sqb" causes "ModId = RDD" or "ModId = SQB";
#    - "update dlm 10 23" causes "MinDlg = 10" or "MaxDlg = 23";
#    - "update nsk 35 147" causes "LskNdl = 35" or "UskNdl = 147".
#    The "find" command allows to search at run-time for a pattern in a specific tab, and then to resume the previous
#    operation. For example:
#    - "find ver bleiben" to search for the pattern "bleiben" throughout the tab VER;
#    - "find dlg wieder anfangen" to search for the pattern "wieder anfangen" throughout the tab DLG;
#    Adding the extra option "--n", the NOTES columns can be included in the research (e.g. "find dlg bitte --n").

# 3. Regarding the "LngId" parameter, "M" and "G" respectively stand for "Mother tongue" (i.e. italian of english) and "German".

# 4. Remember to always add a final extra value to "DlgSri"-array for setting the proper length of the last dialogue
#    (i.e. the final row-number of dialogue +3).

# 5. "Standard" execution means any non-find processing cycle. 

# 6. "Non-dialogue" tab means any tab except for 'DLG' (e.g. 'ADJ, 'VER', etc).

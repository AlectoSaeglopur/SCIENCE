
### LIBRARIES ###

from collections import namedtuple                                                                      # to create pseudo-structures as in C
from numpy import inf, zeros
from os import system                                                                                   # to call "clear" or "cls" shell functions
from pandas import isna, read_excel                                                                     # requires "pip install pandas && pip install xlrd && pip install openpyxl"
from random import randint                                                                              # to generate random values
from re import search, finditer, IGNORECASE
from sys import argv, platform                                                                          # to check current OS and terminal input arguments



### PARAMETERS ###

TabId = 'VER'                                                                                           # excel sheet tab to be loaded (see allowed values in "valid_tabs")
LngId = 'E2I'                                                                                           # language translation direction (see allowed values in "valid_lngs")
ModId = 'SQF'                                                                                           # execution mode (see allowed values in "valid_mods")
LskNdl = 0                                                                                              # Number of lines to be skipped at the beginning of non-dialogue tab (NB: set "0" not to skip any lower line)
UskNdl = 0                                                                                              # Number of lines to be skipped at the end of non-dialogue tab (NB: set "0" not to skip any upper line)



### CONSTANTS ###

sheet_struct = namedtuple('sheet_struct',['name','data','nrows','history'])                             # structure with fields needed to handle loaded sheet/tab
valid_tabs = ["ADJ", "CPA", "NOU", "VER", "EXP", "SEN", "MAT"]                                          # list of valid values for "TabId" parameter
valid_lngs = ["I2E", "E2I"]                                                                             # list of valid values for "LngId" parameter >> see NOTE#1
valid_mods = ["RDM", "SQF", "SQB"]                                                                      # list of valid values for "ModId" parameter
len_par = 3                                                                                             # number of characters of each parameter-entry (e.g. "VER", "SQF", etc)

col_gen_eng = 1                                                                                         # english column-index in generic sheets
col_gen_pro = 2                                                                                         # pronunciation column-index in generic sheets
col_gen_ita = 3                                                                                         # italian column-index in generic sheets
col_gen_exa = 4                                                                                         # example column-index in generic sheets
col_sen_eng = 1                                                                                         # english column-index in sentence sheet
col_sen_ita = 2                                                                                         # italian column-index in sentence sheet
col_mat_eng = 1                                                                                         # english column-index in maths sheet
col_mat_ita = 2                                                                                         # italian column-index in maths sheet
col_mat_exa = 3                                                                                         # example column-index in maths sheet

ncols = [4,4,4,4,4,2,3]                                                                                 # number of columns for each tab
ncol_tabs = dict(map(lambda i,j:(i,j),valid_tabs,ncols))                                      

idx_session = {
  "std": 0,                                                                                             # standard index session
  "fnd": 1                                                                                              # find index session
}

find_cmd = {
    "id" : 'find',                                                                                      # find command ID
    "ext_e" : ' --e'                                                                                    # find command extra for adding notes
}

update_cmd = {
    "id" : 'update',                                                                                    # update command ID
}



### GLOBAL VARIABLES ###

break_flag = False
active_sessions = []
idx_display = zeros(max(ncols),dtype=int)
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
    global LskNdl, UskNdl
    if LskNdl < 0:
        LskNdl = 0                                                                                      # reset "LskNdl" to miminum allowed
    if UskNdl < 0:
        UskNdl = 0                                                                                      # reset "UskNdl" to miminum allowed
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
    if ((TabId != 'SEN') and (len(active_sessions[idx_session['std']].history) >= active_sessions[idx_session['std']].nrows-LskNdl-UskNdl)) :
            print('\n>> END: entries in "'+TabId+'"-tab are over!')
            exit()


def set_idx_display( ) :
    """ Function to set the order of columns to display. """
    if len(active_sessions) == 1 :                                                                      # if not in a FIND-session...
        if TabId == 'SEN' :
            if LngId == 'I2E' :
                idx_display[0] = col_sen_ita
                idx_display[1] = col_sen_eng
            else :
                idx_display[0] = col_sen_eng
                idx_display[1] = col_sen_ita
        elif TabId == 'MAT' :
            if LngId == 'I2E' :
                idx_display[0] = col_mat_ita
                idx_display[1] = col_mat_eng
                idx_display[2] = col_mat_exa
            else :
                idx_display[0] = col_mat_eng
                idx_display[1] = col_mat_ita
                idx_display[1] = col_mat_exa
        else :    
            if LngId == 'I2E' :
                idx_display[0] = col_gen_ita
                idx_display[1] = col_gen_eng
                idx_display[2] = col_gen_pro
                idx_display[3] = col_gen_exa
            else :
                idx_display[0] = col_gen_eng
                idx_display[1] = col_gen_pro
                idx_display[2] = col_gen_ita
                idx_display[3] = col_gen_exa


def read_tab( tab_id ) :
    """ Function to load a new sheet/tab from Excel file. """
    global break_flag
    data = read_excel (r'English.xlsx',tab_id,skiprows=0,header=None)                                   # read specific sheet from Excel file (NB: "r" needed to address special character, such as "\")
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
    for i in range(1,active_sessions[idx_session['fnd']].nrows-1) :
        TxtIta = active_sessions[idx_session['fnd']].data.loc[i,col_gen_ita]
        TxtEng = active_sessions[idx_session['fnd']].data.loc[i,col_gen_eng]
        TxtExa = active_sessions[idx_session['fnd']].data.loc[i,col_gen_exa]
        if not(isna(TxtEng)) and not(isna(TxtIta)) :
            if search(find_arg["pattern"],TxtEng,IGNORECASE) or search(find_arg["pattern"],TxtIta,IGNORECASE) :
                Nres = Nres+1
                print('#' + str(Nres) + ' [' + str(i) + ']\n')
                print(TxtEng + '\n')
                print(TxtIta + '\n')
                print(TxtExa + '\n')
                print("-------\n")
            elif find_arg["extra"] == find_cmd["ext_e"] and search(find_arg["pattern"],TxtExa,IGNORECASE) :
                Nres = Nres+1
                print('#' + str(Nres) + ' [' + str(i) + ']\n')
                print(TxtExa + '\n')
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
    if msg_len >= 10 and cmd_req == find_cmd["id"] and len(space_idx) >= 2 :                            # e.g. "find adj humble" or "find ver bloom --e" 
        tab_req = keys[len(find_cmd["id"])+1:len(find_cmd["id"])+len_par+1].upper()
        if tab_req in valid_tabs :
            global TabId, find_arg
            TabId = tab_req
            flag = True
            if keys[-len(find_cmd["ext_e"]):] == find_cmd["ext_e"] :
                find_arg["pattern"] = keys[len(find_cmd["id"])+ len(tab_req)+2:msg_len-len(find_cmd["ext_e"])]
                find_arg["extra"] = find_cmd["ext_e"]
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


def execute_seq_mode_cycle( ) :
    """ Function to process a new item of current tab in sequential mode. """
    check_end_condition()
    while True :
        if ModId == 'SQF' :
            idx_item = len(active_sessions[idx_session['std']].history)+LskNdl+2
        elif ModId == 'SQB' :
            idx_item = active_sessions[idx_session['std']].nrows-UskNdl-len(active_sessions[idx_session['std']].history)+1

        print_header(idx_item)
        for j in range(ncol_tabs[active_sessions[idx_session['std']].name]) :
            field = active_sessions[idx_session['std']].data.loc[idx_item,idx_display[j]]
            if not(isna(field)) :
                print(field+'\n')
            if j < ncol_tabs[active_sessions[idx_session['std']].name]-1 :
                keys = input(' -----\n')
                check_exit_condition(keys)
        return idx_item


def execute_rdm_mode_cycle( ) :
    """ Function to process a new item of current non-dialogue tab in random mode. """
    check_end_condition()
    while True :
        idx_item = randint(LskNdl+2,active_sessions[idx_session['std']].nrows-UskNdl+1)
        if not(idx_item in active_sessions[idx_session['std']].history) :
            print_header(idx_item)
            for j in range(ncol_tabs[active_sessions[idx_session['std']].name]) :
                field = active_sessions[idx_session['std']].data.loc[idx_item,idx_display[j]]
                if not(isna(field)) :
                    print(field+'\n')
                if j < ncol_tabs[active_sessions[idx_session['std']].name]-1 :
                    keys = input(' -----\n')
                    check_exit_condition(keys)
            return idx_item


def parse_tab_cycle( ) :
    """ Function to parse a new item of a tab. """
    if ModId == 'RDM' :                                                                                 # i.e. random mode (RDM)
        idx_item = execute_rdm_mode_cycle()
    elif ModId == 'SQF' or ModId == 'SQB' :                                                             # i.e. forward/backward-sequential mode (SQF/SQB)
        idx_item = execute_seq_mode_cycle()
    active_sessions[idx_session['std']].history.append(idx_item)


def debug_operation( ) :
    """ Function to debug all main parameters and global variable at run-time. """
    print('TabId = ' + TabId)
    print('LngId = ' + LngId)
    print('ModId = ' + ModId)
    print('LskNdl = ' + str(LskNdl) + ' | UskNdl = ' + str(UskNdl))
    print(' ...............\n ')



### MAIN ###

override_params(argv[1:])                                                                               # check if parameters-override request
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
            parse_tab_cycle()
            wait_for_input_keys()

L

### NOTES ###

# 0. To run the script, open a terminal and type "cls && python learn_eng.py". By adding extra arguments the terminal command
#    it is possible to override the value of some parameters specified in the PARAMETERS section. For instance, typing
#    "python learn_eng.py sqf ver" forces "TabId = VER" and "ModId = SQF", regardless of their hard-coded values. 

# 1. Entering 'q' at any moment forces execution to stop and terminal to clear.

# 2. Whenever the message " >> NEXT..." appears, it is possible to enter "find" of "update" commands. The "update"
#    command allows to modify at run-time each parameter. For example:
#    - "update tab ver" or "update tab sen" causes "TabId = VER" or "TabId = SEN";
#    - "update lng i2e" or "update lng e2i" causes "LngId = I2E" or "LngId = E2I";"
#    - "update mod rnd" or "update mod sqb" causes "ModId = RND" or "ModId = SQB";
#    - "update nsk 35 147" causes "LskNdl = 35" or "UskNdl = 147".
#    The "find" command allows to search at run-time for a pattern in a specific tab, and then to resume the previous
#    operation. For example:
#    - "find ver bloom" to search for the pattern "bloom" throughout the tab VER;
#    - "find sen better not" to search for the pattern "better not" throughout the tab SEN;
#    Adding the extra option "--e", the NOTES columns can be added to the search (e.g. "find ver watch --e").

# 3. Regarding the "LngId" parameter, "I" and "E" respectively stand for "Italian" and "English".

# 4. "Standard" execution means any non-find processing cycle. 

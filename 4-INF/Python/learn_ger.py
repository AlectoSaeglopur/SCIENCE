
### LIBRARIES ###

from collections import namedtuple
from numpy import zeros
from os import system                                                                       # to call "clear" or "cls" functions
from pandas import read_excel, isna                                                                     # requires "pip install pandas && pip install xlrd && pip install openpyxl"
from random import randint
from re import search, IGNORECASE
from sys import platform                                                                                # to check current OS



### PARAMETERS ###

TabId = 'DLG'                                                                                          # excel sheet tab to be loaded ('DLG', 'ADJ', 'APC', 'NOU', 'VER', 'EXP' or 'SEN')
LngId = 'M2G'                                                                                             # language ('M2G' for english/italian-to-german or 'G2M' for german/mother-tongue (italian-to-english)
ModId = 'SQB'                                                                                            # dialogue mode ('RDD' for random dialogues, 'RDS' for random sentences, 'SQF' for forward sequential or 'SQB' for backward sequential)
MinDlg = 8                                                                                             # to skip all dialogues before this value (set to "1" to skip no lower dialogue!)
MaxDlg = 10                                                                                             # to skip all dialogues after this value (set to "NoDlg" to skip no upper dialogue!)



### CONSTANTS ###

sheet_struct = namedtuple('sheet_struct',['name','data', 'nrows', 'history'])
valid_tabs = ["DLG", "ADJ", "APC", "NOU", "VER", "EXP", "SEN"]
valid_lngs = ["M2G", "G2M"]
valid_mods = ["RDD", "RDS", "SQF", "SQB"]
DlgSri = [2,10,17,25,36,46,54,66,76,84,94,99,105,113,126,136,145,                                       # starting row indeces for all dialogues (NB: remember to add always a final extra value for setting the proper length of the last dialogue, i.e. the final cell +3)
         152,161,172,182,194,205,215,225,232,244,255,273,286,296,
         307,315,323,334,350,363,373,385,398,410,422,434,449,463,
         477,488,501,514,531,544,556,568,582,597,613,631,643,662,
         676,692,710,728,754,768,780]

col_dlg_ita = 1
col_dlg_ger = 2
col_dlg_not = 3
col_non_dlg_ger = 1
col_non_dlg_pro = 2
col_non_dlg_eng = 3
col_non_dlg_not = 4
idx_sheet = {
  "std": 0,
  "fnd": 1
}



### GLOBAL VARIABLES ###

find_word = ''
active_sheets = []
idx_display = zeros(4,dtype=int)



### FUNCTIONS ###

def check_parameters( ) :
    Ndlg = len(DlgSri)-1
    if MinDlg < 1 or MinDlg > MaxDlg or MaxDlg > Ndlg :
        raise Exception('>> Invalid "MinDlg/MaxDlg": shall be between 1 and "Ndlg".')
    if TabId not in valid_tabs :
        raise Exception('>> Invalid "TabId": value shall be part of "valid_tabs".')
    if LngId not in valid_lngs :
        raise Exception('>> Invalid "LngId": value shall be part of "valid_lngs".')
    if ModId not in valid_mods :
        raise Exception('>> Invalid "ModId": value shall be part of "valid_mods".')


def clear_shell( ) :
    CurOS = platform[:3]                                                                    # get first x3 letters of current OS
    if CurOS == 'win' :
        system("cls")                                                                    # clear Windows shell
    elif CurOS == 'lin' :
        system("reset")
        system("clear")                                                                  # clear Ubuntu/Android shell


def set_idx_display( ) :
    if len(active_sheets) == 1 :            # i.e. dont do this for  FIND
        if TabId == 'DLG' :
            if LngId == 'M2G' :
                idx_display[0] = col_dlg_ita
                idx_display[1] = col_dlg_ger
                idx_display[2] = col_dlg_not
                idx_display[3] = -1
            else :
                idx_display[0] = col_dlg_ger
                idx_display[1] = col_dlg_ita
                idx_display[2] = col_dlg_not
                idx_display[3] = -1
        else :
            if LngId == 'M2G' :
                idx_display[0] = col_non_dlg_eng
                idx_display[1] = col_non_dlg_ger
                idx_display[2] = col_non_dlg_pro
                idx_display[3] = col_non_dlg_not
            else :
                idx_display[0] = col_non_dlg_ger
                idx_display[1] = col_non_dlg_pro
                idx_display[2] = col_non_dlg_eng
                idx_display[3] = col_non_dlg_not


def read_tab( tab_id ) :
    data = read_excel (r'DEUTSCH.xlsx',tab_id,skiprows=0,header=None)                                     # read specific sheet/tab from Excel file ("r" to address special character, such as '\')
    nrows = data.shape[0]-2                                                                            # skip first x2 header-rows
    history = []                                                                    # reset history for new tab
    new_sheet = sheet_struct(tab_id,data,nrows,history)
    active_sheets.append(new_sheet)


def check_find_pending( ) :
    flag = False
    if len(active_sheets) > 1 :
        flag = True
    return flag


def execute_find( ) :
    Nres = 0
    if active_sheets[idx_sheet['fnd']].name == 'DLG' :
        for i in range(1,active_sheets[idx_sheet['fnd']].nrows-1) :
            TxtIta = active_sheets[idx_sheet['fnd']].data.loc[i,1]
            TxtGer = active_sheets[idx_sheet['fnd']].data.loc[i,2]
            if not(isna(TxtGer)) :                                                              # skip blank lines
                if search(find_word,TxtGer,IGNORECASE) or search(find_word,TxtIta,IGNORECASE) :
                    Nres = Nres+1
                    print('#' + str(Nres) + ' [' + str(i) + ']\n')
                    print(TxtGer + '\n')
                    print(TxtIta + '\n')
                    print("-------\n")
    else : 
        print(' CODE NOT IMPLEMENTED YET!\n')                                                   # @todo find-case for NOU, VER, etc tabs as well!
    print(str(Nres) + ' results found for "'+ find_word+'" in "'+active_sheets[idx_sheet['fnd']].name+'" tab.\n')
    active_sheets.pop()
    input(' >> NEXT...\n')                                                                      # always return to previous mode here (no input read)


def check_find_request( keys ):
    """ COMMET!!!! """
    flag = False
    req = keys[0:4]
    msg_len = len(keys)
    if msg_len >= 10 and req == 'find' :                                                  # e.g. "find dlg anfangen"
        tab = keys[5:8].upper()
        if tab in valid_tabs :
            global TabId, find_word
            TabId = tab
            find_word = keys[9:msg_len]
            flag = True
    return flag


def check_switch_request( keys ):
    flag = False
    req = keys[0:6]
    msg_len = len(keys)
    if msg_len == 10 and req == 'switch' :                                                  # e.g. "switch adj" to switch tab
        tab = keys[7:10].upper()
        if tab in valid_tabs :
            global TabId
            TabId = tab
            active_sheets.pop()
            flag = True
    elif msg_len == 10 and req == 'switch' :                                                # e.g. "switch m2g" to switch mod
        lng = keys[7:10].upper()
        if lng in valid_lngs :
            global LngId
            LngId = lng
    return flag


def check_exit_condition( keys ) :
    if keys == 'q' :
        clear_shell()
        exit()


def check_end_condition( ) :
    if ((TabId == 'DLG') and (ModId == 'RDS') and (len(active_sheets[idx_sheet['std']].history) >= DlgSri[MaxDlg]-DlgSri[MinDlg-1]-3*(MaxDlg-(MinDlg-1)))) or \
        ((TabId == 'DLG') and (ModId == 'SQF') and (MinDlg-1+len(active_sheets[idx_sheet['std']].history) >= MaxDlg)) or \
        ((TabId == 'DLG') and (ModId == 'SQB') and (MaxDlg-1-len(active_sheets[idx_sheet['std']].history) < MinDlg-1)) or \
        ((TabId == 'DLG') and (ModId == 'RDD') and (len(active_sheets[idx_sheet['std']].history) >= MaxDlg-MinDlg+1)) or \
        ((TabId != 'DLG') and (len(active_sheets[idx_sheet['std']].history) >= active_sheets[idx_sheet['std']].nrows)) :
            print('\n>> END: entries in "'+TabId+'"-tab are over!')
            exit()


def execute_non_dialogue_tab_cycle( ) :
    check_end_condition()
    while True :
        idx_item = randint(0,active_sheets[idx_sheet['std']].nrows-1)
        if not(idx_item in active_sheets[idx_sheet['std']].history) :
            print('*** ' + '[' + str(len(active_sheets[idx_sheet['std']].history)+1) + '|' + str(idx_item+3) + '] ***\n')
            print(active_sheets[idx_sheet['std']].data.loc[idx_item+2,idx_display[0]] + '\n')
            keys = input(' -----\n')
            check_exit_condition(keys)
            print(active_sheets[idx_sheet['std']].data.loc[idx_item+2,idx_display[1]] + '\n')
            active_sheets[idx_sheet['std']].history.append(idx_item)
            break


def execute_dialogue_rds_mode_cycle( ) :
    check_end_condition()
    while True :
        idx_item = randint(DlgSri[MinDlg-1],DlgSri[MaxDlg]-4)                                # retrieve random row index
        if not(isna(active_sheets[idx_sheet['std']].data.loc[idx_item,2])) and not(idx_item+1 in DlgSri) and not(idx_item in active_sheets[idx_sheet['std']].history) :      # avoid blank, title and already processed indeces 
            print('*** ' + '[' + str(len(active_sheets[idx_sheet['std']].history)+1) + '|' + str(idx_item+1) + '] ***\n')
            print('> ' + active_sheets[idx_sheet['std']].data.loc[idx_item,idx_display[0]])
            keys = input('\n -----\n')
            check_exit_condition(keys)
            print('> ' + active_sheets[idx_sheet['std']].data.loc[idx_item,idx_display[1]] + '\n\n')
            active_sheets[idx_sheet['std']].history.append(idx_item)
            break


def execute_dialogue_seq_mode_cycle( ) :
    check_end_condition()
    if ModId == 'SQF' :
        idx_item = MinDlg-1+len(active_sheets[idx_sheet['std']].history)
    elif ModId == 'SQB' :
        idx_item = MaxDlg-1-len(active_sheets[idx_sheet['std']].history)
    print('*** ' + '[' + str(len(active_sheets[idx_sheet['std']].history)+1) + '|' + str(idx_item+1) + '] ***\n')
    DlgLen = DlgSri[idx_item+1]-DlgSri[idx_item]-3
    for i in range(DlgLen) :
        print('> ' + active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item]+i,idx_display[0]])
        keys = input('')
        check_exit_condition(keys)
        print('> ' + active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item]+i,idx_display[1]] + '\n-----\n')
    print(active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item],idx_display[2]] + '\n')
    active_sheets[idx_sheet['std']].history.append(idx_item)


def execute_dialogue_rdd_mode_cycle( ):
    check_end_condition()
    while True :
        idx_item = randint(MinDlg-1,MaxDlg-1)
        if not(idx_item in active_sheets[idx_sheet['std']].history) :
            print('*** ' + '[' + str(len(active_sheets[idx_sheet['std']].history)+1) + '|' + str(idx_item+1) + '] ***\n')
            DlgLen = DlgSri[idx_item+1]-DlgSri[idx_item]-3
            for i in range(DlgLen) :
                print('> ' + active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item]+i,idx_display[0]])
                keys = input('')
                check_exit_condition(keys)
                print('> ' + active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item]+i,idx_display[1]] + '\n-----\n')
            print(active_sheets[idx_sheet['std']].data.loc[DlgSri[idx_item],idx_display[2]] + '\n')
            active_sheets[idx_sheet['std']].history.append(idx_item)
            break


def execute_dialogue_tab_cycle( ) :
    if ModId == 'RDS' :                                                                     # i.e. random sentence mode (RDS)
        execute_dialogue_rds_mode_cycle()
    elif ModId == 'SQF' or ModId == 'SQB' :                                                              # i.e. forward sequential mode (SQF) or SQB
        execute_dialogue_seq_mode_cycle()
    elif ModId == 'RDD' :                                                               # i.e. random dialogue mode (RDD)
        execute_dialogue_rdd_mode_cycle()



### MAIN ###

check_parameters()
while 1 :
    read_tab(TabId)
    set_idx_display()
    while 1 :
        clear_shell()
        if check_find_pending() :
            execute_find()
        else :                                                                                  # if standard case
            if active_sheets[idx_sheet['std']].name == 'DLG' :                                  # dialogue tab handler
                execute_dialogue_tab_cycle()
            else :
                execute_non_dialogue_tab_cycle()
            keys = input(' >> NEXT...\n')
            check_exit_condition(keys)
            if check_find_request(keys) | check_switch_request(keys) :
                break



# EXTRA SPAZIO PRIMA DI next all fine di DIALOGO 63

# explain the meaning of "std", aka standard = any non-find execution
# execute SQB/F anche per non-DLG tabs
# execute find mode also for non-DLG tabs
# aggiungi key case per cambiare mode
# aggiumgi commenti a tutto
# check dialoghi da ger a ita
# speigazione su come usare tutte le features
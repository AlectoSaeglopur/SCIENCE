 
### LIBRARIES ###

from pandas import read_excel                                                           # pip install pandas && pip install xlrd && pip install openpyxl
from random import randint
from sys import platform                                                                # to check current OS
import os                                                                               # to call "clear" or "cls" functions


### PARAMETERS ###

SID = 'VER'                                                                             # sheet ID ('ADJ', 'APC', 'NOU', 'VER', 'EXP' or 'SEN')
LNG = 'ENG'                                                                             # language ('ENG' for I2E or 'ITA' for E2I)
MOD = 'RND'                                                                             # operating mode ('RND' for random, 'LIN' for linear)


### PROCESSING ###

j = 0                                                                                   # counter on the number of items processed so far (not essential)
FFlag = False                                                                           # Find-mode flag
CurOS = platform[:3]                                                                    # get first 3 letters of current OS

while 1 :

    Hist = []                                                                           # reset history list (to avoid repetitions of the same index)
    Sheet = read_excel (r'ENGLISH.xlsx',SID,skiprows=1,header=None)                     # Read excel file ("r" to address special character, such as '\')
    Nrows = Sheet.shape[0]-1                                                            # Skip first blank row
#    Ncols = Sheet.shape[1]-1                                                            # Skip first blank column
#    print('Sheet Size = ' + str(Nrows) + ' x ' + str(Ncols) + '\n\n')
    
    while 1 :

        if FFlag == True :
            FFlag = False
            SheetF = read_excel (r'ENGLISH.xlsx',FSID,skiprows=1,header=None)
            NrowsF = SheetF.shape[0]-1
            Nres = 0
            print('\n >> ' + FSID + ' : ' + Fword + ' <<\n')

            if FSID == 'SEN' :
                for i in range(1,NrowsF-1) :
                    TxtEng = SheetF.loc[i,1]
                    TxtIta = SheetF.loc[i,2]
                    if( (TxtEng.find(Fword)!=-1) or (TxtIta.find(Fword)!=-1) ) :
                        Nres = Nres+1
                        print(' ----- ' + str(Nres) + ' -----\n')
                        print(TxtEng + '\n')
                        print(TxtIta + '\n')
            else :
                for i in range(1,NrowsF-1) :
                    TxtEng = SheetF.loc[i,1]
                    TxtIta = SheetF.loc[i,3]
                    TxtEx = SheetF.loc[i,4]
                    if( (TxtEng.find(Fword)!=-1) or (TxtIta.find(Fword)!=-1) or (TxtEx.find(Fword)!=-1) ) :
                        Nres = Nres+1
                        print(' ----- ' + str(Nres) + ' -----\n')
                        print(TxtEng + '\n')
                        print(SheetF.loc[i,2] + '\n')
                        print(TxtIta + '\n')
                        print(TxtEx + '\n')

            if Nres == 0 :
                print(' ----- 0 -----\n')                                               # no matching case found
            input(' >> NEXT...\n')                                                      # always return to previous mode here (no input read)
            if CurOS == 'win' :
                os.system("cls")
            elif CurOS == 'lin' :
                os.system("reset")
                os.system("clear")

        else :

            if MOD == 'RND' :
                Idx = randint(1,Nrows)
            else :                                                                      # i.e. MOD == 'LIN'
                Idx = Idx+1

            if not(Idx in Hist) :
                print('*** ' + '[' + str(j+1) + '|' + str(Idx) + '] ***\n')

                if SID == 'SEN' :                                                       # in case of sheet 'SEN'
                    if LNG == 'ITA' :
                        print(' >> ENGLISH\n')
                        print(Sheet.loc[Idx,1] + '\n')
                        input(' >> ITALIAN\n')
                        print(Sheet.loc[Idx,2] + '\n')
                    else :
                        print(' >> ITALIAN\n')
                        print(Sheet.loc[Idx,2] + '\n')
                        input(' >> ENGLISH\n')
                        print(Sheet.loc[Idx,1] + '\n')
                        
                else :                                                                  # for all other sheets
                    if LNG == 'ITA' :
                        print(' >> ENGLISH\n')
                        print(Sheet.loc[Idx,1] + '\n')
                        input(' >> EXAMPLE\n')
                        print(Sheet.loc[Idx,4] + '\n')
                        input(' >> ITALIAN\n')
                        print(Sheet.loc[Idx,3] + '\n')
                        print(' >> PRONUNCIATION\n')
                        print(Sheet.loc[Idx,2] + '\n')
                    else :
                        print(' >> ITALIAN\n')
                        print(Sheet.loc[Idx,3] + '\n')                                  # print italian text
                        input(' >> EXAMPLE\n')
                        print(Sheet.loc[Idx,4] + '\n')                                  # print example text
                        input(' >> ENGLISH\n')
                        print(Sheet.loc[Idx,1] + '\n')                                  # print english text
                        print(' >> PRONUNCIATION\n')
                        print(Sheet.loc[Idx,2] + '\n')                                  # print pronunciation text

                Hist.append(Idx)                                                        # append new index to history list
                j = j+1
                Key = input(' >> NEXT...\n')
                if CurOS == 'win' :
                    os.system("cls")                                                    # clear Windows shell
                elif CurOS == 'lin' :
                    os.system("reset")
                    os.system("clear")                                                  # clear Ubuntu / Android shell
                    
                if Key == 'A' :                                                         # press one of the following keys to change sheet, or "Enter" to continue
                    SID = 'ADJ'
                    break
                elif Key == 'C' :
                    SID = 'CPA'
                    break
                elif Key == 'N' :
                    SID = 'NOU'
                    break
                elif Key == 'V' :
                    SID = 'VER'
                    break
                elif Key == 'X' :
                    SID = 'EXP'
                    break
                elif Key == 'S' :
                    SID = 'SEN'
                    break

                if (len(Key) == 2) and (Key[0] == 'L') and (LNG == 'ENG') :             # to move to linear mode, enter "L" followed by the desired starting letter (in lower case)
                    MOD = 'LIN'
                    StLet = Key[1]                                                      # starting letter in linear mode
                    Idx = 1
                    while 1 :
                        Cell = Sheet.loc[Idx,1]
                        if Cell[0] == StLet :
                            break
                        else :
                            Idx = Idx+1
                    Idx = Idx-1
                    break
                elif Key == 'R' :
                    MOD = 'RND'
                    break 

                if Key == 'E' :                                                         # press one of the following keys to switch between ENG and ITA modes
                    LNG = 'ENG'
                elif Key == 'I' :
                    LNG = 'ITA'
                elif len(Key) >= 5 and Key[0] == 'F' :                                  # e.g. "F V smack"
                    Fword = Key[4:len(Key)]                                             # save word to find
                    FFlag = True                                                        # assert find-flag for next cycle
                    if Key[2] == 'A' :                                                  # press one of the following keys to change sheet, or "Enter" to continue
                        FSID = 'ADJ'
                        break
                    elif Key[2] == 'C' :
                        FSID = 'CPA'
                        break
                    elif Key[2] == 'N' :
                        FSID = 'NOU'
                        break
                    elif Key[2] == 'V' :
                        FSID = 'VER'
                        break
                    elif Key[2] == 'X' :
                        FSID = 'EXP'
                        break
                    elif Key[2] == 'S' :
                        FSID = 'SEN'
                        break

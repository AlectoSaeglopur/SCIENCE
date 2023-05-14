
### LIBRARIES ###

from pandas import read_excel, isna                                                                     # requires "pip install pandas && pip install xlrd && pip install openpyxl"
from random import randint
from sys import platform                                                                                # to check current OS
import os                                                                                               # to call "clear" or "cls" functions


### PARAMETERS ###

SID = 'DLG'                                                                                             # sheet ID ('DLG', 'ADJ', 'APC', 'NOU', 'VER', 'EXP' or 'SEN')
LNG = 'E2G'                                                                                             # language ('E2G' for english/italian-to-german or 'G2E' for german/italian-to-english)
MinDlg = 20                                                                                             # to skip all dialogues before this value (set to "1" to skip no lower dialogue!)
MaxDlg = 65                                                                                             # to skip all dialogues after this value (set to "NoDlg-1" to skip no upper dialogue!)
Mode = 'SQB'                                                                                            # dialogue mode ('RDD' for random dialogues, 'RDS' for random sentences, 'SQF' for forward sequential or 'SQB' for backward sequential)

### PROCESSING ###

j = 0                                                                                                   # counter on the number of items processed so far (not essential)
FFlag = False                                                                                           # FIND-mode flag
DlgSri = [2,10,17,25,36,46,54,66,76,84,94,99,105,113,126,136,145,                                       # starting row indeces for all dialogues (NB: remember to add always a final extra value for setting the proper length of the last dialogue, i.e. the final cell +3)
         152,161,172,182,194,205,215,225,232,244,255,273,286,296,
         307,315,323,334,350,363,373,385,398,410,422,434,449,463,
         477,488,501,514,531,544,556,568,582,597,613,631,643,662,
         676,692,710,728,754,768,780]
NoDlg = len(DlgSri)                                                                                     # number of dialogues (plus one) in the Excel sheet

if Mode == 'SQF' :                                                                                      # index initialization for forward sequencial mode
    Idx = MinDlg-2
elif Mode == 'SQB' :                                                                                    # index initialization for backward sequencial mode
    Idx = MaxDlg

while 1 :

    Hist = []                                                                                           # reset history list (to avoid repetitions of the same index)
    OkFlag = False
    Sheet = read_excel (r'DEUTSCH.xlsx',SID,skiprows=0,header=None)                                     # read specific sheet from Excel file ("r" to address special character, such as '\')
    Nrows = Sheet.shape[0]-2                                                                            # skip first two header rows

    while 1 :

        if FFlag == True :                                                                              # FIND-request handler

            FFlag = False
            SheetF = read_excel (r'DEUTSCH.xlsx',FSID,skiprows=1,header=None)
            NrowsF = SheetF.shape[0]-1
            Nres = 0
            print('\n >> ' + FSID + ' : ' + Fword + ' <<\n')

            if FSID == 'DLG' :
                for i in range(1,NrowsF-1) :
                    TxtIta = SheetF.loc[i,1]
                    TxtGer = SheetF.loc[i,2]
                    if not(isna(TxtGer)) :                                                              # skip blank lines
                        if (TxtGer.find(Fword)!=-1) or (TxtIta.find(Fword)!=-1) :
                            Nres = Nres+1
                            print(' ----- ' + str(Nres) + ' [' + str(i) + '] -----\n')
                            print(TxtGer + '\n')
                            print(TxtIta + '\n')
            else : 
                print(' CODE NOT IMPLEMENTED YET!\n')                                                   # @todo find-case for NOU, VER, etc tabs as well!
                
            if Nres == 0 :
                print(' ----- 0 -----\n')                                                               # no matching case found
            input(' >> NEXT...\n')                                                                      # always return to previous mode here (no input read)
            if CurOS == 'win' :
                os.system("cls")
            elif CurOS == 'lin' :
                os.system("reset")
                os.system("clear")

        else :                                                                                          # non-FIND-request case

            if SID == 'DLG' :                                                                           # dialogue tab handler

                if Mode == 'RDS' :                                                                     # i.e. random sentence mode (RDS)

                    if len(Hist) >= DlgSri[MaxDlg]-DlgSri[MinDlg-1]-3*(MaxDlg-(MinDlg-1)) :             # check if there are still sentences left
                        print('>> Phrases are over!')
                        exit()
                    else :
                        Idx = randint(DlgSri[MinDlg-1],DlgSri[MaxDlg]-4)                                # retrieve random row index (extremes included)

                    if not(isna(Sheet.loc[Idx,2])) and not(Idx+1 in DlgSri) and not(Idx in Hist) :      # avoid blank, title and already processed indeces 
                        OkFlag = True
                        print('*** ' + '[' + str(j+1) + '|' + str(Idx+1) + '] ***\n')
                        print('> ' + Sheet.loc[Idx,1])
                        input('')
                        print('> ' + Sheet.loc[Idx,2] + '\n')
                        print('---\n')

                else :

                    if Mode == 'SQF' :                                                                  # i.e. forward sequential mode (SQF)
                        Idx = Idx+1
                        if Idx >= MaxDlg :
                            print('>> Dialogues are over!')
                            exit()
                    elif Mode == 'SQB' :                                                                # i.e. backward sequential mode (SQB)
                        Idx = Idx-1
                        if Idx < 0 :
                            print('>> Dialogues are over!')
                            exit()
                    elif Mode == 'RDD' :                                                               # i.e. random dialogue mode (RDD)
                        if len(Hist) >= MaxDlg-MinDlg+1 :                                     
                            print('>> Dialogues are over!')
                            exit()
                        else :
                            Idx = randint(MinDlg-1,MaxDlg)
                    else :
                        print('>> Invalid dialogue mode!')
                        exit()
                    
                    if not(Idx in Hist) and (Idx >= MinDlg-1) and (Idx <= MaxDlg-1) :

                        OkFlag = True
                        print('*** ' + '[' + str(j+1) + '|' + str(Idx+1) + '] ***\n')
                        DlgLen = DlgSri[Idx+1]-DlgSri[Idx]-3
                        for i in range(DlgLen) :
                            print('> ' + Sheet.loc[DlgSri[Idx]+i,1])
                            input('')
                            print('> ' + Sheet.loc[DlgSri[Idx]+i,2] + '\n')
                            print('---\n')

                        print(Sheet.loc[DlgSri[Idx],3] + '\n')

            else :

                Idx = randint(0,Nrows-1)

                if not(Idx in Hist) :

                    OkFlag = True
                    print('*** ' + '[' + str(j+1) + '|' + str(Idx+3) + '] ***\n')
                    if LNG == 'G2E' :
                        print(' >> DEUTSCH\n')
                        print(Sheet.loc[Idx+2,1] + '\n')
                        input(' >> ENGLISCH\n')
                        print(Sheet.loc[Idx+2,3] + '\n')
                    else :
                        print(' >> ENGLISCH\n')
                        print(Sheet.loc[Idx+2,3] + '\n')
                        input(' >> DEUTSCH\n')
                        print(Sheet.loc[Idx+2,1] + '\n')

            if OkFlag :

                OkFlag = False
                Hist.append(Idx)
                j = j+1
                Key = input(' >> NEXT...\n')

                CurOS = platform[:3]                                                                    # get first 3 letters of current OS
                if CurOS == 'win' :
                    os.system("cls")                                                                    # clear Windows shell
                elif CurOS == 'lin' :
                    os.system("reset")
                    os.system("clear")                                                                  # clear Ubuntu / Android shell
                if Key == 'A' :                                                                         # press one of the following keys to change sheet, or "Enter" to continue
                    SID = 'ADJ'
                    Hist = []                                                                           # reset history list for new SID
                    break
                elif Key == 'K' :
                    SID = 'KPA'
                    Hist = []
                    break
                elif Key == 'N' :
                    SID = 'NOM'
                    Hist = []
                    break
                elif Key == 'V' :
                    SID = 'VER'
                    Hist = []
                    break
                elif Key == 'U' :
                    SID = 'AUS'
                    Hist = []
                    break
                elif Key == 'D' :
                    SID = 'DLG'
                    Hist = []
                    break

                if Key == 'G' :                                                                         # press one of the following keys to switch between ENG and ITA LNGe
                    LNG = 'E2G'
                elif Key == 'E' :
                    LNG = 'G2E'
                elif len(Key) >= 5 and Key[0] == 'F' :                                                  # e.g. "F D anfangen"
                    Fword = Key[4:len(Key)]                                                             # save word to find
                    FFlag = True                                                                        # assert find-flag for next cycle
                    if Key[2] == 'A' :                                                                  # press one of the following keys to change sheet, or "Enter" to continue
                        FSID = 'ADJ'
                        break
                    elif Key[2] == 'K' :
                        FSID = 'KPA'
                        break
                    elif Key[2] == 'N' :
                        FSID = 'NOM'
                        break
                    elif Key[2] == 'V' :
                        FSID = 'VER'
                        break
                    elif Key[2] == 'U' :
                        FSID = 'AUS'
                        break
                    elif Key[2] == 'D' :
                        FSID = 'DLG'
                        break

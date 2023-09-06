
'''
' Title: FILE-LIST FILTER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for filtering a .txt file-list looking for a specified string pattern.
'''

## LIBRARIES ##

from re import search, IGNORECASE
from sys import argv


## PARAMETERS ##

Nskip = 2                                                                       # Number of header lines to skip


## PROCESSING ##

LenPat = len(argv)-1                                                            # Number of pattern string words
if LenPat > 0 :
    Pattern = str(argv[1])                                                      # String-pattern to be found parsed from command (e.g. "python list_filter.py love is" generates Pattern = "love is" )
    for j in range(LenPat-1) :
        Pattern = Pattern+' '+str(argv[2+j])
    fid = open('.\list.txt','r',encoding='utf-8')                               # the "utf-8" option is needed to correctly red special characters
    Data = fid.readlines()[Nskip:]
    fid.close()
    Cnt = 0
    Nelem = len(Data)
    for j in range(Nelem) :
        if search(Pattern,Data[j],IGNORECASE) :
            print(Data[j][:-1])                                                 # "-1" is needed to remove the extra "\n" character added by readlines()
            Cnt += 1
    print('-----\nMATCHES :',str(Cnt)+' out of '+str(Nelem)+' elements')
else :
    raise Exception("No string-pattern given as input!")

'''
' Title: FILE-LIST FILTER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for filtering a .txt file-list looking for a specified string pattern.
'              For example, to look for pattern "love is" type into shell "python music_list_filter.py # love is".
'''

## LIBRARIES ##

from re import search, IGNORECASE
from sys import argv


## PARAMETERS ##

Nskip = 2                                                                       # number of header lines to skip
SpChar = "#"                                                                    # special character required before the string pattern argument


## PROCESSING ##

LenPat = len(argv)-1                                                            # number of pattern string words
if LenPat < 2 :
    raise Exception("Not enough input arguments provided.")
elif str(argv[1]) != SpChar :
    raise Exception("Wrong start-of-pattern character found.")
else :
    Pattern = str(argv[2])                                                      # string-pattern to be found parsed from command
    for j in range(LenPat-2) :
        Pattern = Pattern+' '+str(argv[3+j])
    fid = open('.\list.txt','r',encoding='utf-8')                               # the "utf-8" option is needed to correctly red special characters
    Data = fid.readlines()[Nskip:]
    fid.close()
    Cnt = 0
    Nelem = len(Data)
    for j in range(Nelem) :
        if search(Pattern,Data[j],IGNORECASE) :                                 # the "IGNORECASE" option allows the search to be case-insensitive
            print(Data[j][:-1])                                                 # "-1" is needed to remove the extra "\n" character added by readlines()
            Cnt += 1
    print('-----\nMatches for "'+Pattern+'" : '+str(Cnt)+' out of '+
        str(Nelem)+' elements')


## NOTES ##

# 1. To search for strings containing parenthesis or brackets add "\" before, since these are special characters used
#    by Python to delimit string ends. For example, to search all unplugged songs [U], use "... # \[U\]".
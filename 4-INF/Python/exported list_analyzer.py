
'''
' Title: FILE-LIST ANALYZER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for analyzing/filtering a .txt file-list looking for a specified string pattern.
'''


## LIBRARIES ##

from re import search, IGNORECASE
from sys import argv



## PARAMETERS ##

path = "H:/MUSIC/"                                                              # folder path (use '.' for current folder)
fname = "list.txt"                                                              # file name to analyze
nskip = 2                                                                       # number of header lines to skip
spchar = "#"                                                                    # separation character required before the string pattern argument



## PROCESSING ##

patlen = len(argv)-1                                                            # number of pattern-text words
if patlen < 2 :
    raise Exception("Not enough input arguments provided.")
elif str(argv[1]) != spchar :
    raise Exception("Wrong start-of-pattern character found.")
else :
    pattext = str(argv[2])                                                      # pattern-text to be found parsed from command
    for j in range(patlen-2) :
        pattext = pattext+' '+str(argv[3+j])
    fid = open(path+fname,'r',encoding='utf-8')                                 # the "utf-8" option is needed to correctly read special characters
    data = fid.readlines()[nskip:]
    fid.close()
    nelem = int(data[-1].split(" ")[-1])                                        # retrieve the number of listed elements from the last number in the last line (aka "stats" in "folder_list_exporter.py")
    data[:nelem]
    cnt = 0
    print("")
    for j in range(nelem) :
        if search(pattext,data[j],IGNORECASE) :                                 # the "IGNORECASE" option allows the search to be case-insensitive
            print(" " + data[j][:-1])                                           # "-1" is needed to remove the extra "\n" character added by readlines()
            cnt += 1
    print('\n >> Matches for "' + pattext + '" : '+str(cnt) +
          ' out of ' + str(nelem)+' elements')



## NOTES ##

# 1. For example, to look for pattern "love is" type into shell "python music_list_filter.py # love is".
    
# 2. To search for strings containing parenthesis or brackets add "\" before, since these are special characters used
#    by Python to delimit string ends. For example, to search all unplugged songs [U], use "... # \[U\]".

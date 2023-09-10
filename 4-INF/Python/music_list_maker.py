
'''
' Title: FILE-LIST MAKER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for listing all files of a desired type within a specified folder into a .txt file.
'''

## LIBRARIES ##

from datetime import datetime
from glob import glob


## PARAMETERS ##

Path = r"H:\MUSIC"                                                              # path where to search (use '.' for current folder)
Extens = "mp3"                                                                  # file extension to be searched (use '*' to for all)
Nf = "%4d"                                                                      # j-counter print-format


## PROCESSING ##

flist = glob(Path+'\*.'+Extens)
dt = datetime.now()                                                             # get current date and time
fid = open('.\list.txt','w',encoding='utf-8')
fid.write(' >> '+dt.strftime("%d-%b-%Y %H:%M:%S")+' [P] <<\n\n')
Nelem = len(flist)
if Extens == "*" :
    for j in range(Nelem) :
        fid.write(Nf%(j+1)+': '+flist[j][len(Path)+1:]+'\n')
else :
    for j in range(Nelem) :
        fid.write(Nf%(j+1)+': '+flist[j][len(Path)+1:-len(Extens)-1]+'\n')
fid.close()
print(" >> Execution completed : "+str(Nelem)+" files listed")

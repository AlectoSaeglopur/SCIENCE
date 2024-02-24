
'''
' Title: FOLDER FILES LIST-EXPORTER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for listing all files of desired types within a specified folder into a .txt file.
'''


## LIBRARIES ##

from datetime import datetime
from glob import glob
from numpy import zeros
from os.path import splitext



## PARAMETERS ##

path = "H:/MUSIC/"                                                              # folder path (use '.' for current folder)
ext_inc = ['mp3','wav']                                                         # file extensions to be included (use ['.*'] for all extensions)
ext_exc = []                                                                    # file extensions to be excluded (used only if "ext_inc = ['.*']")
fcnt = '%4d'                                                                    # counter print-format
pext = True                                                                     # flag for keeping/removing extension in listed files name



## PROCESSING ##

dt = datetime.now()                                                             # get current date and time
fid = open(path+'list.txt','w',encoding='utf-8')
fid.write(' >> '+dt.strftime("%d-%b-%Y %H:%M:%S")+' [P] <<\n\n')

if ext_inc == ['.*'] :
    flist = glob(path+'\*'+ext_inc[0])
    ext_inc = []
    for file in flist :
        fname, fext = splitext(file)
        if not(fext in ext_inc) and not(fext in ext_exc) :
            ext_inc.append(fext)                                                # retrieve sequentially all file-extensions within folder

cnt = zeros(len(ext_inc),dtype=int)                                             # overall counter
for i, ext in enumerate(ext_inc) :
    flist = glob(path+'\*'+ext)                                                 # retrieve all files with specified extension within folder
    nelem = len(flist)                                                          # number of files with the current extension found
    for j in range(nelem) :
        if pext :
            fid.write(fcnt%(sum(cnt)+j+1)+': '+flist[j][len(path):]+'\n')
        else :
            fid.write(fcnt%(sum(cnt)+j+1)+': '+flist[j][len(path):-len(ext)]+'\n')
    cnt[i] = nelem

stats = ''
stats += '\n >> Files listed within "'+path+'":\n'
for j in range(len(ext_inc)) :
    stats += "    - " + ext_inc[j] + "\t= " + str(cnt[j]) +"\n"
stats += "    - overall \t= "+str(sum(cnt))
fid.write("\n-------------------------\n"+stats)
fid.close()
print(stats)



## NOTES ##

# 1. Examples:
#    - music   -> path = "H:/MUSIC/"  | ext_inc = ['mp3','wav'] | ext_exc = []
#    - images  -> path = "H:/IMAGES/" | ext_inc = ['.*']        | ext_exc = ['.ini','.txt']

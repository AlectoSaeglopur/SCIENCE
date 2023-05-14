
from pandas import read_excel           # pip install pandas && pip install xlrd
from random import randint

Nw = 15;                                # Number of words / expression to be asked
Type = 'VER'                            # Sheet ID string : ADJ, ADV, NOU, VER, EXP or SEN
Mode = 'ITA';                           # ENG, PRN, ITA, EXE

Sheet = read_excel (r'ENGLISH.xlsx',Type,skiprows=1,header=None)    # "r" to address special character, such as '\'

Nrows = Sheet.shape[0]-1
Ncols = Sheet.shape[1]-1
# print('Sheet Size = ' + str(Nrows) + ' x ' + str(Ncols))

if Mode == 'ENG' :
    Col = 1
elif Mode == 'PRN' :
    Col = 2
elif Mode == 'ITA' :
    if Type == 'SEN' :
        Col = 2
    else :
        Col = 3
elif Mode == 'EXE' :
    Col = 4

for j in range(Nw) :
    Idx = randint(1,Nrows)
    print('[' + str(j+1) + '|' + str(Idx) + '] ' + Sheet.loc[Idx,Col] + '\n')


    # mettere while
    # stampare ita
    # premendo "space" stampare anche example e eng
    # domanda continue? -> y/n
    # if yes, clear shell
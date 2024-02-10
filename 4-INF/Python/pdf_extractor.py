
### LIBRiRIS ###

import fitz                                                         # requires "pip install PyMuPDF"
from os import system                                               # to call "clear" or "cls" shell functions



### PARAMETERS ###

file_name = 'celine'                                                 # name of PDF file to be scanned
annot_type = 'Underline'                                            # annotations type to search (use 'Highlight' or 'Underline')
delta = [3, 5]                                                      # delta for annotations boundary [NB: to be adjusted for specific file]
sep_char = '\n\n'                                                   # separation-characters added between consecutive annotations



### CONSTANTS ###

WsULx = 0                                                           # upper-left point X-coordinate index within original word structure
WsULy = 1                                                           # upper-left point Y-coordinate index within original word structure
WsBRx = 2                                                           # bottom-right point X-coordinate index within original word structure
WsBRy = 3                                                           # bottom-right point Y-coordinate index within original word structure
WsWrt = 4                                                           # word-text index within original word structure

ULi = 0                                                             # upper-left point coordinates index within annotations structure
BRi = -1                                                            # bottom-right point coordinates index within annotations structure

X = 0                                                               # X-coordinate index
Y = 1                                                               # Y-coordinate index



### PROCESSING ###

data = fitz.open(file_name+'.pdf')                                  # load data from pdf file
n_pag = len(data)                                                   # retrieve overall number of pages
ann_cnt = 0                                                         # annotations counter
ann_text = ''                                                       # annotations text

for i, page in enumerate(data) :                                    # loop over each file pages
    annots_coords = []
    annot = page.first_annot
    while annot :                                                   # scan all annotations within the current page
        if annot.type[1] == annot_type:
            coords = [annot.vertices[ULi], annot.vertices[BRi]]     # retrieve annotation coordinates
            annots_coords.append(coords)
        annot = annot.next
    system("cls")

    page_words = page.get_text_words()                              # load all words within current page
    for k, annot in enumerate(annots_coords) :                      # loop over each foud annotation within current page
        ann_text += str(ann_cnt+k+1) + '.'                          # add annotation counter to new line
        state = 'SEARCH'
        for j in range(len(page_words)) :
            word_coords = [[page_words[j][WsULx],page_words[j][WsULy]], \
                           [page_words[j][WsBRx],page_words[j][WsBRy]]]
            if state == 'SEARCH' :      
                if word_coords[ULi][X]-annot[ULi][X] >= -delta[X] and \
                    abs(word_coords[ULi][Y]-annot[ULi][Y]) < delta[Y] :
                    ann_text += ' ' + page_words[j][WsWrt]
                    state = 'COPY'
            elif state == 'COPY' :
                if (word_coords[BRi][X]-annot[BRi][X] > delta[X] and \
                    abs(word_coords[BRi][Y]-annot[BRi][Y]) < delta[Y]) or \
                    word_coords[BRi][Y]-annot[BRi][Y] > delta[Y] :
                    break
                else :
                    ann_text += ' ' + page_words[j][WsWrt]
        ann_text += sep_char
    ann_cnt += len(annots_coords)

ann_text = ann_text[:-len(sep_char)]
fid = open(file_name+'.txt','w',encoding='utf-8')
fid.write(ann_text)
fid.close()



### RESULTS ###

print("\n - Scanned file : " + file_name + '.pdf')
print(" - Number of pages : " + str(n_pag))
print(" - Number of " + annot_type.lower() + "s : " + str(ann_cnt))
print("\n -----------\n")
print(ann_text)



### NOTES ###

# 1. Keep in mind spaces act as delimites within text, thus always underline/highline on pdf file until a space!

# 2. For more info see "https://medium.com/@vinitvaibhav9/extracting-pdf-annots_coords-using-python-9512af43a6d".

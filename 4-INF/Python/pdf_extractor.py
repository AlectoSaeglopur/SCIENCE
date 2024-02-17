
### LIBRARIES ###

import fitz                                                                         # requires "pip install PyMuPDF"
from os import system                                                               # to call "clear" or "cls" shell functions



### PARAMETERS ###

file_path = "H:/EBOOKS/BOOKS/"                                                      # file path
file_name = "Stupore e tremori (Amelie Nothomb, 1999)"                              # name of PDF file to be scanned [NB: see NOTE#1]
annot_type = 'Underline'                                                            # annotations type to search (use 'Highlight' or 'Underline')
delta = [3, 5]                                                                      # delta for annotations boundary for X-Y coordinates [NB: to be adjusted for specific file]
sep_char = '\n\n'                                                                   # separation-characters added between consecutive annotations
adj_text = True


### CONSTANTS ###

WsULx = 0                                                                           # upper-left point X-coordinate index within original word structure
WsULy = 1                                                                           # upper-left point Y-coordinate index within original word structure
WsBRx = 2                                                                           # bottom-right point X-coordinate index within original word structure
WsBRy = 3                                                                           # bottom-right point Y-coordinate index within original word structure
WsWrt = 4                                                                           # word-text index within original word structure

ULi = 0                                                                             # upper-left point coordinates index within annotations structure
BRi = -1                                                                            # bottom-right point coordinates index within annotations structure

X = 0                                                                               # X-coordinate index
Y = 1                                                                               # Y-coordinate index



### FUNCTIONS ###

def append_sorted_annot( ann_coords, new_coord, cnt ) :
    """ Function to append new annotation to list in appearance order. """
    if cnt == 0 :
        ann_coords.append(new_coord)
    else :
        for j in range(cnt) :
            if (new_coord[ULi][Y] < ann_coords[j][ULi][Y]) or \
                (new_coord[ULi][Y] == ann_coords[j][ULi][Y] and \
                new_coord[ULi][X] < ann_coords[j][ULi][X]) :
                ann_coords.insert(j,new_coord)
                break
            elif j == cnt-1 :
                ann_coords.append(new_coord)
    return ann_coords

def get_annot_coords( page ) :
    """ Function to retrieve and list all annotations within current page. """
    ann_cnt_pg = 0                                                                  # number of annotation within the current page
    ann_coords = []
    annot = page.first_annot
    while annot :                                                                   # scan all annotations within the current page
        if annot.type[1] == annot_type:
            coord = [annot.vertices[ULi],annot.vertices[BRi]]                       # retrieve annotation coordinates
            ann_coords = append_sorted_annot(ann_coords[:],coord,ann_cnt_pg)        # append new annotation in appearance order (NB: by default it's chronological instead)
            ann_cnt_pg += 1
        annot = annot.next
    return ann_coords


def capitalize_text_incipit( ann_text ) :
    """ Function to capitalizethe first alpha character of annotation (in case it's not). """
    for j in range(len(ann_text)) :
        if ann_text[j].isalpha() :
            ann_text = ann_text[:j]+ ann_text[j].capitalize()+ann_text[j+1:]
            break
        print(ann_text[j])
    return ann_text

def change_wrong_end_char( ann_text ) :
    """ Function to correct final punctuation of annotation or insert if not present. """
    wrong_end_char = [";",":",","]
    if ann_text[-1] in wrong_end_char :
        ann_text = ann_text[:-1]+'.'
    elif ann_text[-1].isalpha() :
        ann_text = ann_text+'.'
    return ann_text

def add_unmatched_char( ann_text ) :
    """ Function to insert unmached characters within annotation. """
    match_char = [('(',')'),('[',']'),('“','”'),('«','»'),('"','"')]
    for i in range(len(match_char)) :
        if ann_text.count(match_char[i][0]) > ann_text.count(match_char[i][1]) :
            ann_text += match_char[i][1]
            break
    return ann_text
    
def check_adjustments( ann_text ) :
    """ Function to apply adjustment of current annotation. """
    ann_text = capitalize_text_incipit(ann_text)
    ann_text = change_wrong_end_char(ann_text)
    ann_text = add_unmatched_char(ann_text)
    return ann_text

def get_annot_header( cnt_ov, cnt_pg, pg_num):
    """ Function to generate the header of a new annotation. """
    header = '[#'+str(cnt_ov+cnt_pg+1)+' | p.'+str(pg_num+1)+']'
    return header

def get_word_coords( pg_words ) :
    """ Function to retrieve starting/final coordinates of input word. """
    word_coords = [[pg_words[j][WsULx],pg_words[j][WsULy]], \
                   [pg_words[j][WsBRx],pg_words[j][WsBRy]]]
    return word_coords

def check_start_condition( word_coords, annot_coords ) :
    """ Function to check the condition for start copying a new annotation. """
    outcome = False
    if word_coords[ULi][X]-annot_coords[ULi][X] >= -delta[X] and \
        abs(word_coords[ULi][Y]-annot_coords[ULi][Y]) < delta[Y] :
        outcome = True
    return outcome

def check_end_condition( word_coords, annot_coords) :
    """ Function to check the condition for start copying a new annotation. """
    outcome = False
    if (word_coords[BRi][X]-annot_coords[BRi][X] > delta[X] and \
        abs(word_coords[BRi][Y]-annot_coords[BRi][Y]) < delta[Y]) or \
        word_coords[BRi][Y]-annot_coords[BRi][Y] > delta[Y] :                       # check if j-th word is still inside the annotation box (i.e. end-of-annotation condition)
        outcome = True
    return outcome



### PROCESSING ###

data = fitz.open(file_path+file_name+'.pdf')                                        # load data from pdf file
n_pag = len(data)                                                                   # retrieve overall number of pages
ann_cnt_ov = 0                                                                      # overall annotations counter
ann_text_ov = ''                                                                    # overall annotations text
ann_ovflow = False                                                                  # flag indicating an annotation-overflow between consecutive pages

for i, page in enumerate(data) :                                                    # loop over each file's page...
    annots_list = get_annot_coords(page)                                            # find and list annotations coordinatinates within current page
    if annots_list :                                                                # if current pages has annotations...
        pg_words = page.get_text_words()                                            # load all words within current page
        n_words = len(pg_words)                                                     # number of words within current page
        for k, ann_coords in enumerate(annots_list) :                               # loop over each foud annotation within current page
            last_ann_header = get_annot_header(ann_cnt_ov,k,i)
            ann_text_ov += last_ann_header                                          # add annotation counter to new line
            if ann_ovflow == False :
                ann_text_page = ''
            state = 'SEARCH'
            for j in range(n_words) :                                               # loop over each word within current page
                word_coords = get_word_coords(pg_words)
                if state == 'SEARCH' :                                              # if annotation match/copying has not started yet...
                    if check_start_condition(word_coords,ann_coords) :
                        if j <= 1 and ann_ovflow :                                  # check if an overflow is ongoing if 1st word of page is part of the annotation
                            ann_text_ov = ann_text_ov[:-len(last_ann_header)]
                            ann_cnt_ov -= 1
                            ann_ovflow = False
                        ann_text_page += ' '+pg_words[j][WsWrt]                     # add new word to annotation text
                        state = 'COPY'
                elif state == 'COPY' :                                              # if annotation match/copying is ongoing...
                    if check_end_condition(word_coords,ann_coords) :                # check if j-th word is still inside the annotation box (i.e. end-of-annotation condition)
                        if adj_text :
                            ann_text_page = check_adjustments(ann_text_page)        # NB: this condition is checked only at end of annotation (not due to overflow, since for-loop is broken before in the latter case)
                        break
                    else :
                        ann_text_page += ' ' + pg_words[j][WsWrt]                   # add j-th word to annotations text-list
                if state == 'COPY' and j == n_words-1 :
                    ann_ovflow = True
                elif j > 1 and ann_ovflow :                                         # if new page does not start with an annotation but previous page was in overflow...
                    ann_text_ov = ann_text_ov[:-len(last_ann_header)]
                    ann_text_ov += ann_text_page+sep_char                           # close and add previous annotation
                    ann_text_ov += last_ann_header
                    ann_text_page = ''
                    ann_ovflow = False
            if not(ann_ovflow) or i == n_pag-1:
                ann_text_ov += ann_text_page+sep_char
        ann_cnt_ov += len(annots_list)
    elif ann_ovflow :                                                               # if new page has no annotations but previous page was in overflow...
            ann_text_ov += ann_text_page+sep_char                                   # close and add previous annotation
            ann_ovflow = False

ann_text_ov = ann_text_ov[:-len(sep_char)]                                          # remove useless final separation-characters
fid = open(file_path+file_name+'.txt','w',encoding='utf-8')
fid.write(ann_text_ov)                                                              # copy all annotations to output .txt file
fid.close()



### RESULTS ###

system("cls")
print("\n - Scanned file : "+file_name+'.pdf')
print(" - Number of pages : "+str(n_pag))
print(" - Number of "+annot_type.lower()+"s : "+str(ann_cnt_ov))
print("\n -----------\n")
print(ann_text_ov)



### NOTES ###

# 1. Keep in mind these highlight/underline rules on .pdf files:
#    - always annotate until the next space (since spaces act as delimites within text);
#    - for owerflowing annotation between consecutive pages, apply two separete annotations (re-merging will be then handledby this script);
#    - in case of long annotations within a single page, always apply a single annotation (i.e. do not break into multiple ones).

# 2. For more info see "https://medium.com/@vinitvaibhav9/extracting-pdf-ann_coords-using-python-9512af43a6d".

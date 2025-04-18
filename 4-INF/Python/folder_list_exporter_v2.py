
'''
' Title: FOLDER FILES LIST-EXPORTER
' Author: Filippo Valmori
' Date: 06/09/2023
' Description: Script for listing all files of desired types within a specified
               folder into a .log file in tabulated format.
'''


## LIBRARIES ##

from datetime import datetime
from glob import glob
from numpy import zeros
from os.path import splitext
from tabulate import tabulate                                                   # requires "pip install tabulate"



## PARAMETERS ##

folder_path = "H:/MUSIC/flac/"                                                  # folder path (use '.' for current folder | NB: remember the final "/")
included_ext = ['.mp3']                                                         # file extensions to be included (use ['.*'] for all extensions)
excluded_ext = []                                                               # file extensions to be excluded (used only if "included_ext = ['.*']")
recurs_flag = False                                                             # flag for recursively extending export to sub-folders
max_tab_width = 50                                                              # maximum number of characters per tabulated column



### FUNCTIONS ###

def get_subpath( recurs_flag ) :
  ''' Function to get sub-path according to recursive flag. '''
  if recurs_flag == True :
    subpath = '\**\*'                                                             
  else :
    subpath = '\*'
  return subpath


def get_included_extensions( included_ext, recurs_flag ) :
  ''' Function to retrieve available extensions if all-option has been selected. '''
  subpath = get_subpath(recurs_flag)
  if included_ext == ['.*'] :
    flist = glob(folder_path+subpath+included_ext[0], recursive=recurs_flag)
    included_ext = []
    for file in flist :
      _, fext = splitext(file)
      if not(fext.lower() in included_ext) and not(fext.lower() in excluded_ext) :
        included_ext.append(fext.lower())
  # sort included extensions alphabetically (just for clearer stats)
  included_ext.sort()
  return included_ext


def retrieve_elem_fields( string ) :
  ''' Fucntion to retrieve title, artist and year info from file name.'''
  idx_1st_delimiter = string.find("(")
  idx_2nd_delimiter = string[idx_1st_delimiter:].find(",") + idx_1st_delimiter
  idx_3rd_delimiter = string[idx_2nd_delimiter:].find(")") + idx_2nd_delimiter
  # retrieve title [substring from start to first "(" character]
  title = string[:idx_1st_delimiter-1]
  # retrieve artist [substring from first "(" character to next "," character]
  artist = string[idx_1st_delimiter+1: idx_2nd_delimiter]
  # retrieve year [substring from post-artist "," character to next ")" character]
  year = string[idx_2nd_delimiter+1: idx_3rd_delimiter]
  return title, artist, year


def parse_folder_files(folder_path, included_ext, recurs_flag) :
  ''' Function to parse folder content and retrieve files list for included extensions. '''
  exts_cnt = zeros(len(included_ext), dtype=int)
  elems_list = []
  subpath = get_subpath(recurs_flag)
  # loop over each included extension
  for i, ext in enumerate(included_ext) :
      flist = glob(folder_path+subpath+ext, recursive=recurs_flag)
      nelems = len(flist)
      # loop over each file of current extension
      for j in range(nelems) :
        file_name = flist[j][len(folder_path):-len(ext)]
        elem_cnt = sum(exts_cnt)+j+1
        elem_ext = ext
        elem_title, elem_artist, elem_year = retrieve_elem_fields(file_name)
        elems_list.append([elem_cnt, elem_title, elem_artist, elem_year, elem_ext])
      # update elements counter for current extension
      exts_cnt[i] = nelems
  return elems_list, exts_cnt


def get_exporting_stats( folder_path, included_ext, exts_cnt) :
  ''' Function for generating exporting statistics and extra info. '''
  date_time = datetime.now()
  stats_text = '\n>> Generation date/time: '+date_time.strftime("%d-%b-%Y @ %H:%M:%S")+'\n'
  stats_text += '>> Files listed within "'+folder_path+'":\n'
  for j in range(len(included_ext)) :
      stats_text += "    - " + included_ext[j] + " = " + str(exts_cnt[j]) +"\n"
  stats_text += "    - TOTAL = " + str(sum(exts_cnt))
  return stats_text


def log_results(folder_path, stats_text, elems_list) :
  ''' Function to sav exporting list and stats on.log file. '''
  elems_list_headers = ["Index", "Title", "Artist", "Year", "Extension"]
  elems_list_text = tabulate(elems_list, headers=elems_list_headers,
    tablefmt="grid", maxcolwidths=[max_tab_width for _ in range(len(elems_list_headers))])
  with open(folder_path + '_list.log', 'w', encoding='utf-8') as fid :
    fid.write(stats_text)
    fid.write(2*'\n')
    fid.write(elems_list_text)



## PROCESSING ##

included_ext = get_included_extensions(included_ext, recurs_flag)
elems_list, exts_cnt = parse_folder_files(folder_path, included_ext, recurs_flag)
stats_text = get_exporting_stats(folder_path, included_ext, exts_cnt)



## RESULTS ##

log_results(folder_path, stats_text, elems_list)
print(stats_text)



## NOTES ##

# 1. Examples:
#    - music   -> folder_path = "H:/MUSIC/"  | included_ext = ['.mp3','.wav']  | excluded_ext = []

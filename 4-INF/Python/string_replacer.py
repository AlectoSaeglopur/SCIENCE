'''
' Script to replace a string with another in all files (of a specified extension)
' within an input directory (sub-directories included).
'''


## IMPORTS ##

from os import walk
from os.path import join


## PARAMETERS ##

dir_path = "C:\\Users\\Filippo\\Downloads\\TORRENT\\_streaming_community_api"
old_strings = ['blue', 'cyan', 'green', 'magenta', 'purple', 'red', 'yellow']
new_string = 'white'
file_ext = '.py'

## PROCESSING ##

print(' >> Touched files:')
for root, dirs, files in walk(dir_path) :
    for fname in files:
        fpath = join(root, fname)
        if fpath[-len(file_ext):] == file_ext :
          with open(fpath) as fid:
              text = fid.read()
          for old_string in old_strings :
            text = text.replace(old_string, new_string)
          with open(fpath, "w") as fid :
              fid.write(text)
          print('    - '+fpath)
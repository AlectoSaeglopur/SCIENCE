
## LIBRARIES

import json


## PARAMETERS

fname = 'js_data.json'                                              # json file name where to read data from


## PROCESSING

try :
    with open(fname,'r') as fid:                                    # open file in read-mode ("with" ensures to automatically close the file when no more needed)
        try :
            users = json.load(fid)                                  # read data from .json file
            for j in range(len(users)) :
                print(str(j+1) + ". " + str(users[j]))
        except json.JSONDecodeError as err:                         # check if any error occurred while reading .json file
            print("JSON ERROR: ", err)                              # print error code
except FileNotFoundError :
    print("FILE ERROR: File not found")
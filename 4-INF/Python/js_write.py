
## LIBRARIES

import json                                                         # import json built-in library


## PARAMETERS

fname = 'js_data.json'                                              # .json file name where to store data


## FUNCTIONS

def add_users( ) :
    users = []                                                      # list of users to be added
    while True :
        qexit = input(str(len(users)+1) + ". Quit (Y/N)? - ")       # exit condition (press "Y" or "y" to quit)
        if qexit.upper() == 'Y' :                                   # check exit-condition (case-insensitive)
            break
        else :
            new_name = input("What's your name? - ")                # ask new user name from input
            new_age = input("What's your age? - ")
            new_role = input("What's your role? - ")
            new_user = [new_name, new_age, new_role]
            users.append(new_user)                                  # add new user to overall list
    return users

def store_data( users ) :
    with open(fname,'w') as fid :                                   # open file in write-mode ("with" ensures to automatically close the file when no more needed)
        json.dump(users,fid)                                        # store data into .json file


## PROCESSING

users = add_users()
if users :
    store_data(users)





## NOTES

# 1. Remember to store all the data with a single "json.dummp(.)"-call, otherwise issues arise if multiple data-structures are found while reading back!

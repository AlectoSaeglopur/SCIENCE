
# FUNCTION #

"""
" Function to manipulate an I/O list.
"""
def list_update( IoList ) :
    Item = IoList.pop()                             # remove final item from list
    for j in range(len(IoList)) :
        IoList[j] = IoList[j] + 'X'                 # append 'X'-character to each remaining item (just to show the list can be permanently modified inside a function)
    return Item
        

# MAIN #

MyList = ['Alexander', 'Brian', 'Charles', 'David', 'Edward']
print(str(MyList)+"\n ----------------")

while MyList :                                      # if the list is not empty yet...
    Item = list_update(MyList)
    print(Item + " || " + str(MyList))              # print removed item and remaining (and modified) list
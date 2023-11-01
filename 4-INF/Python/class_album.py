
class Tracklist( ) :
    """ Class for musical tracklsit """

    def __init__( self ) :
        self.list = []                                      # assign default value
    
    def add_song( self, name ) :
        self.list.append(name)

    def get_list( self ) :
        for j in range(len(self.list)) :
            print(" "+str(j+1)+". "+self.list[j])


class Album( ) :
    """ Class for musical album """

    def __init__( self, title, artist, year ) :
        """ Album initializer """
        self.title = title
        self.artist = artist
        self.year = year
        self.tracklist = Tracklist()                        # use another sub-class as member

    def get_album( self ) :
        """ Print album info on shell """
        print(" >> INFO <<")
        print(" Title: "+self.title)
        print(" Artist: "+self.artist)
        print(" Year: "+str(self.year))
        print(" Tracklist:")
        self.tracklist.get_list()
        print("\n~~~~~~~~~~~~~~~~~~~~~~~~~\n")


## MAIN ##

mk = Album('Catartica','Marlene Kuntz',1994)
mk.tracklist.add_song("Lieve")
mk.tracklist.add_song("Canzone di domani")
mk.tracklist.add_song("Sonica")
mk.tracklist.add_song("Nuotando nell'aria")
mk.get_album()

print(" >> HELP <<")
help(Album)                                                 # get verbose docstring-info about class "Album" using the built-in function "help()"
print("\n~~~~~~~~~~~~~~~~~~~~~~~~~\n")

print(" >> DOC <<")
print(Album.__doc__)                                        # get essential docstring-info about class "Album" using the __doc__ member (can be used also for standard functions without classes)
print(Album.get_info.__doc__)


/*** LIBRARIES ***/

#include <iostream>
#include <string>
#include <fstream>
using namespace std;



/*** CLASS DEFINITION ***/

class birthday {                                                            // Class "birthday" for specifying the date of birth of a person

  private:

    int Day, Month, Year;

#ifdef PROTECT_CASE
  protected:
#else
  public:
#endif

    birthday ( int InDay, int InMonth, int InYear ){                        // Constructor of the class to initialize new istances
      Day = InDay;
      Month = InMonth;
      Year = InYear;
      cout << " - New object created (BIRTHDAY) [0]" << endl << endl;
    }

    birthday ( string InDef ){                                              // Constructor overloading (not essential) following J2000
      if ( InDef.compare("J2000") == 0 ){
        Day = 1;
        Month = 1;
        Year = 2000;
      }
      cout << " - New object created (BIRTHDAY) [J]" << endl << endl;
    }

    ~birthday( void ){                                                      // Destructor of the class to delete objects no more useful
        cout << " - Object deleted (BIRTHDAY)" << endl << endl;
    }

    void GetDate( int *Vect ){
      Vect[0] = Day;
      Vect[1] = Month;
      Vect[2] = Year;
    }

    void SetDate( int NewDay, int NewMonth, int NewYear ){                  // Function for modifying the birthday members from outside the birthday class

        Day = NewDay;
        Month = NewMonth;
        Year = NewYear;
        if ( (NewDay<1) || (NewDay>31) ){
          ExceptionHandler(-1);
        } else if ( (NewMonth<1) || (NewMonth>12) ){
          ExceptionHandler(-2);
        }

    }

    void ExceptionHandler( int ErrId ){                                     // Function for handling exceptions and stopping execution
      switch ( ErrId ){
        case -1:
          cout << " ---> ERROR#" << ErrId << " : Invalid day!" << endl;
          break;
        case -2:
          cout << " ---> ERROR#" << ErrId << " : Invalid month!" << endl;
          break;
      }
      throw ErrId;                                                          // [alternative: exit(1)]
    }

    void PrintInfo( void ){
      cout << "   Bithday : " << Day << "/" << Month << "/" << Year << endl;
    }

};


template <class ARG>                                                        // This class is defined as template (i.e. its members can be defined as int, double or float at will)
class statistics {                                                          // Class "statistics" for specifying player average performances

  private:

    ARG PPG, APG, RPG;                                                      // Points, assists and rebounds per game

  public:

    statistics( ARG AvPnt, ARG AvAst, ARG AvReb):
      PPG(AvPnt), APG(AvAst), RPG(AvReb) {
        cout << " - New object created (STATS)" << endl << endl;
      }

    ~statistics( void ){                                                    // Destructor of the class to delete objects no more useful
        cout << " - Object deleted (STATS)" << endl << endl;
    }

    void SetStats( ARG NewAvPnt, ARG NewAvAst, ARG NewAvReb ){              // Function for modifying the birthday members from outside the birthday class
      PPG = NewAvPnt;
      APG = NewAvAst;
      RPG = NewAvReb;
    }

    void PrintInfo( void ){
      cout << "   PPG : " << PPG << endl;
      cout << "   APG : " << APG << endl;
      cout << "   RPG : " << RPG << endl;
    }

};


class player : public birthday, public statistics<double> {                 // Class "player" for basic information of an NBA player (inheriting class birthday and statistics with type double) [alternative: <int>]

  private:

    const string Name;
    const string Surname;
    string Team;
    int JerseyNum;
    int PrintNum;                                                           // Number of times the player::PrintInfo() function has been invoked

    friend void ExtReset( player *Object );                                 // Function for making the private member "ModNum" accessible from ouside the class with the "friend" keyword

  public:

    player( string InNam, string InSur ):                                   // Constructor of the class to initialize new istances (usable also for constant members)
      birthday("J2000"),                                                    // Initialization of the inherited class (shall be in the first line!) [alternative: birthday(0,0,0)]                                                  
      statistics(0,0,0),
      Name(InNam),
      Surname(InSur){
      Team = "?";
      JerseyNum = -1;
      PrintNum = 0;
      cout << " - New object created (PLAYER)" << endl << endl;
    }
    
    ~player( void ){                                                        // Destructor to delete objects no more useful
      cout << " - Object deleted (PLAYER)" << endl << endl;
    }

    void SetTeam( string NewTeam ){
      Team = NewTeam;
    }

    void SetJerseyNum( int NewJerseyNum ){
      JerseyNum = NewJerseyNum;
    }

#ifdef PROTECT_CASE
    void SetBirthday( int NewDay, int NewMonth, int NewYear ){
      SetDate(NewDay,NewMonth,NewYear);
    }
#endif

    void PrintInfo( void ){
      cout << " - PLAYER INFO (#" << PrintNum << ")" << endl;
      cout << "   Name : " << Name << endl;                                 // [alternative (keyword "this"): this->Name instead of Name]
      cout << "   Surname : " << Surname << endl;
      birthday::PrintInfo();
      cout << "   Team : " << Team << endl;
      cout << "   Jersey number : " << JerseyNum << endl;
      statistics::PrintInfo();
      cout << endl;
      PrintNum++;
    }

    void WriteFile( void ){
      int Vect[3];
      GetDate(Vect);
      fstream Fid;
      Fid.open(Name+Surname+".txt");
      if (Fid.is_open()){
        Fid << " - PLAYER INFO" << endl;
        Fid << "   Name : " << Name << endl;                                 // [alternative (keyword "this"): this->Name instead of Name]
        Fid << "   Surname : " << Surname << endl;
        Fid << "   Birthday : " << std::to_string(Vect[0])+"/"+std::to_string(Vect[1])+"/"+std::to_string(Vect[2]) << endl;   // [alternative: ... << Vect[0] << "/" << Vect[1] << "/" << Vect[2]
        Fid << "   Team : " << Team << endl;
        Fid << "   Jersey number : " << JerseyNum << endl;
      }
      Fid.close();
    }

};



/*** EXTRA FUNCTIONS ***/

void ExtReset( player *Object ){
  cout << " - Ext. Function Call:" <<endl;
  cout << "   ModNum (before) = " << Object->PrintNum << endl;
  Object->PrintNum = 0;
  cout << "   ModNum (after) = " << Object->PrintNum << endl << endl;
}



/*** MAIN ***/

int main(){

#ifdef PROTECT_CASE
  cout << " *** PROTECTED VERSION ***" << endl << endl;                     // Activate the macro by adding -D PROTECT_CASE to the compiling instruction
#else
  cout << " *** PUBLIC VERSION ***" << endl << endl;
#endif
  
  player DR("Derrick","Rose");                                              // Creating instance of class player
  DR.PrintInfo();                                                           // Print DR object default info
  DR.SetTeam("Chicago Bulls");                                              // Set DR NBA team
  DR.SetJerseyNum(1);                                                       // Set DR jersey number
#ifdef PROTECT_CASE
  DR.SetBirthday(4,10,1988);
#else
  DR.SetDate(4,10,1988);                                                    // Set DR birthday date
#endif

#if INT_STATS                                                               // To use integer statistics
  int StatsB[3] = {23,10,5}; 
  DR.SetStats(StatsB[0],StatsB[1],StatsB[2]);
#else                                                                       // To use float statistics
  float StatsA[3] = {23.4,9.8,5.1}; 
  DR.SetStats(StatsA[0],StatsA[1],StatsA[2]);
#endif
  
  DR.PrintInfo();                                                           // Print DR object updated info
  ExtReset(&DR);                                                            // Test the external/friend function  
#ifdef EXCEPT_CASE
  DR.SetDate(1,13,1988);                                                    // Line to trigger error/exception
#endif
  DR.WriteFile();                                                           // Store player data into a txt file
  return 0;                                                                 // Return of main function (not essential)
  
}

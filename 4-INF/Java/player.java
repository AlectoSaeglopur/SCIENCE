
/* LIBRARIES */

import java.util.Scanner;                                                             // Library for using user input at run-time
import java.util.Formatter;                                                           // Library for creating and writing into external files
import java.util.HashMap;                                                             // Library for using the built-in HashMap class

/* NBA PLAYER CLASS (MAIN) */

public class player extends person {

  enum role {                                                                         // Example of enum class for basket roles
    PG, SG, SF, PF, CN, NA
  }

  /* Player class attributes */

  private static final int WHIST = -10;                                               // Whole stats history printing ID
  private static final int HERAS = -11;                                               // Stats history erasure ID
  private role Pos = role.NA;                                                         // Role set as default as "not available" (N/A)
  private String Team;
  private int JerseyNum;
  private String Nickname;                                                            // Since this attribute is not initialized inside constructors, it assumes "null" as initial default value
  private history StatsHist = new history();                                          // Create object of inner class "history" for statistics info
  private static int PrtNum;                                                          // Since defined as static, this is a single and shared variable among all tHERAS created player instances

  /* Player class methods */

  protected player( ){                                                                // Default player constructor (i.e. with no parameters)
    this.Team = DS;
    this.JerseyNum = -1;
    System.out.println("* player object created (D)\n");
  }

  protected player( String N, String S ){                                             // Custom constructor (overloading), for initializing name and surname
    super.SetName(N);                                                                 // Call superclass SetName function of tHERAS superclass "person"
    super.SetSurname(S);
    super.SetJob("NBA Player");
    this.Team = DS;                                                                   // The default string (DS) is inherited by the super-superclass "birthday"
    this.JerseyNum = -1;
    System.out.println("* player object created (NS)\n");
  }

  protected void SetPos( role NewVal ){
    this.Pos = NewVal;
  }

  protected void SetTeam( String NewVal ){
    this.Team = NewVal;
  }

  protected void SetJerseyNum( int NewVal ){
    this.JerseyNum = NewVal;
  }

  protected void SetNickname( String NewVal ){
    this.Nickname = NewVal;
  }

  protected static int GetPrtNum( ){                                                  // Function needed because only static methods can act on static attributes (such as PrtNum here)
    return PrtNum;
  }

  protected static void IncrPrtNum( ){
    PrtNum++;
  }

  protected void PrintRole( ){
    System.out.printf("  - Role : ");
    switch( this.Pos ){
      case PG:
        System.out.println("Point Guard");
        break;
      case SG:
        System.out.println("Shooting Guard");
        break;
      case SF:
        System.out.println("Small Forward");
        break;
      case PF:
        System.out.println("Power Forward");
        break;
      case CN:
        System.out.println("Center");
        break;
      default:
        System.out.println("N/A");
    }
  }

  protected void SetByUser( ){                                                        // Function for allowing user to modify specific fields of the player class at run-time
    System.out.printf("** USER : Enter ID -> ");
    Scanner UserVal = new Scanner(System.in);                                         // Enter the value on terminal
    int ID = UserVal.nextInt();                                                       // Interpret the provided ID
    switch ( ID ){
        case 1:                                                                       // 1 -> team
            System.out.printf(" ---> Enter Team -> ");
            UserVal = new Scanner(System.in);
            String UserTeam = UserVal.nextLine();
            this.SetTeam(UserTeam);
            break;
        case 2:                                                                       // 2 -> nickname
            System.out.printf(" ---> Enter Nickname -> ");
            UserVal = new Scanner(System.in);
            String UserNickname = UserVal.nextLine();
            this.SetNickname(UserNickname);
            break;
        default:
          System.out.printf(" ---> Enter jersey number -> ");                         // default -> jersey number
          UserVal = new Scanner(System.in);
          int UserJerseyNum = UserVal.nextInt();
          this.SetJerseyNum(UserJerseyNum);
    }
    System.out.println();
//    UserVal.close();                                                                  // Uncommenting here, System.in is closed avoiding the resource leakage warning above. However, then this user function would be usable just once!                    
}

  protected void PrintInfo( ){
    System.out.println("* Player Info [#"+GetPrtNum()+"]");
    super.PrintInfo();                                                                // Recall the PrintInfo method of the superclass "person"
    PrintRole();
    System.out.println("  - Team : "+this.Team);
    System.out.println("  - Jersey Number : "+this.JerseyNum);
    System.out.println("  - Nickname : "+this.Nickname);
    System.out.println();
    IncrPrtNum();
  }

  protected void AddHistYear( int StYear, double NewP, double NewA, double NewR ){
    StatsHist.AddStat(StYear,NewP,NewA,NewR);
  }

  protected void RemHistYear ( int RemYear ){                                         // Mapppin function for acting on inner class "history"
    StatsHist.RemoveStat(RemYear);
  }  

  protected void PrintHist( int ID ){
    StatsHist.PrintStat(ID);
  }

  protected void WriteTxt( ){                                                         // Function writing player info into a .txt file (named as surname)
    try {
      Formatter Fid = new Formatter(super.GetSurname()+".txt");
      Fid.format("* PLAYER INFO\n");
      Fid.format("  - Name : "+super.GetName()+"\n");
      Fid.format("  - Surname : "+super.GetSurname()+"\n");
      Fid.format("  - Team : "+this.Team+"\n");
      Fid.format("  - Jersey Number : "+this.JerseyNum+"\n");
      Fid.format("  - Nickname : "+this.Nickname+"\n");
      Fid.close();
    } catch (Exception Err){
      System.out.println(" - Error while opening .txt file!");
    } 
  }

  /* INNER (NESTED) HISTORY CLASS OF PLAYER CLASS */

  public class history {

    private final int Nmax = 3;                                                       // Maximum number of Years (i.e. Keys) allowed for player statistics history
    private int Ntaken;                                                               // Counter for the number of free/busy memory cells
    private HashMap <Integer,Double> PPG = new HashMap <Integer,Double>();            // HashMap for linking integer KEY (Year) to the corresponding double DATA (points-per-game, PPG) value
    private HashMap <Integer,Double> APG = new HashMap <Integer,Double>();            // HashMap for linking integer KEY (Year) to the corresponding double DATA (assists-per-game, APG) value
    private HashMap <Integer,Double> RPG = new HashMap <Integer,Double>();            // HashMap for linking integer KEY (Year) to the corresponding double DATA (rebounds-per-game, RPG) value

    protected history( ){
      this.Ntaken = 0;
      System.out.println("* history object created");
    }

    protected void AddStat( int Year, double NewP, double NewA, double NewR ){
      if ( this.PPG.containsKey(Year) ){                                              // HashMap class allows the automatic modification of a key already present
        this.PPG.put(Year,NewP);
        this.APG.put(Year,NewA);
        this.RPG.put(Year,NewR);
        System.out.println("  + MODIFIED "+Year);
      } else if ( this.Ntaken >= this.Nmax ){
        System.out.println("  + CANNOT ADD "+Year+" : FULL MEMORY");
      } else {
        this.PPG.put(Year,NewP);
        this.APG.put(Year,NewA);
        this.RPG.put(Year,NewR);
        this.Ntaken++;
        System.out.println("  + ADDED "+Year);
      }
    }

    protected void RemoveStat( int Year ){
      if ( Year == HERAS ){
        this.PPG.clear();                                                             // The clear() function removes all the key/data pairs of the HashMap
        this.APG.clear();
        this.RPG.clear();
        this.Ntaken = 0;
        System.out.println("  + FULL MEMORY ERASURE");
      } else if ( this.PPG.containsKey(Year) ){
        this.PPG.remove(Year);
        this.APG.remove(Year);
        this.RPG.remove(Year);
        this.Ntaken--;
        System.out.println("  + REMOVED "+Year);
      } else {
        System.out.println("  + CANNOT REMOVE "+Year+" : NOT PRESENT");
      }
    }

    protected void PrintStat( int Year ){
      double Pnt, Ast, Rbn;  
      if ( Year == WHIST ){                                                           // Value ID for printing the whole available history
        if ( this.PPG.size() == 0 ){
          System.out.println("  + READ HISTORY : EMPTY");
        } else {
          System.out.println("  + HISTORY :");
          for ( int Key : this.PPG.keySet() ) {                                       // Example of Java's enhanced for-loop
            Pnt = this.PPG.get(Key);
            Ast = this.APG.get(Key);
            Rbn = this.RPG.get(Key);
            System.out.printf("     "+Key+" --> ");
            System.out.println("PPG = "+Pnt+" | APG = "+Ast+" | RPG = "+Rbn);
          }
        }
      } else if ( this.PPG.containsKey(Year) ){
        Pnt = this.PPG.get(Year);
        Ast = this.APG.get(Year);
        Rbn = this.RPG.get(Year);
        System.out.printf("  + READ "+Year+" -> ");
        System.out.println("PPG = "+Pnt+" | APG = "+Ast+" | RPG = "+Rbn);
      } else {
        System.out.println("  + READ "+Year+" -> NOT PRESENT");
      }
    }
    
  }

  /* MAIN FUNCTION */

  public static void main( String[] args ) {

    player TM = new player("Tracy","McGrady");                                        // Creation of a new player object 
    TM.PrintInfo();
    TM.SetTeam("Orlando Magic");
    TM.SetJerseyNum(1);
    TM.SetDate(24,5,1979);                                                            // Recall of birthday super-super class method!
    TM.SetPlace("Bartow","USA");
    TM.SetNickname("THERAS Big Sleep");
    TM.SetHeight(2.03f);
    TM.SetWeight(98.5f);
    TM.SetPos(role.SF);                                                               // To set role as Small Forward
    TM.PrintInfo();

    player MJ = new player("Michael","Jordan");
    MJ.SetTeam("Chicago Bulls");
    MJ.SetJerseyNum(23);
    MJ.SetDate(17,2,1963);                                                            // Try to set an invalid date (e.g. 17/33/1963) for testing tHERAS exception in birthday class
    MJ.SetPlace("New York","USA");
    MJ.SetNickname("His Airness");
    MJ.SetHeight(1.98f);
    MJ.SetWeight(98.1f);
    MJ.SetPos(role.SG);                                                               // To set role as Shooting Guard
//    MJ.SetByUser();                                                                   // To set specific player class attributes at run-time by user
    MJ.PrintInfo();                                                                   // Note that the PrtNum value (since static) is common and shared with the previous TM object!
    MJ.WriteTxt();

    MJ.PrintHist(WHIST);                                                              // Print whole history
    MJ.AddHistYear(1990,32.6,5.5,6.7);                                                // Add statistics for year 1990
    MJ.AddHistYear(1991,31.3,6.1,6.4);                                                // Add statistics for year 1991
    MJ.AddHistYear(1992,30.6,7.5,8.2);                                                // Add statistics for year 1992
    MJ.PrintHist(1991);                                                               // Print statistics for year 1990
    MJ.PrintHist(1994);                                                               // Try printing statistics for year 1990
    MJ.PrintHist(WHIST);                                                              
    MJ.AddHistYear(1992,38.6,5.9,6.9);                                                // Modify statistics for year 1991
    MJ.PrintHist(WHIST);
    MJ.AddHistYear(1994,29.4,5.8,7.8);                                                // Try adding statistics for year 1994
    MJ.RemHistYear(1990);                                                             // Remove statistics for year 1990
    MJ.RemHistYear(1991);                                                             // Remove statistics for year 1991
    MJ.PrintHist(WHIST);
    MJ.AddHistYear(1994,29.4,5.8,7.8);                                                // Add statistics for year 1994
    MJ.PrintHist(WHIST);
    MJ.RemHistYear(1989);                                                             // Try removing statistics for year 1989
    MJ.RemHistYear(HERAS);                                                            // Erase history totally
    MJ.PrintHist(WHIST);

  }

}

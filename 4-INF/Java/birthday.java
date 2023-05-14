
/* BIRTHDAY SUPER-SUPERCLASS */

public class birthday {

    /* Birthday class attributes */
    
    public final String DS = "N/A";                                                     // Not available (N/A) default string constant
    
    private int Day;                                                                    // Initialized to 0 since not specified in the constructor)
    private int Month;
    private int Year;
    private String City;
    private String State;

    /* Birthday class methods */

    public class InvBdayDate extends Exception {  
        InvBdayDate( String S ){  
         super(S);
        }
    }

    protected birthday( ){
        this.City = "N/A";
        this.State = "N/A";
        System.out.printf("* birthday object created\n");
    }

    protected void SetDate( int NewD, int NewM, int NewY ) {
        try {
            if ( (NewD > 0) && (NewD <32 ) )
                this.Day = NewD;
            else
                throw new InvBdayDate("Invalid Day!");
            if ( (NewM > 0) && (NewM <13) )
                this.Month = NewM;
            else
                throw new InvBdayDate("Invalid Month!");
            if ( (NewY > 1900) && (NewY <2050) )
                this.Year = NewY;
            else
            throw new InvBdayDate("Invalid Year!");
        } catch( Exception Err ){
            System.out.printf("EXCEPTION -> "+Err+"\n\n");
            System.exit(1);                                                             // To stop execution if an exception in this function (SetDate) occurs                 
        }
    }

    protected void SetPlace( String NewC, String NewS ){
        this.City = NewC;
        this.State = NewS;
    }

    protected void PrintInfo( ){
        System.out.println("  - Birthday : "+this.Day+"/"+this.Month+"/"+this.Year);    
        System.out.println("  - Birthplace : "+this.City+" ("+this.State+")");
    }

}

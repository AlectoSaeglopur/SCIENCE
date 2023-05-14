
/* PERSON SUPERCLASS */

public class person extends birthday {
    
    /* Person class attributes */

    private String Name;
    private String Surname;
    private float Height;                                                               // Measured in [m]
    private float Weight;                                                               // Measured in [kg]
    private String Job;

    /* Person class methods */

    protected person( ){                                                                // NB: Do not use the keayword "void" as function parameter!                                          
        this.Name = DS;
        this.Surname = DS;
        this.Height = 0.0f;                                                             // The keyword "this" is not essential (but always good practice)
        this.Weight = 0.0f;                                                             // the "f" is needed for float type (0.0 would assume double type)
        this.Job = DS;
        System.out.printf("* person object created\n");
    }

    protected void SetName( String NewVal ){
        this.Name = NewVal;
    }

    protected void SetSurname( String NewVal ){
        this.Surname = NewVal;
    }

    protected void SetHeight( float NewVal ){
        if ( NewVal > 1.0 ){                                                            // Control that height to be set is at least 1 meter
            this.Height = NewVal;
        }
    }

    protected void SetWeight( float NewVal ){
        if ( NewVal > 50 ){
            this.Weight = NewVal;
        }
    }

    protected void SetJob( String NewVal ){
        this.Job = NewVal;
    }

    protected String GetName( ){
        return this.Name;
    }

    protected String GetSurname( ){
        return this.Surname;
    }

    protected void PrintInfo( ){       
        System.out.println("  - Name : "+this.Name);
        System.out.println("  - Surname : "+this.Surname);
        System.out.println("  - Height : "+this.Height+" m");
        System.out.println("  - Weight : "+this.Weight+" kg");
        System.out.println("  - Job : "+this.Job);
        super.PrintInfo();                                                              // Call PrintInfo method from "birthday" superclass
    }

}

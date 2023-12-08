class Main inherits IO{
    main(): IO { 
    {
        let s:String<-in_string(), s0:String <-in_string() in {
            
            out_string(s);
            out_string(" len(s) = ");
            out_int(s.length());

            out_string("\n");

            out_string(s0);
            out_string(" len(s0) = ");
            out_int(s0.length());

            out_string("\ns == s0:");
            if s=s0 then out_string("true") else out_string("false")fi;
            
        };

    }    
    };
};
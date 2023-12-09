class Main inherits IO{
    f1():Int{1};
    f2():Int{2};
    main(): IO { 
    {
        let s:String<-"in_string()" in {
            
            -- out_string(s);
            -- out_string(" len(s) = ");
            -- out_int(s.length());

            -- out_string("\n");

            -- out_string(s0);
            -- out_string(" len(s0) = ");
            -- out_int(s0.length());

            out_string("\n");
            if s.substr(0,1) = s.substr(0,1) then
            {
                out_string(s.substr(0,1));
                out_string(" == ");
                out_string(s.substr(0,1));
                out_string(" true");
            }
            else
            {
                out_string(s.substr(0,1));
                out_string(" == ");
                out_string(s.substr(0,1));
                out_string(" false");
            }
            fi;
            
            -- if f1() = f2() then
            -- {
            --     out_int(f1());
            --     out_string(" == ");
            --     out_int(f2());
            --     out_string(" true");
            -- }
            -- else
            -- {
            --     out_int(f1());
            --     out_string(" == ");
            --     out_int(f2());
            --     out_string(" false");
            -- }
            -- fi;

            -- out_string("\ns == s0:");
            -- if s=s0 then out_string("true") else out_string("false")fi;
            
        };

    }    
    };
};
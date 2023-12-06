class A{
    name: String <- "A";
    x: Int;
    b: Bool;

    init(_name:String,_x:Int,_b:Bool):A{
        
        {
            set_name(_name);
            self.set_x(_x);
            self@A.set_b(_b);
            self;
        }

    };
    get_name():String
    {
        {
            name;
        }
    };
    
    set_name(s:String):String{
        {
            name <- s;
        }
    };

    set_x(n:Int):Int{
        x<-n
    };

    set_b(v:Bool):Bool{
        b<-v
    };
    print():IO
    {
        let io:IO<- new IO in
        {
            io.out_string("A:\n");
            io.out_string("Nombre: ");
            io.out_string(name);
            io.out_string("\nx = ");
            io.out_int(x);
            io.out_string("\nb = ");
            if b then io.out_string("true\n") else io.out_string("false\n") fi;
        }
    };
};


class Main inherits IO{
    main(): IO { 
    {
        -- let a:A <- new A in {
        --     a.init("test_name_A ",1,true);
        --     a.print();
        -- };

        -- if 3 = 3 then new IO.out_string("3 = 3 true\n") else new IO.out_string("3 = 3 false\n") fi;   
        -- if 3 <= 3 then new IO.out_string("3 <= 3 true\n") else new IO.out_string("3 <= 3 false\n") fi;
        -- if 3 < 3 then new IO.out_string("3 < 3 true\n") else new IO.out_string("3 < 3 false\n") fi;
        -- if 3 < 4 then new IO.out_string("3 < 4 true\n") else new IO.out_string("3 < 4 false\n") fi;
        
        -- if "asd" = "asd" then new IO.out_string("'asd' = 'asd' true\n") else new IO.out_string("'asd' = 'asd' false\n") fi;
        -- if "asda" = "asd" then new IO.out_string("'asda' = 'asd' true\n") else new IO.out_string("'asda' = 'asd' false\n") fi;
        -- if "assa" = "asd" then new IO.out_string("'assa' = 'asd' true\n") else new IO.out_string("'assa' = 'asd' false\n") fi;

        let a:A <- new A, a0: A <- a in{
            if a = a0 then new IO.out_string("a = a0 true\n") else new IO.out_string("a = a0 false\n") fi;
            a <- new A;
            new IO.out_string("a = new A\n");
            if a = a0 then new IO.out_string("a(new) = a0 true\n") else new IO.out_string("a(new) = a0 false\n") fi;

        };



    }    
    };
};
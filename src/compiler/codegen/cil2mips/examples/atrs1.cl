class A{
    s: String;
    l: String;
    x: Int <-13;

    f():A
    {
        {
            new IO.out_string(s);
            self;
        }
    };
    
    set_s(k:String):String{
        {
            self@A.set_x(18);
            s <- k;
        }
    };

    set_x(n:Int):Int{
        x<-n
    };

    print():IO
    {
        {
            new IO.out_string(s);
            new IO.out_int(x);
        }
    };
};

class B{
    b():B{ new B};
    a():A{ new A};
};

class Main inherits IO{
    main(): IO { 
    {
        let a:A <- new A in {
            a <- new B.a();
            a.set_s("test_string ");
            a.print().out_string(" another string");
        };
    }    
    };
};
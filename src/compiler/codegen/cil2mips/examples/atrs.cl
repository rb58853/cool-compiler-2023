class A{
    x:Int<-13;
    y:Int;
    z:Bool;

    f(n:Int):Int
    {
        {
            n <- x + n + y;
            set_y(10);
            n+y;
        }
    };
    set_y(n:Int):Int{
        y<-n
    };
};
class B{
    b():B{ new B};
    a():A{ new A};
};

class Main{
    main(): Int { 
    {
        let a:A <- new A in {
            a <- new B.a();
            a.set_y(5);
            a.f(2);
            -- a.set_y(2);
        };
    }    
    };
};
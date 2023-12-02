class A{
    x:Int<-13;
    y:Int;
    z:Bool;

    f(n:Int):Int
    {
        {
            x + n + y;
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
            -- new B.a().f(2); #esto pincha bien
            a <- new B.a();
            a.set_y(5);
            a.f(2);
        };
    }    
    };
};
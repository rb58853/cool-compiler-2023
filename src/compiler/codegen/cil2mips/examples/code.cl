class A{
    x:Int<-13;
    y:Int;
    z:Int;

    f(n:Int):Int
    {
        {
            n <- x + n + y;
            set_y(10);
            z <- n+y;
            test1(2);
        }
    };
    
    set_y(n:Int):Int{
        y<-n
    };
    test1(k:Int):Int{
        {
            k <- k * z;
            set_y(10);
            test2(k);
        }  
    };
    test2(x1:Int):Int{
        y+x1
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
        };
    }    
    };
};
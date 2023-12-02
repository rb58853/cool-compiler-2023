class A{
    x:Int<-13;
    y:Int;
    z:Bool;

    f(n:Int):Int
    {
        {
            n + x;
        }
    };
};
class B{
    b():B{ new B};
    a():A{ new A};
};

class Main{
    main(): Int { 
    {
        new B.a().f(2);
    }    
    };
};

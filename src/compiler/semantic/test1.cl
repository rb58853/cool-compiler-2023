class MyClass1 inherits MyClass2{ 
    a:Int <- 2; 
    b:MyClass2;
    s:String;

    f1(y:Int):Int { 
        {
            let x: Int, y:String <-"123", a:Bool, x:Int<-1 in y.length();
            --y <- 1;
            --s <- b.s(y);
            --s <- b.s(y).length(); -- Esto tiene que dar error
            a <- new MyClass2.s(y).length();
            --a <- new INT.s(y).length(); -- Error s no esta definido en Int
        }
    }; 
};

class MyClass2 { 
    b:MyClass1; 
    f2(y:Int):Int 
    { 
        y <- 1 
    };

    s(x:Int):String 
    { 
        "y <- 1" 
    }; 
};
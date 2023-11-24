class MyClass1 inherits MyClass2{ 
    a:Int <- 2; 
    b:MyClass2 <- new MyClass1;
    b1:MyClass1;
    s:String;
    bool_test: Bool;

    f1(y:Int):Int { 
        {
            b <- new MyClass1; 
            -- b <- new Int; --Error No se puede asignar Int a MyClass2
            --bool_test <- b = b1;
            --let x: String, y:String <-"123", a:Bool, x:Int<-1 in y.length();
            --y <- 1;
            --s <- b.s(y);
            --s <- b.s(y).length(); -- Esto tiene que dar error
            a <- new MyClass2.s(y).length();
            --a <- new INT.s(y).length(); -- Error s no esta definido en Int
        }
    }; 
};


class MyClass2 { 
    c:MyClass1 <- new MyClass1; 
    f2(y:Int):Int
    { 
        y <- 1 
    };

    s(x:Int):String 
    { 
        "y <- 1" 
    }; 
};
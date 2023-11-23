class MyClass1 inherits MyClass2{ 
    a:INT <- 2; 
    b:MyClass2;
    s:STRING;

    f1(y:INT):INT { 
        {
            --y <- 1;
            --s <- b.s(y);
            --s <- b.s(y).length(); -- Esto tiene que dar error
            a <- new MyClass2.s(y).length();
            --a <- new INT.s(y).length(); -- Error s no esta definido en INT
        }
    }; 
};

class MyClass2 { 
    b:MyClass1; 
    f2(y:INT):INT 
    { 
        y <- 1 
    };

    s(x:INT):STRING 
    { 
        "y <- 1" 
    }; 
};
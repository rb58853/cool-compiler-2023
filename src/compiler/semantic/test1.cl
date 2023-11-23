class MyClass1 inherits MyClass2{ 
    a:INT <- 2; 
    b:MyClass2;
    s:STRING;

    f1(y:INT):INT { 
        {
            --y <- 1;
            --s <- b.s(y);
            --s <- b.s(y).length(); -- Esto tiene que dar error
            a <- b.s(y).length();
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
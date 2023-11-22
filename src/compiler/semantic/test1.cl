class MyClass1 inherits MyClass2{ 
    a:INT <- 2; 
    b:MyClass2;
    s:STRING;

    f1(y:INT):INT { 
        {
            --y <- 1;
            s <- b.s().length();
            a <- b.s().length();
        }
    }; 
};

class MyClass2 { 
    b:MyClass1; 
    f2(y:INT):INT 
    { 
        y <- 1 
    };

    s():STRING 
    { 
        "y <- 1" 
    }; 
};
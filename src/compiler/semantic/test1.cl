class MyClass1 inherits MyClass2{ 
    a:INT <- 2; 
    f(y:INT):INT 
    { 
        y <- 1 
    }; 
};

class MyClass2 inherits MyClass1{ 
    b:MyClass1; 
    f(y:INT):INT 
    { 
        y <- 1 
    }; 
};
class MyClass2 { 
    b:INT <- 2; 
    f(y:INT):INT 
    { 
        {
            y<-y+1; 
            print(y + 3);
        } 
    }; 
}
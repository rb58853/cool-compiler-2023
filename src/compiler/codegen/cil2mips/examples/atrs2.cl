
class Main inherits IO{
    x:Int <- 1;
    y:Int <- x;
    main(): IO { 
    {
        out_int(x);
        out_int(y);
    }    
    };
};
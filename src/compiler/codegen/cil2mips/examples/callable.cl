class A{
    x:Int;
    y:Int;
    z:Bool;
};
class B{
    b:A <- new A;
};

class Main{
    main(): Int { 
        -- let x:Int <- 4, y:Int<-x+ test(5,2) in {
        --     x <- test(y,x);
        --     x;
        -- }
        let x:Int <- 2, y:Int<- x + test(test(test(10,10),x),2) in{
            y;
        }
        
    };

    test(a:Int, b:Int):Int {
        {
            let x:Int<- 10 in {
               a <- b + a + x;
            };
            -- a;
        }
    };    
};

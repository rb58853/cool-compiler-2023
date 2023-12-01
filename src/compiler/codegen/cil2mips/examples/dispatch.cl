class Main{
    q:Int <- 0;
    w:Int <- 1;
    e:Int <- 2;

    main(): Int { 
        -- let x:Int <- 2 + let x:Int<-1 in x+ let y:Int <- x+2 in y + x, b:Int<-0 in {
        let x:Int <- 4, y:Int<-x+ test(5,2) in {
            x <- test(y,x);
            x;
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
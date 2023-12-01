class Main{
    main(): Int { 
        -- let x:Int <- 4, y:Int<-x+ test(5,2) in {
        --     x <- test(y,x);
        --     x;
        -- }
        let x:Int <- 2, y:Int<- 2 + test(5,2) in{
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
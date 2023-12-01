class Main{
   
    main(): Int { 
        let x:Int <- 2 + let x:Int<-1 in x+ let y:Int <- x+2 in y + x, b:Int<-0 in {
            x <- 3 + x;
            x;
        }
    };    
};
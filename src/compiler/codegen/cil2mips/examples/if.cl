-- class B{
--     isFalse():Bool{ false};
--     isTrue():Bool{ true};
-- };

-- class IF_{
--     test(b:B): Int
--     {
--         if b.isFalse() then 1 else 0 fi
--     };
--     -- str(s:String):String{
--     --     s
--     -- };
-- };

class Main inherits IO{
    x:Int <-5;
    main(): Object { 
    {
        while 0 < x loop
        {
            x<- x-1;
        }
        pool;
    }    
    };
};
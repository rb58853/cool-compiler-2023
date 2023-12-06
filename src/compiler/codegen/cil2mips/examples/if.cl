-- class A{
--     s: String;
--     l: String;
--     x: Int <-13;

--     f():A
--     {
--         {
--             new IO.out_string(s);
--             self;
--         }
--     };
    
--     set_s(k:String):String{
--         {
--             self.set_x(18);
--             s <- k;
--         }
--     };

--     set_x(n:Int):Int{
--         x<-n
--     };

--     print():IO
--     {
--         {
--             new IO.out_string(s);
--             new IO.out_int(x);
--         }
--     };
-- };

-- class B{
--     b():B{ new B};
--     a():A{ new A};
-- };

class IF_{
    test(x:Int, y:Int): Int
    {
        if not not not x < y then 1 else 0 fi
    };
    -- str(s:String):String{
    --     s
    -- };
};

class Main inherits IO{
    main(): IO { 
    {
        new IO.out_int(new IF_.test(3,2));
        -- new IO.out_string(new IF_.str("1234"));
    }    
    };
};
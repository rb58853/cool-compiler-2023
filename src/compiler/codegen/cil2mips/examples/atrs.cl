class A{
    a():Int{1};
    -- b():Int{2};
    -- c():Int{a()+b()};
    -- d():Int{c()+a()};
    -- e():Int{a()+b()+d()};
    -- plus(x:Int, y:Int):Int{ x + y };
    -- minus(x:Int, y:Int):Int{ x - y };
};
class B{
    a():Int{1};
    -- b():Int{2};
    -- c():Int{a()+b()};
    -- d():Int{c()+a()};
    -- e():Int{a()+b()+d()};
};


class Main inherits IO{
    main(): IO 
    { 
        {
            let a:A <- new A, int:Int in {
            value(value(a.a()));
            --     -- int<-(a.plus (a.e(),a.plus(a.minus(a.e(),a.a()),b.d())));
                -- int<-value(value(a.a()));
            --     -- int<-value(a.plus(a.b(),a.a()));
            --     -- print(a.plus(a.b(),a.a()));
                -- out_int(int);
                out_int(1);
            };
        }
    };
    value(x:Int):Int{
        x
        -- plus(x,10)
    };
    plus(x:Int,y:Int):Int{
        x+y
    };

    print(value:Int):IO{
        out_int(value)
    }; 
};
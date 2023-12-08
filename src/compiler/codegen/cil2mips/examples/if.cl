class B{
    isFalse():Bool{ false};
    isTrue():Bool{ true};
};

class IF_{
    test(b:B): String
    {
        if b.isFalse() then "true" else "false" fi
    };
    -- str(s:String):String{
    --     s
    -- };
};

class Main inherits IO{
    main(): IO { 
        {
            out_string(test());
        }
    };

    test():String{
        if true then "true" else "false" fi
    } ;   

};
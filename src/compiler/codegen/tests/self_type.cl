class Silly 
{
    copy() : SELF_TYPE { self };
};
class Sally inherits Silly { };

class Main inherits IO
{
    x : Sally <- (new Sally).copy();
    
    main() : IO {
        -- Esto tiene que imprimir Sally
        out_string(x.type_name()) 
    };
};

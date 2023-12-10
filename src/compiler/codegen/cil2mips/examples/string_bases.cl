class Main inherits IO{
    main(): IO { 
    {
        -- out_string("123456".concat("11"));
        out_string("\nel length de un string vacio es ");
        out_int("".length());
        out_string("\nel resultado de concatenar en string vacio con 123 es ");
        out_string("".concat("123"));
        out_string("\nel resultado de concatenar - con 123 es ");
        out_string("-".concat("123"));
        out_string("\nel substring(0,1) -123 es ");
        out_string("-123".substr(0,1));

    }    
    };
};
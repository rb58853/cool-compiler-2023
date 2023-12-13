class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{
    a:A <- new A;
    v:A;
    exit:String <- "error";
    
    main(): IO
    { 
        {
            if isvoid a then 
            out_string("a es void")
            else
            out_string("a no es void")
            fi;
            
            if isvoid v then 
            out_string("\nv es void\n")
            else
            out_string("\nv no es void\n")
            fi;
            


            
        }
    };
};
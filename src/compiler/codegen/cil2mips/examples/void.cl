class A {};
class Main inherits IO{
    main(): IO { {
            let a:A in 
            let a:A, b:A in {
                if a = b then out_string("a = b true\n") else out_string("a = b false\n") fi;
                a<- new A;
                out_string("\na type_name: ");
                out_string(a.type_name());
                out_string("\nb type_name: ");
                out_string(b.type_name());

                if a = b then out_string("\na(new) = b true\n") else out_string("\na(new) = b false\n") fi;
                if isvoid(b) then out_string("b is void true\n") else out_string("b is void false\n") fi; 
                if isvoid(a) then out_string("a is void true\n") else out_string("a is void false\n") fi; 
            }; 
            out_string("exit\n");
        }
    };
};
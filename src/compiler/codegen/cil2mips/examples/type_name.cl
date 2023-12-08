class A {
    print():String{
      "Clase A"    
    };
};
class B inherits A{
    print():String{
      "Clase B"    
    };
};
class Main inherits IO{
    main(): IO { 
        let a:A<- new A in {
        a <- New B;    
        out_string(a.type_name());
        out_string("\n");
        out_string(new String.type_name());
        out_string("\n");
        out_string(new Int.type_name());
        out_string("\n");
        out_string(new Bool.type_name());
        }
    };
};
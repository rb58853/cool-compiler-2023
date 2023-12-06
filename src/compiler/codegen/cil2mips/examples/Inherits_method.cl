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
        out_string(a.print());
        }
    };
};
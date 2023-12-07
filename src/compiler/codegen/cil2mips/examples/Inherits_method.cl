class A {
    x:Int<-0;
    print():String{
      "Clase A\n"
    };
};
-- class B inherits A{
--   --B debe tener tambien un metodo llamado print y un atributo x con valor 0
  
-- };
class Main inherits IO{
    main(): IO { 
        -- let a:A<- new A in {
        -- -- a <- New B;    
        -- out_string(a.print());
        -- }
        -- {
            out_string(new A.print())
        --   -- out_string(new A.type_name());
        -- }
    };
};
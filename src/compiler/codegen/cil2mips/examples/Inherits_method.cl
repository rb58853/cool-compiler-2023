class A {
    x:Int<-0;
    y:Int<-13;
    print():String{
      "Clase A\n"
    };
};
class B inherits A{
  --B debe tener tambien un metodo llamado print y un atributo x con valor 0
  print():String{
    {
      abort();
      "Clase B\n";
    }

  };
};

class C inherits B {
  print():String{
    "Clase C\n"
  };
  set_x(n:Int):Int{
    {
      x<-n;
      y;
    }
  };
};

class Main inherits IO{
    main(): IO { 
        let a:A<- new A, c:C<-new C in {
        a <- New C;
        out_string(a.print());
        out_string(a.type_name());
        out_string(c@B.print());
        abort();
        out_int(c.set_x(11));
        }
        -- {
            -- out_string(new A.print())
        --   -- out_string(new A.type_name());
        -- }
    };
};
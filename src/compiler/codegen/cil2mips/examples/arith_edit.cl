class A {

   var : Int <- 0;

   value() : Int { var };
   set_value(value:Int): Int {var<-value};
}; 

class Main inherits IO {
   
   char : String;
   flag : Bool <- true;
   a:A <- new A;

   menu() : String {
      {
	        out_string("\tTo quit...enter q:\n\n");
            in_string();
      }
   };
   main() : Object {
      {
         a.set_value(1234);
         print(a.value());
      }
   
   };

   -- print(var : A) : IO {
   print(value : Int) : IO {
	         out_string(i2a(value))
   };
   i2a(i : Int) : String {
      {
	      if i = 0 then "0" else 
            if 0 < i then i2a_aux(i) else
              "-".concat(i2a_aux(i * ~1)) 
            fi fi;
            
      }
   };
   i2a_aux(i : Int) : String {
      {
        if i = 0 then "" else 
	    (let next : Int <- i / 10 in{

		 i2a_aux(next).concat(i2c(i - next * 10));
       }
	    )
        fi;
      }
   };
   
   i2c(i : Int) : String {
      {
	      if i = 0 then "0" else
	      if i = 1 then "1" else
	      if i = 2 then "2" else
	      if i = 3 then "3" else
	      if i = 4 then "4" else
	      if i = 5 then "5" else
	      if i = 6 then "6" else
	      if i = 7 then "7" else
	      if i = 8 then "8" else
	      if i = 9 then "9" else
	      { abort(); ""; }  -- the "" is needed to satisfy the typchecker
              fi fi fi fi fi fi fi fi fi fi;
           }
      };
};


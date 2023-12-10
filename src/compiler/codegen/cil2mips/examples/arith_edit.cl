
class Main inherits IO {
   
   char : String;
   flag : Bool <- true;


   menu() : String {
      {
	        out_string("\tTo quit...enter q:\n\n");
            in_string();
      }
   };
   main() : Object {
      {
         while flag loop
            {
	            char <- menu();
                
                -- if flag then
                -- out_string("flag es true\n")
                -- else
                -- out_string("flag es false\n")
                -- fi;
                
                if char = "q" then{
                    out_string("Entro al if para cambiar el valor de flag\n");
                    flag <- false;
                } 
		        else
                    out_string("No es 'q' la letra\n")
                fi;
            }
         pool;
       }
   };

};


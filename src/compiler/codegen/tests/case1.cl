class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{
    instance:A <- new A;
    exit:String <- "error";
    
    main(): IO
    { 
        {
            instance <- new D;
            out_string("La instancia es de tipo dinamico: ");
            case instance of
            int:Int => exit <-"Int\n";
            string:String => exit <-"String\n";
            bool:Bool => exit <-"Bool\n";
            object:Object => exit <-"Object\n";
            io:IO => exit <-"IO\n";
            a:A => exit <-"A\n";
            b:B => exit <-"B\n";
            c:C => exit <-"C\n";
            d:D => exit <-"D\n";
            e:E => exit <-"E\n";
            f:F => exit <-"F\n";
            g:G => exit <-"G\n";
            esac;

            out_string(exit);
        }
    };
};
class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{
    exit:String <- "error";
    
    main(): IO
    { 
        {
            --Esto tiene que dar error xq o hay ni string ni Object en los case
            case "new String" of
            int:Int => exit <-"Int\n";
            bool:Bool => exit <-"Bool\n";
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
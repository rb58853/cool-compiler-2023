class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{
    a:A <- new A;
    exit:String <- "error";
    main(): IO
    { 
        {
            case a of
            int:Int => exit <-"Int";
            string:String => exit <-"String";
            bool:Bool => exit <-"Bool";
            object:Object => exit <-"Object";
            io:IO => exit <-"IO";
            a:A => exit <-"A";
            b:B => exit <-"B";
            c:C => exit <-"C";
            d:D => exit <-"D";
            e:E => exit <-"E";
            f:F => exit <-"F";
            g:G => exit <-"G";
            esac;

            out_string(exit);
        }
    };
};
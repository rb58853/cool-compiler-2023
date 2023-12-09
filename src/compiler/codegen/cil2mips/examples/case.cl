class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{

    main(): IO
    { 
        {

            out_string("exit");
        }
    };
};
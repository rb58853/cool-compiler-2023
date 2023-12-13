class A {};
class B inherits A {};
class C inherits B {};
class D inherits A {};
class E inherits B {};
class F inherits C {};
class G inherits F {};

class Main inherits IO{
    a0:A <- new A;
    a1:A <- new B;
    a2:A <- new C;
    a3:A <- new D;

    main(): IO
    { 
        {
            a0 <- a1.copy();
            out_string("\nSe asigna a0 <- a1.copy(). (a1 es de tipo dinamico B). Luego a0.type_name = ");
            out_string(a0.type_name());
            a0 <- a2.copy();
            out_string("\nSe asigna a0 <- a2.copy(). (a2 es de tipo dinamico C). Luego a0.type_name = ");
            out_string(a0.type_name());
            a0 <- a3.copy();
            out_string("\nSe asigna a0 <- a3.copy(). (a3 es de tipo dinamico D). Luego a0.type_name = ");
            out_string(a0.type_name());
            out_string("\na0 es una copia de a3 y la operacion == entre ellos devuelve: ");
            if a0 = a3 then
            out_string("true\n")
            else
            out_string("false\n")
            fi;
        }
    };
};
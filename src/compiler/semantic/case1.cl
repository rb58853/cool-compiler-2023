--For each branch, let Ti be the static type of <expri>. The static type of a case expression is Join 1≤i≤n Ti.

class A { };
class B inherits A { };
class C inherits B { };
class D inherits B { };
class E inherits B { }; 
class F inherits A { }; 

class Main inherits IO {
	main(): IO { out_string("Hello World!")};

	test: B <- case 0 of
				b: Bool => new F;
				i: Int => new E;
			esac;
};  

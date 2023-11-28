class A {
    x:Int <- 0;
    b_func(): B { new B };
};

class B inherits A{
    s0:String <- "string";
    
    f():Int{
        1+4
    };
};

class Main{
    x: Int;
    s: String;
    b_class: B;
    a_class: A;

    test_case():Int{
        b: Int <- case "true" of
			i: Int => 1;
			b: Bool => 2;
			s: String => 3;
        	-- i: Int => let z:Int<-1 in z+3;
			-- b: Bool => 2 + x;
			-- s: String => 3 + 4;
		esac;
    }
	-- test_dispatch(y:Int): Int { 
    --     a_class.b_func().f()
    -- };
    
    -- test_let(y:Int): Int { 
        -- y <- 18 + let a:Int <- 2 + y - let z:Int<-1 in z+3, b:String <- "s" in {
        --     a <- y + 3 + a;
        --     a;
        -- }
    -- }    
};
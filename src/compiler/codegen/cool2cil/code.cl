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
    _bool: Bool;
	i: Int <- 1;
    
    test_while(y:Int): Object{
        while i<= let x_0:Int<-13 in x_0*i loop i <- i + 1 pool
    };
    -- test_logical(y:Bool): Bool { 
    --     y <- 18 <= let a:Int <- 2 + 3 - let z:Int<-1 in z+3, b:String <- "s" in {
    --         a <- 3 + a + x;
    --         a;
    --     }
    -- };    
    
    -- test_if():Int{
    --     if 18 <= let a:Int <- 2 + 3 - let z:Int<-1 in z+3, b:String <- "s" in {a <- 3 + a + x;a;} then 
    --     x <- 1 + x
    --     else
    --     x<-2 + let z:Int<-1 in z+3
    --     fi
    -- };

    -- test_case():Int{
    --     b: Int <- case "true" of
	-- 		i: Int => 1;
	-- 		b: Bool => 2;
	-- 		s: String => 3;
    --     	-- i: Int => let z:Int<-1 in z+3;
	-- 		-- b: Bool => 2 + x;
	-- 		-- s: String => 3 + 4;
	-- 	esac;
    -- };

	-- test_dispatch(y:Int): Int { 
    --     a_class.b_func().f()
    -- };
    
    -- test_let(y:Int): Int { 
    --     y <- 18 + let a:Int <- 2 + y - let z:Int<-1 in z+3, b:String <- "s" in {
    --         a <- y + 3 + a;
    --         a;
    --     }
    -- };    
};
class Main inherits IO {
    pal(s : String) : Bool {
	if s.length() = 0
	then true
	else if s.length() = 1
	then true
	else if s.substr(0, 1) = s.substr(s.length() - 1, 1)
	then
	 {
		out_string(s.substr(0, 1));
		out_string(" = ");
		out_string(s.substr(s.length() - 1, 1));
		out_string(" true\n");


		pal(s.substr(1, s.length() -2));
	 }
	else false
	fi fi fi
    };

    i : Int;

    main() : IO {
	{
        i <- ~1;
	    out_string("enter a string\n");
	    if pal(in_string())
	    then out_string("\nthat was a palindrome\n")
	    else out_string("\nthat was not a palindrome\n")
	    fi;
	}
    };
};

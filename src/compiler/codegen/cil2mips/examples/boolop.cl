class BoolOp {

  and(b1 : Bool, b2 : Bool) : Bool {
     if b1 then b2 else false fi
  };


  or(b1 : Bool, b2 : Bool) : Bool {
     if b1 then true else b2 fi
  };

};

class Main inherits IO {
    boolop:BoolOp <- new BoolOp;
    main():IO{
        if boolop.and(3<5, not 3<6) then out_string("and true") else out_string("and false") fi
    };
};
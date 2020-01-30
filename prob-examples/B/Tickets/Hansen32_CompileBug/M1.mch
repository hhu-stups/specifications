MACHINE M1
INCLUDES M2
DEFINITIONS
  "CHOOSE.def"
OPERATIONS
  out <-- bar =
    VAR res,todo,yy
    IN
      res := 0 ;
      todo := 1..100;
      WHILE todo /= {}
      DO
        yy := CHOOSE(todo);
        todo := todo \{yy};
        res <-- foo(yy)
      INVARIANT todo <: 1..100
      VARIANT card(todo)
      END;
      out := res
    END
END

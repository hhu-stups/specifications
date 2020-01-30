MACHINE M2
DEFINITIONS
  "CHOOSE.def"
OPERATIONS
  out <-- foo(p) =
    VAR res, todo, x
    IN
      res := 0 ;
      todo := 1..100;
      WHILE todo /= {}
      DO
        x := CHOOSE(todo);
        todo := todo \{x};
        res := res + p
      INVARIANT todo <: 1..100
      VARIANT card(todo)
      END;
      out:= res
    END
END

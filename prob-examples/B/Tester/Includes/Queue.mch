MACHINE Queue(TYPE)
CONSTANTS mx
PROPERTIES mx = 10
VARIABLES q
INVARIANT q:seq(TYPE)
INITIALISATION q := {}
OPERATIONS
  add(el) = PRE el:TYPE & size(q)<mx THEN q := q <- el END;
  el <-- pop = PRE q /= {} THEN
     q := tail(q) ||
     el := first(q)
    END
END
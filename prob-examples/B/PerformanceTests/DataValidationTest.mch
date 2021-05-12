MACHINE DataValidationTest
DEFINITIONS
  SET_PREF_TIME_OUT == 120000
CONSTANTS
  n,
  ids, value, ids_for_value
PROPERTIES
  n = 20001 & // with n>20000 value is kept symbolic
  ids = 1..n &
  value = %x.(x:1..n | x mod 100) &
  ids_for_value = value~
VARIABLES counter, error, checked
INVARIANT
   counter :0..n &
   error : BOOL &
   checked : BOOL
INITIALISATION counter := 0 || error := FALSE || checked := FALSE
OPERATIONS
  Validate = BEGIN
     WHILE counter < n DO
        counter := counter + 1;
        IF counter /: ids THEN
           error := TRUE
        //ELSIF counter: 0..n & (counter mod 100) /: 0..99 THEN
        ELSIF counter|->100 : value  THEN
        //ELSIF value(counter) /: 0..99 THEN
           error := TRUE
        ELSIF card(ids_for_value[{value(counter)}]) < n/100 THEN
           error := TRUE
        END
        INVARIANT counter:INTEGER
        VARIANT n-counter
    END ;
        checked := TRUE
  END
END

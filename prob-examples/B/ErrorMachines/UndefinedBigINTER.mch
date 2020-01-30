MACHINE UndefinedBigINTER
ABSTRACT_CONSTANTS rs
PROPERTIES rs : FIN(INT) & rs={} 
OPERATIONS
 ss <-- GetINTER = BEGIN
     ss := INTER(z).(z:rs|{z})  /* this should raise a well-definedness error */
  END
END
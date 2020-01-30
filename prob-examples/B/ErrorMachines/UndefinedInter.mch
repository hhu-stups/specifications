MACHINE UndefinedInter
ABSTRACT_CONSTANTS rs
PROPERTIES rs <: FIN(INT) & rs={} 
OPERATIONS
 ss <-- GetInter = BEGIN
     ss := inter(rs) /* this should raise a well-definedness error */
  END
END
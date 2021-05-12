MACHINE LibraryLustre

SETS REF = {ref}

ABSTRACT_CONSTANTS
 l_and, l_or, l_not,
 l_plus, l_minus, l_multiply, l_divide, l_unary_minus,
 l_less, l_greater, l_less_equal, l_greater_equal,
 l_equal_integer, l_unequal_integer, l_equal_boolean, l_unequal_boolean,
 l_fby_integer, l_fby_boolean,
 l_ite_integer, l_ite_boolean

PROPERTIES
  l_and : POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_and = (%(x,y).(x : POW(REF * BOOL) & y : POW(REF * BOOL) | IF x = {ref |-> FALSE} or y = {ref |-> FALSE} THEN {ref |-> FALSE} ELSE IF x = {ref |-> TRUE} THEN y ELSE {} END END)) &
  l_or : POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_or = (%(x,y).(x : POW(REF * BOOL) & y : POW(REF * BOOL) | IF x = {ref |-> TRUE} or y = {ref |-> TRUE} THEN {ref |-> TRUE} ELSE IF x = {ref |-> FALSE} THEN y ELSE {} END END)) &
  l_not : POW(REF * BOOL) --> POW(REF * BOOL) &
  l_not = (%x.(x : POW(REF * BOOL) | IF x = {} THEN {} ELSE {ref |-> bool(not(x(ref) = TRUE))} END)) &
  l_plus : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_plus = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) + y(ref)} END)) &
  l_minus : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_minus = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) - y(ref)} END)) &
  l_multiply : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_multiply = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) * y(ref)} END)) &
  l_divide : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_divide = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) / y(ref)} END)) &
  l_unary_minus : POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_unary_minus = (%x.(x : POW(REF * INTEGER) | IF x = {} THEN {} ELSE {ref |-> -x(ref)} END)) &
  l_less_equal : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_less_equal = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) <= y(ref))} END)) &
  l_less : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_less = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) < y(ref))} END)) &
  l_greater_equal : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_greater_equal = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) >= y(ref))} END)) &
  l_greater : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_greater = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) > y(ref))} END)) &
  l_equal_integer : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_equal_integer = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) = y(ref))} END)) &
  l_unequal_integer : POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * BOOL) &
  l_unequal_integer = (%(x,y).(x : POW(REF * INTEGER) & y : POW(REF * INTEGER) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) /= y(ref))} END)) &
  l_equal_boolean : POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_equal_boolean = (%(x,y).(x : POW(REF * BOOL) & y : POW(REF * BOOL) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) = y(ref))} END)) &
  l_unequal_boolean : POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_unequal_boolean = (%(x,y).(x : POW(REF * BOOL) & y : POW(REF * BOOL) | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) /= y(ref))} END)) &
  l_fby_integer : BOOL * POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_fby_integer = (%(x,y,z).(x : BOOL & y : POW(REF * INTEGER) & z : POW(REF * INTEGER) | IF x = TRUE THEN y ELSE z END)) &
  l_fby_boolean : BOOL * POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_fby_boolean = (%(x,y,z).(x : BOOL & y : POW(REF * BOOL) & z : POW(REF * BOOL) | IF x = TRUE THEN y ELSE z END)) &
  l_ite_integer : POW(REF * BOOL) * POW(REF * INTEGER) * POW(REF * INTEGER) --> POW(REF * INTEGER) &
  l_ite_integer = (%(x,y,z).(x : POW(REF * BOOL) & y : POW(REF * INTEGER) & z : POW(REF * INTEGER) | IF x = {} THEN {} ELSE IF x(ref) = TRUE THEN y ELSE z END END)) &
  l_ite_boolean : POW(REF * BOOL) * POW(REF * BOOL) * POW(REF * BOOL) --> POW(REF * BOOL) &
  l_ite_boolean = (%(x,y,z).(x : POW(REF * BOOL) & y : POW(REF * BOOL) & z : POW(REF * BOOL) | IF x = {} THEN {} ELSE IF x(ref) = TRUE THEN y ELSE z END END))
END

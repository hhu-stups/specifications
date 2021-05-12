MACHINE LibraryLustre

SETS REF = {ref}

ABSTRACT_CONSTANTS
  l_ite_integer,
  l_less, l_greater, l_less_equal, l_greater_equal,
  l_plus, l_minus, l_multiply, l_divide, l_unary_minus,
  l_equal_integer, l_unequal_integer,
  l_fby_integer,
  LUSTRE_INT,
  LUSTRE_INT_NOT_NIL
CONSTANTS
  LUSTRE_BOOL, LUSTRE_BOOL_NOT_NIL,
  l_and, l_or, l_not,
  l_equal_boolean, l_unequal_boolean,
  l_fby_boolean,
  l_ite_boolean

PROPERTIES
  LUSTRE_INT = {x | x : POW(REF * INTEGER) & card(x) <= 1} &
  LUSTRE_BOOL = {x | x : POW(REF * BOOL) & card(x) <= 1} &
  LUSTRE_INT_NOT_NIL = {x | x : POW(REF * INTEGER) & card(x) = 1} &
  LUSTRE_BOOL_NOT_NIL = {x | x : POW(REF * BOOL) & card(x) = 1} &
  l_and = (%(x,y).(x : LUSTRE_BOOL & y : LUSTRE_BOOL | IF x /= {} & y /= {} THEN
                                                                {ref |-> bool(x(ref) = TRUE & y(ref) = TRUE)}
                                                              ELSE
                                                                IF x = {} THEN
                                                                  IF y = {} THEN
                                                                    {}
                                                                  ELSE
                                                                    IF y(ref) = FALSE THEN
                                                                      {ref |-> FALSE}
                                                                    ELSE
                                                                      {}
                                                                    END
                                                                  END
                                                                ELSE
                                                                  IF x(ref) = FALSE THEN
                                                                    {ref |-> FALSE}
                                                                  ELSE
                                                                    {}
                                                                  END
                                                                END
                                                              END)) &
  l_or = (%(x,y).(x : LUSTRE_BOOL & y : LUSTRE_BOOL | IF x /= {} & y /= {} THEN
                                                                {ref |-> bool(x(ref) = TRUE or y(ref) = TRUE)}
                                                              ELSE
                                                                IF x = {} THEN
                                                                  IF y = {} THEN
                                                                    {}
                                                                  ELSE
                                                                    IF y(ref) = TRUE THEN
                                                                      {ref |-> TRUE}
                                                                    ELSE
                                                                      {}
                                                                    END
                                                                  END
                                                                ELSE
                                                                  IF x(ref) = TRUE THEN
                                                                    {ref |-> TRUE}
                                                                  ELSE
                                                                    {}
                                                                  END
                                                                END
                                                              END)) &
  l_not = (%x.(x : LUSTRE_BOOL | IF x = {} THEN {} ELSE {ref |-> bool(x(ref) /= TRUE)} END)) &
  l_plus = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) + y(ref)} END)) &
  l_minus = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) - y(ref)} END)) &
  l_multiply = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) * y(ref)} END)) &
  l_divide = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> x(ref) / y(ref)} END)) &
  l_unary_minus = (%x.(x : LUSTRE_INT | IF x = {} THEN {} ELSE {ref |-> -x(ref)} END)) &
  l_less_equal = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) <= y(ref))} END)) &
  l_less = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) < y(ref))} END)) &
  l_greater_equal = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) >= y(ref))} END)) &
  l_greater = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x(ref) > y(ref))} END)) &
  l_equal_integer = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x = y)} END)) &
  l_unequal_integer = (%(x,y).(x : LUSTRE_INT & y : LUSTRE_INT  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x /= y)} END)) &
  l_equal_boolean = (%(x,y).(x : LUSTRE_BOOL & y : LUSTRE_BOOL  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x = y)} END)) &
  l_unequal_boolean = (%(x,y).(x : LUSTRE_BOOL & y : LUSTRE_BOOL  | IF x = {} or y = {} THEN {} ELSE {ref |-> bool(x /= y)} END)) &
  l_fby_integer = (%(x,y,z).(x : BOOL & y : LUSTRE_INT & z : LUSTRE_INT  | IF x = TRUE THEN
                                                                                            IF y = {} THEN
                                                                                              {}
                                                                                            ELSE
                                                                                              {ref |-> y(ref)}
                                                                                            END
                                                                                          ELSE
                                                                                            IF z = {} THEN
                                                                                              {}
                                                                                            ELSE
                                                                                              {ref |-> z(ref)}
                                                                                            END
                                                                                          END)) &
  l_fby_boolean = (%(x,y,z).(x : BOOL & y : LUSTRE_BOOL & z : LUSTRE_BOOL  | IF x = TRUE THEN
                                                                                      IF y = {} THEN
                                                                                        {}
                                                                                      ELSE
                                                                                        {ref |-> bool(y(ref) = TRUE)}
                                                                                      END
                                                                                    ELSE
                                                                                      IF z = {} THEN
                                                                                        {}
                                                                                      ELSE
                                                                                        {ref |-> bool(z(ref) = TRUE)}
                                                                                      END
                                                                                    END)) &
  l_ite_integer = (%(x,y,z).(x : LUSTRE_BOOL & y : LUSTRE_INT & z : LUSTRE_INT | IF x = {} THEN
                                                                                                      {}
                                                                                                    ELSE
                                                                                                      IF y /= {} & z /= {} THEN
                                                                                                        {ref |-> IF x(ref) = TRUE THEN y(ref) ELSE z(ref) END}
                                                                                                      ELSE
                                                                                                        IF x(ref) = TRUE THEN
                                                                                                          IF y = {} THEN
                                                                                                            {}
                                                                                                          ELSE
                                                                                                            {ref |-> y(ref)}
                                                                                                          END
                                                                                                        ELSE
                                                                                                          IF z = {} THEN
                                                                                                            {}
                                                                                                          ELSE
                                                                                                            {ref |-> z(ref)}
                                                                                                          END
                                                                                                        END
                                                                                                      END
                                                                                                    END)) &
  l_ite_boolean = (%(x,y,z).(x : LUSTRE_BOOL & y : LUSTRE_BOOL & z : LUSTRE_BOOL | IF x = {} THEN
                                                                                                {}
                                                                                              ELSE
                                                                                                IF y /= {} & z /= {} THEN
                                                                                                  {ref |-> bool((IF x(ref) = TRUE THEN y(ref) ELSE z(ref) END) = TRUE)}
                                                                                                ELSE
                                                                                                  IF x(ref) = TRUE THEN
                                                                                                    IF y = {} THEN
                                                                                                      {}
                                                                                                    ELSE
                                                                                                      {ref |-> bool(y(ref) = TRUE)}
                                                                                                    END
                                                                                                  ELSE
                                                                                                    IF z = {} THEN
                                                                                                      {}
                                                                                                    ELSE
                                                                                                      {ref |-> bool(z(ref) = TRUE)}
                                                                                                    END
                                                                                                  END
                                                                                                END
                                                                                              END))


END

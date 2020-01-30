MACHINE BirthdayPuzzle
/* A puzzle from
 M. Fitzpatrick, 1993, Birthday puzzle. Newsletter of the Association for logic programming, Vol 6/4. */
SETS Items = {vt, /* video tape */
              cd, /* compact disk */
              ct, /* cassette tape */
              rt /* record token */}
CONSTANTS
 alan, barry, carl, david
PROPERTIES
  alan: Items & barry: Items & david:Items & carl:Items &
  Items = {alan,barry,david,carl} &
  (alan=cd => barry=vt & david=ct) &
  (barry=ct => carl=rt & alan=vt) &
  (david=rt => alan=cd & barry=vt) &
  (alan=vt => carl=rt & david=ct) &
  (barry=vt => alan=rt & david=ct) &
  (alan=rt => barry=cd & carl=vt) &
  (carl=rt => barry=cd & alan=ct) &
  (alan=ct => barry=rt & david=cd) &
  (carl=vt => david=cd) 
OPERATIONS
  r <-- Alan = BEGIN r:= alan END;
  r <-- Barry = BEGIN r:= barry END;
  r <-- Carl = BEGIN r:= carl END;
  r <-- David = BEGIN r:= david END
END
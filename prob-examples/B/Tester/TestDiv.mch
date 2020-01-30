MACHINE TestDiv
OPERATIONS
  res <-- div_nat_2_24 (nn) =
      PRE
         nn : NATURAL
      THEN
         res := nn / 2 ** 24
      END;

   res <-- div_nat_2_25 (nn) =
      PRE
         nn : NATURAL
      THEN
         res := nn / 2 ** 25
      END;

   res <-- div_nat_2_26 (nn) =
      PRE
         nn : NATURAL
      THEN
         res := nn / 2 ** 26
      END;

   res <-- div_2_22 (nn) =
      PRE
         nn : INTEGER
      THEN
         res : (res : INTEGER &
                nn - res * 2 ** 22 : 0 .. 2 ** 22 - 1)
      END;

   res <-- div_2_23 (nn) =
      PRE
         nn : INTEGER
      THEN
         res : (res : INTEGER &
                nn - res * 2 ** 23 : 0 .. 2 ** 23 - 1)
      END;

   res <-- div_2_24 (nn) =
      PRE
         nn : INTEGER
      THEN
         res : (res : INTEGER &
                nn - res * 2 ** 24 : 0 .. 2 ** 24 - 1)
      END

END


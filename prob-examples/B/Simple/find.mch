MACHINE find
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
 /* Takes over 2 minutes with AnimB */
  find(y,z) = PRE y:0..9999 & z:0..9999 & y+z = 9998 & y-z>9990 THEN
    xx := y+z
  END

; /* a bit sluggish (a few seconds) with AnimB */
  find_sqrt(y,z) = PRE y:0..9999 & z:0..9999 & y*y=z & z>500 THEN
    xx := y+z
  END;

/* also very fast with AnimB */
  find_difficult(x) = PRE x:0..99999 & x mod 2 /= 0 & x mod 3 /= 0 & x*x > 434900000 & x*x< 434935000 THEN
    xx := x  /* should find 20855 */
  END
END


/* Copy
 * Author: 
 * Creation date: 14/11/2016
 */
MACHINE
    Copy
OPERATIONS
     xx,yy <-- Copy1(vv) = PRE vv:INT & xx:INT & yy:INT THEN
          xx := 10-vv || yy:=vv
      END;
     xx,yy <-- Inc(vv) = PRE vv:INT & xx:INT & yy:INT THEN
         xx := xx+vv || yy := yy+vv
      END;
     xx,yy <-- Copy2(vv) = PRE vv:INT & xx:INTEGER & yy:INTEGER THEN
          xx := 10-vv || yy:=vv
      END
END


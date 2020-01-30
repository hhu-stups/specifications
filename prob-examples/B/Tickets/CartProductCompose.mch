MACHINE CartProductCompose
SETS
 AA={aa,bb}; CC={cc,dd}
CONSTANTS ff,res
PROPERTIES
  ff : (AA*CC) --> INTEGER &
  ff = %(xx,yy).(xx:AA & yy:CC | 0) &
  res <: INTEGER &
  res = ff[AA*CC]
END


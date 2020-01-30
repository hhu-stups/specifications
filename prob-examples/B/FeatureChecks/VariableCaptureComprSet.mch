MACHINE VariableCaptureComprSet
/* check that we find the invariant violation */
SETS
 ID={aa,bb}
VARIABLES xx,yy
INVARIANT
 {yy|yy>xx & yy<10} = {} & xx:INTEGER & yy:INTEGER
INITIALISATION xx:=11 || yy:=5
OPERATIONS
  Setxy = BEGIN xx:=yy END
ASSERTIONS
  !xx.(xx:1..15 => {yy | yy: {yy|yy>xx & yy<10}} = {zz | zz: {yy|yy>xx & yy<10}})
END


MACHINE SimpleSETasQVAR
/* checks whether a global SET can also be used as a quantified variable */
SETS
 S;R
DEFINITIONS scope_S == 3; scope_R == 3
CONSTANTS fsr, s 
PROPERTIES
 fsr:S-->R & !S.(S:R => S:ran(fsr)) & s:POW(s) & S=s & s=S 
END


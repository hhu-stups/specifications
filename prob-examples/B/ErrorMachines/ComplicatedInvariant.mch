MACHINE ComplicatedInvariant
/* The invariant can become very complicated; check if the invariant time_out
   mechanism works properly */
DEFINITIONS SET_PREF_MAXINT == 80
VARIABLES xx
INVARIANT
 xx <: NATURAL & !yy.(yy<:xx => (yy=xx or yy<<:xx))
INITIALISATION xx:={}
OPERATIONS
  SetNATURAL = xx := NATURAL
END


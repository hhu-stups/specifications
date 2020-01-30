MACHINE temp4
DEFINITIONS SET_PREF_TRY_FIND_ABORT == TRUE
SETS S={a,b,c};T={d,e,f}
PROPERTIES
!(f).(f : S+->T =>
    (
        !(x,y).(x:S & y:S => (f(x)=f(y) => x=y))
    =>
        dom(f)=S
    )
  )
END

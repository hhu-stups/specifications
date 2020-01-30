MACHINE test
DEFINITIONS SET_PREF_TRY_FIND_ABORT == TRUE
SETS S={a,b,c};T={d,e,f}
PROPERTIES
!(f).(f : S+->T =>
    (
        !(x,y).(x:dom(f) & y:dom(f) & f(x)=f(y) => x=y)
    <=>
        !(x,y).(x:dom(f) & y:dom(f) => (f(x)=f(y) => x=y))
    )
  )
END


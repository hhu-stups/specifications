MACHINE Z3_Override_Test
CONSTANTS f,g
PROPERTIES
//>>> :z3 f={1|->2} & g = f <+ {2|->3}
  (
    f = {1 |-> 2}
    &
    #smt_tmp150.(
      (
        g = smt_tmp150 \/ {2 |-> 3}
        &
        !(smt_tmp148,smt_tmp149).(
          (
            smt_tmp148 |-> smt_tmp149 : f
            &
            not(
              #smt_tmp151.(
                (
                  smt_tmp148 : smt_tmp151
                  &
                  !smt_tmp152.(
                    #smt_tmp153.(
                      smt_tmp152 |-> smt_tmp153 = 2 |-> 3
                    )
                    =>
                    smt_tmp152 : smt_tmp151
                  )
                  &
                  !smt_tmp152.(
                    smt_tmp152 : smt_tmp151
                    =>
                    #smt_tmp153.(
                      smt_tmp152 |-> smt_tmp153 = 2 |-> 3
                    )
                  )
                )
              )
            )
          )
          =>
          smt_tmp148 |-> smt_tmp149 : smt_tmp150
        )
        &
        !(smt_tmp148,smt_tmp149).(
          smt_tmp148 |-> smt_tmp149 : smt_tmp150
          =>
          (
            smt_tmp148 |-> smt_tmp149 : f
            &
            not(
              #smt_tmp154.(
                (
                  smt_tmp148 : smt_tmp154
                  &
                  !smt_tmp155.(
                    #smt_tmp156.(
                      smt_tmp155 |-> smt_tmp156 = 2 |-> 3
                    )
                    =>
                    smt_tmp155 : smt_tmp154
                  )
                  &
                  !smt_tmp155.(
                    smt_tmp155 : smt_tmp154
                    =>
                    #smt_tmp156.(
                      smt_tmp155 |-> smt_tmp156 = 2 |-> 3
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
END

MACHINE UNION_PerfTest
SETS
    MISSION =
    {   MS01_09
    ,   MS01_19
    ,   MS01_2A
    ,   MS11_09
    ,   MS11_19
    ,   MS11_2A
    ,   MS21_2A
    ,   MS07_01
    ,   MS28_21
    };
    ITINERAIRE =
    {   IT01_07
    ,   IT01_13
    ,   IT04_01
    ,   IT07_05
    ,   IT08_09
    ,   IT11_07
    ,   IT11_13
    ,   IT14_19
    ,   IT14_2A
    ,   IT21_25
    ,   IT26_2A
    ,   IT26_21
    ,   IT28_27
    ,   RT09_08
    ,   RT2A_29
    }
CONSTANTS
    RETOURNEMENT,TRAJET
PROPERTIES
    RETOURNEMENT <: ITINERAIRE
&   RETOURNEMENT =
    {   RT09_08
    ,   RT2A_29
    }
&   TRAJET : MISSION --> (ITINERAIRE - RETOURNEMENT >+> ITINERAIRE - RETOURNEMENT)
&   TRAJET =
    {   MS01_09 |->
        {   IT01_07 |-> IT08_09
        }
    ,   MS01_19 |->
        {   IT01_13 |-> IT14_19
        }
    ,   MS01_2A |->
        {   IT01_13 |-> IT14_2A
        }
    ,   MS11_09 |->
        {   IT11_07 |-> IT08_09
        }
    ,   MS11_19 |->
        {   IT11_13 |-> IT14_19
        }
    ,   MS11_2A |->
        {   IT11_13 |-> IT14_2A
        }
    ,   MS21_2A |->
        {   IT21_25 |-> IT26_2A
        }
    ,   MS07_01 |->
        {   IT07_05 |-> IT04_01
        }
    ,   MS28_21 |->
        {   IT28_27 |-> IT26_21
        }
    }
ASSERTIONS
UNION (msn_un).(msn_un : MISSION | dom (TRAJET (msn_un)) \/ ran (TRAJET (msn_un)))
  =
{IT01_07,IT01_13,IT04_01,IT07_05,IT08_09,IT11_07,IT11_13,IT14_19,IT14_2A,IT21_25,IT26_2A,IT26_21,IT28_27}
END
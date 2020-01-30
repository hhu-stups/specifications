MACHINE LabelBoolPragmaDisappears
SETS
 ID={aa,bb,cc}
//DEFINITIONS
// SET_PREF_PARTITION_PROPERTIES == TRUE
CONSTANTS iv, iw
PROPERTIES
 iv:{bb,cc} & iw /= iv &

  /*@label "axm-test1" */ bool(iv /= aa & card(ID /\ {iv})=1 ) = TRUE &
  /*@label "axm-test2" */ ( card({iv,iw})=2 & {iv,iw} /\ {aa} /= {} )
ASSERTIONS
  /*@label "thm-test1" */ (iv /= aa & card(ID /\ {iv})=1 )
; /*@label "thm-test2" */ bool((iv = bb or iv=cc) & card(ID /\ {iv,iw})>1 ) = TRUE
END


MACHINE RULE_r967_1
 /* A proof rule from Siemens; added some definitions to test the Prolog BParser */
 /* ProB should find a counter example */
DEFINITIONS BTRUE==(1=1) ; BFALSE==(1/=1) ; EXPR == (1+1); SUBST == BEGIN a_mch := {} END
SETS t12; t14
CONSTANTS a_mch, b_mch, c_mch
/* non freeness: */
PROPERTIES
(a_mch : POW(t12)) & (b_mch : POW((t14*t12))) & (c_mch : t14)
ASSERTIONS
((a_mch<|(b_mch)~)(b_mch(c_mch)) = c_mch)
END
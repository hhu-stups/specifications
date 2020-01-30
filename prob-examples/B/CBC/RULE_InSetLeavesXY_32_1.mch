MACHINE RULE_InSetLeavesXY_32_1
/* A proof rule by Siemens; no counter example should be found */
DEFINITIONS BTRUE==(1=1) ; BFALSE==(1/=1)
SETS t22; t23
CONSTANTS P_mch, f_mch, g_mch, x_mch
/* non freeness: */
PROPERTIES
(f_mch : POW((t23*t22))) & (g_mch : POW((t23*t22))) & (x_mch : t23) & (P_mch : POW(t22))
ASSERTIONS
(((ran(f_mch) : POW(P_mch)) & (ran(g_mch) : POW(P_mch))) => ((f_mch\/g_mch)(x_mch) : P_mch))
END
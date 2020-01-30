MACHINE PerManyVarsCsts200
   /* 
     3 sets 
     200 constants 
     200 variables 
     10 operations 
   */ 
 DEFINITIONS SET_PREF_MAXINT == 5; SET_PREF_MININT == -1; SET_PREF_MAX_INITIALISATIONS == 300
 SETS S0; S1; S2
 CONSTANTS
  c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25,
  c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39, c40, c41, c42, c43, c44, c45, c46, c47, c48, c49,
  c50, c51, c52, c53, c54, c55, c56, c57, c58, c59, c60, c61, c62, c63, c64, c65, c66, c67, c68, c69, c70, c71, c72, c73,
  c74, c75, c76, c77, c78, c79, c80, c81, c82, c83, c84, c85, c86, c87, c88, c89, c90, c91, c92, c93, c94, c95, c96, c97,
  c98, c99, c100, c101, c102, c103, c104, c105, c106, c107, c108, c109, c110, c111, c112, c113, c114, c115, c116, c117,
  c118, c119, c120, c121, c122, c123, c124, c125, c126, c127, c128, c129, c130, c131, c132, c133, c134, c135, c136, c137,
  c138, c139, c140, c141, c142, c143, c144, c145, c146, c147, c148, c149, c150, c151, c152, c153, c154, c155, c156, c157,
  c158, c159, c160, c161, c162, c163, c164, c165, c166, c167, c168, c169, c170, c171, c172, c173, c174, c175, c176, c177,
  c178, c179, c180, c181, c182, c183, c184, c185, c186, c187, c188, c189, c190, c191, c192, c193, c194, c195, c196, c197, c198, c199
 PROPERTIES
  c0 <: S1 & c1 <: INT & c2 <: INTEGER & c3 : POW1(INTEGER) & c4 : S2 & c5 <: NATURAL1 & c6 : NATURAL & c7 <: NATURAL &
  c8 : POW(S1) & c9 : NATURAL1 & c10 : POW(NATURAL) & c11 <: S0 & c12 <: BOOL & c13 <: S1 & c14 <: NAT1 & c15 <: BOOL &
  c16 : BOOL & c17 : INTEGER & c18 : INT & c19 : NATURAL & c20 : S0 & c21 : POW1(BOOL) & c22 : NATURAL & c23 <: S1 &
  c24 <: NAT & c25 <: INTEGER & c26 : S2 & c27 : INTEGER & c28 : POW1(INTEGER) & c29 : POW1(INT) & c30 : NAT & c31 : NAT &
  c32 : NATURAL1 & c33 : NATURAL & c34 : POW1(NATURAL1) & c35 <: S1 & c36 : S0 & c37 <: S2 & c38 <: INT & c39 : BOOL &
  c40 <: BOOL & c41 : POW1(S2) & c42 <: NATURAL1 & c43 : POW(NATURAL) & c44 : POW1(S1) & c45 : POW(S1) & c46 : S2 & c47 <: NATURAL1 &
  c48 <: INT & c49 : NATURAL1 & c50 : POW(S1) & c51 : NATURAL & c52 : POW1(NATURAL) & c53 : NATURAL1 & c54 : INTEGER & c55 : S2 &
  c56 : POW1(S2) & c57 <: INT & c58 : INTEGER & c59 <: INT & c60 : INTEGER & c61 : S0 & c62 : NAT & c63 : NATURAL & c64 : POW(NATURAL1) &
  c65 : POW1(NAT1) & c66 : S0 & c67 : INT & c68 : POW1(S1) & c69 : S0 & c70 : POW1(BOOL) & c71 : INTEGER & c72 : INTEGER & c73 : S2 &
  c74 : NAT1 & c75 : POW1(NATURAL) & c76 : S0 & c77 : NAT & c78 : POW1(NATURAL1) & c79 : S2 & c80 : NATURAL & c81 : NAT1 & c82 : POW1(NAT) &
  c83 : S2 & c84 <: S1 & c85 <: S2 & c86 : POW1(S0) & c87 : S1 & c88 : POW(NAT1) & c89 <: NATURAL & c90 <: S0 & c91 : NAT1 &
  c92 : POW1(NATURAL1) & c93 : POW(S2) & c94 : S1 & c95 : POW1(BOOL) & c96 : POW(S0) & c97 : S0 & c98 : NAT & c99 : NAT &
  c100 : POW1(INTEGER) & c101 : S2 & c102 <: S0 & c103 <: NATURAL1 & c104 : INTEGER & c105 : S2 & c106 <: INT & c107 : POW1(NAT) &
  c108 : NATURAL1 & c109 : S2 & c110 : INTEGER & c111 <: BOOL & c112 : S0 & c113 : POW1(INT) & c114 <: BOOL & c115 : NAT1 &
  c116 <: NATURAL1 & c117 : POW(S2) & c118 <: NAT & c119 : POW(S1) & c120 : POW(INTEGER) & c121 <: NATURAL & c122 : S2 & c123 : S2 &
  c124 : POW1(NAT1) & c125 : POW1(S2) & c126 <: INT & c127 : POW(S1) & c128 : S2 & c129 <: NAT1 & c130 : NAT & c131 : POW1(NAT) &
  c132 : S0 & c133 : POW(S0) & c134 : INTEGER & c135 : NATURAL & c136 <: NAT1 & c137 <: NATURAL1 & c138 : POW(BOOL) & c139 : POW(NATURAL) &
  c140 <: S2 & c141 <: INTEGER & c142 <: BOOL & c143 <: NAT1 & c144 : NAT & c145 <: S1 & c146 : NATURAL1 & c147 <: NATURAL & c148 : NAT1 &
  c149 : S2 & c150 : POW1(S2) & c151 : S0 & c152 : POW1(S0) & c153 <: S1 & c154 : NAT & c155 : NAT1 & c156 <: NAT1 & c157 : POW1(BOOL) &
  c158 : POW(S2) & c159 : INT & c160 : POW(NATURAL1) & c161 <: NATURAL & c162 : S1 & c163 : NATURAL1 & c164 <: INT & c165 : BOOL &
  c166 : INTEGER & c167 : NATURAL1 & c168 : NATURAL & c169 <: INTEGER & c170 : BOOL & c171 : BOOL & c172 : BOOL & c173 : NATURAL &
  c174 <: NAT & c175 : INTEGER & c176 : NATURAL1 & c177 <: INT & c178 : NAT1 & c179 : S1 & c180 : POW(INTEGER) & c181 : NATURAL1 &
  c182 : POW1(INT) & c183 : POW(INTEGER) & c184 : POW1(S1) & c185 : S2 & c186 <: INTEGER & c187 <: BOOL & c188 <: INT & c189 : POW(NAT1) &
  c190 : S2 & c191 : POW1(NATURAL) & c192 : INT & c193 <: S1 & c194 : INT & c195 : INT & c196 : NATURAL & c197 : NAT1 & c198 : POW(NAT1) & c199 : POW1(NATURAL1)
 VARIABLES
  v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
  v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49,
  v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73,
  v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97,
  v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117,
  v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137,
  v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157,
  v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177,
  v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199
 INVARIANT
  v0 : NAT1 & v1 <: NAT & v2 : S0 & v3 : NATURAL & v4 : POW1(NAT) & v5 <: INTEGER & v6 : NAT1 & v7 <: S2 & v8 : NAT & v9 : POW(S1) &
  v10 : POW(NATURAL1) & v11 <: BOOL & v12 <: S2 & v13 : POW1(NATURAL1) & v14 : BOOL & v15 : POW1(S1) & v16 : NATURAL1 & v17 <: BOOL &
  v18 : POW1(S2) & v19 : S1 & v20 : S0 & v21 <: INT & v22 : BOOL & v23 : INT & v24 : INT & v25 <: S0 & v26 : NAT1 & v27 : POW(NATURAL1) &
  v28 : POW1(NAT) & v29 : NAT & v30 : NATURAL & v31 : NAT & v32 : S1 & v33 <: INT & v34 : S0 & v35 : NAT & v36 : NAT1 & v37 : POW1(S0) &
  v38 : S1 & v39 : BOOL & v40 : S0 & v41 : S1 & v42 : BOOL & v43 : NAT1 & v44 : INT & v45 <: NAT1 & v46 : POW1(S2) & v47 : NATURAL1 &
  v48 : S1 & v49 : POW1(BOOL) & v50 : S1 & v51 : NATURAL1 & v52 : S1 & v53 : NAT & v54 : NATURAL1 & v55 <: BOOL & v56 : INT & v57 <: S1 &
  v58 <: INTEGER & v59 : POW(NATURAL) & v60 : S0 & v61 : S2 & v62 : NATURAL1 & v63 <: NATURAL1 & v64 : S2 & v65 : POW(NATURAL) & v66 : POW(S2) &
  v67 : S2 & v68 : S2 & v69 : INT & v70 <: INT & v71 : S2 & v72 : POW1(S0) & v73 : NATURAL & v74 : INT & v75 : NAT & v76 <: NAT1 & v77 : NAT1 &
  v78 : NATURAL & v79 <: BOOL & v80 : POW(BOOL) & v81 : POW1(NAT1) & v82 : POW(S0) & v83 : NATURAL & v84 : S0 & v85 <: S0 & v86 <: NAT1 &
  v87 : S0 & v88 : INT & v89 <: S2 & v90 : POW(NAT1) & v91 : NAT & v92 : NAT1 & v93 : POW1(S0) & v94 : BOOL & v95 : NAT & v96 : POW1(BOOL) &
  v97 : POW1(S1) & v98 : NAT1 & v99 : NAT1 & v100 : POW(INTEGER) & v101 : POW(INTEGER) & v102 : POW(NATURAL) & v103 <: NAT & v104 : NATURAL1 &
  v105 : INTEGER & v106 : INT & v107 <: INT & v108 : POW1(BOOL) & v109 <: INT & v110 : INTEGER & v111 <: S0 & v112 : S2 & v113 : POW1(INTEGER) &
  v114 : INTEGER & v115 : NAT & v116 : NAT & v117 : INTEGER & v118 : INT & v119 : NAT & v120 <: S2 & v121 <: BOOL & v122 : INTEGER &
  v123 : POW(INT) & v124 : S1 & v125 : S2 & v126 : POW1(NAT) & v127 : NAT & v128 <: INTEGER & v129 <: INT & v130 <: NAT1 & v131 : S1 &
  v132 : POW1(NAT) & v133 : S0 & v134 : S2 & v135 : POW(NAT) & v136 : POW1(NAT1) & v137 <: INT & v138 <: INTEGER & v139 : S2 & v140 <: S1 &
  v141 : POW(S2) & v142 <: INTEGER & v143 : NAT & v144 : POW(S0) & v145 : S1 & v146 : NAT1 & v147 : POW(NAT) & v148 : POW(S1) & v149 <: NAT1 &
  v150 : POW1(BOOL) & v151 : BOOL & v152 : POW1(INTEGER) & v153 : NATURAL & v154 : S0 & v155 <: NATURAL & v156 : INTEGER & v157 <: NAT1 &
  v158 <: S0 & v159 : NATURAL1 & v160 : S0 & v161 : BOOL & v162 : S0 & v163 <: S2 & v164 <: S0 & v165 : BOOL & v166 : NATURAL & v167 : INT &
  v168 : POW(S1) & v169 <: NATURAL1 & v170 : NAT1 & v171 : INTEGER & v172 : S1 & v173 : POW1(NATURAL1) & v174 : BOOL & v175 : S1 &
  v176 <: NATURAL1 & v177 : S1 & v178 : INTEGER & v179 : POW1(NAT1) & v180 : BOOL & v181 : NATURAL1 & v182 : POW(S1) & v183 : POW1(BOOL) &
  v184 : S0 & v185 : NATURAL1 & v186 : NATURAL & v187 : NATURAL1 & v188 : NATURAL & v189 : POW(S0) & v190 : NAT & v191 <: INTEGER &
  v192 : POW(NATURAL1) & v193 : POW(S0) & v194 <: S2 & v195 : POW1(NATURAL1) & v196 <: S1 & v197 <: NATURAL1 & v198 <: NATURAL1 & v199 : NATURAL
 INITIALISATION
   v0:=1 || v1::POW1(NAT) || v2::S0 || v3::NATURAL || v4::POW1(NAT) || v5::POW(INTEGER) || v6::NAT1 ||
   v7::POW(S2) || v8::NAT || v9::POW(S1) || v10::POW(NATURAL1) || v11::POW1(BOOL) || v12::POW1(S2) ||
   v13::POW1(NATURAL1) || v14::BOOL || v15::POW1(S1) || v16::NATURAL1 || v17::POW(BOOL) || v18::POW1(S2) ||
   v19::S1 || v20::S0 || v21::POW(INT) || v22::BOOL || v23::INT || v24::INT || v25::POW(S0) || v26::NAT1 ||
   v27::POW(NATURAL1) || v28::POW1(NAT) || v29::NAT || v30::NATURAL || v31::NAT || v32::S1 || v33::POW(INT) ||
   v34::S0 || v35::NAT || v36::NAT1 || v37::POW1(S0) || v38::S1 || v39::BOOL || v40::S0 || v41::S1 || v42::BOOL ||
   v43::NAT1 || v44::INT || v45::POW(NAT1) || v46::POW1(S2) || v47::NATURAL1 || v48::S1 || v49::POW1(BOOL) ||
   v50::S1 || v51::NATURAL1 || v52::S1 || v53::NAT || v54::NATURAL1 || v55::POW1(BOOL) || v56::INT || v57::POW(S1) ||
   v58::POW1(INTEGER) || v59::POW(NATURAL) || v60::S0 || v61::S2 || v62::NATURAL1 || v63::POW1(NATURAL1) || v64::S2 ||
   v65::POW(NATURAL) || v66::POW(S2) || v67::S2 || v68::S2 || v69::INT || v70::POW1(INT) || v71::S2 || v72::POW1(S0) ||
   v73::NATURAL || v74::INT || v75::NAT || v76::POW(NAT1) || v77::NAT1 || v78::NATURAL || v79::POW(BOOL) ||
   v80::POW(BOOL) || v81::POW1(NAT1) || v82::POW(S0) || v83::NATURAL || v84::S0 || v85::POW(S0) || v86::POW(NAT1) ||
   v87::S0 || v88::INT || v89::POW1(S2) || v90::POW(NAT1) || v91::NAT || v92::NAT1 || v93::POW1(S0) || v94::BOOL || v95::NAT ||
   v96::POW1(BOOL) || v97::POW1(S1) || v98::NAT1 || v99::NAT1 || v100::POW(INTEGER) || v101::POW(INTEGER) || v102::POW(NATURAL) ||
   v103::POW(NAT) || v104::NATURAL1 || v105::INTEGER || v106::INT || v107::POW1(INT) || v108::POW1(BOOL) || v109::POW1(INT) ||
   v110::INTEGER || v111::POW(S0) || v112::S2 || v113::POW1(INTEGER) || v114::INTEGER || v115::NAT || v116::NAT || v117::INTEGER ||
   v118::INT || v119::NAT || v120::POW(S2) || v121::POW(BOOL) || v122::INTEGER || v123::POW(INT) || v124::S1 || v125::S2 ||
   v126::POW1(NAT) || v127::NAT || v128::POW(INTEGER) || v129::POW1(INT) || v130::POW(NAT1) || v131::S1 || v132::POW1(NAT) ||
   v133::S0 || v134::S2 || v135::POW(NAT) || v136::POW1(NAT1) || v137::POW1(INT) || v138::POW(INTEGER) || v139::S2 || v140::POW1(S1) ||
   v141::POW(S2) || v142::POW(INTEGER) || v143::NAT || v144::POW(S0) || v145::S1 || v146::NAT1 || v147::POW(NAT) || v148::POW(S1) ||
   v149::POW1(NAT1) || v150::POW1(BOOL) || v151::BOOL || v152::POW1(INTEGER) || v153::NATURAL || v154::S0 || v155::POW(NATURAL) ||
   v156::INTEGER || v157::POW(NAT1) || v158::POW(S0) || v159::NATURAL1 || v160::S0 || v161::BOOL || v162::S0 || v163::POW(S2) ||
   v164::POW(S0) || v165::BOOL || v166::NATURAL || v167::INT || v168::POW(S1) || v169::POW(NATURAL1) || v170::NAT1 || v171::INTEGER ||
   v172::S1 || v173::POW1(NATURAL1) || v174::BOOL || v175::S1 || v176::POW(NATURAL1) || v177::S1 || v178::INTEGER || v179::POW1(NAT1) ||
   v180::BOOL || v181::NATURAL1 || v182::POW(S1) || v183::POW1(BOOL) || v184::S0 || v185::NATURAL1 || v186::NATURAL || v187::NATURAL1 ||
   v188::NATURAL || v189::POW(S0) || v190::NAT || v191::POW1(INTEGER) || v192::POW(NATURAL1) || v193::POW(S0) || v194::POW(S2) ||
   v195::POW1(NATURAL1) || v196::POW1(S1) || v197::POW(NATURAL1) || v198::POW(NATURAL1) || v199:=1
 OPERATIONS 
   op0 = PRE v0=1 & v199=1 THEN v87 :: S0 || v136 := {1}  || v74 := 0 END;
   op1 = PRE v0=1 & v199=1 THEN v122 := 1 || v90 := {1} || v30 := 0 || v80 := {TRUE,FALSE} END;
   op2 = PRE v0=1 & v199=1 THEN v33 := {0,1} END;
   op3 = PRE v0=1 & v199=1 THEN v96 := BOOL END;
   op4 = PRE v0=1 & v199=1 THEN v74 := 1 || v105 := 1 || v114 := 0 END;
   op5 = PRE v0=1 & v199=1 THEN v58 := {1}  END;
   op6 = PRE v0=1 & v199=1 THEN v92 := 1 END;
   op7 = PRE v0=1 & v199=1 THEN v22 := TRUE END;
   op8 = PRE v0=1 & v199=1 THEN v29 := 0 END;
   op9 = PRE v0=1 & v199=1 THEN v33 := {} || v133 :: S0 || v191 := {1}  END
END
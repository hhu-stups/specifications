MACHINE bmc_constraint_cleanedup3
CONSTANTS
 mxint,sze,arr,goal,
 found,i,j,pc,mid,mid1,pc1,i1,j1,
 found1,arr1,sze1,goal1,mxint1,mid2,pc2,i2,j2,
 found2,arr2,sze2,goal2,mxint2,mid3,pc3,i3,j3,
 found3,arr3,sze3,goal3,mxint3
DEFINITIONS
  "LibraryIO.def";
  SET_PREF_TIME_OUT == 6000;
  SET_PREF_SMT == TRUE;
  SET_PREF_DISPROVER_MODE==FALSE;
 // SET_PREF_CHR == TRUE
  OBS == observe((sze,arr,goal,
  mid1,pc1,
  mid2,pc2,
  mid3,pc3,i3,j3,
 found3)) ;
  OBS2 == printf("sze=~w, goal=~w~n",[sze,goal]) ;
  OBS3 == printf("arr3=~w~n",[arr3]) & printf("goal3=~w~n",[goal3]) & printf("i3=~w~n",[i3]) &printf("j3=~w~n",[j3])  ;
  OBS0 == btrue
PROPERTIES
  OBS3 &
mxint = 6
&
sze < mxint
&
sze : 0 .. mxint
&
arr : 0 .. mxint +-> -mxint .. mxint
&
arr : 1 .. sze --> -mxint .. mxint
&
!i.(
  i : 1 .. sze - 1
  =>
  arr(i) <= arr(i + 1)
)
&
// goal <= mxint //
goal : -mxint .. mxint
&
found = FALSE
&
i = 1
&
j = sze
&
pc = 0
&
mid = 0
&
arr1 = arr
&
sze1 = sze
&
goal1 = goal
&
mxint1 = mxint
&
	i1 = i // extracted by hand
	&
	j1 = j // extracted by hand
	&
	found1 = FALSE // extracted by hand,  found1 must be FALSE
	&
	pc1 : {pc,1} // extracted by hand
	&
	mid1 : {i+j, mid} // extracted by hand
	      & mid1 >= 0
&
(
  (
	i1 = i
	&
	j1 = j
	&
	found1 = found
	&
	(
	  (
		pc = 0 // TRUE
		&
		found = FALSE // TRUE
		&
		i <= j
		&
		mid1 = i + j
		&
		pc1 = 1
	  )
//	  or
//	  (
//		pc = 1 // FALSE ...
//     )
	)
  )
//  or
//  (
//	pc = 2 // FALSE ...
//  )
)
&
arr2 = arr1
&
sze2 = sze1
&
goal2 = goal1
&
mxint2 = mxint1
&
    mid2 : {i1+j1, mid1/2, mid1} // extracted by hand
    &
    pc2 : {1,2,pc1} // extracted by hand
    &
    found2 = found1 // extracted by hand
    &
    j2 = j1 // extracted by hand
    &
(
  (
	i2 = i1
	&
	j2 = j1
	&
	found2 = found1 // found1 must be FALSE
	&
	(
	  (
		pc1 = 1
		&
		mid2 = mid1 / 2
		&
		pc2 = 2
	  )
	)
  )
)
&
arr3 = arr2
&
sze3 = sze2
&
goal3 = goal2
&
mxint3 = mxint2
&
  (
	pc2 = 2
	&
	(
	  arr2(mid2) = goal2
	  =>
	  (
		found3 = TRUE
		&
		i3 = mid2
		&
		j3 = mid2
	  )
	)
	&
	(
	  not(
		arr2(mid2) = goal2
	  )
	  =>
      (
        found3 = found2 & // extracted
      (
        arr2(mid2) < goal2
        =>
        (
        i3 = mid2 + 1
        &
        found3 = found2
        &
        j3 = j2
        &
        j3 = j2
        )
		 )
		&
      (
        not(
        arr2(mid2) < goal2
        )
        =>
        (
        j3 = mid2 - 1
        &
        found3 = found2
        &
        i3 = i2
        &
        i3 = i2
        )
		  )
	  )
	)
	&
	pc3 = 0
	&
	mid3 = mid2
	&
	found3 = TRUE &
	not(arr3(i3) = goal3)
)
//& found3=TRUE
END

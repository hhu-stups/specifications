MACHINE bmc_constraint_cleanedup
CONSTANTS
 mxint,sze,arr,goal,
 found,i,j,pc,mid,mid1,pc1,i1,j1,
 found1,arr1,sze1,goal1,mxint1,r1,mid2,pc2,i2,j2,
 found2,arr2,sze2,goal2,mxint2,r2,mid3,pc3,i3,j3,
 found3,arr3,sze3,goal3,mxint3
PROPERTIES
mxint = 7
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
		found = FALSE
		&
		i <= j
		&
		mid1 = i + j
		&
		pc1 = 1
	  )
	  or
	  (
		pc = 1 // FALSE
		&
		mid1 = mid / 2
		&
		pc1 = 2
	  )
	)
  )
  or
  (
	pc = 2 // FALSE
	&
	(
	  arr(mid) = goal
	  =>
	  (
		found1 = TRUE
		&
		i1 = mid
		&
		j1 = mid
	  )
	)
	&
	(
	  not(
		arr(mid) = goal
	  )
	  =>
	  (
		(
		  arr(mid) < goal
		  =>
		  (
			i1 = mid + 1
			&
			found1 = found
			&
			j1 = j
			&
			j1 = j
		  )
		)
		&
		(
		  not(
			arr(mid) < goal
		  )
		  =>
		  (
			j1 = mid - 1
			&
			found1 = found
			&
			i1 = i
			&
			i1 = i
		  )
		)
	  )
	)
	&
	pc1 = 0
	&
	mid1 = mid
  )
  or
  (
	pc = 0
	&
	i >= j
	&
	r1 = found
	&
	i1 = i
	&
	j1 = j
	&
	found1 = found
	&
	mid1 = mid
	&
	pc1 = pc
  )
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
(
  (
	i2 = i1
	&
	j2 = j1
	&
	found2 = found1
	&
	(
	  (
		pc1 = 0
		&
		found1 = FALSE
		&
		i1 <= j1
		&
		mid2 = i1 + j1
		&
		pc2 = 1
	  )
	  or
	  (
		pc1 = 1
		&
		mid2 = mid1 / 2
		&
		pc2 = 2
	  )
	)
  )
  or
  (
	pc1 = 2
	&
	(
	  arr1(mid1) = goal1
	  =>
	  (
		found2 = TRUE
		&
		i2 = mid1
		&
		j2 = mid1
	  )
	)
	&
	(
	  not(
		arr1(mid1) = goal1
	  )
	  =>
	  (
		(
		  arr1(mid1) < goal1
		  =>
		  (
			i2 = mid1 + 1
			&
			found2 = found1
			&
			j2 = j1
			&
			j2 = j1
		  )
		)
		&
		(
		  not(
			arr1(mid1) < goal1
		  )
		  =>
		  (
			j2 = mid1 - 1
			&
			found2 = found1
			&
			i2 = i1
			&
			i2 = i1
		  )
		)
	  )
	)
	&
	pc2 = 0
	&
	mid2 = mid1
  )
  or
  (
	pc1 = 0
	&
	i1 >= j1
	&
	r2 = found1
	&
	i2 = i1
	&
	j2 = j1
	&
	found2 = found1
	&
	mid2 = mid1
	&
	pc2 = pc1
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
  (
	i3 = i2
	&
	j3 = j2
	&
	found3 = found2
	&
	(
	  (
		pc2 = 0
		&
		found2 = FALSE
		&
		i2 <= j2
		&
		mid3 = i2 + j2
		&
		pc3 = 1
		&
		not(
		  (
			pc3 : 0 .. 10
			&
			mid3 : 0 .. mxint3
		  )
		)
	  )
	  or
	  (
		pc2 = 1
		&
		mid3 = mid2 / 2
		&
		pc3 = 2
		&
		not(
		  (
			pc3 : 0 .. 10
			&
			mid3 : 0 .. mxint3
		  )
		)
	  )
	)
  )
  or
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
	not(
	  (
		(
		  found3 = TRUE
		  =>
		  arr3(i3) = goal3
		)
		&
		i3 : 0 .. mxint3
		&
		j3 : 0 .. mxint3
		&
		pc3 : 0 .. 10
	  )
	)
  )
)
END

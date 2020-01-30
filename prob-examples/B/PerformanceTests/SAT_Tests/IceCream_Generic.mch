MACHINE IceCream_Generic
DEFINITIONS
 N == 24; NODES == 1..N;
 SET_PREF_SMT == TRUE
CONSTANTS edge, ice, vans
PROPERTIES
 edge: NODES <-> NODES &
 edge = { 1|->2, 1|->4,
          2|->3,
          3|->4, 3|->5, 3|->7,
          4|->7,
          5|->6, 5|->9,
          6|->7, 6|->8,
          7|->8,
          8|->10, 8|->13,
          9|->10, 9|->11, 9|->12,
          11|->12, 11|->14,
          12|->13,
          13|->16,
          14|->15, 14|->17,
          15|->16, 15|->17, 15|->18, 15|->21,
          16|->18, 16|->19,
          17|->19,
          18|->19, 18|->20, 18|->21,
          19|->20, 19|->21,
          20|->21, 20|->22,
          21|->22, 21|->23, 21|->24,
          22|->23, 21|->24,
          23|->24} &
 ice : NODES--> BOOL &
 !x.(x:NODES =>
      (ice(x)=TRUE or (TRUE:ice[edge[{x}]]) or (TRUE:ice[edge~[{x}]])))

   /* It takes ProB 16.29 seconds to find a solution with 6 vans without SMT mode;
      with enable SMT on it takes 0.340 seconds */
 & vans = card(ice~[{TRUE}]) &  
   vans <7   /* minimal solution requires 6 vans */
ASSERTIONS
  !(x,y).(x|->y:edge => x<y) /* check if we have entered the graph correctly */
OPERATIONS
  v <-- NrVans = BEGIN v := vans END;
  xx <-- Get(yy) = PRE yy:1..N THEN xx:= ice(yy) END;
  v <-- Vans = BEGIN v:= ice~[{TRUE}] END
END


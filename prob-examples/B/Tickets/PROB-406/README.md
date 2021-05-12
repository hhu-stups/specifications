

This Project tests Prob procesing of multiple instantiation (INCLUDE/prefix)



# Model Overview
```
MM
    INCLUDES
        a1.A1,
        a2.A2,
        b1.B1,
        b2.B2

    PROMOTES
        a1.opx1
        b1.opx1
    op1
    op2
    op3
    op4
    
MM_i
    REFINES MM
A1
    EXTENDS x1.X1({0,1},0)   /* prefixed first level inclusion */ 
    opa1
A2 
    EXTENDS X2      /* non-prefixed */
    opa2
B1 
    EXTENDS x1.X1({2,3},2)   /* prefixed first level inclusion */
    opb1
B2 
    EXTENDS X2      /* non-prefixed */
    opb2
X1(T,init)
    EXTENDS y1.Y1(T,init)
    v1
    opx1
X2
    EXTENDS Y2
    v2
    opx2
Y1(T,init)
    vy1
    opy1
Y2 
    vy2
    opy2

```
# Test 1 

Load MM.mch

* Expected results
We expect the following symbols in ProB:

* Actual Parameters
```
a1.x1.T
a1.x1.init
a1.x1.y1.T
a1.x1.y1.init
b1.x1.T
b1.x1.init
b1.x1.y1.T
b1.x1.y1.init
```
* Operations 
```
op1
op2
op3
op4
a1.x1.opx1
a2.opx2
b1.x1.opx1
b2.opx2
```

 * Variables
```
 a1.x1.v1
 a1.x1.y1.vy1
 a2.v2
 a2.vy2
 b1.x1.v1
 b1.x1.y1.vy1
 b2.v2
 b2.vy2
```

# Test 2
Load MM_i.imp

* Expected results - SAME as for Test 1

## Test suite execution report

ProB version 1.5.0-final

### Test1 : FAIL
Observed: 
* error regarding inconsistent SETUP_CONSTATNS
* actual parameters do not have appropriate prefixes
    * names are duplicate
    * e.g. `x1.y1.T` appears twice


### Test2 : (not executed)


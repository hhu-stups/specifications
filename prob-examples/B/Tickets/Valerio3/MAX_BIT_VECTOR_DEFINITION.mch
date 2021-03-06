/*
 adapted version by Michael Leuschel
*/
MACHINE
    MAX_BIT_VECTOR_DEFINITION

SEES
    BIT_DEFINITION
    
DEFINITIONS
    Max_size_bv == 16;
    Last_elem_bv == 15;
    SET_PREF_SYMBOLIC == TRUE

CONSTANTS
   
    BIT_VECTOR,
    bv_catenate, 
    bv_sub, 
    bv_zero, 
    bv_one,
    bv_size,
    bv_not,    
    bv_and,    
    bv_or, 
    bv_xor,
    bv_get, 
    bv_set, 
    bv_clear,
    bv_put,
    phys_bv_index

PROPERTIES
    BIT_VECTOR = seq1(BIT) 

    /* & !(vec).( vec : BIT_VECTOR => size (vec)<=Max_size_bv) */
   /* this property is false !!; it is now detected to be false by ProB */

    & bv_size = %(bv).(bv : BIT_VECTOR | size(bv)) 
    
    & bv_catenate = %(vc1,v2) . (vc1 : BIT_VECTOR & v2: BIT_VECTOR | vc1^v2) 

    & phys_bv_index = %(vpbi1) . (vpbi1 : BIT_VECTOR | 0..(bv_size(vpbi1)-1)) 
   
    & bv_sub = %(bv,low,high) . (bv : BIT_VECTOR & low: 0..(bv_size(bv)-1) & high:low..(bv_size(bv)-1)
        							| %(i0).(i0: 1..(high-low+1) | bv(i0+low) )) 

    & bv_zero : 1..Max_size_bv --> BIT_VECTOR 
    & bv_zero = %(sz) . (sz : 1..Max_size_bv | (1..sz) * {0}) 

    & bv_one : 1..Max_size_bv --> BIT_VECTOR 
    & bv_one = %(sz) . (sz : 1..Max_size_bv | (1..sz) * {1})/* */

    & bv_not = %(vn1).(vn1: BIT_VECTOR | %(idx).(idx : 1..bv_size(vn1)|bit_not(vn1(idx) ) ) ) 
 
    & bv_and = %(va1,v2).(va1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(va1) = bv_size(v2)|
        		%(idx).(idx : 1..bv_size(va1) | bit_and(va1(idx),v2(idx)))) 

    & bv_or = %(vo1,v2).(vo1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(vo1) = bv_size(v2) |
        		%(idx).(idx : 1..bv_size(vo1) | bit_or(vo1(idx),v2(idx)))) 

    & bv_xor = %(vx1,v2).(vx1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(vx1) = bv_size(v2) |
        %(idx).(idx :1..bv_size(vx1) | bit_xor(vx1(idx),v2(idx)))) 
    
    & bv_clear = %(vcl1,idx).(vcl1: BIT_VECTOR & idx : 0..Last_elem_bv | vcl1 <+ { (idx+1) |-> 0 })
      
    & bv_set = %(vs1,idx).(vs1: BIT_VECTOR & idx : 0..Last_elem_bv | vs1 <+ { (idx+1) |-> 1 }) 

    & bv_get = %(vg1,idx).(vg1: BIT_VECTOR & idx : 0..Last_elem_bv | vg1(idx+1)) 


    & bv_put = %(vp1,idx,bit).(vp1: BIT_VECTOR & idx : 0..Last_elem_bv & bit:BIT | vp1 <+ { (idx+1)|-> bit })


ASSERTIONS
    
    /*begin -  assertions added  temporally to suport the total functions in ProB  */
    bv_size : BIT_VECTOR --> 1..Max_size_bv;
    bv_catenate : (BIT_VECTOR * BIT_VECTOR) --> BIT_VECTOR ;
    phys_bv_index : BIT_VECTOR --> POW(NATURAL);
    bv_sub : (BIT_VECTOR * (1..Last_elem_bv) * (1..Last_elem_bv))--> BIT_VECTOR ;
    bv_not : BIT_VECTOR --> BIT_VECTOR ;
    bv_and : (BIT_VECTOR * BIT_VECTOR) --> BIT_VECTOR;
    bv_or : (BIT_VECTOR * BIT_VECTOR) --> BIT_VECTOR ;
    bv_xor : (BIT_VECTOR * BIT_VECTOR) --> BIT_VECTOR ;
    bv_clear : (BIT_VECTOR * (0..Last_elem_bv)) --> BIT_VECTOR ;
    bv_set : (BIT_VECTOR * (0..Last_elem_bv)) --> BIT_VECTOR ;
    bv_get : (BIT_VECTOR * (0..Last_elem_bv)) --> BIT ;
    bv_put: (BIT_VECTOR * (0..Last_elem_bv) *BIT) --> BIT_VECTOR;
    /*end -  assertions added  temporally to suport the total functions in ProB  */
    
    
    ! bv.(bv : BIT_VECTOR => bv_size(bv_not(bv)) = bv_size(bv));
   	    
    ! (bv,indx).(bv : BIT_VECTOR & indx : 0..(bv_size(bv)-1) => (bv_get(bv_not(bv_not(bv)),indx) = bv_get(bv,indx) ));

    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR =>
            		bv_size(bv_catenate(v1, v2)) = bv_size(v1) + bv_size(v2));

    ! (bv,low,high). (bv : BIT_VECTOR & low : 0..(bv_size(bv)-1) & high : 0..(bv_size(bv)-1) & low <= high =>
            			bv_size(bv_sub(bv, low, high)) = high-low);

    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) =>
            		bv_size(bv_and(v1, v2)) = bv_size(v2));
       
    ! (v1,v2,indx). (v1 : BIT_VECTOR & v2 : BIT_VECTOR  & bv_size(v1) = bv_size(v2) & indx: 0..(bv_size(v1)-1)=>
            			(bv_get(bv_and(v1, v2),indx) = bv_get(bv_and(v2, v1),indx)));
       
    ! (v1,v2,v3,indx). (v1:BIT_VECTOR & v2:BIT_VECTOR & v3:BIT_VECTOR & bv_size(v1)=bv_size(v2) & bv_size(v1)=bv_size(v3) 
        					& indx: 0..(bv_size(v1)-1)=> (bv_get(bv_and(v1, bv_and(v2,v3)),indx) = bv_get(bv_and(bv_and(v1, v2), v3),indx)) );
       
    ! (bv,indx). (bv : BIT_VECTOR & indx:0..(bv_size(bv)-1) => (bv_get(bv_and(bv, bv_zero(bv_size(bv))),indx) = 
            		bv_get(bv_zero(bv_size(bv)),indx) ));

    ! (bv,indx). (bv : BIT_VECTOR & indx:0..(bv_size(bv)-1) => (bv_get(bv_and(bv, bv_one(bv_size(bv))),indx) = bv_get(bv,indx)));

    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) => bv_size(bv_or(v1, v2)) = bv_size(v1));
       
    ! (v1,v2,indx). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) & indx:0..(bv_size(v1)-1) =>
            			(bv_get(bv_or(v1, v2),indx) = bv_get(bv_or(v2, v1),indx)));
       
    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) =>
            		bv_size(bv_or(v1, v2)) = bv_size(v2));   
       
    ! (v1,v2,v3,indx). (v1 : BIT_VECTOR & v2 : BIT_VECTOR& v3 : BIT_VECTOR & bv_size(v1) = bv_size(v2) & bv_size(v1) = bv_size(v3) 
        					& indx:0..(bv_size(v1)-1)=> (bv_get(bv_or(v1, bv_or(v2,v3)),indx) = bv_get(bv_or(bv_or(v1, v2), v3),indx)));
   
    ! (bv,indx). (bv:BIT_VECTOR & indx:0..(bv_size(bv)-1) => (bv_get(bv_or(bv, bv_one(bv_size(bv))),indx) = bv_get(bv_one(bv_size(bv)),indx)));
    
    ! (bv,indx). (bv:BIT_VECTOR & indx:0..(bv_size(bv)-1)=> (bv_get(bv_or(bv, bv_zero(bv_size(bv))),indx) = bv_get(bv,indx)));

    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) =>bv_size(bv_xor(v1, v2)) = bv_size(v1));
    
    ! (v1,v2). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) =>bv_size(bv_xor(v1, v2)) = bv_size(v2));
    
    ! (v1,v2,indx). (v1 : BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) & indx:0..(bv_size(v1)-1) =>
            			(bv_get(bv_xor(v1, v2),indx) = bv_get(bv_xor(v2, v1),indx)));
                    
    ! (bv,indx). (bv : BIT_VECTOR & indx:0..(bv_size(bv)-1) => bv_get(bv_xor(bv,bv),indx) = bv_get(bv_zero(bv_size(bv)),indx))
END
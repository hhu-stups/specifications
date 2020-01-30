/*

*/
MACHINE
    BIT_VECTOR_DEFINITION

SEES
    BIT_DEFINITION

CONSTANTS
   
    BIT_VECTOR,
    bv_catenate, 
    bv_sub /*, 
    bv_zero, 
    bv_one*/ ,
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
   
  /*  & bv_size : BIT_VECTOR +-> NATURAL1 */
    & bv_size = %(bv).(bv : BIT_VECTOR | size(bv)) 
    
/*   & bv_catenate : BIT_VECTOR * BIT_VECTOR +-> BIT_VECTOR */
	& bv_catenate = %(v1,v2) . (v1 : BIT_VECTOR & v2: BIT_VECTOR | v1^v2) 

/*    & phys_bv_index : BIT_VECTOR +-> POW(NATURAL)*/
    & phys_bv_index = %(v1) . (v1 : BIT_VECTOR | 0..(bv_size(v1)-1)) 
   
/*    & bv_sub : BIT_VECTOR * NATURAL1 * NATURAL1 +-> BIT_VECTOR */
    & bv_sub = %(bv,low,high) . (bv : BIT_VECTOR & low: 0..(bv_size(bv)-1) & high:low..(bv_size(bv)-1)
        							| %(i0).(i0: 1..(high-low+1) | bv(i0+low) )) 

   /* & bv_zero : NATURAL1 --> BIT_VECTOR */
   /* & bv_zero = %(sz) . (sz : NATURAL1 | (1..sz) * {0}) */

  /*  & bv_one : NATURAL1 --> BIT_VECTOR */
  /*  & bv_one = %(sz) . (sz : NATURAL1 | (1..sz) * {1}) */

   /* & bv_not : BIT_VECTOR +-> BIT_VECTOR */
    & bv_not = %(v1).(v1: BIT_VECTOR | %(idx).(idx : 1..bv_size(v1)|bit_not(v1(idx) ) ) ) 

/*    & bv_and : BIT_VECTOR * BIT_VECTOR +-> BIT_VECTOR */
    & bv_and = %(v1,v2).(v1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2)|
        		%(idx).(idx : 1..bv_size(v1) | bit_and(v1(idx),v2(idx)))) 

/*    & bv_or : BIT_VECTOR * BIT_VECTOR +-> BIT_VECTOR */
    & bv_or = %(v1,v2).(v1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) |
        		%(idx).(idx : 1..bv_size(v1) | bit_or(v1(idx),v2(idx)))) 

/*    & bv_xor : BIT_VECTOR * BIT_VECTOR +-> BIT_VECTOR */
    & bv_xor = %(v1,v2).(v1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(v1) = bv_size(v2) |
        %(idx).(idx :1..bv_size(v1) | bit_xor(v1(idx),v2(idx)))) 
    
/*    & bv_clear : BIT_VECTOR * (0..15) +-> BIT_VECTOR */
    & bv_clear = %(v1,idx).(v1: BIT_VECTOR & idx : 0..(bv_size(v1)-1) | v1 <+ { (idx+1) |-> 0 })
      
/*    & bv_set : BIT_VECTOR * (0..15) +-> BIT_VECTOR */
    & bv_set = %(v1,idx).(v1: BIT_VECTOR & idx : 0..(bv_size(v1)-1) | v1 <+ { (idx+1) |-> 1 }) 

/*    & bv_get : BIT_VECTOR * (0..15) +-> BIT */
    & bv_get = %(v1,idx).(v1: BIT_VECTOR & idx : 0..(bv_size(v1)-1) | v1(idx+1)) 


/*    & bv_put: BIT_VECTOR * (0..15) *BIT +-> BIT_VECTOR */
    & bv_put = %(v1,idx,bit).(v1: BIT_VECTOR & idx : 0..(bv_size(v1)-1) & bit:BIT | v1 <+ { (idx+1)|-> bit })
   
   

/*ASSERTIONS
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
                    
    ! (bv,indx). (bv : BIT_VECTOR & indx:0..(bv_size(bv)-1) => bv_get(bv_xor(bv,bv),indx) = bv_get(bv_zero(bv_size(bv)),indx)) */
END
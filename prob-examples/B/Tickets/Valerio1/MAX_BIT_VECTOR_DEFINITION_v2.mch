/*
 adapted version by Michael Leuschel
*/
MACHINE
    MAX_BIT_VECTOR_DEFINITION_v2

SEES
    BIT_DEFINITION
    
DEFINITIONS
    Max_size_bv == 16;
    Last_elem_bv == 15;
    GOAL2 ==  BIT_VECTOR = seq1(BIT);
    GOAL ==  bv_not = %(bvn1).(bvn1: BIT_VECTOR | %(idx).(idx : 1..bv_size(bvn1)|bit_not(bvn1(idx) ) ) ) 

CONSTANTS
   
    BIT_VECTOR,
    bv_catenate, 
    bv_sub/*, 
    bv_zero, 
    bv_one*/,
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
   
    & bv_size = %(bv).(bv : BIT_VECTOR | size(bv)) 
    
	& bv_catenate = %(bvc1,v2) . (bvc1 : BIT_VECTOR & v2: BIT_VECTOR | bvc1^v2) 

    & phys_bv_index = %(pbv1) . (pbv1 : BIT_VECTOR | 0..(bv_size(pbv1)-1)) 
   
    & bv_sub = %(bv,low,high) . (bv : BIT_VECTOR & low: 0..(bv_size(bv)-1) & high:low..(bv_size(bv)-1)
        							| %(i0).(i0: 1..(high-low+1) | bv(i0+low) )) 

   /* & bv_zero : NATURAL1 --> BIT_VECTOR 
    & bv_zero = %(sz) . (sz : NATURAL1 | (1..sz) * {0}) 

    & bv_one : NATURAL1 --> BIT_VECTOR 
    & bv_one = %(sz) . (sz : NATURAL1 | (1..sz) * {1}) */

    & bv_not = %(v1).(v1: BIT_VECTOR | %(idx).(idx : 1..bv_size(v1)|bit_not(v1(idx) ) ) ) 
 
    & bv_and = %(bav1,v2).(bav1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(bav1) = bv_size(v2)|
        		%(idx).(idx : 1..bv_size(bav1) | bit_and(bav1(idx),v2(idx)))) 

    & bv_or = %(bov1,v2).(bov1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(bov1) = bv_size(v2) |
        		%(idx).(idx : 1..bv_size(bov1) | bit_or(bov1(idx),v2(idx)))) 

    & bv_xor = %(bxv1,v2).(bxv1: BIT_VECTOR & v2 : BIT_VECTOR & bv_size(bxv1) = bv_size(v2) |
        %(idx).(idx :1..bv_size(bxv1) | bit_xor(bxv1(idx),v2(idx)))) 
    
    & bv_clear = %(bcv1,idx).(bcv1: BIT_VECTOR & idx : 0..Last_elem_bv | bcv1 <+ { (idx+1) |-> 0 })
      
    & bv_set = %(bsv1,idx).(bsv1: BIT_VECTOR & idx : 0..Last_elem_bv | bsv1 <+ { (idx+1) |-> 1 }) 

    & bv_get = %(bgv1,idx).(bgv1: BIT_VECTOR & idx : 0..Last_elem_bv | bgv1(idx+1)) 


    & bv_put = %(bptv1,idx,bit).(bptv1: BIT_VECTOR & idx : 0..Last_elem_bv & bit:BIT | bptv1 <+ { (idx+1)|-> bit })

ASSERTIONS
    !(vec).( vec : BIT_VECTOR => size (vec)<=Max_size_bv);
    bv_size : BIT_VECTOR +-> 1..Max_size_bv;
    bv_catenate : (BIT_VECTOR * BIT_VECTOR) +-> BIT_VECTOR ;
    phys_bv_index : BIT_VECTOR +-> POW(NATURAL);
    bv_sub : (BIT_VECTOR * (1..Last_elem_bv) * (1..Last_elem_bv))+-> BIT_VECTOR ;
    bv_not : BIT_VECTOR +-> BIT_VECTOR ;
    bv_and : (BIT_VECTOR * BIT_VECTOR) +-> BIT_VECTOR;
    bv_or : (BIT_VECTOR * BIT_VECTOR) +-> BIT_VECTOR ;
    bv_xor : (BIT_VECTOR * BIT_VECTOR) +-> BIT_VECTOR ;
    bv_clear : (BIT_VECTOR * (0..Last_elem_bv)) +-> BIT_VECTOR ;
    bv_set : (BIT_VECTOR * (0..Last_elem_bv)) +-> BIT_VECTOR ;
    bv_get : (BIT_VECTOR * (0..Last_elem_bv)) +-> BIT ;
    bv_put: (BIT_VECTOR * (0..Last_elem_bv) *BIT) +-> BIT_VECTOR 
 
   /*

ASSERTIONS
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
                    
    ! (bv,indx). (bv : BIT_VECTOR & indx:0..(bv_size(bv)-1) => bv_get(bv_xor(bv,bv),indx) = bv_get(bv_zero(bv_size(bv)),indx))*/
END
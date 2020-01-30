MACHINE
    BIT_VECTOR_ARITHMETICS
    
SEES 
    BIT_DEFINITION,
    MAX_BIT_VECTOR_DEFINITION,
    POWER2
    
    
    
CONSTANTS
    bv_nat,
    bv_even
    
PROPERTIES
    bv_nat : BIT_VECTOR --> NATURAL &
    bv_nat = % (bv). (bv : BIT_VECTOR | ( SIGMA idx . (idx : dom(bv) | (2**idx) * bv(idx))))&

    
    bv_even:BIT_VECTOR --> BIT &
    bv_even=%(bv).(bv:BIT_VECTOR| 1- (size(bv|>{1}) mod 2) )
    
    
ASSERTIONS
    ! ss. (ss : NATURAL1 => (bv_nat(bv_zero(ss)) = 0)) &
    ! ss. (ss : NATURAL1 => (bv_even(bv_zero(ss)) = 0))
    
END
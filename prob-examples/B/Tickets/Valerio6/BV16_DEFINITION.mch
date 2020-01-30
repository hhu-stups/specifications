/* BV16_DEFINITION
 * Author: atelierb
 * Creation date: Thu Feb 12 2009
 */
MACHINE
    BV16_DEFINITION    
SEES 
	BIT_DEFINITION,
	MAX_BIT_VECTOR_DEFINITION,
	BYTE_DEFINITION
	
DEFINITIONS	
	BV16_WIDTH == 16;
	SET_PREF_SYMBOLIC == TRUE
	
CONSTANTS 
	BV16_INDX,
	PHYS_BV16_INDEX,
	BV16_ZERO,
	BV16/*,
	bv16_get_low,
	bv16_get_high*/,
	bv16_byte,
	byte_bv16/*,
	bv16_bit_get*/
	
PROPERTIES 

	BV16_INDX = 1..(BV16_WIDTH) &
	PHYS_BV16_INDEX = 0..(BV16_WIDTH-1) &
	BV16 = { bt | bt: BIT_VECTOR & size(bt)=BV16_WIDTH} &
	BV16_ZERO = [0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0]  &
	
	/*bv16_byte -- this function was replaced by bv16_get_low,bv16_get_high and bv_catenate*/
	
	
	/*	bv16_byte = %(bv).(bv:BV16 | (bv /|\ 8  , bv \|/ 8  ) ) */

	/*bv16_get_low: BV16 --> BYTE &
	bv16_get_low = %(bv).(bv:BV16 | bv /|\ 8 )	 &
	
	bv16_get_high: BV16 --> BYTE &
	bv16_get_high = %(bv).(bv:BV16 | bv \|/ 8  ) 
    */

	bv16_byte = %(bv).(bv:BV16 | ({ 1|->bv(9),2|->bv(10),3|->bv(11),4|->bv(12),5|->bv(13),6|->bv(14),7|->bv(15),8|->bv(16)}
	        ,{ 1|->bv(1),2|->bv(2),3|->bv(3),4|->bv(4),5|->bv(5),6|->bv(6),7|->bv(7),8|->bv(8)}) ) &
	
	byte_bv16 = %(bv1,bv2).(bv1: BYTE & bv2 : BYTE | bv1^bv2)              


	/* this function must be replaced by bv_get */
/*	bv16_bit_get: (BV16 * PHYS_BV16_INDEX )--> BIT &
    bv16_bit_get = %(bt,ind).(bt:BV16 & ind:PHYS_BV16_INDEX | bt(ind+1) )	*/

ASSERTIONS
    
    BV16_ZERO: BV16 &
    BV16<:BIT_VECTOR &
    
    card(BV16) = 65536 &
   /* 
    byte_bv16 : ( BV16  --> (BYTE * BYTE)) &
    bv16_byte : ((BYTE * BYTE) --> BV16 )& 
    byte_bv16 = bv16_byte~ & */
    
    !(bt).(bt : BV16 => size(bt)=size(bt) & size(bt)=16 & bt : seq1(BIT) /*&
      bv_catenate(bv16_get_low(bt),bv16_get_high(bt))=bt*/ ) &
    
    
   /* 
    dom(bv16_byte) = BV16 &
    ran(bv16_byte) = (BYTE * BYTE) &

    dom(byte_bv16) = (BYTE * BYTE)  &
    ran(byte_bv16) = BV16 &*/
    
/*    dom(bv16_bit_get) = (BV16 * PHYS_BV16_INDEX ) &
    ran(bv16_bit_get) = BIT &*/
    
    [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] : BV16 &
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] : BV16
    
END

/* BV16_DEFINITION
 * Author: atelierb
 * Creation date: Thu Feb 12 2009
 */
MACHINE
    BV16_DEFINITION    
SEES 
	BIT_DEFINITION,
	BYTE_DEFINITION
	
DEFINITIONS
	BV16_WIDTH == 16;
	SET_PREF_SYMBOLIC == TRUE
	
CONSTANTS 
	BV16_INDX,
	PHYS_BV16_INDEX,

	BV16/*,
	bv16_get_low,
	bv16_get_high*/,
	bv16_byte,
	byte_bv16/*,	
	bv16_bit_get*/,
	complement16
	
PROPERTIES 

	BV16_INDX = 1..(BV16_WIDTH) &
	PHYS_BV16_INDEX = 0..(BV16_WIDTH-1) &
	BV16 = (BV16_INDX --> BIT)  & card(BV16)= 65536 &
    !(b1).(b1 : BV16 => size(b1)=BV16_WIDTH & b1 : seq1(BIT)) & 
	
	/*bv16_byte -- this function was replaced by bv16_get_low,bv16_get_high and bv_catenate*/
	
	
	/*	bv16_byte = %(bv).(bv:BV16 | (bv /|\ 8  , bv \|/ 8  ) ) */

	/*bv16_get_low: BV16 --> BYTE &
	bv16_get_low = %(bv).(bv:BV16 | bv /|\ 8 )	 &
	
	bv16_get_high: BV16 --> BYTE &
	bv16_get_high = %(bv).(bv:BV16 | bv \|/ 8  ) 
	*/
	
 complement16 = %(bt).(bt : BV16 | %(idx).(idx : 1..16|bit_not(bt(idx) ) ) ) &
 
 
 bv16_byte : ( BV16  +-> (POW(INTEGER*INTEGER)  * POW(INTEGER*INTEGER) )) & /* changed from BYTE to POW(POW(INTEGER*INTEGER))  to relation by leuschel */ 
/* The order is important to represent the integers */
	bv16_byte = %(bv).(bv:BV16 | ( { 8|->bv(16),7|->bv(15),6|->bv(14),5|->bv(13),4|->bv(12),3|->bv(11),2|->bv(10),1|->bv(9)}
	                             , { 8|->bv(8) ,7|->bv(7) ,6|->bv(6) ,5|->bv(5) ,4|->bv(4) ,3|->bv(3) ,2|->bv(2) ,1|->bv(1)}) ) &
	
	byte_bv16 : ((BYTE * BYTE) +-> POW(INTEGER*INTEGER))  & /* leuschel: replaced BV16 in range by POW(INTEGER*INTEGER)*POW(INTEGER*INTEGER)) */
	byte_bv16 = %(bv1,bv2).(bv1: BYTE & bv2 : BYTE |
	    ( { 16|->bv1(8),15|->bv1(7),14|->bv1(6),13|->bv1(5),12|->bv1(4),11|->bv1(3), 10|->bv1(2),9|->bv1(1)
      ,   8|->bv2(8),7 |->bv2(7),6 |->bv2(6), 5|->bv2(5), 4|->bv2(4),3 |->bv2(3), 2 |->bv2(2),1|->bv2(1) } ))              


	/* this function must be replaced by bv_get */
/*	bv16_bit_get: (BV16 * PHYS_BV16_INDEX )--> BIT &
    bv16_bit_get = %(bt,ind).(bt:BV16 & ind:PHYS_BV16_INDEX | bt(ind+1) )	*/

ASSERTIONS
    
    card(BV16) = 65536 &

    
    complement16 : BV16 --> BV16 &
  
    
   
   bv16_byte : ( BV16  >->> (BYTE * BYTE)) &
   byte_bv16 : ((BYTE * BYTE) >->> BV16 ) & 
   byte_bv16 = bv16_byte~ &
    
    !(bt).(bt : BV16 => size(bt)=16 & bt : seq1(BIT) /*&
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

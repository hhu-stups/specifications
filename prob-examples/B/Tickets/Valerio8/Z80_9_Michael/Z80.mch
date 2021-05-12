/*************************************************************************
Copyright (c) 2008, Valerio Medeiros Jr., David Deharbe

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the Universidade Federal do Rio Grande do Norte nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*************************************************************************/

MACHINE
    Z80
INCLUDES
    MEMORY
SEES 
    ALU ,
    BIT_DEFINITION,
    BYTE_DEFINITION,
    BV16_DEFINITION,
    
    UCHAR_DEFINITION,
    SCHAR_DEFINITION,
    SSHORT_DEFINITION,
    USHORT_DEFINITION,
    POWER2 
   
SETS
    id_reg_8 = { a0 , f0 , f_0 , a_0 ,
        b0 , c0 , b_0 , c_0 ,
        d0 , e0 , d_0 , e_0 ,
        h0 , l0 , h_0 , l_0 } ;
    id_reg_16 = { BC , DE , HL , SP , AF }        
ABSTRACT_VARIABLES
    rgs8,
    pc , sp , ix , iy ,
    i_,r_ , 
    iff1 , iff2,
    im ,
    io_ports   
INVARIANT
    rgs8 : id_reg_8 --> BYTE &
    pc : USHORT & sp : BV16 & ix : BV16 & iy : BV16 &
    i_ : BYTE & r_  : BYTE & 
    iff1 : BIT &  iff2 : BIT &
    im : (BIT*BIT) &
    io_ports  : BYTE --> BYTE

DEFINITIONS
    SET_PREF_SYMBOLIC == TRUE;
    SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE;
    /*To make sure that CLPFD is turned on in the DEFINITIONS:*/
    SET_PREF_CLPFD == TRUE;    


    pow2_0 == 1;
    pow2_1 == 2;
    pow2_2 == 4;
    pow2_3 == 8;
    pow2_4 == 16;
    pow2_5 == 32;
    pow2_6 == 64;
    pow2_7 == 128;
    pow2_8 == 256;
    pow2_9 == 512;
    pow2_10 == 1024;    
    pow2_11 == 2048;  
    pow2_12 == 4096;   
    pow2_13 == 8192;
    pow2_14 == 16384;   
    pow2_15 == 32768; 
    pow2_16 == 65536;


    bv_BC == byte_bv16 ( rgs8 ( b0 ) , rgs8 ( c0 ) ) ;
    bv_HL == byte_bv16 ( rgs8 ( h0 ) , rgs8 ( l0 ) ) ;
    bv_DE == byte_bv16 ( rgs8 ( d0 ) , rgs8 ( e0 ) ) ;
    bv_AF == byte_bv16 ( rgs8 ( a0 ) , rgs8 ( f0 ) ) ;
    
    bv_9BC0 == mem ( byte_bv16 ( rgs8 ( b0 ) , rgs8 ( c0 ) ) );
    bv_9DE0 == mem ( byte_bv16 ( rgs8 ( d0 ) , rgs8 ( e0 ) ) );
    bv_9HL0 == mem ( byte_bv16 ( rgs8 ( h0 ) , rgs8 ( l0 ) ) );
    bv_9AF0 == mem ( byte_bv16 ( rgs8 ( a0 ) , rgs8 ( f0 ) ) );
    
    bv_9SP0 == mem ( sp );
    bv_9IX0 == mem ( ix );
    bv_9IY0 == mem ( iy );
    
    sp_plus_one == ushort_bv16 ( add16USHORT ( 0 , bv16_ushort ( sp ) , 1 ) );
    sp_plus_two == ushort_bv16 ( add16USHORT ( 0 , bv16_ushort ( sp ) , 2 ) );
    sp_minus_one == ushort_bv16 ( sub16USHORT ( 0 , bv16_ushort ( sp ) , 1 ) );
    sp_minus_two == ushort_bv16 ( sub16USHORT ( 0 , bv16_ushort ( sp ) , 2 ) );
    
    z_s  == bv8get ( rgs8 ( f0 ) , 7 ) ;
    z_z  == bv8get ( rgs8 ( f0 ) , 6 ) ;
    z_00 == bv8get ( rgs8 ( f0 ) , 5 ) ;
    z_h  == bv8get ( rgs8 ( f0 ) , 4 ) ;
    z_01 == bv8get ( rgs8 ( f0 ) , 3 ) ;
    z_p  == bv8get ( rgs8 ( f0 ) , 2 ) ;
    z_n  == bv8get ( rgs8 ( f0 ) , 1 ) ;
    z_c  == bv8get ( rgs8 ( f0 ) , 0 )    
    
    
CONCRETE_CONSTANTS
    get_bv_reg16,
    REG16_TO_REG8 ,
    REG8_TO_REG16 ,
    update_flag_reg	,
    cc_get
PROPERTIES
    

    
  
    REG16_TO_REG8 : id_reg_16 +-> ( id_reg_8 * id_reg_8 ) & /* SP is not used in this function */
    REG16_TO_REG8 = %(idf).( idf :  id_reg_16 & idf = BC |( b0 , c0 ))\/
				    %(idf).( idf :  id_reg_16 & idf = DE |( d0 , e0 ))\/
				    %(idf).( idf :  id_reg_16 & idf = HL |( h0 , l0 ))\/
				    %(idf).( idf :  id_reg_16 & idf = AF |( a0 , f0 ))


    &
    
    REG8_TO_REG16 : ( id_reg_8 * id_reg_8 ) +-> id_reg_16 &
    REG8_TO_REG16 = %(idf1,idf2).( idf1 : id_reg_8  & idf2 : id_reg_8 & idf1 = b0 &  idf2 = c0 | BC)\/
   				    %(idf1,idf2).( idf1 : id_reg_8  & idf2 : id_reg_8 & idf1 = d0 &  idf2 = e0 | DE)\/
   				    %(idf1,idf2).( idf1 : id_reg_8  & idf2 : id_reg_8 & idf1 = h0 &  idf2 = l0 | HL)\/
   				    %(idf1,idf2).( idf1 : id_reg_8  & idf2 : id_reg_8 & idf1 = a0 &  idf2 = f0 | AF) &
    
    
    
    /* update_flag_reg : ( BIT * BIT * BIT * BIT * BIT * BIT +-> ({f0} * BYTE) )&   ProB simplification  */
    update_flag_reg = % ( s7 , z6 , h4 , pv2 , n_add_sub , c0 ) .
    ( s7 : BIT & z6  : BIT &   h4 : BIT  & pv2 : BIT & n_add_sub : BIT & c0 : BIT |
        ( f0 |-> [c0, n_add_sub, pv2, 1, h4, 1, z6, s7]) ) &
    
   
   
   
   
    /* cc_get : ( (id_reg_8 --> BYTE) * (0..8) ) +-> BIT &*/
     cc_get = %(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 0 |1 - bv8get ( rgs8_ ( f0 ) , 6 ) )\/
			%(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 1 |    bv8get ( rgs8_ ( f0 ) , 6 ) )\/
		    %(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 2 |1 - bv8get ( rgs8_ ( f0 ) , 0 ) )\/     
			%(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 3 |    bv8get ( rgs8_ ( f0 ) , 0 ) )\/     
			%(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 4 |1 - bv8get ( rgs8_ ( f0 ) , 2 ) )\/ 
		    %(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 5 |    bv8get ( rgs8_ ( f0 ) , 2 ) )\/ 
			%(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 6 |1 - bv8get ( rgs8_ ( f0 ) , 7 ) )\/ 
     		%(rgs8_,ind).( rgs8_ : (id_reg_8 --> BYTE) & ind = 7 |    bv8get ( rgs8_ ( f0 ) , 7 ) ) &
														
														
														
														
		/*get_bv_reg16 : ( BV16 * ( id_reg_8 --> BYTE ) * id_reg_16 ) +-> ( BV16 )	&			*/
		get_bv_reg16 = %(sp_,rgs8_,r1).( sp_ :  BV16 & rgs8_ : ( id_reg_8 --> BYTE ) & r1 = BC| byte_bv16 ( rgs8_ ( b0 ) , rgs8_ ( c0 ) ) )\/
		%(sp_,rgs8_,r1).( sp_ :  BV16 & rgs8_ : ( id_reg_8 --> BYTE ) & r1 = DE| byte_bv16 ( rgs8_ ( d0 ) , rgs8_ ( e0 ) ))\/
		%(sp_,rgs8_,r1).( sp_ :  BV16 & rgs8_ : ( id_reg_8 --> BYTE ) & r1 = HL| byte_bv16 ( rgs8_ ( h0 ) , rgs8_ ( l0 ) ))\/
		%(sp_,rgs8_,r1).( sp_ :  BV16 & rgs8_ : ( id_reg_8 --> BYTE ) & r1 = SP| sp_ )\/
		%(sp_,rgs8_,r1).( sp_ :  BV16 & rgs8_ : ( id_reg_8 --> BYTE ) & r1 = AF| byte_bv16 ( rgs8_ ( a0 ) , rgs8_ ( f0 ) ))
																
    
ASSERTIONS

   /* ProB Assertions */
   card(REG16_TO_REG8 ) = 5 &
   card(update_flag_reg ) = 64 &
   
   /* ProB Assertions */
    get_bv_reg16 : ( BV16 * ( id_reg_8 --> BYTE ) * id_reg_16 ) +-> ( BV16 )	&	
    cc_get : ( (id_reg_8 --> BYTE) * (0..8) ) +-> BIT &
    
   /* card ( ushort_uchar ) = 65536 & Prob simplification */
    ran ( mem ) <: BYTE &
    dom ( mem ) = BV16 &
    ran ( rgs8 ) <: BYTE &
    dom ( rgs8 ) = id_reg_8 &
    
    
    instruction_next(pc) : USHORT & 
    
    
    bv_9BC0 : BYTE  & mem ( byte_bv16 ( schar_byte ( 0 ) , bv_9BC0 ) ) : BYTE &
    bv_9DE0 : BYTE  & mem ( byte_bv16 ( schar_byte ( 0 ) , bv_9DE0 ) ) : BYTE &
    bv_9HL0 : BYTE  & mem ( byte_bv16 ( schar_byte ( 0 ) , bv_9HL0 ) ) : BYTE &
    bv_9AF0 : BYTE  & mem ( byte_bv16 ( schar_byte ( 0 ) , bv_9AF0 ) ) : BYTE &
    
    
    bv_9SP0 : BYTE  &
    bv_9IX0 : BYTE  &
    bv_9IY0 : BYTE &
    
    
    update_refresh_reg(r_): BYTE &
    
    
    dom(update_flag_reg) = ( BIT * BIT * BIT  * BIT * BIT * BIT ) &
    ran(update_flag_reg) : POW({f0} * BYTE) &
    
    !(b1,b2,b3,b4,b5,b6).(  b1: BIT & b2: BIT & b3: BIT & b4: BIT & b5: BIT & b6 : BIT   => update_flag_reg(b1,b2,b3,b4,b5,b6) : {f0} * BYTE ) &
    
    !(xx).(xx: id_reg_8 -->BYTE =>  (rgs8 <+ xx) : id_reg_8 --> BYTE) &
    
    !(xx,xxr).(xx: id_reg_8 & xxr : BYTE =>  rgs8 <+ { xx|->xxr } : id_reg_8 --> BYTE) &
    
    !(xx,xxr,yy,yyr).(xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  not(xx=yy) 
        =>  rgs8 <+ { xx|->xxr,yy|->yyr } : id_reg_8 --> BYTE) &
    
    !(xx,xxr,yy,yyr,zz,zzr).(xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  zz: id_reg_8 & zzr : BYTE &
        not(xx=yy) & not(xx=zz) & not(yy=zz) 
        =>  rgs8 <+ { xx|->xxr,yy|->yyr , zz|->zzr } : id_reg_8 --> BYTE) &
    
    !(xx,xxr,yy,yyr,zz,zzr,vv,vvr).(xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  zz: id_reg_8 & zzr : BYTE &
        vv : id_reg_8 & vvr: BYTE &
        not(xx=yy) & not(xx=zz) & not(xx=vv) &  not(yy=zz) & not(yy=vv) & not(zz=vv) 
        =>  rgs8 <+ { xx|->xxr,yy|->yyr , zz|->zzr ,  vv|->vvr } : id_reg_8 --> BYTE) &
    
    
    !(xx,xxr,yy,yyr,zz,zzr,vv,vvr,ww,wwr).
    (xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  zz: id_reg_8 & zzr : BYTE &
        vv : id_reg_8 & vvr: BYTE & ww : id_reg_8 &  wwr : BYTE & not(xx=yy) & not(xx=zz) &
        not(xx=vv) & not(xx=ww) & not(yy=zz) & not(yy=vv) & not(yy=ww) & not(zz=vv) & not(zz=ww) & not(vv=ww)
        =>  rgs8 <+ { xx|->xxr,yy|->yyr , zz|->zzr ,  vv|->vvr,  ww |-> wwr } : id_reg_8 --> BYTE) &
    
    !(xx,xxr,yy,yyr,zz,zzr,vv,vvr,ww,wwr,aa,aar).
    (xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  zz: id_reg_8 & zzr : BYTE &
        vv : id_reg_8 & vvr: BYTE & ww : id_reg_8 &  wwr : BYTE &  aa : id_reg_8 & aar : BYTE &
        not(xx=yy) & not(xx=zz) & not(xx=vv) & not(xx=ww) & not(xx=aa) & not(yy=zz) & not(yy=vv) & not(yy=ww)
        & not(yy=aa) & not(zz=vv) & not(zz=ww) & not(zz=aa) & not(vv=ww) & not(vv=aa) & not(ww=aa)
        =>  rgs8 <+ { xx|->xxr,yy|->yyr , zz|->zzr ,  vv|->vvr,  ww |-> wwr, aa |-> aar } : id_reg_8 --> BYTE) &
    
    !(xx,xxr,yy,yyr,zz,zzr,vv,vvr,ww,wwr,aa,aar,bb,bbr).
    (xx: id_reg_8 & xxr : BYTE & yy: id_reg_8 & yyr : BYTE &  zz: id_reg_8 & zzr : BYTE &
        vv : id_reg_8 & vvr: BYTE & ww : id_reg_8 &  wwr : BYTE &  aa : id_reg_8 & aar : BYTE & 
        bb: id_reg_8 & bbr : BYTE & not(xx=yy) & not(xx=zz) & not(xx=vv) & not(xx=ww) &
        not(xx=aa) & not(xx=bb) & not(yy=zz)
        & not(yy=vv) & not(yy=ww)  & not(yy=aa) & not(yy=bb) & not(zz=vv) & not(zz=ww) & not(zz=aa) &
        not(zz=bb) & not(vv=ww) & not(vv=aa)& not(vv=bb) & not(ww=aa) & not(ww=bb) & not(aa=bb)
        =>  rgs8 <+ { xx|->xxr,yy|->yyr , zz|->zzr ,  vv|->vvr,  ww |-> wwr, aa |-> aar, bb |-> bbr }
        : id_reg_8 --> BYTE) &  
    
    
    

    
    /**** Define types of contants ussualy used ****/
    
    bv_BC  : BV16 &
    bv_HL : BV16 &
    bv_DE : BV16 &
    bv_AF : BV16 &
    
    bv_9BC0 : BYTE &
    bv_9DE0 : BYTE &
    bv_9HL0 : BYTE &
    bv_9AF0 : BYTE &
    
    bv_9SP0 : BYTE &
    bv_9IX0 : BYTE &
    bv_9IY0 : BYTE &
    
    
    dec_BV16(bv_BC)  : BV16 &
    inc_BV16(bv_BC)  : BV16 &
    
    dec_BV16(bv_DE)  : BV16 &
    inc_BV16(bv_DE)  : BV16 &
    
    inc_BV16(bv_HL)  : BV16 &
    dec_BV16(bv_HL)  : BV16 &
    
    sp_plus_one : BV16 &
    sp_plus_two : BV16 &
    sp_minus_one : BV16 &
    sp_minus_two : BV16 &
    
    z_s  : BIT &
    z_z  : BIT &
    z_00 : BIT &
    z_h  : BIT &
    z_01 : BIT &
    z_p  : BIT &
    z_n  : BIT &
    z_c  : BIT &
    
    
    /**** Define types of contants ussualy often ****/
    
    
    io_ports(rgs8(c0)): BYTE &
    
    dec(rgs8(b0)) : BYTE 
    
    
    
INITIALISATION
    
    rgs8 := { (a0 |-> [1,1,1,1,1,1,1,1]) , (f0 |-> [1,1,1,1,1,1,1,1]) , (f_0 |-> [1,1,1,1,1,1,1,1]) , (a_0 |-> [1,1,1,1,1,1,1,1]) ,
        (b0 |-> [1,1,1,1,1,1,1,1]) , (c0 |-> [1,1,1,1,1,1,1,1]) , (b_0 |-> [1,1,1,1,1,1,1,1]) , (c_0 |-> [1,1,1,1,1,1,1,1]) ,
        (d0 |-> [1,1,1,1,1,1,1,1]) , (e0 |-> [1,1,1,1,1,1,1,1]) , (d_0 |-> [1,1,1,1,1,1,1,1]) , (e_0 |-> [1,1,1,1,1,1,1,1]) ,
        (h0 |-> [1,1,1,1,1,1,1,1]) , (l0 |-> [1,1,1,1,1,1,1,1]) , (h_0 |-> [1,1,1,1,1,1,1,1]) , (l_0 |-> [1,1,1,1,1,1,1,1]) } ||
    
    pc := 0 || sp := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] || ix := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] || iy := [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] ||
    i_ :=[0,0,0,0,0,0,0,0] || r_  :=[0,0,0,0,0,0,0,0] || 
    io_ports  :: (BYTE --> {[0,0,0,0,0,0,0,0]}) ||
    iff1 :=0  ||  iff2 :=0 ||
    im := (0|->0)

OPERATIONS
    
    /************************************************************************************** 
    ****** Input an Output Group
    ***************************************************************************************/
    ext_update_io_ports(address,value)=
    PRE address : UCHAR &  value : SCHAR THEN
        io_ports ( uchar_byte ( address ) ) := schar_byte ( value )
    END;
    
    
    IN_A_9n0 ( nn ) =
    PRE nn : UCHAR    THEN
        rgs8 ( a0 ) := io_ports ( uchar_byte ( nn ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    IN_r_9C0 ( rr ) =
    PRE rr : id_reg_8 & rr /= f0   THEN
        ANY
            negative , zero , half_carry , pv , add_sub , carry
        WHERE 
            negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
            negative = is_negative ( io_ports ( rgs8 ( c0 ) ) ) &
            zero = is_zero ( io_ports ( rgs8 ( c0 ) ) ) &
            half_carry = 0 &
            pv = parity_even ( io_ports ( rgs8 ( c0 ) ) )   &
            add_sub =  0 &
            carry = z_c
        THEN
            rgs8 := rgs8 <+ { ( rr |-> io_ports ( rgs8 ( c0 ) ) ) ,
                update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    INI =
    PRE bv16_ushort(bv_HL) : DATA_R_ADR    THEN
        ANY hvn , lvn ,
            negative , zero , half_carry , pv , add_sub , carry
        WHERE 
            negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
            hvn : BYTE & lvn : BYTE &            
            (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
            negative = is_negative ( io_ports ( rgs8 ( c0 ) ) ) &
            zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
            half_carry = z_h &
            pv = parity_even ( io_ports ( rgs8 ( c0 ) ) )   &
            add_sub =  1 &
            carry = z_c
        THEN
            updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
                update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
            
        END
    END;
    
    
    INIR =
    PRE bv16_ushort(bv_HL) : DATA_R_ADR    THEN
        ANY hvn , lvn ,
            negative , zero , half_carry , pv , add_sub , carry
        WHERE 
            negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
            hvn : BYTE & lvn : BYTE &
            (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
            negative = is_negative ( io_ports ( rgs8 ( c0 ) ) ) &
            zero = 1  &
            half_carry = z_h &
            pv = parity_even ( io_ports ( rgs8 ( c0 ) ) )   &
            add_sub =  1 &
            carry = z_c
        THEN
            updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
                update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
            r_ := update_refresh_reg(r_) ||
            IF  is_zero ( dec ( rgs8 ( b0 ) ) ) = 1 THEN pc := instruction_next ( pc )  END
        END
    END;
    
    
    IND =  
    PRE bv16_ushort(bv_HL) : DATA_R_ADR    THEN
        ANY hvn , lvn ,
            negative , zero , half_carry , pv , add_sub , carry
        WHERE
            negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
            hvn : BYTE & lvn : BYTE &
            (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &      
            negative = is_negative ( io_ports ( rgs8 ( c0 ) ) ) &
            zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
            half_carry = z_h &
            pv = parity_even ( io_ports ( rgs8 ( c0 ) ) )   &
            add_sub =  1 &
            carry = z_c
        THEN
            updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
                update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    INDR =
    PRE bv16_ushort(bv_HL) : DATA_R_ADR    THEN
        ANY  hvn , lvn ,
            negative , zero , half_carry , pv , add_sub , carry
        WHERE 
            negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
            hvn : BYTE & lvn : BYTE &
            (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &    
            negative = is_negative ( io_ports ( rgs8 ( c0 ) ) ) &
            zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
            half_carry = z_h &
            pv = parity_even ( io_ports ( rgs8 ( c0 ) ) )   &
            add_sub =  1 &
            carry = z_c
        THEN
            updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
                update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
            IF  is_zero ( dec ( rgs8 ( b0 ) ) ) = 1 THEN pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_) END
        END
    END;
    
    
    
    OUT_9n0_A ( nn ) =
    PRE nn : UCHAR    THEN
        io_ports ( uchar_byte ( nn ) ) := rgs8 ( a0 ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    OUT_9C0_r ( rr ) =
    PRE rr : id_reg_8 & rr /= f0  THEN
        io_ports ( rgs8 ( rr ) ) := rgs8 ( c0 ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    OUTI =
    ANY hvn , lvn ,
        negative , zero , half_carry , pv , add_sub , carry
    WHERE
        negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
        hvn : BYTE & lvn : BYTE &
        (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
        negative = is_negative ( bv_9HL0 ) &
        zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
        half_carry = z_h &
        pv = parity_even ( bv_9HL0 ) &
        add_sub =  1 &
        carry = z_c
    THEN
        io_ports ( rgs8 ( c0 ) ) := bv_9HL0 ||
        updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
        rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
            update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    OUTIR =
    ANY  hvn , lvn ,
        negative , zero , half_carry , pv , add_sub , carry
    WHERE
        negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
        hvn : BYTE & lvn : BYTE &
        (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
        negative = is_negative ( bv_9HL0 ) &
        zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
        half_carry = z_h &
        pv = parity_even ( bv_9HL0 ) &
        add_sub =  1 &
        carry = z_c
        
    THEN
        io_ports ( rgs8 ( c0 ) ) := bv_9HL0 ||
        updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
        rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
            update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
        r_ := update_refresh_reg(r_) ||
        IF  is_zero ( dec ( rgs8 ( b0 ) ) ) = 1 THEN pc := instruction_next ( pc )  END
        
    END;
    
    
    OUTD =
    ANY  hvn , lvn ,
        negative , zero , half_carry , pv , add_sub , carry
    WHERE
        negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
        hvn : BYTE & lvn : BYTE &
        (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
        negative = is_negative ( bv_9HL0 ) &
        zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
        half_carry = z_h &
        pv = parity_even ( bv_9HL0 ) &
        add_sub =  1 &
        carry = z_c
        
    THEN
        io_ports ( rgs8 ( c0 ) ) := bv_9HL0 ||
        updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
        rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
            update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    OUTDR =
    ANY  hvn , lvn ,
        negative , zero , half_carry , pv , add_sub , carry
    WHERE
        negative : BIT &  zero : BIT &  half_carry : BIT & pv : BIT & add_sub : BIT & carry : BIT & 
        hvn : BYTE & lvn : BYTE &
        (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
        negative = is_negative ( bv_9HL0 ) &
        zero = is_zero ( dec ( rgs8 ( b0 ) ) ) &
        half_carry = z_h &
        pv = parity_even ( bv_9HL0 ) &
        add_sub =  1 &
        carry = z_c
        
    THEN
        io_ports ( rgs8 ( c0 ) ) := bv_9HL0 ||
        updateAddressMem ( bv_HL , io_ports ( rgs8 ( c0 ) ) ) ||
        rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) , ( b0 |-> dec ( rgs8 ( b0 ) ) ) ,
            update_flag_reg( negative , zero , half_carry , pv , add_sub , carry ) } ||
        r_ := update_refresh_reg(r_) ||
        IF  is_zero ( dec ( rgs8 ( b0 ) ) ) = 1 THEN pc := instruction_next ( pc )  END
        
    END
    
  










;
    
    /************************************************************************************** 
    ***  			Rotate and Shift Group pg. 190
    **************************************************************************************/
    
    RLCA =
    BEGIN
        rgs8 := rgs8 <+ { a0 |->rotateleft(rgs8(a0)) , 
            update_flag_reg(z_s,z_z,0,z_p,0,bv8get(rgs8(a0),7) )   }||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    RLA =
    BEGIN
        rgs8 := rgs8 <+ { a0 |-> (rotateleft(rgs8(a0)) <+ {(1|-> z_c)} ), 
            update_flag_reg(z_s,z_z,0,z_p,0,bv8get(rgs8(a0),7) )   }||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    RRCA =
    BEGIN
        rgs8 := rgs8 <+ { a0 |-> rotateright(rgs8(a0)) , 
            update_flag_reg(z_s,z_z,0,z_p,0,bv8get(rgs8(a0),0) )   }||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    RRA =
    BEGIN
        rgs8 := rgs8 <+ { a0 |-> (rotateright(rgs8(a0)) <+ {(8|-> z_c)} ), 
            update_flag_reg(z_s,z_z,0,z_p,0,bv8get(rgs8(a0),0) )   }||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        
    END;
    
    RLC_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = rotateleft(rgs8(rr)) THEN
            
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),7) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RLC_9HL0 =
    PRE bv16_ushort( bv_HL )  : DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = rotateleft( bv_9HL0 ) THEN
            rgs8 := rgs8 <+ { update_flag_reg(  is_negative(res), is_zero(res),0,
                    parity_even(res) ,0,bv8get(bv_9HL0,7) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    RLC_9IX_d0(desloc) =
    PRE desloc : SCHAR & bv16_ushort ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) :  DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = rotateleft( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) THEN         
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),7) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RLC_9IY_d0(desloc) =
    PRE desloc : SCHAR & bv16_ushort (ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 )) :  DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = rotateleft( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) THEN         
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),7) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
   
    
    
    
    RL_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = (rotateleft(rgs8(rr))<+ {(1|-> z_c)} ) THEN
            
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),7) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RL_9HL =
    PRE bv16_ushort (bv_HL) :  DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = (rotateleft( bv_9HL0 )<+ {( 0 |-> z_c)} ) THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,7) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END	;
    
    
    RL_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) :  DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = (rotateleft( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) <+ {(1|-> z_c)} ) 			THEN
            
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0, bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),7) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RL_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) :  DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = (rotateleft( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) )<+ {(1|-> z_c)} ) 		
        THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),7) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RRC_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = rotateright(rgs8(rr)) THEN
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),0) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RRC_9HL0 =
    PRE bv16_ushort(bv_HL) :  DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = rotateright( bv_9HL0 ) THEN
            
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,0) )   }||
            
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
  /*    Prob Simplification*/
    RRC_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) :  DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = rotateright( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RRC_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) :  DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = rotateright( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RR_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = (rotateright(rgs8(rr))<+ {(1|-> z_c)} ) THEN
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),0) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RR_9HL =
    PRE bv16_ushort(bv_HL) : STACK_R_ADR THEN
        ANY res WHERE res : BYTE & res = (rotateright( bv_9HL0 )<+ {(1|-> z_c)} ) THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,0) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
   /* ProB Simplification */
    RR_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = (rotateright( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) <+ {(1|-> z_c)} ) 			THEN
            
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RR_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = (rotateright( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) )<+ {(1|-> z_c)} ) 		
        THEN            
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SLA_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = (rotateright(rgs8(rr))<+ {(1|-> z_c)} ) THEN
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),7) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SLA_9HL0 =
    PRE  bv16_ushort(bv_HL) : DATA_R_ADR THEN
        ANY res WHERE res : BYTE & res = (rotateright( bv_9HL0 )<+ {(1|-> z_c)} ) THEN      
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,7) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    
    SRA_9HL0 =
    PRE  bv16_ushort(bv_HL) : DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = (rotateright( bv_9HL0 )) <+ {8|-> bv_9HL0(7)}  THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,0) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
   /* ProB Simplification */
    SRA_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & 
            res = (rotateright( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ))<+ 
            {7 |-> bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),7) }
        THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SRA_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & 
            res = rotateright( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) <+
            {7 |-> bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),7) }
        THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(res), is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SRL_r(rr) =
    PRE rr : id_reg_8 & rr /= f0 THEN
        ANY res WHERE res : BYTE & res = bitclear(rotateright(rgs8(rr)),7)  THEN
            rgs8 := rgs8 <+ { rr |-> res, 
                update_flag_reg(
                    0, is_zero(res),0, parity_even(res) ,0,bv8get(rgs8(rr),0) )   }||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SRL_9HL0 =
    PRE  bv16_ushort(bv_HL) : DATA_R_ADR  THEN
        ANY res WHERE res : BYTE & res = bitclear(rotateright( bv_9HL0 ),7)  THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    0, is_zero(res),0, parity_even(res) ,0,bv8get(bv_9HL0,0) )   }||
            updateAddressMem(bv_HL, res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    /* ProB Simplification */
    SRL_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN 
        ANY res WHERE res : BYTE & 
            res = bitclear(rotateright( mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ),7)
        THEN
            rgs8 := rgs8 <+ { update_flag_reg(
                    0, is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), res ) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    SRL_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN 
        ANY res WHERE res : BYTE & 
            res = bitclear(rotateright( mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ),7)
        THEN          
            rgs8 := rgs8 <+ { update_flag_reg(
                    0, is_zero(res),0, parity_even(res),
                    0,bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),0) )   }||            
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), res )  ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END	
    END;
    
    
    RLD=
    PRE bv16_ushort(bv_HL) : DATA_R_ADR THEN
        ANY res, acc WHERE res : BYTE & acc : BYTE &
            res =  { 8|->bv8get(bv_9HL0,3), 7|->bv8get(bv_9HL0,2), 6|->bv8get(bv_9HL0,1), 
                5|->bv8get(bv_9HL0,0),
                4|->bv8get(rgs8(a0),3),   3|->bv8get(rgs8(a0),2), 2|->bv8get(rgs8(a0),1),
                1|->bv8get(rgs8(a0),0)	} &
            acc = rgs8(a0) <+ { 4|->bv8get(bv_9HL0,7),   3|->bv8get(bv_9HL0,6), 
                2|->bv8get(bv_9HL0,5),	1|->bv8get(bv_9HL0,4)  }
            
        THEN
            
            rgs8 := rgs8 <+ { update_flag_reg(
                    is_negative(acc), is_zero(acc),0, parity_even(acc),
                    0,z_c )   }||            
            updateAddressMem(bv_HL, res ) 
            || pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    RRD=
    PRE bv16_ushort(bv_HL) : DATA_R_ADR THEN
        ANY res, acc WHERE res : BYTE & acc : BYTE &
            res =  { 8|->bv8get(rgs8(a0),3),   7|->bv8get(rgs8(a0),2), 6|->bv8get(rgs8(a0),1),
                5|->bv8get(rgs8(a0),0),
                4|->bv8get(bv_9HL0,7), 3|->bv8get(bv_9HL0,6), 2|->bv8get(bv_9HL0,5), 
                1|->bv8get(bv_9HL0,4)} &
            acc = rgs8(a0) <+ { 4|->bv8get(bv_9HL0,3),   3|->bv8get(bv_9HL0,2), 
                2|->bv8get(bv_9HL0,1),	1|->bv8get(bv_9HL0,0)  }
            
        THEN
            rgs8 := rgs8 <+ { update_flag_reg( is_negative(acc), is_zero(acc),0, parity_even(acc), 0 ,z_c )   }||            
            updateAddressMem(bv_HL,res) 
            || pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    /************************************************************************************** 
    ***  			BIT Manipulation  Group
    **************************************************************************************/
    
    BIT_b_rr (bb,rr) =
    PRE bb : 0..7& rr : id_reg_8 & rr /= f0 THEN
        rgs8 := rgs8 <+ {update_flag_reg( z_s, bit_not( bv8get( rgs8(rr),bb) ), 1,z_p,0,z_c)}||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    BIT_b_9HL0 (bb) =  
    PRE bb : 0..7 THEN
        rgs8 := rgs8 <+ {update_flag_reg( z_s, bit_not( bv8get(bv_9HL0,bb) ), 1,z_p,0,z_c)}||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    /* ProB Simplification */
    BIT_b_9IX_d0 (desloc, bb) =  
    PRE bb : 0..7 & desloc : SCHAR THEN
        rgs8 := rgs8 <+ {update_flag_reg( z_s, bit_not( bv8get(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),bb) ), 1,z_p,0,z_c)}||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    BIT_b_9IY_d0 (desloc, bb) =  
    PRE bb : 0..7 & desloc : SCHAR THEN
        rgs8 := rgs8 <+ {update_flag_reg( z_s, bit_not( bv8get(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),bb) ), 1,z_p,0,z_c)}||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    SET_b_r(bb,rr)=
    PRE bb  : 0..7 & rr : id_reg_8 THEN
        rgs8(rr):= bitset(rgs8(rr),bb) 	||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    
    SET_b_9HL0(bb)=
    PRE bb  : 0..7 & bv16_ushort(bv_HL) : DATA_R_ADR THEN
        updateAddressMem(bv_HL, bitset(bv_9HL0,bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    /* Prob Simplification */
    SET_b_9IX_d0(bb,desloc)=
    PRE bb  : 0..7 & desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), bitset(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    SET_b_9IY_d0(bb,desloc)=
    PRE bb  : 0..7 & desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), bitset(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    
    RES_b_r(bb,rr)=
    PRE bb  : 0..7 & rr : id_reg_8 & rr /= f0 THEN
        rgs8(rr):= bitclear(rgs8(rr),bb) 	 ||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)       
    END;
    
    
    RES_b_9HL0(bb)=
    PRE bb  : 0..7 & bv16_ushort(bv_HL) : DATA_R_ADR THEN
        updateAddressMem(bv_HL, bitclear(bv_9HL0,bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    /* ProB simplification */
    RES_b_9IX_d0(bb,desloc)=
    PRE bb  : 0..7 & desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), bitclear(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ),bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    RES_b_9IY_d0(bb,desloc)=
    PRE bb  : 0..7 & desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), bitclear(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ),bb))||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)    
    END;
    
    /************************************************************************************** 
    ***  			JUMP GROUP
    **************************************************************************************/
    
    JP_nn(nn)=
    PRE nn : USHORT THEN
        pc:= nn || r_ := update_refresh_reg(r_)    
    END;
    
    JP_cc_nn(cc,nn)=
    PRE cc : 0..7 & nn : USHORT THEN
        
        ANY res WHERE res : BIT &             
            { 0 |-> bit_not(z_z) , 1 |-> z_z,
                2 |-> bit_not(z_c) , 3 |-> z_c  ,
                4 |-> bit_not(z_p) , 5 |-> z_p ,
                6 |-> bit_not(z_s)  , 7 |-> z_s  }(cc) = res 
        THEN
            IF	res = 1 THEN    pc:= nn
            ELSE pc := instruction_next(pc) END  
            || r_ := update_refresh_reg(r_)    
        END
    END;
    
    JR_e(ee_p)=
    PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
        /*    PRE (ee - pc -2) : SCHAR..*/
        pc := ee_p || r_ := update_refresh_reg(r_)    
    END;
    
    JR_C_e(ee_p)=
    PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
        IF z_c = 0 THEN	pc := instruction_next(pc) 
        ELSE pc := ee_p END
        || r_ := update_refresh_reg(r_)    
    END;
    
    
    JR_NC_e(ee_p)=
    PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
        IF z_c = 1 THEN	pc := instruction_next(pc) 
        ELSE pc := ee_p END
        || r_ := update_refresh_reg(r_)    
    END;
    
    JR_Z_e(ee_p)=
	PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
        IF z_z = 0 THEN		 pc := instruction_next(pc) 
        ELSE pc := ee_p END
        || r_ := update_refresh_reg(r_)    
    END;
    
    JR_NZ_e(ee_p)=
	PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
        IF z_z = 1 THEN		 pc := instruction_next(pc) 
        ELSE pc := ee_p END
        || r_ := update_refresh_reg(r_)    
    END;
    
    JP_HL=
    BEGIN
        pc := bv16_ushort(bv_HL) || r_ := update_refresh_reg(r_)    
    END;
    
    JP_IX=
    BEGIN
        pc := bv16_ushort( ix)  || r_ := update_refresh_reg(r_)    
    END;
    
    JP_IY=
    BEGIN
        pc :=  bv16_ushort( iy) || r_ := update_refresh_reg(r_)    
    END;
    
    DJNZ_e(ee_p)=
    PRE  ee_p : USHORT & ee_p - pc  <= 129  & ee_p - pc  >= (-126) THEN
   /* PRE ee : SCHAR & ee-2 : SCHAR THEN*/
        
        rgs8(b0):=	dec(rgs8(b0))||
        
        IF is_zero(dec(rgs8(b0))) = 1 THEN	pc := instruction_next(pc)
        ELSE pc := ee_p  END || r_ := update_refresh_reg(r_)    
        
    END;
    
    /************************************************************************************** 
    ***  			CALL and RETURN GROUP
    **************************************************************************************/
    
    CALL_nn (nn) =
    PRE nn : USHORT & bv16_ushort(sp_minus_two) : STACK_R_ADR  &  bv16_ushort(sp) : STACK_R_ADR THEN
        ANY high,low WHERE high : BYTE & low : BYTE & ( high , low ) = bv16_byte(ushort_bv16(pc)) &
			sp_minus_one /= sp_minus_two
        THEN
            updateStack( { ( sp_minus_one) |-> high, (sp_minus_two) |-> low } ) ||
            sp := sp_minus_two ||
            pc := nn   
        END
    END;
    
   /* ProB Simplification */
    CALL_cc_nn (cc,nn) =
    PRE cc : 0..8 & nn : USHORT & bv16_ushort(sp_minus_two) : STACK_R_ADR  &  bv16_ushort(sp) : STACK_R_ADR THEN
        ANY high,low WHERE high : BYTE & low : BYTE &  ( high , low ) = bv16_byte(ushort_bv16(pc)) 
        THEN
            IF cc_get(rgs8,cc) = 1 THEN
                updateStack( { ( sp_minus_one) |-> high, (sp_minus_two) |-> low } ) ||
                sp := sp_minus_two ||
                pc := nn 
            ELSE 
                pc := instruction_next(pc)
            END
            || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    RET = 
    BEGIN
        pc := bv16_ushort(  byte_bv16( mem(sp_plus_one) , bv_9SP0 )) || sp := sp_plus_two || r_ := update_refresh_reg(r_) 
    END;
    
    
    RET_cc(cc) =
    PRE cc : 0..7 THEN
        IF  cc_get(rgs8,cc) = 1 THEN       pc := bv16_ushort(  byte_bv16( mem(sp_plus_one) , bv_9SP0 )) || sp := sp_plus_two 
        ELSE pc := instruction_next(pc) END
        || r_ := update_refresh_reg(r_) 
    END;
    
    
    RETI = 
    BEGIN
        pc := bv16_ushort(  byte_bv16( mem(sp_plus_one) , bv_9SP0 )) || sp := sp_plus_two || r_ := update_refresh_reg(r_) 
    END;
    
    
    RETN = 
    BEGIN
        pc := bv16_ushort(  byte_bv16( mem(sp_plus_one) , bv_9SP0 )) ||
        sp := sp_plus_two || r_ := update_refresh_reg(r_) || iff1:= iff2
    END;
    
    
    RST_p(pp) = 
    PRE pp : 0..7 &  bv16_ushort(sp_minus_two) : STACK_R_ADR  &  bv16_ushort(sp) : STACK_R_ADR  THEN
        ANY pc_l, pc_h WHERE pc_l : BYTE & pc_h : BYTE & bv16_byte(ushort_bv16(pc))= (pc_l,pc_h) 
        THEN 
            updateStack( { sp_minus_one |-> pc_h, sp_minus_two |-> pc_l } ) ||
            sp := sp_minus_two || pc := pp*8    || r_ := update_refresh_reg(r_) 
        END
    END
    
    
    
    
  










;    
    /************************************************************************************** 
    ***  			Arithmetic and Logic Group 
    **************************************************************************************/
    
    AND_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT 
            & pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_and(  rgs8(a0),rgs8(rr) ) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0       
        THEN     											
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    AND_A_n(n1)=   
    PRE n1 : SCHAR 
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_and( rgs8(a0), schar_byte( n1 )) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN     									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    AND_A_9HL0=   
    ANY 
        result  , negative , zero , half_carry , pv , add_sub , carry 
    WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
        pv : BIT & add_sub : BIT & carry : BIT &  
        result = bv8_and(  rgs8(a0),  bv_9HL0 ) &
        negative = is_negative(result) &
        zero = is_zero(result)  & 
        half_carry = 0 &         
        pv =   parity_even(result)      &
        add_sub =  0 &
        carry = 0    
    THEN       									
        rgs8:= rgs8 <+ { a0|-> result, 
            update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END  ;
    
    /* ProB simplification */
    AND_A_9IX_d0(desloc)=
    PRE desloc : SCHAR THEN   
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &
            result = bv8_and(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    AND_A_9IY_d0(desloc)=   
    PRE desloc : SCHAR THEN   
        
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &
            result = bv8_and(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    
    OR_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT 
            & pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_or(rgs8(a0),rgs8(rr) ) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0       
            
        THEN     											
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    OR_A_n(n1)=   
    PRE n1 : SCHAR 
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT 
            & pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_or( rgs8(a0), schar_byte( n1 )) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN     									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    OR_A_9HL0=   
    ANY 
        result  , negative , zero , half_carry , pv , add_sub , carry 
    WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
        pv : BIT & add_sub : BIT & carry : BIT &
        result = bv8_or(  rgs8(a0),  bv_9HL0 ) &
        negative = is_negative(result) &
        zero = is_zero(result)  & 
        half_carry = 0 &         
        pv =   parity_even(result)      &
        add_sub =  0 &
        carry = 0    
    THEN       									
        rgs8:= rgs8 <+ { a0|-> result, 
            update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END;
    
    /* Prob Simplification */
    OR_A_9IX_d0(desloc)=
    PRE desloc : SCHAR THEN   
        
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
        pv : BIT & add_sub : BIT & carry : BIT &
            result = bv8_or(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    OR_A_9IY_d0(desloc)=   
    PRE desloc : SCHAR THEN   
        
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &
            result = bv8_or(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    XOR_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_xor(rgs8(a0),rgs8(rr) ) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0       
            
        THEN     											
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    XOR_A_n(n1)=   
    PRE n1 : SCHAR 
    THEN  
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT 
            & pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_xor( rgs8(a0), schar_byte( n1 )) &
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN     									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    XOR_A_9HL0=   
    ANY 
        result  , negative , zero , half_carry , pv , add_sub , carry 
    WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
        pv : BIT & add_sub : BIT & carry : BIT &  
        result = bv8_xor(  rgs8(a0),  bv_9HL0 ) &
        negative = is_negative(result) &
        zero = is_zero(result)  & 
        half_carry = 0 &         
        pv =   parity_even(result)      &
        add_sub =  0 &
        carry = 0    
    THEN       									
        rgs8:= rgs8 <+ { a0|-> result, 
            update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END;
    
    /* ProB simplification */
    XOR_A_9IX_d0(desloc)=
    PRE desloc : SCHAR THEN   
        
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_xor(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    XOR_A_9IY_d0(desloc)=   
    PRE desloc : SCHAR THEN   
        
        ANY 
            result  , negative , zero , half_carry , pv , add_sub , carry 
        WHERE  result : BYTE & negative : BIT & zero : BIT & half_carry : BIT &
            pv : BIT & add_sub : BIT & carry : BIT &  
            result = bv8_xor(  rgs8(a0), mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) ) &  
            negative = is_negative(result) &
            zero = is_zero(result)  & 
            half_carry = 0 &         
            pv =   parity_even(result)      &
            add_sub =  0 &
            carry = 0    
        THEN       									
            rgs8:= rgs8 <+ { a0|-> result, 
                update_flag_reg( negative,zero, half_carry,pv,add_sub, carry)   } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END 
    END;
    
    
    CP_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &(sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(rgs8(rr)))
        THEN  
            rgs8:= rgs8 <+ { update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    CP_A_n(n1)=   
    PRE n1 : SCHAR  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &(sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)), schar_uchar( n1) )
        THEN  
            rgs8:= rgs8 <+ {  update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    CP_A_9HL0=   
    ANY 
        sum, negative, carry, half_carry, zero
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &(sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(bv_9HL0))
    THEN  
        rgs8:= rgs8 <+ {  update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END;
    /* Prob simplification */
    CP_A_9IX_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ {  update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    CP_A_9IY_d0(desloc)=  
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ {  update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    INC_r(rr) =
    PRE 
        rr : id_reg_8 & rr /= f0
    THEN
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar( rgs8(rr)), 1)
        THEN 
            rgs8 := rgs8 <+ {(rr |-> uchar_byte(sum) ),
                update_flag_reg( negative,zero, half_carry,carry,0, carry) } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    INC_9HL0 =
    PRE bv16_ushort(bv_HL) : DATA_R_ADR    THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &          
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(bv_9HL0),1)
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,0, carry) } ||
            updateAddressMem( bv_HL , uchar_byte(sum) )||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    /* Prob simplification */
    INC_9IX_d0(desloc) =
    PRE desloc : SCHAR  & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )),1)
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,0, carry) } ||
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), uchar_byte(sum)) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    INC_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN 
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &         
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )),1)
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,0, carry) } ||
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), uchar_byte(sum)) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    DEC_r(rr) =
    PRE 
        rr : id_reg_8 & rr /= f0
    THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &         
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar( rgs8(rr)), 1)
        THEN 
            rgs8 := rgs8 <+ {(rr |-> uchar_byte(sum) ),
                update_flag_reg( negative,zero, half_carry,carry,1, z_c) } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    DEC_9HL0 =
    PRE bv16_ushort(bv_HL) : DATA_R_ADR  THEN 
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &      
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(bv_9HL0),1)
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,1, z_c) } ||
            updateAddressMem( bv_HL , uchar_byte(sum) )||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    
    DEC_9IX_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( ix ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN 
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )),1)
            
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,1, z_c) } ||
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ), uchar_byte(sum)) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    DEC_9IY_d0(desloc) =
    PRE desloc : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR  THEN 
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )),1)
        THEN 
            rgs8 := rgs8 <+ {update_flag_reg( negative,zero, half_carry,carry,1, z_c) } ||
            updateAddressMem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ), uchar_byte(sum)) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
  /* Prob Simplification */
  ADD_HL_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN      
        ANY result, bv_value, bvh, bvl,
            negative, carry, half_carry, zero
        WHERE 
            result : USHORT & bv_value : BV16  &  bvh : BYTE &   bvl : BYTE &
            negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            get_bv_reg16(sp,rgs8,ss) = bv_value &
            result = add16USHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value ) ) &
            (bvh,bvl) = bv16_byte(ushort_bv16(result))&
            negative = z_s &
            zero = z_z &
            half_carry = add_halfcarryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  ) &
            carry =  add_carryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  )
        THEN
            rgs8 := rgs8 <+ { h0|-> bvh,  l0|-> bvl ,
                update_flag_reg( negative,zero, half_carry,z_p ,0, carry) } ||
            
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    ADC_HL_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        ANY result, bv_value, bvh, bvl,
            negative, carry, half_carry, zero
            
        WHERE 
            result : USHORT & bv_value : BV16  &  bvh : BYTE &   bvl : BYTE &
            negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            get_bv_reg16(sp,rgs8,ss) = bv_value &
            
            result = add16USHORT(z_c , bv16_ushort( bv_HL) , bv16_ushort( bv_value )) &
            negative = 1 &
            zero = is_zero16USHORT(result) &
            half_carry = add_halfcarryUSHORT(z_c , bv16_ushort( bv_HL) , bv16_ushort( bv_value )  ) &
            carry =  add_carryUSHORT(z_c , bv16_ushort( bv_HL) , bv16_ushort( bv_value ) )
            
        THEN
            rgs8 := rgs8 <+ { h0|-> bvh,  l0|-> bvl ,
                update_flag_reg( negative,zero, half_carry, carry ,0, carry) } ||
            
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    
    
    
    SBC_HL_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        
        ANY result, bv_value, bvh, bvl,
            negative, carry, half_carry, zero
            
        WHERE 
            result : USHORT & bv_value : BV16  &  bvh : BYTE &   bvl : BYTE &
            negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &            
            get_bv_reg16(sp,rgs8,ss) = bv_value &
            result = sub16USHORT(z_c, bv16_ushort( bv_HL) , bv16_ushort( bv_value )) &
            negative = 1 &
            zero = is_zero16USHORT(result) &
            half_carry = sub_halfcarryUSHORT(z_c, bv16_ushort( bv_HL) , bv16_ushort( bv_value ) ) &
            carry =  sub_carryUSHORT(z_c, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  )
            
        THEN
            rgs8 := rgs8 <+ { h0|-> bvh,  l0|-> bvl ,
                update_flag_reg( negative,zero, half_carry, carry ,0, carry) } ||
            
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    ADD_IX_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        
        ANY result, bv_value, bvh, bvl,
            negative, carry, half_carry, zero
            
        WHERE 
            
            result : USHORT & bv_value : BV16  &  bvh : BYTE &   bvl : BYTE &
            negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            get_bv_reg16(sp,rgs8,ss) = bv_value &
            
            result = add16USHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value ) ) &
            (bvh,bvl) = bv16_byte(ushort_bv16(result))&
            negative = z_s &
            zero = z_z &
            half_carry = add_halfcarryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  ) &
            carry =  add_carryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  )
            
        THEN
            rgs8 := rgs8 <+ { update_flag_reg( negative,zero, half_carry,z_p ,0, carry) } ||
            ix :=  ushort_bv16(result) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    ADD_IY_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        
        ANY result, bv_value, bvh, bvl,
            negative, carry, half_carry, zero
        WHERE 
            result : USHORT & bv_value : BV16  &  bvh : BYTE &   bvl : BYTE &
            negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            get_bv_reg16(sp,rgs8,ss) = bv_value &
            
            result = add16USHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value ) ) &
            (bvh,bvl) = bv16_byte(ushort_bv16(result))&
            negative = z_s &
            zero = z_z &
            half_carry = add_halfcarryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  ) &
            carry =  add_carryUSHORT(0, bv16_ushort( bv_HL) , bv16_ushort( bv_value )  )
            
        THEN
            rgs8 := rgs8 <+ { update_flag_reg( negative,zero, half_carry,z_p ,0, carry) } ||
            iy :=  ushort_bv16(result) ||
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    INC_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        
        IF ss = SP THEN sp:= inc_BV16(sp)
        ELSE 
            ANY
                rh,rl, vh,vl
            WHERE rh : id_reg_8 & rl : id_reg_8 & vh : BYTE &  vl : BYTE &
                REG16_TO_REG8(ss)= (rh, rl) & not( rh = rl) &
                bv16_byte( inc_BV16( byte_bv16( rgs8(rh),rgs8(rl) ))) = (vh,vl)
            THEN
                rgs8 := rgs8<+ { rh|-> vh , rl|-> vl }
            END
        END
        ||		pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        
    END;
    
    
    INC_IX=
    BEGIN
        ix := inc_BV16(ix)||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    INC_IY=
    BEGIN
        iy := inc_BV16(iy)||
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    DEC_ss(ss)=
    PRE ss : id_reg_16 & not(ss = AF) THEN
        
        IF ss = SP THEN sp:= inc_BV16(sp)
        ELSE 
            ANY
                rh,rl, vh,vl
            WHERE rh : id_reg_8 & rl : id_reg_8 & vh : BYTE &  vl : BYTE &
                REG16_TO_REG8(ss)= (rh, rl) & not( rh = rl) &
                bv16_byte( dec_BV16( byte_bv16( rgs8(rh),rgs8(rl) ))) = (vh,vl)
            THEN
                rgs8 := rgs8<+ { rh|-> vh , rl|-> vl }	||		pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
            END
        END
        
    END;
    
    
    DEC_IX=
    BEGIN
        ix := dec_BV16(ix)	||		pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    
    DEC_IY=
    BEGIN
        ix := dec_BV16(ix)	||		pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END 
    
  










;    
    
    /************************************************************************************** 
    ***  			Arithmetic Group 
    **************************************************************************************/
    
    ADD_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0, byte_uchar( rgs8(a0)),byte_uchar( rgs8(rr)) ) &
             dom( add8UCHAR ) = BIT * UCHAR * UCHAR 
        THEN 
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum) , (update_flag_reg( negative,zero, half_carry,carry,0, carry))   }    	   	   ||  pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    ADD_A_n(n1)=   
    PRE n1 : SCHAR  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(rgs8(a0)), schar_uchar( n1))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    ADD_A_9HL0=   
    ANY 
        sum, negative, carry, half_carry, zero
        
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
        
        (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(bv_9HL0))
    THEN 															
        rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
    /* Prob Simplfication */
    ADD_A_9IX_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0,byte_uchar(rgs8(a0)), byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    
    ADD_A_9IY_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(0, byte_uchar(rgs8(a0)), byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    
    ADC_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(rgs8(rr)) )
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    ADC_A_n(n1)=   
    PRE n1 : SCHAR  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = add8UCHAR(z_c,byte_uchar(rgs8(a0)),schar_uchar( n1) )
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    ADC_A_9HL0=   
    ANY 
        sum, negative, carry, half_carry, zero
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
        (sum, negative, carry, half_carry, zero) = add8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(bv_9HL0) )
    THEN  
        rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry) }  || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
    END;
    
   /* Prob simplification */
    ADC_A_9IX_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = add8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END  
    END;
    
    
    
    ADC_A_9IY_d0(desloc)=    
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = add8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,0, carry)  }  || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)
        END 
    END;
    
    
    
    SUB_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(rgs8(rr)))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    SUB_A_n(n1)=   
    PRE n1 : SCHAR  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)), schar_uchar( n1))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    SUB_A_9HL0=   
    ANY 
        sum, negative, carry, half_carry, zero
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
        (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(bv_9HL0))
    THEN  
        rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END;
    
    /* Prob simplification */
    SUB_A_9IX_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    
    SUB_A_9IY_d0(desloc)=  
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(0,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    SBC_A_r(rr)=   
    PRE rr : id_reg_8  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(rgs8(rr))  )
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    SBC_A_n(n1)=   
    PRE n1 : SCHAR  
    THEN  
        ANY 
            sum, negative, carry, half_carry, zero
            
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(z_c,byte_uchar(rgs8(a0)), schar_uchar( n1 ) )
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    SBC_A_9HL0=   
    ANY 
        sum, negative, carry, half_carry, zero
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
        (sum, negative, carry, half_carry, zero) = substract8UCHAR(z_c, byte_uchar(rgs8(a0)),byte_uchar(bv_9HL0 ))
    THEN  
        rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
        pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
    END;
    
    /* Prob Simplification */
    SBC_A_9IX_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar((mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) )))
        THEN  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_) 
        END  
    END;
    
    
    
    SBC_A_9IY_d0(desloc)=   
    PRE desloc : SCHAR THEN
        ANY 
            sum, negative, carry, half_carry, zero
        WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT &
            (sum, negative, carry, half_carry, zero) = substract8UCHAR(z_c,byte_uchar(rgs8(a0)),byte_uchar(mem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) ))
        THEN  													  
            rgs8:= rgs8 <+ { a0|-> uchar_byte(sum), update_flag_reg( negative,zero, half_carry,carry,1, carry)  } || 
            pc := instruction_next(pc) || r_ := update_refresh_reg(r_)								
        END  
    END
    
;    
    /************************************************************************************** 
    ***  			Load 16 bits Group - Continuing
    **************************************************************************************/
    
    CPI =
    ANY
        sum , negative , carry , half_carry , zero ,
        hvn , lvn , bvn , cvn
    WHERE
        sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT     &
        hvn : BYTE & lvn : BYTE & bvn : BYTE & cvn : BYTE &
        substract8UCHAR ( 0 , byte_uchar ( rgs8 ( a0 ) ) , byte_uchar ( bv_9HL0 ) ) = (sum , negative , carry , half_carry , zero) &
        (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
        (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        
    THEN
        IF zero = 1 THEN
            rgs8 := rgs8 <+ { h0 |-> hvn , l0 |-> lvn , b0 |-> bvn , c0 |-> cvn
                , update_flag_reg( negative , zero , half_carry , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 1 , z_c ) }
            
        END
        ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    CPIR =
    ANY
        sum , negative , carry , half_carry , zero ,
        hvn , lvn , bvn , cvn
    WHERE
        sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT     &
        hvn : BYTE & lvn : BYTE & bvn : BYTE & cvn : BYTE &
        substract8UCHAR ( 0 , byte_uchar ( rgs8 ( a0 ) ) , byte_uchar ( bv_9HL0 ) ) = (sum , negative , carry , half_carry , zero) &
        (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
        (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        
    THEN
        IF zero = 1 THEN
            rgs8 := rgs8 <+ { h0 |-> hvn , l0 |-> lvn , b0 |-> bvn , c0 |-> cvn
                ,   update_flag_reg( negative , zero , half_carry
                    , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 1 , z_c ) }
            
        END
        || r_ := update_refresh_reg(r_) ||
        IF  is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) = 0 or ( zero = 1 ) THEN pc := instruction_next ( pc ) END
    END;
    
    
    CPD =
    ANY
        sum , negative , carry , half_carry , zero ,
        hvn , lvn , bvn , cvn
    WHERE
        sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT     &
        hvn : BYTE & lvn : BYTE & bvn : BYTE & cvn : BYTE &
        substract8UCHAR ( 0 , byte_uchar ( rgs8 ( a0 ) ) , byte_uchar ( bv_9HL0 ) ) = (sum , negative , carry , half_carry , zero) &
        (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
        (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        
    THEN
        IF zero = 1 THEN
            rgs8 := rgs8 <+ { h0 |-> hvn , l0 |-> lvn , b0 |-> bvn , c0 |-> cvn
                ,   update_flag_reg( negative , zero , half_carry
                    , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 1 , z_c ) }
            
        END
        ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    CPDR =
    ANY
        sum , negative , carry , half_carry , zero ,
        hvn , lvn , bvn , cvn
    WHERE
        sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT     &
        hvn : BYTE & lvn : BYTE & bvn : BYTE & cvn : BYTE &
        substract8UCHAR ( 0 , byte_uchar ( rgs8 ( a0 ) ) , byte_uchar ( bv_9HL0 ) ) = (sum , negative , carry , half_carry , zero) &
        (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
        (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        
    THEN
        IF zero = 1 THEN
            rgs8 := rgs8 <+ { h0 |-> hvn , l0 |-> lvn , b0 |-> bvn , c0 |-> cvn
                ,  update_flag_reg( negative , zero , half_carry
                    , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 1 , z_c ) }
        END
        || IF  is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) = 0 or ( zero = 1 ) THEN pc := instruction_next ( pc )  END||
        r_ := update_refresh_reg(r_)
    END;
    
    
    /************************************************************************************** 
    ****** Arithmetic and Logic Intructions are in the module Z80LoAri - 8 and 16 bits
    ***************************************************************************************/
    
    
    
    /************************************************************************************** 
    ****** General Purpose Arithmetic and CPU control 
    ***************************************************************************************/
    
   /* DAA =
    ANY
        result , s0, z0,h0,pv0, n0, c0
    WHERE
        result : BYTE & s0 : BIT & z0 : BIT & h0 : BIT & pv0 : BIT & n0 : BIT & c0 : BIT &
        daa_function(z_n, z_c , z_h , rgs8 ( a0 ) ) = ( result ,  c0, h0) & 
        s0 = bv8get(result,7) &
        z0 = is_zero(result) &
        pv0= parity_even(result) &
        n0 = z_n 
    THEN
        rgs8 :=  rgs8 <+ { a0 |-> result ,  update_flag_reg( s0, z0,h0,pv0, n0, c0  ) }  ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    */
    
    CPL =
    ANY  result
    WHERE result : BYTE  & result = complement ( rgs8 ( a0 ) )
    THEN
        rgs8 :=   rgs8 <+ {  ( a0 |-> result ) ,
            update_flag_reg( z_s , z_z , 1 , z_p , 1 , z_c ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        
    END ;
    
    NEG =
    ANY
        sum , negative , carry , half_carry , zero
    WHERE  sum : UCHAR & negative : BIT & carry : BIT & half_carry : BIT & zero : BIT & 
    	  (sum , negative , carry , half_carry , zero) = substract8UCHAR ( 0 , 0 , byte_uchar ( rgs8 ( a0 ) ) )
    THEN
        rgs8 := rgs8 <+ { a0 |-> uchar_byte ( sum ) ,  update_flag_reg( negative , zero , half_carry , carry , 1 , carry ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END ;
    
    CCF =
    BEGIN
        rgs8 := rgs8 <+ {  update_flag_reg( z_s , z_z , z_h , z_p , 0 , bit_not ( z_c ) ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END ;
    
    SCF =
    BEGIN
        rgs8 := rgs8 <+ {  update_flag_reg( z_s , z_z , z_h , z_p , 0 , 1 ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END ;
    
    NOP =
    BEGIN
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END ;
    
    HALT =   
    BEGIN
        r_ := update_refresh_reg(r_)
    END  ;
    
    DI=
    BEGIN
        iff1:= 0 || iff2 :=0    ||   pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    EI=
    BEGIN
        iff1:= 1 || iff2 :=1    ||   pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    IM0=
    BEGIN
        im := (0 |-> 0)   ||   pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    IM1=
    BEGIN
        im := (0 |-> 1)  ||   pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    IM2=
    BEGIN
        im := (1 |-> 1)   ||   pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END
    
    /************************************************************************************** 
    ******    Rotate and SHIFT GROUP in Z80Man_bitControl
    ***************************************************************************************/
    
  
    
    
    
    
    
  



;

    set_pc(value)=
    PRE value : USHORT THEN
        pc:=0
    END;
    
    result <-- get_pc =
    BEGIN
        result := pc
    END;


    /************************************************************************************** 
    ***  			Load 16 bits Group 
    **************************************************************************************/
    
    LD_r_r_ ( rr , rr_ ) =
    PRE rr : id_reg_8 & rr_ : id_reg_8  THEN
        rgs8 ( rr ) := rgs8 ( rr_ ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_r_n_ ( rr , n0 ) =
    PRE rr : id_reg_8 & n0 : SCHAR  THEN
        rgs8 ( rr ) := schar_byte ( n0 ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_r_9HL0 ( rr ) =
    PRE rr : id_reg_8 THEN
        ANY address WHERE address : BV16 &
            address =  byte_bv16 ( rgs8 ( h0 ) , rgs8 ( l0 ) )
        THEN
            rgs8 ( rr ) := mem ( address ) ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    /* Prob Simplification*/
    LD_r_9IX_d0 ( rr , desloc ) =
    PRE rr : id_reg_8 & desloc : SCHAR
    THEN
    rgs8 ( rr ) := mem(ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 )) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_r_9IY_d0 ( rr , desloc ) =
    PRE rr : id_reg_8 & desloc : SCHAR
    THEN
        rgs8 ( rr ) := mem(ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 )) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_9HL0_r ( rr ) =
    PRE rr : id_reg_8 & bv16_ushort( bv_HL) : DATA_R_ADR  THEN
        updateAddressMem ( bv_HL , rgs8 ( rr ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    LD_9IX_d0_r ( desloc , rr ) =
    PRE  desloc : SCHAR & rr : id_reg_8 & (( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ) : DATA_R_ADR THEN
        updateAddressMem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) , rgs8 ( rr ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9IY_d0_r ( desloc , rr ) =
    PRE  desloc : SCHAR & rr : id_reg_8 & (( (bv16_ushort ( iy ) + desloc ) mod 65536 ) ) : DATA_R_ADR THEN
        updateAddressMem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) , rgs8 ( rr ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9HL0_n ( n0 ) =
    PRE n0 : SCHAR & bv16_ushort( bv_HL ) : DATA_R_ADR     THEN
        updateAddressMem ( bv_HL , schar_byte ( n0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    /* Prob Simplification*/
    LD_9IX_d0_n ( desloc , n0 ) =
    PRE  desloc : SCHAR & n0 : SCHAR &  (( (bv16_ushort ( ix ) + desloc ) mod 65536 ) ): DATA_R_ADR THEN
        updateAddressMem ( ushort_bv16 ( (bv16_ushort ( ix ) + desloc ) mod 65536 ) , schar_byte ( n0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9IY_d0_n ( desloc , n0 ) =
    PRE  desloc : SCHAR & n0 : SCHAR & (( (bv16_ushort ( iy ) + desloc ) mod 65536 )) : DATA_R_ADR THEN
        updateAddressMem ( ushort_bv16 ( (bv16_ushort ( iy ) + desloc ) mod 65536 ) , schar_byte ( n0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_A_9BC0  =
    BEGIN
        rgs8 ( a0 ) :=  bv_9BC0  ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_A_9DE0  =
    BEGIN
        rgs8 ( a0 ) := bv_9DE0 ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_A_9nn0 ( nn ) =
    PRE nn :  USHORT
    THEN
        rgs8 ( a0 ) := mem ( ushort_bv16 ( nn ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9BC0_A  =
    PRE           bv16_ushort(bv_BC) : DATA_R_ADR
    THEN
        updateAddressMem ( bv_BC , rgs8 ( a0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    LD_9DE0_A  =
    PRE bv16_ushort(bv_DE) : DATA_R_ADR
    THEN
        updateAddressMem ( ( bv_DE ) , rgs8 ( a0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9nn0_A ( nn ) =
    PRE nn : USHORT   &  nn  : DATA_R_ADR
    THEN
        updateAddressMem ( ushort_bv16 ( nn ) , rgs8 ( a0 ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    /************************************************************************************** 
    ***  			Interruption Group 
    **************************************************************************************/
    LD_A_I=
	BEGIN
        rgs8 := rgs8  <+ { a0 |-> i_ ,  update_flag_reg( is_negative(i_ ), is_zero( i_  ), 0 , iff2 , 0, z_c )} ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_A_R=
    BEGIN
        rgs8 := rgs8  <+ { a0 |->r_ ,   update_flag_reg( is_negative( r_ ), is_zero( r_  ), 0 , iff2 , 0, z_c )  } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_I_A=
    BEGIN
        i_ := rgs8(a0)  ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_R_A=
    BEGIN
        r_ := rgs8(a0)  ||
        pc := instruction_next ( pc ) 
    END;
    
    /************************************************************************************** 
    ***  			Load 16 bits Group 
    **************************************************************************************/
    
    LD_dd_nn ( dd , nn ) =
    PRE dd : id_reg_16 & nn : USHORT  & dd /= AF
    THEN
        IF dd = SP THEN  sp := ushort_bv16 ( nn )
        ELSE
            ANY rh , rl , w1 , w2 WHERE
                rh : id_reg_8 &  rl : id_reg_8 &
                w1 : BYTE & w2 : BYTE &
                (rh , rl) = REG16_TO_REG8 ( dd ) & not(rh = rl) &
                bv16_byte ( ushort_bv16 ( nn ) ) = (w1 , w2)
            THEN
                rgs8 := rgs8 <+ { rh |-> w1 , rl |-> w2 } ||
                pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
            END
        END
    END;
    
    
    LD_IX_nn ( nn ) =
    PRE   nn : USHORT
    THEN
        ix := ushort_bv16 ( nn ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    LD_IY_nn ( nn ) =
    PRE   nn : USHORT
    THEN
        iy := ushort_bv16 ( nn ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_HL_9nn0 ( nn ) =
    PRE   nn : USHORT
    THEN
        rgs8 := rgs8 <+ { h0 |-> mem ( ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) ) , l0 |-> mem ( ushort_bv16 ( nn ) ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_dd_9nn0 ( dd , nn ) =
    PRE dd : id_reg_16 & nn : USHORT  & dd /= AF
    THEN
        r_ := update_refresh_reg(r_) ||
        IF dd = SP THEN
            sp := byte_bv16 ( mem ( ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) ) , mem ( ushort_bv16 ( nn ) ) )
        ELSE
            ANY rh , rl , w1 , w2 WHERE
                rh : id_reg_8 &  rl : id_reg_8 &
                w1 : BYTE & w2 : BYTE &
                (rh , rl) = REG16_TO_REG8 ( dd ) &  not(rh = rl) &
                w1 = mem ( ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) ) &
                w2 = mem ( ushort_bv16 ( nn ) )
            THEN
                rgs8 := rgs8 <+ { rh |-> w1 , rl |-> w2 } ||
                pc := instruction_next ( pc ) 
            END
        END
    END;
    
    
    
    
    LD_IX_9nn0 ( nn ) =
    PRE   nn : USHORT
    THEN
        ix := byte_bv16 ( mem ( ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) ) , mem ( ushort_bv16 ( nn ) ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_IY_9nn0 ( nn ) =
    PRE   nn : USHORT
    THEN
        iy := byte_bv16 ( mem ( ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) ) , mem ( ushort_bv16 ( nn ) ) ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    LD_9nn0_HL ( nn ) =
    PRE   nn : USHORT &
        nn  : DATA_R_ADR &  add16USHORT ( 0 , nn , 1 )  : DATA_R_ADR
    THEN
        updateMem ( { ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) |-> rgs8 ( h0 ) , ushort_bv16 ( nn ) |-> rgs8 ( l0 ) } ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    
    LD_9nn0_dd ( nn , dd ) =
    PRE dd : id_reg_16 &  dd /= AF & nn : USHORT  & 
        nn  : DATA_R_ADR & add16USHORT( 0 , nn , 1 ) : DATA_R_ADR
    THEN
        IF dd = SP
        THEN
            ANY vh , vl WHERE
                vh : BYTE & vl : BYTE &
                bv16_byte ( sp ) = (vh , vl) &
                not(ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) = ushort_bv16 ( nn ))
            THEN
                updateMem ( { ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) |-> vh , ushort_bv16 ( nn ) |-> vl } )
                || r_ := update_refresh_reg(r_)
            END
        ELSE
            ANY rh , rl , w1 , w2 WHERE
                rh : id_reg_8 &  rl : id_reg_8 &
                w1 : SCHAR & w2 : BYTE &
                (rh , rl) = REG16_TO_REG8 ( dd ) &  not(rh = rl) 
            THEN
                updateMem ( { ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) |-> rgs8 ( rh ) , ushort_bv16 ( nn ) |-> rgs8 ( rl ) } ) ||
                pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
            END
        END
    END;
    
    
    
    LD_9nn0_IX ( nn ) =
    PRE   nn : USHORT &  nn  : DATA_R_ADR & add16USHORT ( 0 , nn , 1 )  : DATA_R_ADR THEN
        ANY h_ix , l_ix WHERE
            h_ix : BYTE & l_ix : BYTE &
            (h_ix , l_ix) = bv16_byte ( ix )
        THEN
            updateMem ( { ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) |-> h_ix , ushort_bv16 ( nn ) |-> l_ix } ) ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    LD_9nn0_IY ( nn ) =
    PRE   nn : USHORT &  nn : DATA_R_ADR &  add16USHORT ( 0 , nn , 1 )  : DATA_R_ADR  THEN
        ANY h_iy , l_iy WHERE
            h_iy : BYTE & l_iy : BYTE &
            (h_iy , l_iy) = bv16_byte ( iy ) 
        THEN
            updateMem ( { ushort_bv16 ( add16USHORT ( 0 , nn , 1 ) ) |-> h_iy , ushort_bv16 ( nn ) |-> l_iy } ) ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    LD_SP_HL  =
    BEGIN
        sp := bv_HL ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    LD_SP_IX  =
    BEGIN
        sp := ix ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    LD_SP_IY  =
    BEGIN
        sp := iy ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    
    PUSH_qq ( qq ) =
    PRE  qq : id_reg_16 & qq /= SP 
    THEN
        ANY
            qqh , qql
        WHERE qqh : id_reg_8 & qql : id_reg_8 &
            REG16_TO_REG8 ( qq ) = (qqh , qql) &  not( qqh = qql) &
            { sp_minus_two |-> rgs8 ( qql ) ,
                sp_minus_one |-> rgs8 ( qqh ) } : BV16 --> BYTE
        THEN
            updateStack ( { sp_minus_two |-> rgs8 ( qql ) ,
                    sp_minus_one |-> rgs8 ( qqh ) } ) ||
            sp := sp_minus_two ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    PUSH_IX  =   
    ANY
        wh , wl
    WHERE wh : BYTE & wl : BYTE &
        bv16_byte ( ix ) = (wh , wl) &
        { sp_minus_two |-> wl , sp_minus_one |-> wh } : BV16 +-> BYTE
    THEN
        updateStack ( { sp_minus_two |-> wl ,
                sp_minus_one |-> wh } ) ||
        sp := sp_minus_two ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    PUSH_IY  =
    ANY
        wh , wl
    WHERE wh : BYTE & wl : BYTE &
        bv16_byte ( iy ) = (wh , wl) &
        { sp_minus_two |-> wl , sp_minus_one |-> wh } : BV16 +-> BYTE
    THEN
        updateStack ( { sp_minus_two |-> wl ,
                sp_minus_one |-> wh } ) ||
        sp := sp_minus_two ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    POP_qq ( qq ) =
    PRE  qq : id_reg_16 & qq /= SP
    THEN
        ANY
            qqh , qql
        WHERE qqh : id_reg_8 & qql : id_reg_8 &
            REG16_TO_REG8 ( qq ) = (qqh , qql) &  not( qqh = qql) &
            { qql |-> mem ( sp_plus_two ) , qqh |-> mem ( sp_plus_one ) } : id_reg_8 --> BYTE
        THEN
            rgs8 := rgs8 <+ { qql |-> mem ( sp_plus_two ) , qqh |-> mem ( sp_plus_one ) } ||
            sp := sp_plus_two ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    POP_IX  =
    PRE   sp : BV16 
    THEN
        ANY
            bv16
        WHERE bv16 : BV16  &
            byte_bv16 ( mem ( sp_plus_one ) , mem ( sp_plus_two ) ) = bv16
        THEN
            ix := bv16 ||
            sp := sp_plus_two ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    
    POP_IY  =
    PRE   sp : BV16
    THEN
        ANY
            bv16
        WHERE bv16 : BV16  &
            byte_bv16 ( mem ( sp_plus_one ) , mem ( sp_plus_two ) ) = bv16
        THEN
            iy := bv16 ||
            sp := sp_plus_two ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    EX_DE_HL =
    BEGIN
        rgs8 := rgs8 <+ { d0 |-> rgs8 ( h0 ) , e0 |-> rgs8 ( l0 ) , h0 |-> rgs8 ( d0 ) , l0 |-> rgs8 ( e0 ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    EX_AF_AF_ =
    BEGIN
        rgs8 := rgs8 <+ { a0 |-> rgs8 ( a_0 ) , f0 |-> rgs8 ( f_0 ) , a_0 |-> rgs8 ( a0 ) , f_0 |-> rgs8 ( f0 ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    
    EXX =
    BEGIN
        rgs8 := rgs8 <+ { b0 |-> rgs8 ( b_0 ) , c0 |-> rgs8 ( c_0 ) , d0 |-> rgs8 ( d_0 ) , e0 |-> rgs8 ( e_0 ) , h0 |-> rgs8 ( h_0 ) , l0 |-> rgs8 ( l_0 ) ,
            b_0 |-> rgs8 ( b0 ) , c_0 |-> rgs8 ( c0 ) , d_0 |-> rgs8 ( d0 ) , e_0 |-> rgs8 ( e0 ) , h_0 |-> rgs8 ( h0 ) , l_0 |-> rgs8 ( l0 ) } ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    EX_9SP0_HL =
    PRE
        bv16_ushort( sp_plus_one) : STACK_R_ADR &  bv16_ushort( sp ) : STACK_R_ADR
    THEN
        rgs8 := rgs8 <+ { h0 |-> mem ( sp_plus_one ) , l0 |-> mem ( sp ) } ||
        updateStack ( { sp_plus_one |-> rgs8 ( h0 ) , sp |-> rgs8 ( l0 ) } ) ||
        pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
    END;
    
    
    EX_9SP0_IX =
    PRE 	   bv16_ushort( sp_plus_one) : STACK_R_ADR &  bv16_ushort( sp ) : STACK_R_ADR 
    THEN
        ANY wh , wl
        WHERE wh : BYTE & wl : BYTE &
            bv16_byte ( ix ) = (wh , wl )
        THEN
            ix := byte_bv16 ( mem ( sp_plus_one ) , mem ( sp ) ) ||
            updateStack ( { sp_plus_one |-> wh , sp |-> wl } ) ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    EX_9SP0_IY =
    PRE 	   bv16_ushort( sp_plus_one) : STACK_R_ADR &  bv16_ushort( sp ) : STACK_R_ADR 
    THEN    
        ANY wh , wl
        WHERE wh : BYTE & wl : BYTE &
            bv16_byte ( iy ) = (wh , wl)
        THEN
            iy := byte_bv16 ( mem ( sp_plus_one ) , mem ( sp ) ) ||
            updateStack ( { sp_plus_one |-> wh , sp |-> wl } ) ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    LDI =
    PRE bv16_ushort(bv_DE) : DATA_R_ADR    THEN
        ANY  hvn , lvn , dvn , evn , bvn , cvn
        WHERE
            hvn : BYTE & lvn : BYTE & dvn : BYTE & evn : BYTE & 
            bvn : BYTE & cvn : BYTE & 
            
            (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
            (dvn , evn) = bv16_byte ( inc_BV16 ( bv_DE ) ) &
            (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        THEN
            updateAddressMem ( bv_DE , bv_9HL0 ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) ,
                ( d0 |-> dvn ) , ( e0 |-> evn ) ,
                ( b0 |-> bvn ) , ( c0 |-> cvn ) ,
                update_flag_reg( z_s , z_z , 0 , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 0 , z_c ) } ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    LDIR =
    PRE bv16_ushort(bv_DE) : DATA_R_ADR    THEN
        ANY  hvn , lvn , dvn , evn , bvn , cvn
        WHERE
            hvn : BYTE & lvn : BYTE & dvn : BYTE & evn : BYTE & 
            bvn : BYTE & cvn : BYTE & 
            (hvn , lvn) = bv16_byte ( inc_BV16 ( bv_HL ) ) &
            (dvn , evn) = bv16_byte ( inc_BV16 ( bv_DE ) ) &
            (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        THEN
            updateAddressMem ( bv_DE , bv_9HL0 ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) ,
                ( d0 |-> dvn ) , ( e0 |-> evn ) ,
                ( b0 |-> bvn ) , ( c0 |-> cvn ) ,
                update_flag_reg( z_s , z_z , 0 , 0 , 0 , z_c ) } 
            || r_ := update_refresh_reg(r_) ||
            IF  is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) = 0 THEN pc := instruction_next ( pc )  END
        END
    END;
    
    
    LDD =
    PRE bv16_ushort(bv_DE) : DATA_R_ADR    THEN
        ANY  hvn , lvn , dvn , evn , bvn , cvn
        WHERE
            hvn : BYTE & lvn : BYTE & dvn : BYTE & evn : BYTE & 
            bvn : BYTE & cvn : BYTE & 
            (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
            (dvn , evn) = bv16_byte ( dec_BV16 ( bv_DE ) ) &
            (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
        THEN
            updateAddressMem ( bv_DE , bv_9HL0 ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) ,
                ( d0 |-> dvn ) , ( e0 |-> evn ) ,
                ( b0 |-> bvn ) , ( c0 |-> cvn ) ,
                update_flag_reg( z_s , z_z , 0 , bit_not ( is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) ) , 0 , z_c ) } ||
            pc := instruction_next ( pc ) || r_ := update_refresh_reg(r_)
        END
    END;
    
    
    LDDR =
    PRE bv16_ushort(bv_DE) : DATA_R_ADR    THEN
        ANY  hvn , lvn , dvn , evn , bvn , cvn
        WHERE
            hvn : BYTE & lvn : BYTE & dvn : BYTE & evn : BYTE & 
            bvn : BYTE & cvn : BYTE &
            (hvn , lvn) = bv16_byte ( dec_BV16 ( bv_HL ) ) &
            (dvn , evn) = bv16_byte ( dec_BV16 ( bv_DE ) ) &
            (bvn , cvn) = bv16_byte ( dec_BV16 ( bv_BC ) )
            
        THEN
            updateAddressMem ( bv_DE , bv_9HL0 ) ||
            rgs8 :=  rgs8 <+ { ( h0 |-> hvn ) , ( l0 |-> lvn ) ,
                ( d0 |-> dvn ) , ( e0 |-> evn ) ,
                ( b0 |-> bvn ) , ( c0 |-> cvn ) ,
                update_flag_reg( z_s , z_z , 0 , 0 , 0 , z_c ) } 
            || r_ := update_refresh_reg(r_) ||
            IF  is_zero16USHORT ( bv16_ushort ( dec_BV16(bv_BC)  )  ) = 0 THEN pc := instruction_next ( pc )  END
            
        END
    END
    
    
    
    
    
    
  










;    
    /************************************************************************************** 
    ****** Extern Interactions Group
    ***************************************************************************************/
    
    ext_NMI = 
    PRE bv16_ushort(sp_minus_two) : STACK_R_ADR & bv16_ushort(sp_minus_one): STACK_R_ADR  THEN
        ANY pc_low, pc_high WHERE pc_low : BYTE & pc_high : BYTE & bv16_byte(ushort_bv16(pc))= (pc_low,pc_high) 
              & sp_minus_two : BV16 & sp_minus_one : BV16 
            
        THEN
            updateStack({ (sp_minus_two |-> pc_low),(sp_minus_one |->pc_high ) }) || sp:= sp_minus_two ||
            pc := 102 || iff1:=0 || iff2:= 0 || r_ := update_refresh_reg(r_)
        END
    END;
    
    ext_INT(byte_bus) = 
    PRE iff1 = 1  & byte_bus: 0..255 & bv16_ushort(sp_minus_one) : STACK_R_ADR & bv16_ushort(sp) : STACK_R_ADR THEN
        ANY pc_low, pc_high 
        WHERE pc_low : BYTE & pc_high : BYTE &
            bv16_byte(ushort_bv16(pc))= (pc_low,pc_high) 
        THEN 
            IF im = ( 0 |-> 0 ) THEN /* Mode 0 */
                IF  byte_bus = 199  /*RST00H*/ or byte_bus = 207 /*RST08H*/ or
                    byte_bus = 215  /*RST10H*/ or byte_bus = 223  /*RST18H*/ or
                    byte_bus = 231  /*RST20H*/ or byte_bus = 239  /*RST28H*/ or 
                    byte_bus = 247  /*RST30H*/ or byte_bus = 255  /*RST38H*/
                THEN                     
                    pc := byte_bus - 199  ||
                    updateStack( {  sp_minus_one |-> pc_low,
                                    sp_minus_two |-> pc_high } ) ||
                    sp := sp_minus_two ||  r_ := update_refresh_reg(r_) 
                ELSE
                    skip  /* Not implemeted yet the others instructions with codop of 8 bits */
                END
            ELSIF  im =  ( 0 |-> 1 ) THEN /* Mode 1 */
                pc :=  56 /* 56 decimal = 38H */                ||
                updateStack( { sp_minus_one |-> pc_low,
                               sp_minus_two |-> pc_high } ) ||
                sp := sp_minus_two ||  r_ := update_refresh_reg(r_)                 
            ELSIF    im = ( 1 |-> 1 ) THEN /* Mode 2 */              
                pc := bv16_ushort(byte_bv16( i_ ,bitclear(rotateleft(uchar_byte(byte_bus)),0))) ||
                updateStack( {  sp_minus_one |-> pc_low, 
                                sp_minus_two |-> pc_high } ) ||
                sp := sp_minus_two ||  r_ := update_refresh_reg(r_) 
            END  
        END
    END;    
    
    ext_RESET = 
    BEGIN
        
        iff1:=0||iff2:=0|| im:= (0|->0) || pc:=0|| i_ := uchar_byte(0) ||  r_ := uchar_byte(0) || 
        rgs8  := rgs8 <+ { (a0 |->uchar_byte(255) ), (f0 |->uchar_byte(255) ) }||
        sp := byte_bv16(uchar_byte(255),uchar_byte(255))
        
    END;  


    /************************************************************************************** 
    ****** Read e write registers
    ***************************************************************************************/

	value <-- io_read(aa) = 
	PRE aa : id_reg_8 THEN
	    value := rgs8(aa)
	END;

	io_write(aa,value) = 
	PRE aa : id_reg_8 & value : BYTE THEN
	    rgs8(aa) := value
	END








END
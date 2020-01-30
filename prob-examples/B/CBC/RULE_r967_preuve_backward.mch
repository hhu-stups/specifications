MACHINE RULE_r967_preuve_backward
DEFINITIONS BTRUE==(1=1) ; BFALSE==(1/=1)
SETS t12; t14
CONSTANTS a_mch, b_mch, c_mch
/* non freeness: 
lrond_s11 \ a_mch & lrond_s11 \ b_mch & lrond_s11 \ c_mch & lrond_s11 \ t12 & lrond_s11 \ t14 & lrond_s14 \ a_mch & lrond_s14 \ b_mch & lrond_s14 \ c_mch & lrond_s14 \ t12 & lrond_s14 \ t14 & lrond_t10 \ a_mch & lrond_t10 \ b_mch & lrond_t10 \ c_mch & lrond_t10 \ t12 & lrond_t10 \ t14 & lrond_t13 \ a_mch & lrond_t13 \ b_mch & lrond_t13 \ c_mch & lrond_t13 \ t12 & lrond_t13 \ t14 & lrond_y9 \ a_mch & lrond_y9 \ b_mch & lrond_y9 \ c_mch & lrond_y9 \ t12 & lrond_y9 \ t14 & 
lrond_s11 \ lrond_s14 & lrond_s11 \ lrond_t10 & lrond_s11 \ lrond_t13 & lrond_s11 \ lrond_y9 & lrond_s14 \ lrond_t10 & lrond_s14 \ lrond_t13 & lrond_s14 \ lrond_y9 & lrond_t10 \ lrond_t13 & lrond_t10 \ lrond_y9 & lrond_t13 \ lrond_y9 & */
PROPERTIES
(a_mch : POW(t12)) & (b_mch : POW((t14*t12))) & (c_mch : t14)
ASSERTIONS
(#(lrond_s11,lrond_t10).(
(((lrond_s11,lrond_t10) : (POW(t14)*POW(t12))) &

 ((b_mch : (lrond_s11+->lrond_t10)) & 
 
 ((c_mch : dom(b_mch)) & 
 
!lrond_y9.((
(lrond_y9 = b_mch(c_mch))

 => 
 
 #(lrond_s14,lrond_t13).(
 (((lrond_s14,lrond_t13) : (POW(t12)*POW(t14))) &
  (((a_mch<|(b_mch)~) : (lrond_s14+->lrond_t13)) &
   (lrond_y9 : dom((a_mch<|(b_mch)~))))))))))))
   
 =>
 
  ((a_mch<|(b_mch)~)(b_mch(c_mch)) = c_mch))
END
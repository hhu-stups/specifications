MACHINE BV16UpUPdate_DEFINITION
SETS
 ID={aa,bb}
CONSTANTS BIT, BYTE, BIT_VECTOR, UCHAR_MIN, UCHAR_MAX, UCHAR, uchar_byte, update_refresh_reg,
update_refresh_reg_no_mod,update_refresh_reg_no_uchar
PROPERTIES
   BIT = 0 .. 1

  & BIT_VECTOR = seq1(BIT)
  & update_refresh_reg = %v0.(v0 : BYTE|uchar_byte(128 * v0(7) + ((((((64 * v0(6) + 32 * v0(5)) + 16 * v0(4)) + 8 * v0(3)) + 4 * v0(2)) + 2 * v0(1)) + v0(0)) mod 128))
  & update_refresh_reg_no_mod = %v0.(v0 : BYTE|uchar_byte(128 * v0(7) + ((((((64 * v0(6) + 32 * v0(5)) + 16 * v0(4)) + 8 * v0(3)) + 4 * v0(2)) + 2 * v0(1)) + v0(0)) ))
  & update_refresh_reg_no_uchar = %v0.(v0 : BYTE|(128 * v0(7) + ((((((64 * v0(6) + 32 * v0(5)) + 16 * v0(4)) + 8 * v0(3)) + 4 * v0(2)) + 2 * v0(1)) + v0(0)) ))
  
  & UCHAR_MAX = 256 - 1
  & UCHAR_MIN = 0
  & UCHAR = UCHAR_MIN .. UCHAR_MAX

  & uchar_byte = %v0.(v0 : UCHAR|[(v0 mod 2) / 1,(v0 mod 4) / 2,(v0 mod 8) / 4,(v0 mod 16) / 8,(v0 mod 32) / 16,(v0 mod 64) / 32,(v0 mod 128) / 64,(v0 mod 256) / 128])

  & BYTE = {bt|bt : BIT_VECTOR & size(bt) = 8}
DEFINITIONS
  GOAL1 == update_refresh_reg_no_mod([0,0,0,0,0,0,0,0])=[0,0,0,0,0,0,0,0];
  GOAL == update_refresh_reg_no_uchar([0,0,0,0,0,0,0,0])=0
END


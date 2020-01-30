MACHINE TestBitLibrary
DEFINITIONS
 "LibraryBits.def"
CONCRETE_CONSTANTS
    uint8_t,
    bitwise_not_uint8,
    bitwise_and_uint8,
    bitwise_xor_uint8,
    bitwise_or_uint8
PROPERTIES
    uint8_t  = 0 .. 255  &
    bitwise_not_uint8 = %x.(x:uint8_t | BXOR(x,255)) &
    bitwise_and_uint8 = %(x,y).(x:uint8_t & y: uint8_t|BAND(x,y)) &
    bitwise_or_uint8 = %(x,y).(x:uint8_t & y: uint8_t|BOR(x,y)) &
    bitwise_xor_uint8 = %(x,y).(x:uint8_t & y: uint8_t|BXOR(x,y))
ASSERTIONS
    bitwise_not_uint8  : uint8_t --> uint8_t;
    !x.(x:uint8_t => bitwise_not_uint8(bitwise_not_uint8(x))=x);
    ! (ui1, ui2) . (ui1 : uint8_t & ui2 : {0,1,2,254,255}
        => bitwise_and_uint8 (ui1 |-> ui2) <= ui2);
    BLSHIFT(16,2) = 64;
    BRSHIFT(16,2) = 4;
    BAND(16,0) = 0;
    BOR(BOR(1,2),4) = 7;
    ! (ui1) . (ui1 : uint8_t
        => bitwise_and_uint8 (ui1 |-> ui1) = ui1 &
           bitwise_or_uint8 (ui1 |-> ui1) = ui1 &
           bitwise_and_uint8 (ui1 |-> 0) = 0 &
           bitwise_and_uint8 (0 |-> ui1) = 0 &
           bitwise_or_uint8 (ui1 |-> 0) = ui1 &
           bitwise_or_uint8 (0 |-> ui1) = ui1 &
           bitwise_xor_uint8 (ui1 |-> ui1) = 0 &
           bitwise_xor_uint8 (ui1 |-> 0) = ui1 &
           bitwise_xor_uint8 (0 |-> ui1) = ui1
      )
END


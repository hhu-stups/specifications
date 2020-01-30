
MACHINE DieHard
ABSTRACT_VARIABLES
  big,
  small
/* PROMOTED OPERATIONS
  FillSmallJug,
  FillBigJug,
  EmptySmallJug,
  EmptyBigJug,
  SmallToBig,
  BigToSmall */
DEFINITIONS
  HEURISTIC_FUNCTION == 5-big
INVARIANT
    small : 0 .. 3
  & big : 0 .. 5
  & big /= 4
INITIALISATION
    big,small : (big = 0 & small = 0)
OPERATIONS
  FillSmallJug = 
    BEGIN
      small,big := 3,big
    END;
  
  FillBigJug = 
    BEGIN
      big,small := 5,small
    END;
  
  EmptySmallJug = 
    BEGIN
      small,big := 0,big
    END;
  
  EmptyBigJug = 
    BEGIN
      big,small := 0,small
    END;
  
  SmallToBig = 
    ANY big_n
    WHERE 
        big_n = {z_,z__|(z_ : BOOL & z__ : INTEGER) & ((big + small < 5 => z__ = big + small) & (not(big + small < 5) => z__ = 5))}(TRUE)
    THEN
      small,big := small - (big_n - big),big_n
    END;
  
  BigToSmall = 
    ANY small_n
    WHERE 
        small_n = {z_,z__|(z_ : BOOL & z__ : INTEGER) & ((big + small < 3 => z__ = big + small) & (not(big + small < 3) => z__ = 3))}(TRUE)
    THEN
      big,small := big - (small_n - small),small_n
    END
/* DEFINITIONS
  PREDICATE TypeOK
  PREDICATE Init
  EXPRESSION Min
  PREDICATE NotSolved */
END

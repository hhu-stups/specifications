MACHINE OpParameterTests
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy
INVARIANT
 xx:INTEGER & yy:INTEGER &
 xx:-1..20 & yy:-1..20
INITIALISATION xx:=0 || yy:=0
OPERATIONS
  SetYY8 = BEGIN  yy:=8 END;
  SetXX8 = BEGIN  xx:=8 END;
  DecYY(p) = PRE p:0..yy THEN yy := p END;
  Dec1YY = PRE yy>0 THEN yy := yy-1 END;
  SetXX(p) = PRE p:0..yy THEN xx := p END;
  CopyYY2XX(p) = PRE p = yy THEN xx := p END;
  CopyYY2XX_gt(p) = PRE yy>0 & p = yy THEN xx := p END;
  XX_gt_YY = ANY pp WHERE pp>yy & pp <= xx THEN skip END;
  XX_neq_YY_if = IF xx > yy THEN skip ELSE SELECT xx < yy THEN skip END END;
  XX_neq_YY_select = SELECT xx > yy THEN skip WHEN xx < yy THEN skip END ;
  XX_neq_YY_choice = CHOICE SELECT xx > yy THEN skip END  OR
                            SELECT xx < yy THEN skip END  END;
  XX_neq_YY_simple = PRE xx/=yy THEN IF xx<yy THEN skip END END;
  SetXX5IfEq = PRE xx=yy THEN xx := 5 END;
  TestParaXX(xx) = PRE xx:{yy+1,yy+2} & xx< 10 THEN yy := xx END;
  TestLet(xx1) = LET yy1 BE yy1 = yy+1 IN SELECT xx1:{yy1,yy1+1} & xx1 < 10 THEN yy := xx1 END END;
  CaseTest = CASE xx OF EITHER 0 THEN SELECT yy<10 THEN skip END
                        OR 1 THEN SELECT yy<15 THEN skip END
                END END;

  AnyTest = ANY pp WHERE pp:1..xx & yy=1 THEN xx := pp END;
  AnyWDTest = ANY pp WHERE pp:1..xx & yy=10/xx THEN xx := pp END; // existence of pp guarantees xx not 0
  PreTest = SELECT xx>1 THEN PRE xx <100 THEN xx := 1 END END
END

/*

| ?- b_read_write_info:b_get_read_write_vars('CopyYY2XX',GR,AR,R,W).
GR = [],
AR = [],
R = [yy],
W = [xx] ? 
yes

*/
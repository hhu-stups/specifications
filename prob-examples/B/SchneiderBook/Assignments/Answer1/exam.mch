MACHINE           Exam

SETS              STUDENT; MARKS

CONSTANTS         pass

PROPERTIES        MARKS = 0..100
                  & pass : MARKS

VARIABLES         exam, resit1, resit2, reg

INVARIANT         reg <: STUDENT
                  & exam : reg +-> MARKS
                  & resit1 : reg +-> 0..pass
                  & resit2 : reg +-> 0..pass
                  & dom(resit1) <: dom(exam)
                  & dom(resit2) <: dom(resit1)
                  & exam[dom(resit1)] <: 0..pass-1
                  & resit1[dom(resit2)] <: 0..pass-1

INITIALISATION    reg := {}
                  || exam := {}
                  || resit1 := {}
                  || resit2 := {}

OPERATIONS

  register_student(ss) =
  PRE
    ss : STUDENT
  THEN 
    reg := reg \/ {ss}
  END;

  exam_mark(ss,mm) =
  PRE
    ss : reg & mm : MARKS & ss /: dom(exam)
  THEN
    exam(ss) := mm
  END;

  resit1_mark(ss,mm) =
  PRE
    ss : STUDENT & exam(ss) : 0..pass-1 & ss /: dom(resit1) & mm : 0..pass
  THEN
    resit1(ss) := mm
  END;

  resit2_mark(ss,mm) =
  PRE
    ss : STUDENT & resit1(ss) : 0..pass-1 & ss /: dom(resit2) & mm : 0..pass
  THEN
    resit2(ss) := mm
  END;

nn <-- query(ss) =
  PRE
    ss : STUDENT
  THEN
    nn := card({ss}<|exam) + card({ss}<|resit1) + card({ss}<|resit2) 
  END;

mm <-- markquery(ss) =
  PRE
    ss : STUDENT & ss : dom(exam)
  THEN
    mm := max((exam \/ resit1 \/ resit2)[{ss}])
  END

END

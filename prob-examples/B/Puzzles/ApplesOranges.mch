MACHINE ApplesOranges
/*
From: https://bgr.com/2015/11/20/apple-interview-questions/
(1) There are three boxes, one contains only apples, one contains only oranges, and one contains both apples and oranges. 
(2) The boxes have been incorrectly labeled such that no label identifies the actual contents of the box it labels. 
(3) Opening just one box, and without looking in the box, you take out one piece of fruit.
(4) By looking at the fruit, how can you immediately label all of the boxes correctly?
*/
SETS
 Fruit={apple,orange};
 Label={A,O,Both}
CONSTANTS a,o,b, Take, DecisionFunction
PROPERTIES
  a = {apple} & o={orange} & b={apple,orange} // (1)
  &
  Take : Label //3 
  &
  DecisionFunction : Fruit --> perm({a,o,b}) & //4
  !label. ( // the decision function has to work for all allowed labelings
  ( label : {a,o,b} >->> Label &
    label(a) /= A & label(o) /= O & label(b) /= Both // (2)
  )
   =>
  !f.(f: label~(Take) 
      => DecisionFunction(f)(1)=label~(A) &
         DecisionFunction(f)(2)=label~(O) &
         DecisionFunction(f)(3)=label~(Both))
  )
END


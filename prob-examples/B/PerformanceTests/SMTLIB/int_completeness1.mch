MACHINE int_completeness1
 /* is unsatisfiable */
 /* designed to check completeness of solver; logic: QF_IDL */
CONSTANTS x1,x2
PROPERTIES
  x1 > 0 &
  x2 < 0 &
  
  (x1-x2) > 0 &
  (x1-x2) < 4 &
  (x1-x2) /= 1 &
  (x1-x2) /= 2 &
  (x1-x2) /= 3
END

/* SMT original from Talk by David Deharbe at WOBD 2010 in Natal
you can check it with 
  ./veriT --disable-e int_completeness1.smt --check-deduced

(benchmark int_incompleteness1.smt :notes "Designed to check completeness of solver."
 :logic QF_IDL
 :extrafuns ((x1 Int)
(x2 Int))
 :assumption (> x1 0)
 :assumption (< x2 0)
 :formula (and (> (- x1 x2) 0)
(< (- x1 x2) 4) (not (= (- x1 x2) 1)) (not (= (- x1 x2) 2)) (not (= (- x1 x2) 3))))
*/
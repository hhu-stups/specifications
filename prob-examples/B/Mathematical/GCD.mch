MACHINE GCD
DEFINITIONS
 IsCD(d,s) == !i.(i:s => i mod d = 0)
ABSTRACT_CONSTANTS gcd, gcdc, half,halfc
PROPERTIES
 /* a very challenging definition: */
 gcd = {s,d| s<:NATURAL & d:INTEGER & IsCD(d,s) & not(#e.(e:NATURAL1 & IsCD(e,s) & e>d))}
&
 /* a more constructive version which can be computed by ProB without enumeration */
 gcdc = {s,d| s<:NATURAL & d:1..max(s) & IsCD(d,s) & not(#e.(e:NATURAL1 & e<=max(s) & IsCD(e,s) & e>d))}
&
 /* a not very practical definition of half */
 half = {x,r|x:{r * 2,r*2+1}}
&
 /* this one behaves better; no enumeration needed : */
 halfc = {x,r|(r * 2 = x or r*2 = x-1)}
ASSERTIONS
 gcdc({10,15,20,100}) = 5;
 // gcd({10,15}) = 5; // does not work: unknown
 gcdc({10,15}) = 5;
 halfc(1101) = 550
VARIABLES res
INVARIANT res:NATURAL
INITIALISATION res := halfc(1001)
END

/*

>>>> half2(1101)
  ?:inf..sup:(kernel_mappings:determined3(_62713,_62748,2,_62213),kernel_object
  s:int_times3(2,_62748,_62713),kernel_mappings:determined3(_63185,_62748,2,_62
  264),kernel_objects:int_times3(2,_62748,_63185),clpfd:(_62748 in inf..sup))
  
 --> we need to add enumeration
  --> either in eval_strings for expressions
  --> in b_compute_expressions for function application


>>>> gcd({10,15})
Expression Value = 
?:1..sup:(prolog:trig_ground(_28389,[],[_28389],_27966,_27966),kernel_objects:modulo2(10,_28389,0,[contains_wd_condition],wfx(0,_27603,0)),kernel_objects:modulo2(15,_28389,0,[contains_wd_condition],wfx(0,_27603,0)),clpfd:(_28389 in 1..sup))


>>>> s<:NATURAL & IsCD(d,s) & not(#e.(e:NATURAL1 & IsCD(e,s) & e>d & e<=max(s))) & s={10,15} & d<=max(s)
  TRUE
  

( s={10,15} &
       d=5 )

*/


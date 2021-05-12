MACHINE testDefTyping
SETS
 A; B = {das,ist,ein,test}
CONSTANTS constantin
PROPERTIES
 constantin:A
VARIABLES vau1,vau2,vau3
INVARIANT
 vau1<:B & vau2<:B & vau3:B & vau1/=vau2 & #x.(x:B & x:vau1 & x:vau2) & !x.(x:B => x /= test)
INITIALISATION vau1:={das} || vau2:={das,ist} || vau3:=ein
ASSERTIONS
 vau1 /= vau2 & vau1-vau2 /= {}
DEFINITIONS
  apfel(a) == {x|x:a};
  kiwi(a,b,c) == a<:B & b<:B & c<:B &a /= b & b /= c & apfel(b) /= apfel(c);
  himbeere == #c.(c:A)
OPERATIONS
 a <-- test1 = BEGIN a  := das END;
 a,b<-- test2 = BEGIN a  := 1 ; b:=2 END;
 test3 = BEGIN vau1  := {das} || vau2 := {ist} END;
 test4 = PRE not(kiwi(B,B,B)) & vau1 /= {} & vau2 <: B & vau2 /= B & vau1 <: B & vau3 : B & vau1 /= {vau3} THEN
	vau1  := {das} || vau2 := {ist} END;
 test5(foo,bar) = SELECT foo : B & bar : B & himbeere & apfel(B) = apfel(B) THEN
	vau1  := {das} || vau2 := {test} END
END


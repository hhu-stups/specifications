MACHINE EqualityLaws
SETS
 ID={i1,i2,i3}
CONSTANTS a,b,c,  s1,  d,e
PROPERTIES
 a: ID & a /= i2 & a /= i3 &
 b:ID & a/=b & b/=i3 &
 c: ID & a/=b & b/=c &

 !x.(x:ID => (x=a or x=b or x=c)) &
 !x.(x:ID => (x/=a or x/=b or x/=c)) &
 
 s1 <: ID & card(s1)=1 & s1 /= {i2} & s1 /= {i3} &

 !x.(x:s1 => (x/=i2 & x/=i3)) &

 #(x).(x:ID & x/: s1) &
 #(x).(x:POW(ID) & x/= s1) &

  {i1,i2} = {i2,i1} &
  {i1,i2,i3} = {i2,i3,i1} &
  {i1} /= {} &
  {} /= {i1} &
  {i1,i2} /= {i1,i3} &
  {i1,i2,i3} /= {i1,i2} &
 
  {{}} /= {} &
  {{{}}} /= {} &
  {{{}}} /= {{}} &
  {{{{}}}} /= {} &
  {{{{}}}} /= {{}} &
  {{{{}}}} /= {{{}}} &

  {{i1},{i2}} = {{i2},{i1}} &
  {{i1},{i2}} /= {{i1},{i3}} &
  {{i1},{i2}} /= {{i1}} &
  {{i1},{i2}} /= {{i3}} &

  {{{i1},{i2}}} = {{{i2},{i1}}} &
  {{{i1},{i2}}} /= {{{i1},{i3}}} &
  {{{i1},{i2}}} /= {{{i1}}} &
  {{{i1},{i2}}} /= {{{i3}}} &

   /* check whether d can be uniquely determined using following disequality: */
  {{{a}}} /= {{{d}}} &
  {{{d}}} /= {{{b}}} &
   /* check whether e can be uniquely determined using following disequality: */
  {{{a},{b}}} = {{{b},{e}}}
  
DEFINITIONS
 ASS == ( a=i1 &  b=i2 & c=i3 & s1 = {i1} & d=c & e=a)
ASSERTIONS
 ASS
OPERATIONS
  AssertionsOK = PRE ASS THEN skip END
END


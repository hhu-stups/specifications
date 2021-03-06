MACHINE HandshakeSimple
/*
 * Alloy model of the Halmos handshake problem
 *
 * Hilary and Jocelyn are married. They invite four couples who are friends for dinner. When
 * they arrive, they shake hands with each other. Nobody shakes hands with him or herself
 * or with his or her spouse. After there has been some handshaking, Jocelyn jumps up on
 * a chair and says "Stop shaking hands!", and then asks how many hands each person has
 * shaken. All the answers are different. How many hands has Hilary shaken?
 *
 * The Alloy model represents the problem as a set of constraints. Properties of the spouse
 * relationship and of handshaking in general are given as facts. The particular situation
 * is cast as a function.
 *
 *
 * author: Daniel Jackson, 11/15/01
 */
SETS
 PERS={hilary, jocelyn, h1,w1, h2}
CONSTANTS married, shake
DEFINITIONS px == prj1(PERS,PERS)(xy); py == prj2(PERS,PERS)(xy);
PROPERTIES
 married = {hilary |-> jocelyn, h1|->w1} &
 shake: PERS <-> PERS &


 !(x,y).(x|->y:shake =>  (y|->x:shake & y/=x & y|->x/:married)) & 

 !(yy,xx).(yy|->xx:married => xx|->yy /: shake & yy|->xx /: shake) &


 !x.(x /= hilary =>
           !y.(y /= hilary & x/=y => card(shake[{x}]) /= card(shake[{y}]) ) 
      )
ASSERTIONS
   !xy.(xy:shake =>  ( py|->px:shake &  py/=px  & py|->px/:married));
   !x.(x:PERS-{hilary} =>
           !y.(y:PERS-{hilary} & x/=y => card(shake[{x}]) /= card(shake[{y}]) ))
END

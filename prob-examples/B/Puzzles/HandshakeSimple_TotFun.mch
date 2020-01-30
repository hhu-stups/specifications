MACHINE HandshakeSimple_TotFun
/*
 encoding of the Handshake problem using a total function to BOOL
 this is a partial encoding of the full problem, which ProB can solve without Kodkod
 */
SETS
 PERS={hilary, jocelyn, h1,w1, h2}
CONSTANTS married, shake
DEFINITIONS SET_PREF_SMT == TRUE /* enables (and increases limit until which) forall below is expanded and thus also the contrapositive used */
PROPERTIES
 married = {hilary |-> jocelyn, h1|->w1} &
 shake: (PERS * PERS) --> BOOL &

 !(x,y).(shake(x|->y)=TRUE =>  (shake(y|->x)=TRUE & y/=x & y|->x/:married)) &
 
 !x.(x /= hilary =>
           !y.(y /= hilary & x/=y => card({yy|shake(x,yy)=TRUE}) /= card({zz|shake(y,zz)=TRUE}) ) 
      )
ASSERTIONS
 !(x,y,b).((x|->y)|->b : shake =>  (b=TRUE => shake(y|->x)=TRUE & y/=x & y|->x/:married)) & 
 !(x,y).((x|->y)|->TRUE : shake =>  (shake(y|->x)=TRUE & y/=x & y|->x/:married)) & 
 !(x,y).(shake(x|->y)=TRUE =>  (shake(y|->x)=TRUE & y/=x & y|->x/:married)) & 

 !(xx,yy).(xx|->yy : married => shake(xx,yy)=FALSE & shake(yy,xx)=FALSE) & /* seems important for performance */
 !(xx).(xx:PERS => shake(xx,xx)=FALSE) & /* dramatically further reduces runtime */

 !x.(x /= hilary =>
           !y.(y /= hilary & x/=y => card({yy|shake(x,yy)=TRUE}) /= card({zz|shake(y,zz)=TRUE}) ) 
      )
END

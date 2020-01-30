MACHINE FunCall_Exists_correct /* derived from 410_002.mch */
CONSTANTS au,al,bk
PROPERTIES
  au  = {(0|->35),(1|->34),(2|->40),(3|->39)}
 &
  al  =  {(58|->-1),(59|->3)}
 &
  bk = {(0|->1238),(0|->1245), (39|->1111), (66|->1468),(66|->1469)}
ASSERTIONS
 !(bx).
  (
   bx : dom(al)
    =>
     ( al(bx)/= -1
      =>
       #bt.(  /* al(bx) : dom(au) &   <--------------- not required here */
            bt: bk[{
                    
                     au(
                    
                      al(bx))}] 
            )
        )
  )
END
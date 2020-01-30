MACHINE votingsystems

/* VOTING SYSTEMS:
  * Borda
  * Condorcet
  * Copeland 0/1 (and more)
  * Kemeny
  * Lull
  * Ranking
  * Preference
  * Plurality
  * Simpson/Maximin
  * Veto
*/


DEFINITIONS
 GOAL == (nextVote={} & voter=10) 


SETS
 CANDIDATE={A,B,C}


VARIABLES 
 nextVote,  /*current voting*/
 voter,     /*current number of voters with complete votings*/
 bordaRang,
 /*kemenyS,
 kemenyM,*/
 ranking,
 preference, 
 plurality,
 veto      


INVARIANT
     bordaRang    : CANDIDATE --> NATURAL
   & nextVote     : seq(CANDIDATE) 
   & voter        : NAT
   /*& kemenyS      : POW(seq(CANDIDATE)) 
   & kemenyM      : POW(seq(CANDIDATE)) */
   & ranking      : (NAT1<->(CANDIDATE)) +-> NAT
   & preference   : (CANDIDATE<->CANDIDATE) +->NAT 
   & plurality    : CANDIDATE --> NATURAL
   & veto         : CANDIDATE --> NATURAL
/*
   & (nextVote={} => (!x.(x:CANDIDATE & !y.((y:CANDIDATE & y/=x) => (preference({x|->y}) > preference({y|->x})) ) 
                      => (x:dom(veto |> {max(ran(veto))})) )))
*/
/*
   & (nextVote={} => (!x.(x:CANDIDATE & !y.((y:CANDIDATE & y/=x) => (preference({x|->y}) > preference({y|->x})) ) 
                      => (x:dom(plurality |> {max(ran(plurality))})) )))
*/

INITIALISATION 
     bordaRang := %null.(null : CANDIDATE | 0)
  ||
     nextVote := <>
  ||
     voter := 0
  /*||
     kemenyS := {} 
  ||
     kemenyM := {} */
  ||
     ranking := %null.(null : (1..card(CANDIDATE))>->>(CANDIDATE) | 0)
  || 
     preference := %new.(new:CANDIDATE<->CANDIDATE & !x.(x:dom(new) => (new(x)/=x)) & card(new)=1 | 0)
  ||
     plurality := %null.(null : CANDIDATE | 0)
  ||
     veto := %null.(null : CANDIDATE | 0)




OPERATIONS

  winner <-- getBestRankings = 
    PRE nextVote={}
    THEN
      winner := dom(ranking |> {max(ran(ranking))})
    END;

  winner <-- getBestRanked = 
    PRE nextVote={}
    THEN
      winner := ran({1} <| (union(dom(ranking |> {max(ran(ranking))}))))
    END;


  winner <-- getBordaWinner = 
    PRE nextVote={}
    THEN
      winner := dom(bordaRang |> {max(ran(bordaRang))})
    END;


  /*winner beats all other in a pairwise comparison (Condorcet winner|->X is always > than X|->winner), {} possible */
  winner <-- getCondorcetWinner = 
    PRE nextVote={}
    THEN
      winner := {x | x:CANDIDATE & !y.((y:CANDIDATE & y/=x) => (preference({x|->y}) > preference({y|->x})) ) }
    END;

  /*(Condorcet looser|->X is always < than X|->looser), {} possible */
  looser <-- getCondorcetLooser = 
    PRE nextVote={}
    THEN
      looser := {x | x:CANDIDATE & !y.((y:CANDIDATE & y/=x) => (preference({x|->y}) < preference({y|->x})) ) }
    END;


  winner <-- getCopelandLullWinner(COPELANDALPHA) =
    PRE nextVote={}
       & COPELANDALPHA:0..1
    /*COPELANDALPHA: Value used for Copeland* if there is no winner in a pairwise comparison (other values than 0..1 possible)
      Lull winner: COPELANDALPHA=1 */
    THEN
     LET comparison BE
      comparison = 
               %x.(x: CANDIDATE
                   | ((card({y | y:CANDIDATE & y/=x & preference({x|->y})=preference({y|->x})}) * COPELANDALPHA) /*no winnner*/
                     + card({z | z:CANDIDATE & z/=x & preference({x|->z}) > preference({z|->x})})) /*winner*/
                   )
     IN
      winner := dom( (comparison) |> {max(ran(comparison))} )
     END
    END;



  kemenyscoreS <-- getKemenyscoreSimple =
    PRE nextVote={}
    THEN
     LET kemenyS BE
      kemenyS = (
           %x,y.(x:dom(ranking) & y:dom(ranking) & x/=y & ({0} /<: ran({x} <| ranking)) & ({0} /<: ran({y} <| ranking)) 
               | (card((%cand1,cand2.(cand1:CANDIDATE & cand2:CANDIDATE & cand1/=cand2 
                             | {a | a:{0,2} & (a=2 <=> ( ( (union(dom({x} <| ranking)))~(cand1) < (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) > (union(dom({y} <| ranking)))~(cand2) ) 
                                                      or ( (union(dom({x} <| ranking)))~(cand1) > (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) < (union(dom({y} <| ranking)))~(cand2) ) ))}) 
                    ) |> {{2}} )
                 )
                )
          )
     IN
      kemenyscoreS := %a.(a:dom(dom(kemenyS)) | SIGMA(x,y).(y:ran(dom(kemenyS)) & x : ran({a|->y} <| (kemenyS)) | x) )
     END
    END;

  kemenyscoreM <-- getKemenyscoreMultiply =
    PRE nextVote={}
    THEN
     LET kemenyM BE
      kemenyM = (
           %x,y.(x:dom(ranking) & y:dom(ranking) & x/=y & ({0} /<: ran({x} <| ranking)) & ({0} /<: ran({y} <| ranking)) 
               | (card((%cand1,cand2.(cand1:CANDIDATE & cand2:CANDIDATE & cand1/=cand2 
                             | {a | a:{0,2} & (a=2 <=> ( ( (union(dom({x} <| ranking)))~(cand1) < (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) > (union(dom({y} <| ranking)))~(cand2) ) 
                                                      or ( (union(dom({x} <| ranking)))~(cand1) > (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) < (union(dom({y} <| ranking)))~(cand2) ) ))}) 
                    ) |> {{2}} )
                 )*ranking(x)*ranking(y)
                )
          )
     IN
      kemenyscoreM := %a.(a:dom(dom(kemenyM)) | SIGMA(x,y).(y:ran(dom(kemenyM)) & x : ran({a|->y} <| (kemenyM)) | x) )
     END
    END;


  winner <-- getKemenySimpleWinner =
    PRE nextVote={}
    THEN
     LET kemenyX, kemenyscoreY BE
      kemenyX =
        %x,y.(x:dom(ranking) & y:dom(ranking) & x/=y & ({0} /<: ran({x} <| ranking)) & ({0} /<: ran({y} <| ranking)) 
               | (card((%cand1,cand2.(cand1:CANDIDATE & cand2:CANDIDATE & cand1/=cand2 
                             | {a | a:{0,2} & (a=2 <=> ( ( (union(dom({x} <| ranking)))~(cand1) < (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) > (union(dom({y} <| ranking)))~(cand2) ) 
                                                      or ( (union(dom({x} <| ranking)))~(cand1) > (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) < (union(dom({y} <| ranking)))~(cand2) ) ))}) 
                    ) |> {{2}} )
                 )
                )
      &kemenyscoreY =
        (%a.(a:dom(dom(kemenyX))
            | SIGMA(x,y).(y:ran(dom(kemenyX))
                          & x : ran({a|->y} <| (kemenyX)) | x) 
            )
        )
     IN
      winner:= ran({1} <| (union(dom(kemenyscoreY |> {min(ran(kemenyscoreY))}))))
      /*||
      kemenyS := dom(kemenyscoreY |> {min(ran(kemenyscoreY))})*/
     END
    END;


  winner <-- getKemenyMultiplyWinner =
    PRE nextVote={}
    THEN
     LET kemenyX,kemenyscoreY BE 
      kemenyX =
       %x,y.(x:dom(ranking) & y:dom(ranking) & x/=y & ({0} /<: ran({x} <| ranking)) & ({0} /<: ran({y} <| ranking)) 
               | (card((%cand1,cand2.(cand1:CANDIDATE & cand2:CANDIDATE & cand1/=cand2 
                             | {a | a:{0,2} & (a=2 <=> ( ( (union(dom({x} <| ranking)))~(cand1) < (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) > (union(dom({y} <| ranking)))~(cand2) ) 
                                                      or ( (union(dom({x} <| ranking)))~(cand1) > (union(dom({x} <| ranking)))~(cand2) 
                                                         & (union(dom({y} <| ranking)))~(cand1) < (union(dom({y} <| ranking)))~(cand2) ) ))}) 
                    ) |> {{2}} )
                 )*ranking(x)*ranking(y) 
                )
      &kemenyscoreY =
        (%a.(a:dom(dom(kemenyX))
            | SIGMA(x,y).(y:ran(dom(kemenyX))
                          & x : ran({a|->y} <| (kemenyX)) | x) 
            )
        )
     IN
      winner:= ran({1} <| (union(dom(kemenyscoreY |> {min(ran(kemenyscoreY))}))))
     /* ||
      kemenyM := dom(kemenyscoreY |> {min(ran(kemenyscoreY))})*/
     END
    END;


 /*plurality winner: majority of best placements*/
  winner <-- getPluralityWinner = 
    PRE nextVote={}
    THEN
      winner := dom(plurality |> {max(ran(plurality))})
    END;


  /*Simpson winner (Maximin): candidate whose worst pairwise defeat is better than that of all other candidates*/
  winner <-- getSimpsonMaximinWinner = 
    PRE nextVote={}
    THEN
      winner := dom((%mins.(mins: CANDIDATE | min(ran({x | x:{mins}<->CANDIDATE & card(x)=1 & ran(x)/=dom(x)} <| preference)) ))
                    |> {max(ran(%mins.(mins: CANDIDATE | min(ran({x | x:{mins}<->CANDIDATE & card(x)=1 & ran(x)/=dom(x)} <| preference)) )))})
    END;

  simpsonscores <-- getSimpsonscores =
    PRE nextVote={}
    THEN
      simpsonscores := %mins.(mins: CANDIDATE | min(ran({x | x:{mins}<->CANDIDATE & card(x)=1 & ran(x)/=dom(x)} <| preference)) )
    END;

  /*veto winner: candidate with fewest last placements*/
  winner <-- getVetoWinner = 
    PRE nextVote={}
    THEN
      winner := dom(veto |> {max(ran(veto))})
    END;



 /* stepwise voting*/
 voteStep(step,voting) =
    PRE
      voting : (CANDIDATE) 
      & voting /: ran(nextVote)
      & step = card(nextVote)+1
    THEN
      bordaRang(voting) := bordaRang(voting) + (card(CANDIDATE)-(step)) /*best placed candidate gets (card(CANDIDATES)-1) points, ..., last 0 points*/
      ||
      IF card(nextVote) = 0 THEN /*best placed candidate (current voter)*/
         plurality(voting) := plurality(voting) + 1 /*only the best placed candidate gets a point*/
      END
      ||
      IF card(nextVote)=card(CANDIDATE)-1 THEN /*last placed candidate (current voter)*/
         /*save current voter's complete ranking*/
         ranking(nextVote\/{step|->voting}) := ranking(nextVote\/{step|->voting}) + 1
         ||
         nextVote := {}
         ||
         voter := voter+1 /*stepwise voting completed for one more voter*/
      ELSE
         preference := %x.(x: CANDIDATE<->CANDIDATE
                   & dom(x) = {voting}
                   & !ee.(ee:ran(nextVote) => ee/:ran(x))
                   | preference(x) + 1) /*candidate wins against all candidates which are not yet in "nextVote" */
              \/
                  %y.(y: CANDIDATE<->CANDIDATE
                   & dom(y) = {voting}
                   & ran(y) <: ran(nextVote)
                   | preference(y)) /*candidate looses against all candidates in "nextVote" */
              \/
                  %z.(z: CANDIDATE<->CANDIDATE
                   & voting /: dom(z)
                   | preference(z)) /*unchanged comparisons between other candidates*/
         ||
            veto(voting) := veto(voting)+1
         ||
            nextVote:=nextVote\/{step|->voting} /*prepare for next step of current voting*/
      END         
    END

END

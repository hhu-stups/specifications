MACHINE Library

/* Specification of a library system
  University of Sherbrooke
  First version -   July 21, 2009
              Eric Gaudet
  Modified by Marc Frappier and
              Benoit Fraikin
              May 06, 2010
  Modified by Marc Frappier : remove reservations and loan limit for comparison with Michael's Prolog ASTD interpreter
*/

SETS
  MEMBERID ;
  BOOKID

DEFINITIONS scope_MEMBERID == 4; scope_BOOKID == 4; SET_PREF_MAX_OPERATIONS == 35
/* for 3,3:
STATES
deadlocked:0
invariant_violated:0
invariant_not_checked:0
open:0
live:407
total:407
TOTAL_OPERATIONS
3163
COVERED_OPERATIONS
Acquire:312
Discard:312
INITIALISATION:1
Join:378
Leave:378
Lend:594
Renew:594
Return:594
UNCOVERED_OPERATIONS

Pour 4 livres et 4 membres, il y a 5672 états, 61825 transitions
  ProB prend 8.8 secondes (sans symétrie, sans POR,..), avec -p CLPFD FALSE 6.5 secondes
  ProB+nauty Symmetry: 0.47 secondes
  ProB+ LTSMin: 7.5 secondes,
  ProB+TLC: 1 seconde de model checking mais il y a aussi du temps recquis pour le preprocessing….
  ProB+ASTD en Prolog prend 2.85 secondes

Pour 4 membres, 5 livres il y a 27427 états, 353585 transitions  (12.8 transitions per state)

ProB pur: 46 secondes,
ProB+LTSMin: 41 secondes
ProB avec symétrie : 0.8 secondes,
ProB+TLC: 2 secondes de model checking,
ProB+ASTD-Prolog: 17.3 secondes (1585 states/sec, 20438 transitions/sec)

*/

ABSTRACT_VARIABLES
  loan ,
  member ,
  book

INVARIANT
  member <: MEMBERID &
  book <: BOOKID &
  loan : book +-> member

INITIALISATION
  loan := {} ||
  book := {} ||
  member := {}

OPERATIONS

Acquire ( book_ ) =
  PRE
    book_ : BOOKID &
    book_ /: book
  THEN
    book := book \/ { book_ }
  END ;

Discard ( book_ ) =
  PRE
    book_ : BOOKID &
    book_ : book &
    book_ /: dom ( loan )
  THEN
    book := book - { book_ }
  END ;

Join ( member_ ) =
  PRE
    member_ : MEMBERID &
    member_ /: member
  THEN
    member := member \/ { member_ }
  END ;

Leave ( member_ ) =
  PRE
    member_ : MEMBERID &
    member_ : member &
    member_ /: ran ( loan )
  THEN
    member := member - { member_ }
  END ;

Lend ( member_ , book_ ) =
  PRE
    member_ : MEMBERID &
    member_ : member &
    book_ : BOOKID &
    book_ : book &
    book_ /: dom ( loan )
  THEN
    loan ( book_ ) := member_
  END ;

Renew ( member_ , book_ ) =
  PRE
    member_ : MEMBERID &
    book_ : BOOKID &
    member_ : member &
    book_ : book &
    ( book_ |-> member_ ) : loan
  THEN
    skip
  END ;

Return ( book_ ) =
  PRE
    book_ : BOOKID &
    book_ : book &
    book_ : dom ( loan )
  THEN
    loan := { book_ } <<| loan
  END
END

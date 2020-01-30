MACHINE Constraint_with_exists_v2
// from Amira Radhouani (Library Example)
// v2: rewrote domain subtraction into domain restriction for testing
// tests improved treatment of member checks for domain restriction
SETS
BOOK = {bo,bo2,bo3,bo4}
;MEMBER={me}
DEFINITIONS SET_PREF_KODKOD == FALSE; SET_PREF_MAX_INITIALISATIONS == 100
CONSTANTS Instance
PROPERTIES
/* valE */
 #(Book,Member,Lend,Reserve).
 (
    ( (((me|-> bo) /: Lend) & (not(    (
        me : Member & 
        bo : Book & 
        bo /: ran(Lend) & 
        (bo |-> me) : Reserve & 
        card(Lend[{me}]) < 3
    )) 
    )))  &

/* B_Invariant & CCL_Properties */

(     Book <: BOOK & 
    Member <: MEMBER & 
    Lend : Member <-> Book & 
    !(c2).(
        c2 : dom(Lend)
     => 
        card(Lend[{c2}]) <= 3
    ) & 
    Reserve : Book +-> Member )&

/* fis (op) & term(op) & [Action(op)]valF */

(     not(0=1))  & (    (
        Instance : BOOK & 
        Instance : Book
    ) & 
    (
        ((me |-> bo) /: (Lend |>> {Instance})) & 
        (
            me : Member & 
            bo : (Book - {Instance}) & 
            bo /: ran((Lend |>> {Instance})) & 
            (bo |-> me) : ((BOOK - {Instance}) <| Reserve) &   // rewrote this compared to version 1
            card((Lend |>> {Instance})[{me}]) < 3
        )
    ) )

/* contextual constraints */

)
END

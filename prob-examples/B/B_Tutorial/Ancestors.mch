MACHINE Ancestors
/* example taken from http://www-verimag.imag.fr/~potet/methodeB.pdf */
SETS
 Personne
CONSTANTS homme, femme, mari, mere, pere, parent, enfant, grand_parent, ancetre
PROPERTIES
/* R1 */
 homme <: Personne &
 femme <: Personne &
 homme \/ femme = Personne &
/* R2 */
 homme /\ femme = {} &
/* R3: */
 mari: femme <-> homme &
/* R4 */
 mari : femme +-> homme &
/* R5 */
 mari~ : homme +-> femme &
 mari : femme >+> homme &
/* R6 */
 mere : dom(mari) +-> femme &
/* R7 */
 pere = (mere ; mari) &
/* R8 */
 parent = mere \/ pere &
/* R9 */
 enfant = parent~ &
/* R10 */
 grand_parent = (parent ; parent) &
/* R11 */
 ancetre = closure1(parent)

& card(Personne)=5 & card(mere)=2
/* & card(Personne)=5 & card(mere)=2  ProB with Kodkod 270 - 740 ms for first sol; without 10 ms */
/* & card(Personne)=10 & card(mere)=5   ProB with Kodkod: 1280 ms; without : much, much longer [To Investigate] */
END


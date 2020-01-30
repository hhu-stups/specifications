MACHINE Ancestors
/* example taken from http://www-verimag.imag.fr/~potet/methodeB.pdf */
/* an error was made; see if you can find it */
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
 mari~ : femme +-> homme &
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



/* The error is in R5:
 mari~ : femme +-> homme 
It should be:
 mari~ : homme +-> femme 
*/
END


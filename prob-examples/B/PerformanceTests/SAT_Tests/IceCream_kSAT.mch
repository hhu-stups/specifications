MACHINE IceCream_kSAT
/* Puzzle from the Book Computer Science Unplugged (http://csunplugged.com/)
  Encoded as a SAT problem
  Ice Cream vans have to be placed on street corners so that from every corner
   one can get to a van by walking at most one block
 */
DEFINITIONS
 i(Nr) == ice(Nr)=TRUE
CONSTANTS ice, pegs
PROPERTIES
 ice : 1..24 --> BOOL &
 
 pegs = card(ice~[{TRUE}]) &  /* propagation here is not yet ideal: image will wait until first argument can be determined before moving to second argument, ... */
 pegs <7 &  /* minimal solution requires 6 pegs */

 (i(1) or i(2) or i(4) ) & /* Node 1 */
 (i(1) or i(2) or i(3) ) & /* Node 2 */
 (i(2) or i(3) or i(4) or i(5) or i(7)) & /* Node 3 */
 (i(1) or i(3) or i(4) or i(7)) & /* Node 4 */
 (i(3) or i(5) or i(6) or i(9)) & /* Node 5 */
 (i(5) or i(6) or i(7) or i(8)) & /* Node 6 */
 (i(3) or i(4) or i(6) or i(7) or i(8)) & /* Node 7 */
 (i(6) or i(7) or i(8) or i(10) or i(13)) & /* Node 8 */
 (i(5) or i(9) or i(10) or i(11) or i(12)) & /* Node 9 */
 (i(8) or i(9) or i(10)) & /* Node 10 */
 (i(9) or i(11) or i(12) or i(14)) & /* Node 11 */
 (i(9) or i(11) or i(12) or i(13)) & /* Node 12 */
 (i(8) or i(12) or i(13) or i(16)) & /* Node 13 */
 (i(11) or i(14) or i(15) or i(17)) & /* Node 14 */
 (i(14) or i(15) or i(16) or i(17) or i(18) or i(21)) & /* Node 15 */
 (i(13) or i(15) or i(16) or i(18) or i(19)) & /* Node 16 */
 (i(14) or i(15) or i(17) or i(19)) & /* Node 17 */
 (i(15) or i(16) or i(18) or i(19) or i(20) or i(21)) & /* Node 18 */
 (i(16) or i(17) or i(18) or i(19) or i(20) or i(21)) & /* Node 19 */
 (i(18) or i(19) or i(20) or i(21) or i(22)) & /* Node 20 */
 (i(15) or i(18) or i(19) or i(20) or i(21) or i(22) or i(23) or i(24)) & /* Node 21 */
 (i(20) or i(21) or i(22) or i(23) or i(24)) & /* Node 22 */
 (i(21) or i(22) or i(23) or i(24)) & /* Node 23 */
 (i(21) or i(22) or i(23) or i(24))  /* Node 24 */

OPERATIONS
  r <-- NrPegs = BEGIN r :=pegs END;
  r <-- Get(yy) = PRE yy:dom(ice) THEN r := ice(yy) END
END


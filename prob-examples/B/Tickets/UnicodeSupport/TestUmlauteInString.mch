/* TestUmlauteInString
 * Author: Leuschel
 * Creation date: 31/01/2017
 */
MACHINE
    TestUmlauteInString
CONSTANTS
    a,b,c
PROPERTIES
    a:STRING & b:STRING & c:STRING &
    a = "ä" &
    b = "ae" &
    c = "a"
ASSERTIONS
   a /= b &
   b /= c &
   a /= c 
END

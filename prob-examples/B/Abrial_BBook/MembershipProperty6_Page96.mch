MACHINE MembershipProperty6_Page96
/* Encoding of Rule from page 96 of Abrial's B-Book */
/* ProB very quickly finds a counter-example to this rule */
SETS
 s;t;u
CONSTANTS f,g
PROPERTIES
 /* Condition */
 f: s >->> t & 
 g: s >->> u &

 /* --------- */

 not(
   /* Membership Property: */
   f><g: s>->> (t*u)

    )
END


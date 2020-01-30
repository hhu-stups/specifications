MACHINE MembershipProperty4_Page96
/* Encoding of Rule from page 96 of Abrial's B-Book */
/* For this rule there is no counter-example */
SETS
 s;t;u
CONSTANTS f,g
PROPERTIES
 /* Condition */
 f: s >-> t & 
 g: s >-> u &

 /* --------- */

 not(
   /* Membership Property: */
   f><g: s>-> (t*u)

    )
END


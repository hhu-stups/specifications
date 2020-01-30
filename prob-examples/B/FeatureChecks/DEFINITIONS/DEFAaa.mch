/* DEFAaa
 * Author: leuschel
 * Creation date: Thu Oct 22 2009
 Purpose: check whether the local DEFINITION aa in DEFAaa does not interfere with
  constant aa defined in DEFA1;
ProB currently complains about aa defined twice, AtelierB does not
 (this is a small example showing what happens in larger Siemens machines)
 */
MACHINE
    DEFAaa
SEES DEFA1
DEFINITIONS aa==5
CONSTANTS xx
    PROPERTIES xx:NAT & xx=aa
END

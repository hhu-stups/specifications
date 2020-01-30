/*?***************************************?*/
/*? BZTT Team September 2003 		  ?*/
/*? All right reserved       		  ?*/
/*? Copyright University of Franche-Comte ?*/
/*?***************************************?*/

MACHINE DAB

SETS 
 
	ETAT_TRANSACTION={trans_ok, dab_hs, carte_inv_rendue, carte_confisquee, code_faux, dep_montant}; 
	TICKET={oui, non};
	ETAT_DAB={ok,hs};
	ETAT_CARTE= {inconnu, valide, a_reprendre} 
	
DEFINITIONS
	
	CODE == 1000 .. 9999;
	MONTANT == {0,20,40,50,70,80,100,120,140}
	
	
VARIABLES
 
	rap_transac,
	ticket,
	somme_del 
 
INVARIANT 

	rap_transac : ETAT_TRANSACTION & 
	ticket : TICKET & 
            somme_del : NAT & /* added by Leuschel for ProB */
	somme_del : MONTANT

INITIALISATION 

	rap_transac := trans_ok || 
	ticket := non || 
	somme_del := 0 
 
OPERATIONS 
 
transaction_dab (code1,code2,code3,mont,tick,carte,pin,montant_max,etat_dab) = 
PRE 
	code1 : CODE & 
	code2 : CODE & 
	code3 : CODE & 
	mont :  MONTANT  & 
            mont: NAT & /* added by Leuschel for ProB */
	mont /= 0 &
	tick : TICKET & 
	carte : ETAT_CARTE  & 
	pin : CODE & 
	montant_max : 0..140 & 
	etat_dab : ETAT_DAB  
THEN 
	IF etat_dab = hs 
	THEN rap_transac := dab_hs 
	ELSE 
		IF carte = a_reprendre 
		THEN rap_transac := carte_confisquee 
		ELSE 
			IF carte = inconnu 
			THEN rap_transac := carte_inv_rendue 
 			ELSE 
 				IF pin /: {code1,code2,code3} 
				THEN rap_transac := code_faux 
				ELSE  
					IF mont > montant_max
					THEN rap_transac := dep_montant 
					ELSE 
						rap_transac := trans_ok || 
						ticket := tick || 
						somme_del :=mont 
					END 
				END 
			END 
		END 
	END
END 
END 

MACHINE tuts

SETS 

tutoren = {Christian,Bjoern_Ebbinghaus,Sebastian_Meyer,Filip_Krakowski,Michael_Janschek,Joshua_Schmidt,Sirat_Ahmadi,Tobi,Gian_Perrone,Timo_Gruen,Marcin_Golkowski,Yasin_Yazgan,Paul_Baylan,Markus,Daniel_Michels,Kevin_Gnyp,Jakob_Scheumann,Chris_Rutenkolk,Jens,Lukas_Ladenberger}

CONSTANTS 
  termine, cando, solution 

PROPERTIES
 
 termine = 1..22 &
 cando = {Christian} * { 2,3,4,7,8,9,11,12,13,16,17 } \/
{Bjoern_Ebbinghaus} * { 3,4,6,11,12,15,16 } \/
{Sebastian_Meyer} * { 3,8,9,10,13,17,18,21 } \/
{Filip_Krakowski} * { 8,16,18,20 } \/
{Michael_Janschek} * { 2,4,5,7,10,11,15,16,21,22 } \/
{Joshua_Schmidt} * { 1,2,3,4,5,19,20,21,22 } \/
{Sirat_Ahmadi} * { 5,17,18,22 } \/
{Tobi} * { 7 } \/
{Gian_Perrone} * { 2,3,4,5,7,8,9,10,11,12,13,14 } \/
{Timo_Gruen} * { 7,11,16,17,19 } \/
{Marcin_Golkowski} * { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 } \/
{Yasin_Yazgan} * { 10,14,18,21,22 } \/
{Paul_Baylan} * { 7,8,9,10,11,14,17,18,20,21,22 } \/
{Markus} * { 1,4,5,6,7,9,12,14,15,18,20,21,22 } \/
{Daniel_Michels} * { 3,4,7,8,9,12,13,17,19,20,21 } \/
{Kevin_Gnyp} * { 1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,19,20,21 } \/
{Jakob_Scheumann} * { 6,10,12,15,17,19 } \/
{Chris_Rutenkolk} * { 6,7,9 } \/
{Jens} * { 2,3,4,5,7,8,9,10,11,12,13,14,21,22 } \/
{Lukas_Ladenberger} * { 1,2,6,7,15,16,19,20 }

&
  solution <: cando & 
  ran(solution) = termine & ( !(t). (t:tutoren => card({t}<|solution) <= 2 & card({t}<|solution) > 0)) 
END
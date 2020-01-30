MACHINE tuts_v1


CONSTANTS 
 tutoren, termine, cando, solution 

PROPERTIES
 tutoren = {"Christian","Björn Ebbinghaus","Sebastian Meyer","Filip Krakowski","Michael Janschek","Joshua Schmidt","Sirat Ahmadi","Tobi","Gian Perrone","Timo Grün","Marcin Golkowski","Yasin Yazgan","Paul Baylan","Markus","Daniel Michels"} &
 termine = 1..22 &
 cando = {"Christian"} * { 2,3,4,7,8,9,11,12,13,16,17 } \/
{"Björn Ebbinghaus"} * { 3,4,6,11,12,15,16 } \/
{"Sebastian Meyer"} * { 3,8,9,10,13,17,18,21 } \/
{"Filip Krakowski"} * { 8,16,20 } \/
{"Michael Janschek"} * { 2,4,5,7,10,11,15,16,21,22 } \/
{"Joshua Schmidt"} * { 1,2,3,4,5,19,20,21,22 } \/
{"Sirat Ahmadi"} * { 5,17,18,22 } \/
{"Tobi"} * { 7 } \/
{"Gian Perrone"} * { 2,3,4,5,7,8,9,10,11,12,13,14 } \/
{"Timo Grün"} * { 7,11,16,17,19 } \/
{"Marcin Golkowski", "Jens", "Lukas"} * { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 } \/
{"Yasin Yazgan"} * { 10,14,18,21,22 } \/
{"Paul Baylan"} * { 7,8,9,10,11,14,17,18,20,21,22 } \/
{"Markus"} * { 1,4,5,6,7,9,12,14,15,18,20,21,22 } \/
{"Daniel Michels"} * { 3,4,7,8,9,12,13,17,19,20,21 }
&
  solution <: cando & 
  ran(solution) = termine & ( !(t). (t:tutoren => card({t}<|solution) <= 2 & card({t}<|solution) > 0)) 
END
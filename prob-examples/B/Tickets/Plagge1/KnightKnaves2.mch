MODEL
   KnightKnaves2
/*
  Generates time-out in compiled version of ProB
  (probcli Plagge1/KnightKnaves2.mch -init -i)
*/
SETS
  PERSON = {Knight,Knave}
CONSTANTS
  alice,
  bob,
  sam
PROPERTIES
    alice : PERSON
  & bob : PERSON
  & sam : PERSON
  & ( (alice=Knight) <=> (Knight : {alice,bob,sam}) )
  & ( (bob=Knight) <=> (Knave : {alice,sam} ) )
ASSERTIONS
  alice = Knave
END

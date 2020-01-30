MACHINE but_total_relation
SETS
  Person;
  Room
CONCRETE_CONSTANTS
  Outside,
  Door,
  c
PROPERTIES
    Door /\ id(Room - {Outside}) = {}
  & Outside |-> Outside : Door
  & Door <: Door~
  & c : Room <-> Room <-> (Room <-> Room) /* 2 ^ (512*512) possibilities for c */
 /* & c = {x,y| x <: y & ((y ; x) <: y & !(z).(x <: z & (z ; x) <: z => y <: z))} */
 /* & c = {x,y| x <: y & ((y ; x) <: y)} */
  & c = {x,y| x <: y } 

END
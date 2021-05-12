
MACHINE alloytranslation
SETS /* deferred */
  Chest;
  Item;
  Puzzle
CONCRETE_CONSTANTS
  Inventory,
  items__,
  contains,
  A,
  B,
  C,
  Bow,
  Glove,
  Boots,
  Sword,
  solution,
  PA0,
  PA1,
  PB0,
  PC0
/* PROMOTED OPERATIONS
  check0 */
PROPERTIES
    items__ : Inventory <-> Item
  & contains : Chest +-> Item
  & {_c_2,_c_3|PA0 |-> _c_2 |-> _c_3 : solution} = {A} * ({Boots} \/ {Bow})
  & {_c_2,_c_3|PA1 |-> _c_2 |-> _c_3 : solution} = {A |-> Sword}
  & {_c_2,_c_3|PB0 |-> _c_2 |-> _c_3 : solution} = {B |-> Bow}
  & {_c_2,_c_3|PC0 |-> _c_2 |-> _c_3 : solution} = {C |-> Glove}
  & items__[IF Inventory /= {} THEN {min(Inventory)} ELSE {} END] = {i|(contains~)[{i}] = {}}
  & !inv.(inv : Inventory - (IF Inventory /= {} THEN {max(Inventory)} ELSE {} END) => items__[IF succ[{inv}] <: Inventory THEN succ[{inv}] ELSE {} END] = items__[{inv}] \/ {i|inv : Inventory & (inv |-> i : items__ or #p.(# /* LET */ (sol).( (sol)=({_c_2,_c_3|p |-> _c_2 |-> _c_3 : solution}[(contains~)[{i}]]) & sol /= {} & sol <: items__[{inv}])))})
  & !i.(i : Item => card({c|contains[{c}] = {i}}) <= 1)
  & (Puzzle = {PC0}\/{PB0}\/{PA1}\/{PA0} & {PC0}/\{PB0} = {} & {PC0}/\{PA1} = {} & {PC0}/\{PA0} = {} & {PB0}/\{PA1} = {} & {PB0}/\{PA0} = {} & {PA1}/\{PA0} = {})
  & card(Puzzle) = 4
  & (Item = {Sword}\/{Boots}\/{Glove}\/{Bow} & {Sword}/\{Boots} = {} & {Sword}/\{Glove} = {} & {Sword}/\{Bow} = {} & {Boots}/\{Glove} = {} & {Boots}/\{Bow} = {} & {Glove}/\{Bow} = {})
  & card(Item) = 4
  & (Chest = {C}\/{B}\/{A} & {C}/\{B} = {} & {C}/\{A} = {} & {B}/\{A} = {})
  & card(Chest) = 3
INITIALISATION
    skip
OPERATIONS
  check0 = 
    PRE 
        {_c_2,_c_3|PA0 |-> _c_2 |-> _c_3 : solution} = {A} * ({Boots} \/ {Bow})
      & {_c_2,_c_3|PA1 |-> _c_2 |-> _c_3 : solution} = {A |-> Sword}
      & {_c_2,_c_3|PB0 |-> _c_2 |-> _c_3 : solution} = {B |-> Bow}
      & {_c_2,_c_3|PC0 |-> _c_2 |-> _c_3 : solution} = {C |-> Glove}
      & items__[IF Inventory /= {} THEN {min(Inventory)} ELSE {} END] = {i|(contains~)[{i}] = {}}
      & !inv.(inv : Inventory - (IF Inventory /= {} THEN {max(Inventory)} ELSE {} END) => items__[IF succ[{inv}] <: Inventory THEN succ[{inv}] ELSE {} END] = items__[{inv}] \/ {i|inv : Inventory & (inv |-> i : items__ or #p.(# /* LET */ (sol).( (sol)=({_c_2,_c_3|p |-> _c_2 |-> _c_3 : solution}[(contains~)[{i}]]) & sol /= {} & sol <: items__[{inv}])))})
      & !i.(i : Item => card({c|contains[{c}] = {i}}) <= 1)
      & not(!c.(c : Chest => #sol.(c |-> sol : {_c_2,_c_3|#_c_1.(_c_1 |-> _c_2 |-> _c_3 : solution)} & contains[{c}] /<: {sol})) & (contains~)[{Sword}] = {} => #inv.(inv : Inventory & inv : Inventory & (inv |-> Sword : items__ or #p.(# /* LET */ (sol).( (sol)=({_c_2,_c_3|p |-> _c_2 |-> _c_3 : solution}[(contains~)[{Sword}]]) & sol /= {} & sol <: items__[{inv}]))) & inv : Inventory & (inv |-> Boots : items__ or #p.(# /* LET */ (sol).( (sol)=({_c_2,_c_3|p |-> _c_2 |-> _c_3 : solution}[(contains~)[{Boots}]]) & sol /= {} & sol <: items__[{inv}])))))
    THEN
      skip
    END
/* DEFINITIONS
  EXPRESSION next_Inventory(s);
  EXPRESSION nexts_Inventory(s);
  EXPRESSION prev_Inventory(s);
  EXPRESSION prevs_Inventory(s);
  EXPRESSION free;
  PREDICATE reachable(i,inv);
  PREDICATE winnable;
  PREDICATE restrictions; */
END

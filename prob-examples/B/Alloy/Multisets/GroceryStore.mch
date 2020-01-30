MACHINE GroceryStore
SETS
 Item = {Bread,Butter,Milk}
DEFINITIONS
  multiset(T) == (T --> NATURAL);
  finmultiset(T) == (T --> NAT); SET_PREF_MAXINT == 4;
  count(MS) == SIGMA(x).(x:dom(MS)|MS(x)) // count number of items in multiset MS
ABSTRACT_CONSTANTS drop, belongsto
CONSTANTS Dairy, Bakery, Category, b
PROPERTIES
 drop = %bag.(bag:multiset(Item)|bag~[NATURAL1]) & // drop multiplicity
 Dairy = {Butter,Milk} &
 Bakery = {Bread} &
 Category = {Dairy, Bakery} &
 belongsto = {p,c| c:Category & p:c} & // belongsto category
 b : finmultiset(Item) &
 count(Dairy <| b) >= 2 & // a bundle must contain at least two dairy products
 card(belongsto[drop(b)]) >= 2 // every bundle must contain items covering at least two product categories
ASSERTIONS
 b(Bread)>0
END


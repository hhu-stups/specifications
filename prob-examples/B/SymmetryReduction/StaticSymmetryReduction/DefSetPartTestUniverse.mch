MACHINE DefSetPartTestUniverse
SETS
 Universe
CONSTANTS books, persons, journals,
          author, lent
PROPERTIES
  Universe = books \/ persons \/ journals &
  books /\ persons = {} & books /\ journals = {} &
  persons /\ journals = {} &

 // books = Universe /\ persons & Universe /\ persons = {} &

  card(books) = 3 & card(persons) = 4 & card(journals) = 2 &

  author : books --> persons &


  lent : books +-> persons &
  ran(lent) /\ ran(author) = {}
  
END


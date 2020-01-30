MACHINE bookstore
/* machine developed by Carla Ferreira */
/* SEES  Bool_TYPE */

SETS
    CLIENT;
    BOOK


VARIABLES
    basket,
    budget,
    accepted,
    shelf,
    price


DEFINITIONS
    overBudget(c) == budget(c) >= SIGMA(book).(book : BOOK & book: basket(c) | price(book))
          

INVARIANT
    basket : CLIENT +-> FIN (BOOK) &
    budget : CLIENT +-> NAT1 &
    accepted : CLIENT +-> BOOL &
    shelf : BOOK --> NAT &
    price : BOOK --> NAT1 &

    dom(basket) = dom(budget) &
    dom(basket) = dom(accepted)


INITIALISATION
    basket := {} ||
    budget := {} ||
    accepted := {} ||
    shelf :=  BOOK * {20}
 /* %book.(book:BOOK | 20) */
  ||
    price := BOOK * {10}
 /* %book.(book:BOOK | 10) */


/* StAC Specification:
    Bookstore = || c:CLIENT . Client(c)
    Client(c) = Arrive(c); ChooseBooks(c); ((Quit(c); <*>(c)) [] Pay(c))
    ChooseBooks(c) = Checkout(c) [] ( ChooseBook(c); ChooseBooks(c))
    Book(c) = [] b:BOOK . (AddBook(c,b) %(c#1) ReturnBook(c,b));
                ((overBudget(c) -> <*>(c#1)) [] (~overBudget(c) -> {c#1} >> c))
    Pay(c) = ProcessCard(c); (~accepted(c) -> <*>(c))
*/


OPERATIONS

    Arrive(client,amount) =
        PRE
          client : CLIENT &
          client /: dom(basket) &
          amount : NAT1
        THEN
          basket := basket \/ {client |-> {}} ||
          budget := budget \/ {client |-> amount} ||
          accepted := accepted \/ {client |-> FALSE}
        END;
        
    AddBook(client, book) =
        PRE
          client : CLIENT &
          client : dom(basket) &
          book : BOOK &
          book /: basket(client) &
          shelf(book) > 0 &
          not(overBudget(client))
        THEN
          basket(client) := basket(client) \/ {book} ||
          shelf(book) := shelf(book)-1
        END;

    ReturnBook(client, book) =
        PRE 
          client : CLIENT &
          client : dom(basket) &
          book : BOOK &
          book : basket(client) 
        THEN
          basket(client) := basket(client) - {book} ||
          shelf(book) := shelf(book)+1
        END;

    ProcessCard(client) =
        PRE
          client : CLIENT &
          client : dom(basket)
        THEN
          CHOICE
            accepted(client) := TRUE 
            OR 
            accepted(client) := FALSE
          END
        END;        

    Checkout(client) =
        PRE 
          client : CLIENT &
          client : dom(basket)
        THEN
          skip
        END;

    Quit(client) =
        PRE
          client : CLIENT &
          client : dom(basket)
        THEN
          skip
        END

END



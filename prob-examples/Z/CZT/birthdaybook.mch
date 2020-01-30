/* Translated automatically from file:/C:/Docume~1/marku/Mesdoc~1/czt-sourceforge/translators/z2b/tests/birthdaybook.xml */
MACHINE
    Specification
DEFINITIONS
    NAME == 1 .. 2;
    DATE == 14 .. 15
VARIABLES
    birthday,
    known
INVARIANT
    birthday : NAME +-> DATE & 
    known : POW(NAME) & 
    known = dom(birthday)
INITIALISATION
    ANY known__prime,birthday__prime
    WHERE birthday__prime : NAME +-> DATE & 
        known__prime : POW(NAME) & 
        known__prime = dom(birthday__prime) & 
        known__prime = {}
    THEN known := known__prime || 
        birthday := birthday__prime
    END
OPERATIONS
    
    AddBirthday(date__in,name__in) =
    PRE date__in : DATE & 
        name__in : NAME & 
        known = dom(birthday) & 
        name__in /: known
    THEN ANY known__prime,birthday__prime
        WHERE known__prime : POW(NAME) & 
            birthday__prime : NAME +-> DATE & 
            known__prime = dom(birthday__prime) & 
            birthday__prime = birthday \/ {name__in |-> date__in}
        THEN known := known__prime || 
            birthday := birthday__prime
        END
    END;
    
    date__out <-- FindBirthday(name__in) =
    PRE name__in : NAME & 
        known = dom(birthday) & 
        name__in : known
    THEN ANY known__prime,date__out__prime,birthday__prime
        WHERE date__out__prime : DATE & 
            known__prime : POW(NAME) & 
            birthday__prime : NAME +-> DATE & 
            known__prime = dom(birthday__prime) & 
            known__prime = known & 
            birthday__prime = birthday & 
            date__out__prime = birthday(name__in)
        THEN known := known__prime || 
            date__out := date__out__prime || 
            birthday := birthday__prime
        END
    END;
    
    card__out <-- RemindOne(today__in) =
    PRE today__in : DATE & 
        known = dom(birthday)
    THEN ANY known__prime,card__out__prime,birthday__prime
        WHERE card__out__prime : NAME & 
            known__prime : POW(NAME) & 
            birthday__prime : NAME +-> DATE & 
            known__prime = dom(birthday__prime) & 
            known__prime = known & 
            birthday__prime = birthday & 
            card__out__prime : known & 
            birthday(card__out__prime) = today__in
        THEN known := known__prime || 
            card__out := card__out__prime || 
            birthday := birthday__prime
        END
    END
END
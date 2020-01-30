MACHINE
    Controller(lifetime)
CONSTRAINTS
    lifetime : NAT & lifetime <= 100
SEES
    Vend_Data
INCLUDES
    Basic_Controller(lifetime)            
PROMOTES
    restock
OPERATIONS
    enter_coin =
    ANY cc
    WHERE cc : COINS
    THEN
        IF cc = 5
        THEN
            accept_5
        ELSE
            accept_10
        END
    END
END

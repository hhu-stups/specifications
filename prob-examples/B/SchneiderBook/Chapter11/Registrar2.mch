MODEL
   Registrar2
INCLUDES          Marriage,Life  /* adapted from Schneider to get over B4Free
 problem with visibility */
PROMOTES          born, wed, part, partner
OPERATIONS
  dies(nn) =
  PRE nn: PERSON & nn : male \/ female
  THEN
    die(nn) || 
    IF nn : dom(marriage)
    THEN part(nn,marriage(nn))
    ELSIF nn : ran(marriage)
    THEN part(marriage~(nn),nn)
    END
  END
END
MACHINE           Priorityqueue

VARIABLES         queue

INVARIANT         queue : seq(NAT) 
                  & !xx . (xx : 1..size(queue)-1 => (queue(xx) <= queue(xx+1)))

INITIALISATION    queue := <>

OPERATIONS

  insert(nn) =
  PRE nn : NAT
  THEN 
    SELECT queue = <> THEN queue := [nn]
    WHEN queue /= <> & /* added by leuschel */
         nn <= min(ran(queue)) THEN queue := nn -> queue
    WHEN queue /= <> & /* added by leuschel */
         nn >= max(ran(queue)) THEN queue := queue <- nn
    ELSE ANY xx
         WHERE xx : 1..size(queue)-1 & queue(xx) <= nn & nn <= queue(xx+1)
         THEN queue := (queue /|\ xx) ^ [nn] ^ (queue \|/ xx)
         END
    END
  END;

nn <-- extract =
  PRE queue /= <>
  THEN nn := first(queue) || queue := tail(queue)
  END

END

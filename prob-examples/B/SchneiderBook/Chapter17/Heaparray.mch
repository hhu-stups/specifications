MACHINE           Heaparray

VARIABLES         heaparray

INVARIANT         heaparray : seq(NAT) 

INITIALISATION    heaparray := <>

OPERATIONS

nn <-- next = 
  PRE heaparray /= <>
  THEN nn := first(heaparray)
  END;

  chophead = 
  PRE heaparray /= <>
  THEN 
    IF size(heaparray) = 1
    THEN heaparray := <>
    ELSE heaparray := [last(heaparray)] ^ front(tail(heaparray))
    END
  END;

  append(nn) =
  PRE nn : NAT
  THEN heaparray := heaparray ^ [nn]
  END;

ff,jj <-- siftdown(ii) =
  PRE ii : 1..size(heaparray)
  THEN
  SELECT size(heaparray) < 2*ii 
    THEN ff := 1 || jj := ii
  WHEN size(heaparray) = 2*ii
    THEN IF heaparray(2*ii) < heaparray(ii) 
         THEN heaparray := heaparray <+ {ii|->heaparray(2*ii), 2*ii |-> heaparray(ii)} || jj := 2*ii || ff := 1
         ELSE jj := ii || ff := 1
         END
  WHEN size(heaparray) > 2*ii
    THEN 
    SELECT
      heaparray(ii) = min({heaparray(ii), heaparray(2*ii), heaparray(2*ii+1)}) 
      THEN ff := 1 || jj := ii
    WHEN 
      heaparray(2*ii) = min({heaparray(ii), heaparray(2*ii), heaparray(2*ii+1)})
      THEN heaparray := heaparray <+ {ii|->heaparray(2*ii), 2*ii |-> heaparray(ii)} || jj := 2*ii || ff := 0
    WHEN 
      heaparray(2*ii+1) = min({heaparray(ii), heaparray(2*ii), heaparray(2*ii+1)})
      THEN heaparray := heaparray <+ {ii|->heaparray(2*ii+1), 2*ii+1 |-> heaparray(ii)} || jj := 2*ii+1 || ff := 0
    END
  END
  END;

siftup(ii) =
  PRE ii : 2..size(heaparray)
  THEN IF heaparray(ii/2) > heaparray(ii)
       THEN heaparray := heaparray <+ {ii/2 |-> heaparray(ii), ii|->heaparray(ii/2)}
       END
  END


END

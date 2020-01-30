MACHINE Robot0
SETS State = {vid,occ}
VARIABLES dt0
INVARIANT 
  dt0 : {vid, occ}
INITIALISATION
          dt0 := vid
OPERATIONS
          Chgt = SELECT dt0 = vid THEN dt0:=occ END;
          Dchgt = SELECT dt0 = occ THEN dt0:=vid END;
          arr_p = skip
END
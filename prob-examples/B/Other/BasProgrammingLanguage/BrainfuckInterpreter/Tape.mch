MACHINE Tape
VARIABLES data, data_pointer
INVARIANT
  data : INTEGER +-> INTEGER & data_pointer : INTEGER
INITIALISATION
  data_pointer := 0 || data := {}
OPERATIONS
  inc_data_pointer =
    data_pointer := data_pointer + 1;

  dec_data_pointer =
    data_pointer := data_pointer - 1;

  inc_data =
    IF data_pointer : dom(data) THEN
      data := data <+ {data_pointer |-> data(data_pointer) + 1}
    ELSE
      data := data <+ {data_pointer |-> 1}
    END;

  dec_data =
    IF data_pointer : dom(data) THEN
      data := data <+ {data_pointer |-> data(data_pointer) - 1}
    ELSE
      data := data <+ {data_pointer |-> -1}
    END;

  d <-- cur_data =
    IF data_pointer : dom(data) THEN
      d := data(data_pointer)
    ELSE
      d := 0
    END

END

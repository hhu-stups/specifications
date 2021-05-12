MACHINE BFInterpreter
DEFINITIONS
 "LibraryIO.def";
INCLUDES
  Tape
SETS
  STATUS = {not_initialised, no_bf_loaded, bf_loaded}
CONSTANTS
  input_file, valid_commands
PROPERTIES
  input_file : STRING & 
  input_file = "~/repositories/probprivate/public_examples/B/BasProgrammingLanguage/BrainfuckInterpreter/examples/helloworld.bf" &
  valid_commands = {43,45,46,60,62,91,93}
VARIABLES pc, loop_positions, bf_prog, cur_status, error
INVARIANT
  pc : NATURAL & loop_positions : seq(INTEGER) & bf_prog : seq(valid_commands) & cur_status : STATUS & error : BOOL
INITIALISATION
  pc := 1 || loop_positions := [] || bf_prog := {} || cur_status := not_initialised || error := FALSE
OPERATIONS
  start =
    PRE cur_status = not_initialised & not(error = TRUE) THEN
      SEE(input_file) || cur_status := no_bf_loaded
    END;
  read =
    PRE cur_status = no_bf_loaded & not(error = TRUE) THEN
      VAR c,m IN
        c := GET_CODE(input_file);
        m := 2000; /* max length of programm. variant? */
        WHILE c /= -1 DO
          IF c : valid_commands THEN
            bf_prog := bf_prog <- c
          END;
          m := m - 1;
          c := GET_CODE(input_file)
        INVARIANT c:INTEGER
        VARIANT m
        END;
        SEEN(input_file);
        cur_status := bf_loaded
      END
    END;

  interpreter_step =
    PRE cur_status = bf_loaded & pc : dom(bf_prog) & not(error = TRUE) THEN
      VAR on_tape IN
        on_tape <-- cur_data;
        CASE bf_prog(pc) OF
        EITHER 43 THEN /* "+": increment data at pointer position */
          inc_data
        OR 45 THEN /* "-": decrement data at pointer position */
          dec_data
        OR 46 THEN /* ".": write character */
  	  PRINTF("~w", on_tape)
        OR 60 THEN /* "<": decrement data pointer */
          dec_data_pointer
        OR 62 THEN /* ">": increment data pointer */
  	  inc_data_pointer
        OR 91 THEN /* opening square bracket, marks start of loop */
          IF on_tape = 0 THEN
            /* jump over loop */
            WHILE bf_prog(pc) /= 93 DO
              pc := pc + 1
            INVARIANT pc : INTEGER
            VARIANT max(dom(bf_prog)) - pc
            END
          ELSE
            /* remember pc, for jumping back */
            loop_positions := loop_positions <- pc
          END
        OR 93 THEN /*  closing square bracket, end of loop, jump back? */
          IF on_tape /= 0 THEN
            pc := last(loop_positions)
          ELSE
            loop_positions := front(loop_positions)
          END
        ELSE
          error := TRUE
        END
      END;
      pc := pc + 1
    END END

END
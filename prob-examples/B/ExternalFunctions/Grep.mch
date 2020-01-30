MACHINE Grep
DEFINITIONS
 "LibraryRegex.def";
 "LibraryStrings.def";
 "LibraryIO.def"
CONSTANTS
  txt
PROPERTIES
  //txt = READ_FILE_AS_STRING("txt/goethe_faust_kapitel3.txt")
  txt = READ_FILE_AS_STRING("txt/mobydick.txt")
VARIABLES ptr, nrmatches, strings
INVARIANT ptr:NATURAL1 & nrmatches:NATURAL & strings <: STRING
INITIALISATION ptr := 1 || nrmatches := 0 || strings := {}
OPERATIONS
   res,idx <-- next_match = VAR mtch IN
      mtch :=  REGEX_SEARCH(txt,ptr,"\bf[a-z]+");
      IF mtch'position > 0 THEN
         ptr := mtch'position+mtch'length||
         nrmatches := nrmatches + 1 ||
         strings := strings \/ {mtch'string}
      END;
      res := mtch;
      idx := ptr
   END
END

/*
probcli Grep.mch -execute 10000
% Runtime for -execute: 4950 ms (with gc: 5230 ms, walltime: 5360 ms)
>>> strings
Expression Value =
#758:{"fa","fable",...,"future","futures"}

>>> REGEX_SEARCH_ALL(txt,"f[a-z]+")
Expression Value =
#11203:{(1|->"ff"),(2|->"find"),...,(11202|->"five"),(11203|->"finale")}
>>> $
% Type: expr : seq(STRING) [Card=inf]
% Eval Time: 50030 ms (50680 ms walltime) + Normalisation: 0 ms (0 ms walltime) + State expansion: 0 ms walltime

*/

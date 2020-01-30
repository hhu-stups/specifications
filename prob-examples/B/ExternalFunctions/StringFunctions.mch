MACHINE StringFunctions
SETS
 ID={aa,bb}
CONSTANTS mystrings, app, len, files, dir
PROPERTIES
 mystrings = {"A","abc", "AA", "hello", "world"} &
  app: STRING * STRING --> STRING &
  len: STRING --> INTEGER&
  len = %x.(x:STRING|STRING_LENGTH(x)) &
  app = %(x,y).(x:STRING & y:STRING|STRING_APPEND(x,y)) &
  files : STRING --> POW(STRING) &
  files = %(x).(x:STRING|FILES(x)) &
  dir : STRING --> POW(STRING) &
  dir = %(x).(x:STRING|DIRECTORIES(x))
DEFINITIONS
 "LibraryStrings.def";
 FILES(x) == files(x);
 EXTERNAL_FUNCTION_FILES == (STRING --> POW(STRING));
 DIRECTORIES(x) == dir(x);
 EXTERNAL_FUNCTION_DIRECTORIES == (STRING --> POW(STRING));
 EXTERNAL_PREDICATE_DIRECTORY_EXISTS == (STRING);
 DIRECTORY_EXISTS(A) == (A=A)
VARIABLES xx, cur_dir
INVARIANT
 xx:STRING & cur_dir:STRING & DIRECTORY_EXISTS(cur_dir)
ASSERTIONS
  len("abc") = 3;
  len("hello") = 5;
  !(x,y).(x:mystrings & y:mystrings => len(app(x,y)) = len(x)+len(y)); /* this did find a counter-example in atom_length of
   SICStus: dif(X,1), atom_length(a,X) finds a solution in SICStus 4.2.0 */
  app("A","A") = "AA"
INITIALISATION xx:: mystrings || cur_dir := "."
OPERATIONS
 r <-- Len = BEGIN r:= len(xx) END;
 App(s) = PRE s:mystrings THEN xx := app(s,xx) END;
 CurrentFile(f) = PRE f:files(cur_dir) THEN skip END;
 ChangeDir(d) = PRE d:dir(cur_dir) THEN cur_dir := d END
END


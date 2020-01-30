MACHINE SearchForFile
USES LibraryFiles, LibraryStrings, LibraryMath
DEFINITIONS
  target == "sicstus";
  GOAL == (found=TRUE);
  SET_PREF_MAX_OPERATIONS == 256;
  Invisible(x) == #fname.(append(".",fname)=x);
  Visible(x) == not(Invisible(x));
  Ext == %x.(x:STRING|last(split(x,".")));
 EXTERNAL_FUNCTION_TIMESTAMP == INTEGER*INTEGER*INTEGER*INTEGER*INTEGER*INTEGER --> INTEGER;
 TIMESTAMP(Year,Month,Day,Hour,Min,Sec) == 0
VARIABLES cur, found
INVARIANT
 cur : STRING & found : BOOL
INITIALISATION cur :="/usr/local" || found := FALSE
OPERATIONS
 r <-- Found = PRE target : files(cur) THEN r := cur || found := TRUE END;
 NavigateInto(x) = PRE x:full_directories(cur) THEN cur := x END;
 Created(file,y,m,d,hr,mn,sc) = PRE file : full_files(cur) & 
  TIMESTAMP(y,m,d,hr,mn,sc) = file_created(file) THEN skip END /*;
 IsFile(f) = PRE f:files(cur) THEN skip END */
END

/*

Sample Eval... queries:
{y|length(y)=3 & y:Ext[files(".")]}
Ext[{y|y:files(".") & Visible(y)}]

{y|y:files(".") & Invisible(y)} --> y is captured by #y !!


equality_in_not_exists(y,b(function(b(value(closure([x,y,_lambda_result_],[string,string,string],b(equal(b(identifier(_lambda_result_),string,[]),b(external_function_call(STRING_APPEND,[b(identifier(x),string,[nodeid(pos(857,4,11,54,11,54))]),b(identifier(y),string,[nodeid(pos(858,4,11,56,11,56))])]),string,[])),pred,[]))),set(couple(couple(string,string),string)),[nodeid(pos(14,1,7,23,7,28)),loc(local,dummy(uses),concrete_constants),origin([included/LibraryStrings])]),b(couple(b(string(.),string,[nodeid(pos(15,1,7,30,7,32))]),b(identifier(y),string,[nodeid(pos(16,1,7,34,7,34))])),couple(string,string),[nodeid(pos(13,1,7,23,7,35))])),string,[contains_wd_condition,nodeid(pos(13,1,7,23,7,35))]))

{y|y:files(".") & #z.(append(".",z)=y)}
{y|y:files(".") & not(#z.(append(".",z)=y))}

*/


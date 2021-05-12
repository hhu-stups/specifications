MACHINE TestLibraryRegexp
DEFINITIONS
 "LibraryRegex.def";
 "LibraryStrings.def";
 "LibraryIO.def"
ABSTRACT_CONSTANTS
  match,
  expand
PROPERTIES
  match = %(pat).(pat:STRING | %s.(s:STRING | bool(REGEX_MATCH(s,pat))))
  &
  expand = {x,r | x:STRING & #(z).(z:{"a","z","ä"} & r= x^z)}
ASSERTIONS

  // This external predicate checks if a string matches a regular expression pattern.
  REGEX_MATCH("abc","[a-z]+");
  not(REGEX_MATCH("abc1","[a-z]+"));
  REGEX_MATCH("123.45","[^a-zA-Z]+");
  not(REGEX_MATCH("1e9","[^a-zA-Z]+"));
  REGEX_MATCH("abc","(a|b|c)*");
  not(REGEX_MATCH("abcd","(a|b|c)*"));
  {"abc","12","", "0", "9900", "1e"} <| match("[0-9]*") =
  {"abc"|->FALSE,"12"|->TRUE,""|->TRUE, "0"|->TRUE, "9900"|->TRUE, "1e"|->FALSE};
  {"123","11"," 1",""} <| match("[0-9]+") |> {TRUE} = {("11"|->TRUE),("123"|->TRUE)};
  ({"123","11"," 1",""} <| match("[0-9]+"))~[{TRUE}] = {"123","11"};

 // This external predicate checks if a string is a valid regular expression pattern.
  IS_REGEX("ab[0-9]");
  not(IS_REGEX("ab["));
  not(IS_REGEX("ab[0-9"));
  // not(IS_REGEX("ab[0-9]]")); strangely this is currently accepted as pattern

 // This external function searches for the **first** occurence of a pattern in a string.
 // Type: STRING * STRING --> STRING.
  REGEX_SEARCH_STR("abcdef000234daf","[1-9][0-9]*") = "234";
  REGEX_SEARCH_STR("abcdef000234daf","[[:alpha:]]+") = "abcdef";
  REGEX_SEARCH_STR("abcdef000234daf","[[:alpha:]]+$") = "daf";
  REGEX_SEARCH_STR("0123","[[:alpha:]]+") = "";

  // This external function searches for the first occurence of a pattern in a string and
  // returns full information about the match: position, length, match and sub-matches.
  // It also expects an index at which to start the search; which can be useful for writing loops to find all matches.
  // Type: STRING * INTEGER * STRING --> struct(position:INTEGER,length:INTEGER,string:STRING,submatches:seq(STRING)).
  REGEX_SEARCH("abcdef000234daf",1,"[[:alpha:]]+") =
       rec(length:6,position:1,string:"abcdef",submatches:{});
  REGEX_SEARCH("abcdef000234daf",7,"[[:alpha:]]+") =
       rec(length:3,position:13,string:"daf",submatches:{});
  REGEX_SEARCH("abcdef000234daf",1,"([1-9])([0-9]*)") =
       rec(length:3,position:10,string:"234",submatches:{(1|->"2"),(2|->"34")});
  REGEX_SEARCH("0123",1,"[[:alpha:]]+") =
       rec(length:-1,position:-1,string:"",submatches:{}); // negative index in case no match found
  REGEX_SEARCH("000234daf",1,"([0-9])([0-9]*)") =
       rec(length:6,position:1,string:"000234",submatches:{(1|->"0"),(2|->"00234")});
  REGEX_SEARCH("xx000234daf",1,"([0-9])([0-9]*)") =
       rec(length:6,position:3,string:"000234",submatches:{(1|->"0"),(2|->"00234")});
  REGEX_SEARCH("xx000234daf",6,"([0-9])([0-9]*)") =
       rec(length:3,position:6,string:"234",submatches:{(1|->"2"),(2|->"34")});

  // This external function searches for **all** occurences of a pattern in a string and
  // returns the matched strings as a B sequence. It always starts to match at the beginning.
  // Type: $STRING * STRING --> seq(STRING)$.
  REGEX_SEARCH_ALL("abcdef000234daf567","([1-9])([0-9]*)") =
       ["234","567"];
  REGEX_SEARCH_ALL("abcdef000234daf567","([0-9])") =
       ["0","0","0","2","3","4","5","6","7"];
  REGEX_SEARCH_ALL("0123","[[:alpha:]]+") =
       {}; // empty set if no match
  REGEX_SEARCH_ALL("abcd00 xdd fsdf002","[a-z]+[0-9]*") =
       ["abcd00","xdd","fsdf002"];

 // This external function replaces all occurences of a pattern in a string by a given replacement string.
 // Type: STRING * STRING * STRING --> STRING
  REGEX_REPLACE("1abd00abc2","([a-z]+).*?([a-z]+)","xx$2$1xx") = "1xxabcabdxx2";
  REGEX_REPLACE("a01b23c4d56","[0-9]+","NUM") = "aNUMbNUMcNUMdNUM";
  REGEX_REPLACE("a01b23c4d56","[^0-9]+","X") = "X01X23X4X56";
  REGEX_REPLACE("ab12cd34","[0-9]+","($0)") = "ab(12)cd(34)"; // use $0 to refer to full match


  // requires parser version at least 2.9.15:
  REGEX_SEARCH_STR("192x69x2x1","(\d+)x(\d+)x(\d+)x(\d+)") = "192x69x2x1";

  // lookahead using (?=sub)
  REGEX_SEARCH("abc-defg-hi:jkl",1,"[[:alpha:]]+(?=:)")'string = "hi";
  // negative lookahead using (?!sub)
  REGEX_SEARCH("abc-defg-hi:jkl",1,"[[:alpha:]]+(?![-a-z])")'string = "hi";
  // use backreference
  REGEX_SEARCH("abc-dede-hi:jkl",1,"([[:alpha:]]+)\1")'string = "dede"

  ; // UNICODE STUFF

  REGEX_SEARCH_STR("üabcd-23[]","[[:alpha:]]") = "ü";
  REGEX_SEARCH_STR("üabcd-23[]",".") = "ü";
  REGEX_SEARCH_STR("üabcd-23[]","[x]") = "";
  REGEX_SEARCH_STR("üabcd-23[x]","[x]") = "x";
  REGEX_MATCH("ü",".");
  REGEX_MATCH("üaé","...");
  REGEX_MATCH("ü","[[:alpha:]]");
  REGEX_MATCH("ü","[ü]");
  not(REGEX_MATCH("ü","[x]"));
  not(REGEX_MATCH("ü","[a-z]")); // fails when std::regex_constants::collate is used on Linux/Windows
  REGEX_REPLACE("aäbz+A","[a-z]",".") = ".ä..+A"; // ditto
  REGEX_SEARCH("üabcd-23[]",1,"[x]")'length <0;
  REGEX_SEARCH("üabcd-23[]",1,"[[:alpha:]]") =
     rec(length:1,position:1,string:"ü",submatches:{});
  REGEX_SEARCH_ALL("üabcd-23[x]","[x]") = ["x"];
  REGEX_REPLACE("üabcd-23[x]","[x]","XX") = "üabcd-23[XX]";
  REGEX_REPLACE("üabcd-23[x]","[[:alpha:]]","*") = "*****-23[*]";

  // use the expand function to generate more unicode tests
  !n.(n:1..4 => !x.(x:iterate(expand,n)[{""}] => REGEX_MATCH(x,"[[:alpha:]]+$")));
  !n.(n:1..4 => !x.(x:iterate(expand,n)[{""}] => not(REGEX_MATCH(x^"0","[[:alpha:]]+$"))))
VARIABLES mystr, myboolstr
INVARIANT mystr : STRING & myboolstr : STRING
INITIALISATION mystr := "abc" || myboolstr := "01010"
OPERATIONS
   res <-- matches(pat) = PRE pat : {"[a-z]+", "[a-z0-9]+", "[^0-9]+"} THEN
     res := bool(REGEX_MATCH(mystr,pat))
  END;
  add_char(c) = PRE c : {"z","9","-"} THEN
     mystr := mystr ^ c
  END;
  replace = BEGIN mystr := REGEX_REPLACE(mystr,"[^a-z]","") END;

  // from Brett Stevens, Aaron Williams. The Coolest Way to Generate Binary Strings
  cyclic_enum = VAR res IN
                   res := REGEX_SEARCH(myboolstr,2,"10([01]*)");
                   IF res'position>0 THEN
                      // insert myboolstr(1) after first "10"
                      myboolstr := SUB_STRING(myboolstr,2,res'position-2) ^ "10" ^
                                   SUB_STRING(myboolstr,1,1) ^ res'submatches(1)
                   ELSE // insert myboolstr(1) inverted at end
                      res := REGEX_SEARCH(myboolstr,1,"^([01])([01]*)");
                      IF res'submatches(1) = "0" THEN
                         myboolstr := res'submatches(2) ^ "1"
                      ELSE
                         myboolstr := res'submatches(2) ^ "0"
                      END
                   END
                END
END

/*
let txt = READ_FILE_AS_STRING("txt/goethe_faust_kapitel3.txt")
ran(REGEX_SEARCH_ALL(txt,"[a-zA-Züäö]+!"))
{x,y|x:{"a","b","c","d","e","f"} & y=REGEX_SEARCH_FIRST(txt,""^x^"[a-zA-Züäö]+")}
{x,y|x:{"a","b","c","d","e","f"} & y=REGEX_SEARCH_ALL(txt,"\b"^x^"[a-zA-Züäö]+")}

>>> REGEX_SEARCH(txt,1,"frei[a-z]*")
Expression Value =
rec(length:4,position:3922,string:"frei",submatches:{})
>>> $
% Type: expr : struct(length:INTEGER, position:INTEGER, string:STRING, submatches:seq(STRING)) [Card=inf]
% Eval Time: 0 ms (10 ms walltime) + Normalisation: 0 ms (0 ms walltime) + State expansion: 0 ms walltime

>> let txt = READ_FILE_AS_STRING("txt/mobydick.txt")
>>> REGEX_SEARCH(txt,1,"frei[a-z]+")
Expression Value =
rec(length:7,position:589616,string:"freight",submatches:{})
>>> $
% Type: expr : struct(length:INTEGER, position:INTEGER, string:STRING, submatches:seq(STRING)) [Card=inf]
% Eval Time: 620 ms (620 ms walltime) + Normalisation: 0 ms (0 ms walltime) + State expansion: 0 ms walltime
>>> SUB_STRING(txt,589616,20)
Expression Value =
"freight for a craft "

REGEX_SEARCH_ALL(txt,"\b(ze[a-z]*|zone|zodiac)")

does not work yet:
>>> REGEX_SEARCH_ALL(txt,"[xyz][a-z]*")
Expression Value =
["önt","ären","ärke","ünden","äumt","üssen","ärenlauf","ürme","ütend","zendes","ärke","ünden","öhnlich","zeih","ze","öhnt","ächte","ß","zum","ättst","öhnt","ß","zu","ürd","ättst","zu","äg","äbt","zu","zuklagen","zlich","ürwahr","ärung","ßt","önsten","öchste","äh","ühren","ß","ärtner","äumchen","ünt","üt","ünft","zieren","ße","zu","ühren","ür","zu","ze","überlassen","ühr","ämt","ßt","ßt","ür","zu","ühmte","ßt","zur","ätigkeit","zu","zu","zt","ß","öttersöhne","öne","ßt","zengel","zu","üte","zu","übsch","ßen","zu"]

>>> REGEX_SEARCH_STR("küssen","[ü]")
Expression Value =
"ü"
*/

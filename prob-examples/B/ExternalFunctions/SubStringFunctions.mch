MACHINE SubStringFunctions
SETS
 ID={aa,bb}
CONSTANTS mystrings,string_contains_substring
PROPERTIES
  mystrings = {"A","abc", "AA", "hello", "world", "abcdefghijklmnopqrstuvwxyz"} &
  string_contains_substring =
   %s1,s2.(s1 : STRING & s2 : STRING |
     bool(
       #sq1,sq2,i.(
         sq1 = STRING_CHARS(s1)
         & sq2 = STRING_CHARS(s2)
         & i: 1..(size(sq1) - size(sq2) + 1 )
         & (%ii.(ii : i..(i + size(sq2)) | ii-i+1);sq2) <: sq1
       )
     )
   )
DEFINITIONS
 "LibraryStrings.def"
 // EXTERNAL_FUNCTION_STRING_CONTAINS_STRING == (STRING*STRING)--> BOOL;
 // STRING_CONTAINS_STRING(arg1,arg2)==FALSE
 // TRUE when arg2 occurs as contiguous substring in arg1
ASSERTIONS
  STRING_CONTAINS_STRING("abc","a") = TRUE;
  STRING_CONTAINS_STRING("abc","b") = TRUE;
  STRING_CONTAINS_STRING("abc","c") = TRUE;
  STRING_CONTAINS_STRING("abc","d") = FALSE;
  STRING_CONTAINS_STRING("abc","") = TRUE;
  STRING_CONTAINS_STRING("abc","abc") = TRUE;
  STRING_CONTAINS_STRING("abc","bc") = TRUE;
  {x|x:mystrings & STRING_CONTAINS_STRING("AabcD",x)=TRUE} = {"A","abc"};
  STRING_CONTAINS_STRING("abcdefghijklmnopqrstuvwxyz","z") = TRUE;
  STRING_CONTAINS_STRING("abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz","zz") = FALSE;

  {x|x:mystrings & string_contains_substring("AabcD",x)=TRUE} = {"A","abc"};
  string_contains_substring("abcdefghijklmnopqrstuvwxyz","z") = TRUE;
  string_contains_substring("abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz","zz") = FALSE
END


MACHINE TestLibraryStrings
DEFINITIONS
 "LibraryStrings.def"
SETS
   cdv = {cdv_a, cdv_b, cdv_c, cdv_d};
   sig = {sig_1, sig_2, sig_3}
ASSERTIONS
   STRING_TO_ENUM("cdv_a") = cdv_a;
   STRING_TO_ENUM("sig_3") = sig_3;
   !x.(x:cdv => STRING_TO_ENUM(TO_STRING(x)) = x);
   STRINGIFY(cdv) = "cdv";
   STRINGIFY(sig) = "sig";
   STRINGIFY(cdv_c) = "cdv_c";
   INT_TO_HEX_STRING(0) = "0";
   INT_TO_HEX_STRING(15) = "f";
   INT_TO_HEX_STRING(16) = "10";
   INT_TO_HEX_STRING(254) = "fe";
   INT_TO_HEX_STRING(-254) = "-fe";

   STRINGIFY("a") = "\"a\"";
   STRINGIFY("abc\nef") = "\"abc\\nef\"";  // we correctly pretty print newline as \n
   STRING_LENGTH("abc\nef")=6;
   STRINGIFY("abc\\nef") = "\"abc\\\\nef\""; // we correctly print \ n  as \\n
   STRING_LENGTH("abc\\nef")=7;
   STRING_LENGTH("abc\\\ef")=7;
   STRINGIFY("abc\\\ef") = "\"abc\\\\\ef\"";
   STRING_TO_UPPER("abcdzABCDZ") = "ABCDZABCDZ";
   STRING_TO_UPPER("abcdz+äö-ABCDZ") = "ABCDZ+AO-ABCDZ";
   STRING_TO_UPPER("ÄÖ") = "AO";
   STRING_TO_LOWER("abcdz+äö-ABCDZ") = "abcdz+ao-abcdz"
END

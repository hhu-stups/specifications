MACHINE TestSuffixWithReverse
SEES
    LibraryStrings
DEFINITIONS
  "LibraryStrings.def";

  prefix1(module_nom,fichier_nom) == rev(chars(module_nom)) <: rev(chars(fichier_nom));
  prefix2(module_nom,fichier_nom) ==
        length(module_nom) <= length(fichier_nom) &
        !(ii).(ii : dom(chars(module_nom))
            => chars(module_nom)(ii) = chars(fichier_nom)(ii + length(fichier_nom) - length(module_nom)          )
        );
  pre1 == {mm,ff|{mm,ff} <:  {"cat", "c" } & prefix1(mm,ff)}
CONSTANTS
  m,f
PROPERTIES
  {m,f} <:  {"cat", "c" } &
  prefix1(m,f) &
 btrue
ASSERTIONS
 m = f; // here only solutions are m=f
 pre1 = { ("c","c"), ("cat","cat")};
 pre1 = {mm,ff|{mm,ff} <:  {"cat", "c" } & prefix2(mm,ff)};
 {mm,ff|{mm,ff} <:  {"abc", "cat", "c" } & prefix1(mm,ff)} = {mm,ff|{mm,ff} <:  {"abc","cat", "c" } & prefix2(mm,ff)}
END

/*

Previous version had residue error

! An error occurred (source: add_trans_id) !
! Residue:  root:'$setup_constants':[(... : ...,...,...),(... : ...,... : ...),... : ...|...]

*/

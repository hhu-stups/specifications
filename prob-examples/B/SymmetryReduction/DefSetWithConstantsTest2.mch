MACHINE DefSetWithConstantsTest2 /* unsatisfiable example ; times-out without static symmetry detection */
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 4; SET_PREF_TIME_OUT == 9000
SETS
 ID; Enum = {e1,e2}
CONSTANTS aa,bb,cc,dd,ee,ff,gg,hh,ii, f
PROPERTIES
  aa:ID & bb:ID & cc:ID & dd:ID & ee:ID & ff:ID & gg:ID & hh:ID & ii : ID &
/*  bb/=cc & */
  card(ID) = 5 &
  f : ID -->> ID &
  !x.(x:ID => f(x) /= x) &
  (aa /= bb or aa /= dd) &
  (bb /= ee or bb /= ff) &
  (cc /= ff or cc /= gg) &
  (dd /= ff or dd /= gg) &
  (dd /= gg or dd /= hh) &
  (ee /= gg or ee /= hh) &
  (aa /= gg or aa /= hh) &
  (aa = gg or aa = hh) &
  (aa = gg or ee = gg) &
  (aa = hh or ee = gg) &
  (aa = gg or ee = hh) &
  card(f[{aa,bb,cc}]) = card(f[{dd,ee,ff,gg,hh,ii}]) &
  card(f[{aa,bb,ee}]) = card(f[{dd,aa,bb,gg,hh,ee}]) &
  card(f[{aa,bb,ff}]) > card(f[{dd,cc,bb,gg,hh,ee}])

END


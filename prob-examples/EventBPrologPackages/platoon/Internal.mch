
MACHINE platoon1_prob
SETS /* enumerated */
  Vehicles={vh1,vh2,vh3}
CONCRETE_CONSTANTS
  Plane,
  coord,
  make,
  xcoord,
  ycoord,
  dist,
  dmin,
  sqrt
PROPERTIES
    make = id(INTEGER * INTEGER)
  & Plane = INTEGER * INTEGER
  & /* @plane:axm2  */ coord = make~
  & /* @plane:axm3  */ xcoord = (coord ; %(z_,z__).(z_ : INTEGER & z__ : INTEGER|z_))
  & /* @plane:axm4  */ ycoord = (coord ; %(z_,z__).(z_ : INTEGER & z__ : INTEGER|z__))
  & /* @space_prob:axm3  */ dmin : NATURAL1
  & /* @space_prob:axm2  */ dist = %(p1,p2).(p1 : INTEGER * INTEGER & p2 : INTEGER * INTEGER|sqrt((xcoord(p1) - xcoord(p2)) ** 2 + (ycoord(p1) - ycoord(p2)) ** 2))
  & /* @space_prob:axm7  */ card(Vehicles) >= 2
  & /* @space_prob:prob_dmin  */ dmin = 8
  & /* @square_root:axm1  */ sqrt = {x,y|x : NATURAL & (y : NATURAL & (y * y <= x & (y + 1) * (y + 1) > x))}


END

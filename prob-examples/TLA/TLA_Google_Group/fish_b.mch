
MACHINE fish
DEFINITIONS ENUM1 == People; ENUM2 == Colors; ENUM3 == Pets; ENUM4 == Beverages; ENUM5 == Cigarettes
SETS /* enumerated */
  People={Brit,Swede,Dane,Norwegian,German};
  Colors={white,yellow,blue,red,green};
  Pets={birds,cats,dogs,horses,fish};
  Beverages={tea,coffee,milk,beer,water};
  Cigarettes={Pall_Mall,Dunhill,Marlboro,Winfield,Rothmans}
CONCRETE_CONSTANTS
  livesin,
  painted,
  keeps,
  drinks,
  smokes,
  keepsTheFish
PROPERTIES
    livesin : ENUM1 +-> INTEGER
  & painted : INTEGER +-> ENUM2
  & keeps : ENUM1 +-> ENUM3
  & drinks : ENUM1 +-> ENUM4
  & smokes : ENUM1 +-> ENUM5
  & livesin : {Brit,Swede,Dane,Norwegian,German} --> 1 .. 5
  & keeps : {Brit,Swede,Dane,Norwegian,German} --> {birds,cats,dogs,horses,fish}
  & drinks : {Brit,Swede,Dane,Norwegian,German} --> {tea,coffee,milk,beer,water}
  & smokes : {Brit,Swede,Dane,Norwegian,German} --> {Pall_Mall,Dunhill,Marlboro,Winfield,Rothmans}
  & painted : 1 .. 5 --> {white,yellow,blue,red,green}
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (p1 /= p2 => livesin(p1) /= livesin(p2)))
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (p1 /= p2 => keeps(p1) /= keeps(p2)))
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (p1 /= p2 => drinks(p1) /= drinks(p2)))
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (p1 /= p2 => smokes(p1) /= smokes(p2)))
  & !(c1,c2).(c1 : 1 .. 5 & c2 : 1 .. 5 => (c1 /= c2 => painted(c1) /= painted(c2)))
  & !(h).(h : 1 .. 5 => (painted(h) = red => livesin(Brit) = h))
  & keeps(Swede) = dogs
  & drinks(Dane) = tea
  & !(h1,h2).(h1 : 1 .. 5 & h2 : 1 .. 5 => (painted(h1) = green & painted(h2) = white => h1 = h2 - 1))
  & !(p,h).(p : {Brit,Swede,Dane,Norwegian,German} & h : 1 .. 5 => (painted(h) = green & livesin(p) = h => drinks(p) = coffee))
  & !(p).(p : {Brit,Swede,Dane,Norwegian,German} => (smokes(p) = Pall_Mall => keeps(p) = birds))
  & !(p,h).(p : {Brit,Swede,Dane,Norwegian,German} & h : 1 .. 5 => (smokes(p) = Dunhill & painted(h) = yellow => livesin(p) = h))
  & !(p).(p : {Brit,Swede,Dane,Norwegian,German} => (livesin(p) = 3 => drinks(p) = milk))
  & livesin(Norwegian) = 1
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (smokes(p1) = Marlboro & keeps(p2) = cats => livesin(p2) : {livesin(p1) - 1,livesin(p1) + 1}))
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (keeps(p1) = horses & smokes(p2) = Dunhill => livesin(p2) : {livesin(p1) - 1,livesin(p1) + 1}))
  & !(p).(p : {Brit,Swede,Dane,Norwegian,German} => (smokes(p) = Winfield => drinks(p) = beer))
  & smokes(German) = Rothmans
  & !(p).(p : {Brit,Swede,Dane,Norwegian,German} => (painted(livesin(p)) = blue => livesin(p) : {livesin(Norwegian) - 1,livesin(Norwegian) + 1}))
  & !(p1,p2).(p1 : {Brit,Swede,Dane,Norwegian,German} & p2 : {Brit,Swede,Dane,Norwegian,German} => (smokes(p1) = Marlboro & drinks(p2) = water => livesin(p2) : {livesin(p1) - 1,livesin(p1) + 1}))
  & keeps(keepsTheFish) = fish
INITIALISATION
    skip
/* DEFINITIONS
  PREDICATE TheDaneDrinksTea
  EXPRESSION Cigarettes
  PREDICATE ThePersonWhoSmokesPallMallRearsBirds
  PREDICATE TheYellowHouseOwnerSmokesDunhill
  EXPRESSION Pets
  PREDICATE Constraints
  PREDICATE Neighbor
  PREDICATE FuncsAreOnto
  PREDICATE ThePersonWhoKeepsHorsesLivesNextToThePersonWhoSmokesDunhill
  PREDICATE TheSwedeKeepsDogsAsPets
  PREDICATE TheGreenHouseIsOnTheLeftOfTheWhiteHouse
  EXPRESSION Houses
  EXPRESSION Beverages
  PREDICATE TheGreenHousesOwnerDrinksCoffee
  PREDICATE TheGermanSmokesRothmans
  PREDICATE ThePersonWhoSmokesMarlboroHasNeighborWhoDrinksWater
  EXPRESSION Colors
  PREDICATE TheNorwegianLivesNextToTheBlueHouse
  PREDICATE ThePersonWhoSmokesWinfieldDrinksBeer
  PREDICATE TheNorwegianLivesInTheFirstHouse
  PREDICATE ThePersonWhoSmokesMarlboroLiveNextToTheOneWhoKeepsCats
  PREDICATE TheManLivingInTheCenterHouseDrinksMilk
  PREDICATE TheBritLivesInTheRedHouse
  PREDICATE TypeOK
  EXPRESSION People */
END

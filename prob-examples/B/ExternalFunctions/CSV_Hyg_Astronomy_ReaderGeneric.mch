MACHINE CSV_Hyg_Astronomy_ReaderGeneric
/* read the Astronomy Star CSV database http://astronexus.com/ */
DEFINITIONS
 EXTERNAL_FUNCTION_READ_CSV(T) == STRING * BOOL * BOOL --> T;
 READ_CSV(file,skip1,extra) == {};
 EXTERNAL_FUNCTION_READ_CSV_STRINGS == STRING --> seq(CSV_ELement_Type);
 CSV_ELement_Type == STRING +-> STRING ;
 READ_CSV_STRINGS(file) == {};
 EXTERNAL_FUNCTION_DEC_STRING_TO_INT == STRING * INTEGER --> INTEGER;
 DEC_STRING_TO_INT(str,precision) == 0;
 SET_PREF_TIME_OUT == 18000;
 SkipLine1 == TRUE;
 AllowExtraLines == FALSE;
 StarID == NATURAL \/ {-1};
 Parsec == "3.262" // Lightyears
CONSTANTS hyg, dist, mag, name
PROPERTIES

 hyg : seq(CSV_ELement_Type) &
              
 /* load version 1.1 of database with 87475 stars */
 hyg = READ_CSV_STRINGS("CSV/hygfull.csv") &
 
 dist = %i.(i:dom(hyg)|DEC_STRING_TO_INT(hyg(i)("Distance"),1)) &
 
 mag = %i.(i:dom(hyg)|DEC_STRING_TO_INT(hyg(i)("Mag"),1)) &

 name = {i,n|i:dom(hyg) & ("ProperName"|->n) : hyg(i) }
ASSERTIONS
 /* Names of stars within 2 parsecs */
 dom({s,d|d:dist~[1..20] & "ProperName"|->s : hyg(d)}) = 
 {"Barnard's Star","Proxima Centauri","Rigel Kentaurus A","Rigel Kentaurus B"};
 
 card(hyg) = 87475;
 
 /* Check Rounding: */
  dom({s,d|d:dist~[13..13] & s=hyg(d)("Distance")}) =
  {"1.29478331801173","1.34749097181049"};

 /* compute closest named stars (until 4 parsecs) */
(name~ ; (dist |> (1..40) ))~ =
  {(13|->"Proxima Centauri"),(13|->"Rigel Kentaurus A"),
   (13|->"Rigel Kentaurus B"),(18|->"Barnard's Star"),
   (25|->"Lalande 21185"),(26|->"Sirius"),
   (33|->"Lacaille 9352"),(35|->"Procyon"),
   (38|->"Luyten's Star"),(39|->"Kapteyn's Star"),
   (39|->"Lacaille 8760"),(40|->"Kruger 60")}
END

/*

StarID: The database primary key from a larger "master database" of stars.

HD: The star's ID in the Henry Draper catalog, if known.

HR: The star's ID in the Harvard Revised catalog, which is the same as its number in the Yale Bright Star Catalog.

Gliese: The star's ID in the third edition of the Gliese Catalog of Nearby Stars.

BayerFlamsteed: The Bayer / Flamsteed
designation, from the Fifth Edition of the Yale Bright Star Catalog. This is a combination of the two designations. The Flamsteed number, if present, is given first; then a three-letter abbreviation for the Bayer Greek letter; the Bayer superscript number, if present; and finally, the three-letter constellation abbreviation. Thus Alpha Andromedae has the field value "21Alp And", and Kappa1 Sculptoris (no Flamsteed number) has "Kap1Scl".

RA, Dec: The star's right ascension and declination, for epoch 2000.0. Stars present only in the Gliese Catalog, which uses 1950.0 coordinates, have had these coordinates precessed to 2000.

ProperName: A common name for the star, such as "Barnard's Star" or "Sirius". I have taken these names primarily from the Hipparcos project's web site, which lists representative names for the 150 brightest stars and many of the 150 closest stars. I have added a few names to this list. Most of the additions are designations from catalogs mostly now forgotten (e.g., Lalande, Groombridge, and Gould ["G."]) except for certain nearby stars which are still best known by these designations.

Distance: The star's distance in parsecs, the most common unit in astrometry. To convert parsecs to light years, multiply by 3.262. A value of 10000000 indicates missing or dubious (e.g., negative) parallax data in Hipparcos.

Mag: The star's apparent visual magnitude.

AbsMag: The star's absolute visual magnitude (its apparent magnitude from a distance of 10 parsecs).

Spectrum: The star's spectral type, if known.

ColorIndex: The star's color index (blue magnitude - visual magnitude), where known.

*/
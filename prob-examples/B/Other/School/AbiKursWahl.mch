MACHINE AbiKursWahl
SETS
  Fächer = {Mathematik,
             Deutsch, Englisch, Französisch, Spanisch, Lateinisch,
             Physik, Chemie, Biologie, Informatik,
             Geschichte, Sozialwissenschaften, Geographie, Philosophie, // Psychologie
             Musik, Kunst, Sport, Religionslehre}
CONSTANTS
  Sprachen, Fremdsprachen, Naturwissenschaften,
  GesellschaftsFeld
PROPERTIES
  Fremdsprachen = { Englisch, Französisch, Spanisch, Lateinisch} ∧
  Sprachen = {Deutsch} ∪ Fremdsprachen ∧
  Naturwissenschaften = {Physik, Chemie, Biologie, Informatik} ∧
  GesellschaftsFeld = {Geschichte, Sozialwissenschaften, Geographie, Philosophie}
VARIABLES
  Abifächer
INVARIANT
  Abifächer ⊆ Fächer ∧
  card(Abifächer) ≤ 4
INITIALISATION
  Abifächer := ∅
DEFINITIONS
  Abiregel2_NW(AF) == AF /\ ({Mathematik} \/ Naturwissenschaften) ≠ {};
  Abiregel2_G(AF) == AF /\ GesellschaftsFeld ≠ {};
  Abiregel3(AF) == AF /\ Sprachen ≠ {};
  Abiregel4(AF) ==
    (Mathematik ∈ AF ∧ (Deutsch ∈ AF ∨ Fremdsprachen ∩ AF ≠ ∅)) or
    (Deutsch ∈ AF ∧ Fremdsprachen ∩ AF ≠ ∅);
  AlleRegeln(AF) == Abiregel2_NW(AF) & Abiregel2_G(AF) & Abiregel3(AF) & Abiregel4(AF)
OPERATIONS
  AddAbiturFach(Fach) = PRE Fach /: Abifächer & card(Abifächer) < 4 THEN
     Abifächer := Abifächer \/ {Fach}
  END;
  Vervollständige(Wahl) = PRE Wahl <: Fächer & Wahl /\ Abifächer = {} &
         card(Wahl) + card(Abifächer) = 4 & AlleRegeln(Abifächer \/ Wahl) THEN
      Abifächer := Abifächer \/ Wahl
  END;
  res <-- Regel2_NW = IF Abiregel2_NW(Abifächer) THEN res := "OK" ELSE res := "Das mathematisch-naturwissenschaftlich-technische Aufgabenfeld muss abgedeckt werden" END;
  res <-- Regel2_G = IF Abiregel2_G(Abifächer) THEN res := "OK" ELSE res := "Das gesellschaftswissenschaftliche Aufgabenfeld muss abgedeckt werden" END;
  res <-- Regel3 = IF Abiregel3(Abifächer) THEN res := "OK" ELSE res := "Das sprachlich-literaisch-künstlerische Aufgabenfeld kann nur durch das Fach Deutsch oder eine Fremdsprache abgedeckt werden" END;
  res <-- Regel4 =
   IF Abiregel4(Abifächer) THEN  res := "OK"
   ELSE  res := "Unter den vier Abiturfächern müssen zwei der folgenden Fächer sein∈ eine Fremdsprache, Deutsch, Mathematik."
   END
END

// https://www.schulministerium.nrw.de/docs/Schulsystem/Schulformen/Gesamtschule/Kontext/Broschuere_zur_gymnasialen_Oberstufe_2012_13.pdf

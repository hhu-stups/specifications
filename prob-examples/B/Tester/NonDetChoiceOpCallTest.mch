MACHINE NonDetChoiceOpCallTest
INCLUDES NonDetChoicesOpViewTest
VARIABLES zz
INVARIANT
 zz:ID
INITIALISATION zz:=iv
OPERATIONS
  ChooseCall1 = ChooseNonDet1;

  ChooseCall6 = BEGIN zz::{aa,cc} || ChooseNonDet6 END
END


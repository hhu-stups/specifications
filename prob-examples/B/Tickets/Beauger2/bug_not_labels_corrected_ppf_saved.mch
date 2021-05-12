
MACHINE bug_not_labels_corrected_ppf
CONCRETE_CONSTANTS
  aa
PROPERTIES
    aa : INTEGER
  & aa = 0
  & /* @PLABEL_1  */ aa = 0
  & /* @PLABEL_2  */ (
     not(aa = 1)
     =>
     aa < 2
    )
  & /* @PLABEL_3  */ aa < 3
ASSERTIONS
     /* @LABEL_1  */ aa = 1
     &
     /* @LABEL_2  */ (
      not(aa = 1)
      =>
      aa = 2
     )
     &
     /* @LABEL_3  */ aa = 3
INITIALISATION
    skip
END

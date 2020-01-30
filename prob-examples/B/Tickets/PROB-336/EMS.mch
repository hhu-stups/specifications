MACHINE EMS

SETS

USER; UNIT; ROLES = {admin, teacher, student, headmasster, student_guardian}; PERMISSIONS = {addMark, editMark, deleteMark, viewMark, postFeedback, signFinalReport}

 
VARIABLES 
 hasTheRole, performs, studentsList, staffList, headmaster, teachers, 
 studentGuardian, studies, taughtBy, hisGuardian, submissionMark, 
 inClassMark, examMark, manages

INVARIANT
 performs : ROLES <-> PERMISSIONS &
 hasTheRole : USER -->> ROLES &
 
 studentsList <: USER &
 staffList <: USER &
 studentsList /\ staffList = {} &
 studentGuardian <: USER &
 studentGuardian /\ studentsList = {} &
 studentGuardian /\ staffList = {} &

 headmaster <: staffList &
 card(headmaster) <= 1 &
 teachers <: staffList &
 headmaster /\ teachers = {} &
 studies : studentsList <-> UNIT &
 taughtBy : UNIT -->> teachers &
 manages : headmaster <-> studentsList &
 hisGuardian : studentsList -->> studentGuardian &
 submissionMark : studentsList <-> NATURAL &
 inClassMark : studentsList --> NATURAL &  
 examMark : studentsList <-> NATURAL 
 
INITIALISATION 
 hasTheRole, performs, studentsList, staffList, headmaster, teachers, 
 studentGuardian, studies, taughtBy, hisGuardian, submissionMark, 
 inClassMark, examMark, manages := {},{},{},{},{},{},{},{}, {},{},{},{},{},{}


END


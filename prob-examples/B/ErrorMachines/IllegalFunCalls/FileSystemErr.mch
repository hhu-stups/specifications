MACHINE FileSystem
/* Aufgabe:
  - Directories (Verzeichnisse)
  - Files (Dateien)
  - beide haben Namen
  - es gibt ein root Verzeichnis
  
  OPERATIONS 
    NewFolder(parentDir,Name)
    NewFile(parentDir,Name)
    path <-- GetPath(file)
    Delete(folder oder file)
 */
 
SETS Names  = {sbin,usr,make,ls,eps} 
    ; 
     FilesFolders = {d0,d1,d2,d3,f0,f1,f2,f3,f4,f5,f6,f7}
CONSTANTS
   Folders, Files, root, empty
PROPERTIES
   Folders <: FilesFolders & Files <: FilesFolders &
   Folders \/ Files = FilesFolders &
   Folders /\ Files = {} &
   root : Folders &
   empty : Names &
   /* for animation */
   card(Files)>2 &
   card(Folders)>2 &
   Folders = {d0,d1,d2,d3} &
   root = d0 &
   empty = eps
DEFINITIONS 
   active == (dom(parent) \/ {root});
   NonEmptyNames == (Names - {empty});
   SET_PREF_MAX_OPERATIONS == 35
VARIABLES
   parent,name
INVARIANT
   parent: FilesFolders +-> Folders &
   name: active --> Names &
   !vz.(vz:Folders => !(o1,o2).(o1|->vz:parent & o2|->vz:parent & o1/=o2 =>  name(o1)/=name(o2) )) &
   dom(parent) = active-{root}
INITIALISATION
   parent := {} ||
   name := {root|-> empty}
OPERATIONS
   NewFolder(parentDir,newname)  =
     PRE parentDir:Folders & parentDir : active &
             newname:NonEmptyNames &
             newname /: name[parent~[{parentDir}]] THEN
       ANY obj WHERE obj:Folders & obj /: active THEN
         parent := parent \/ {obj |-> parentDir} ||
         name(obj) := newname
       END
   END;

   NewFile(parentDir,newname)  =
     PRE parentDir:Folders & parentDir : active &
             newname:NonEmptyNames &
             newname /: name[parent~[{parentDir}]] THEN
       ANY obj WHERE obj:Files & obj /: active THEN
         parent := parent \/ {obj |-> parentDir} ||
         name(obj) := newname
       END
   END;
   Delete(df) = PRE df:active & df /= root & parent~[{df}] = {}  THEN
       parent :=  {df} <<| parent ||
       name := {df} <<| name
   END;
   path <-- GetPath(ff) = PRE ff:FilesFolders & ff:active  /* SHOULD BE active-{root}, otherwise parent below undefined */
                           THEN
       ANY ss WHERE ss: iseq1(Folders) & 
                    ss(1) = root &
                    parent(ff) = last(ss) &
                    !i.(i:1..size(ss)-1 => ss(i+1) |-> ss(i) : parent) 
              THEN
           path := (ss;name)
       END
   END
END

MACHINE alloytranslation
DEFINITIONS "LibraryIO.def";
 // SET_PREF_SMT == TRUE; SET_PREF_SOLVER_STRENGTH == 100;
  GOAL == (card({p|p : Male & p |-> actor : jobs}) = 1
      & card({p|p : Male & p |-> nurse : jobs}) = 1
      & !c_0.(c_0 : Male => card((husband~)[{c_0}]) <= 1)
      & husband[(jobs~)[{chef}]] = (jobs~)[{telephone_operator}]
      & {boxer} /<: jobs[{Roberta}]
      & jobs[{Pete}] <: Job - QualifiedJob
      & card((jobs~)[{chef}] \/ {Roberta} \/ (jobs~)[{police_officer}]) = 3)
SETS /* deferred */
  Person;
  Job
CONCRETE_CONSTANTS
  Female,
  husband,
  Male,
  Roberta,
  Thelma,
  Steve,
  Pete,
  jobs,
  QualifiedJob,
  nurse,
  teacher,
  police_officer,
  chef,
  guard,
  telephone_operator,
  actor,
  boxer
/* PROMOTED OPERATIONS
  run0 */
PROPERTIES
  //
  // observe(husband) & observe(jobs) &
 // GOAL &

    husband : Female +-> Male
  & Roberta : Female
  & Thelma : Female
  & Steve : Male
  & Pete : Male
  & jobs /= {}
  & !this.(this : Person => card(jobs[{this}]) = 2)
  & nurse : QualifiedJob
  & teacher : QualifiedJob
  & police_officer : QualifiedJob

  & !(p,p_).(card({p} \/ {p_}) = 2 & 1=1 /* LEQ_SYM_BREAK(p,p_) */ => jobs[{p}] /\ jobs[{p_}] = {})
  & !(p,p_).(p:Person & p /= p_ => jobs[{p}] /\ jobs[{p_}] = {})
  & !(p,j).(p|->j:jobs => !p_.( p /= p_  => p_|->j/:jobs))

  & card({p|p : Male & p |-> actor : jobs}) = 1
  & card({p|p : Male & p |-> nurse : jobs}) = 1
  & !c_0.(c_0 : Male => card((husband~)[{c_0}]) <= 1)
  & husband[(jobs~)[{chef}]] = (jobs~)[{telephone_operator}]
  & {boxer} /<: jobs[{Roberta}]
//  & jobs[{Pete}] /<: QualifiedJob
  & jobs[{Pete}] <: Job - QualifiedJob
  & card((jobs~)[{chef}] \/ {Roberta} \/ (jobs~)[{police_officer}]) = 3
  & (Job = {boxer}\/{actor}\/{telephone_operator}\/{guard}\/{chef}\/QualifiedJob & {boxer}/\{actor} = {} & {boxer}/\{telephone_operator} = {} & {boxer}/\{guard} = {} & {boxer}/\{chef} = {} & {boxer}/\QualifiedJob = {} & {actor}/\{telephone_operator} = {} & {actor}/\{guard} = {} & {actor}/\{chef} = {} & {actor}/\QualifiedJob = {} & {telephone_operator}/\{guard} = {} & {telephone_operator}/\{chef} = {} & {telephone_operator}/\QualifiedJob = {} & {guard}/\{chef} = {} & {guard}/\QualifiedJob = {} & {chef}/\QualifiedJob = {})
  & card(Job) >= 5
  & (QualifiedJob = {police_officer}\/{teacher}\/{nurse} & {police_officer}/\{teacher} = {} & {police_officer}/\{nurse} = {} & {teacher}/\{nurse} = {})
  & card(QualifiedJob) = 3
  & (Male = {Pete}\/{Steve} & {Pete}/\{Steve} = {})
  & card(Male) = 2
  & (Female = {Thelma}\/{Roberta} & {Thelma}/\{Roberta} = {})
  & card(Female) = 2
  & (Person = Male\/Female & Male/\Female = {})
  & card(Person) >= 0


//card((jobs~)[{chef}] \/ {Roberta} \/ (jobs~)[{police_officer}]) = 3
// from the above we can conclude:
&
 Roberta|-> chef /: jobs &
 Roberta|-> police_officer /: jobs &
 (jobs~)[{chef}] /= (jobs~)[{police_officer}] &

 Roberta |->guard:jobs & Roberta|->teacher:jobs & Pete|->actor:jobs &
  Pete|->telephone_operator:jobs & Steve|->nurse:jobs & Steve |-> police_officer:jobs


ASSERTIONS
  (TRUE:BOOL)
INITIALISATION
    skip
OPERATIONS
  run0 =
    PRE
        !(p,p_).(card({p} \/ {p_}) = 2 & 1=1 /* LEQ_SYM_BREAK(p,p_) */ => jobs[{p}] /\ jobs[{p_}] = {})
      & card({p|p : Male & p |-> actor : jobs}) = 1
      & card({p|p : Male & p |-> nurse : jobs}) = 1
      & !c_0.(c_0 : Male => card((husband~)[{c_0}]) <= 1)
      & husband[(jobs~)[{chef}]] = (jobs~)[{telephone_operator}]
      & {boxer} /<: jobs[{Roberta}]
      & jobs[{Pete}] <: Job - QualifiedJob
      & card((jobs~)[{chef}] \/ {Roberta} \/ (jobs~)[{police_officer}]) = 3
    THEN
      skip
    END
/* DEFINITIONS
  PREDICATE solve; */
END


/*

jobs
Nr        prj1      prj2
1         Roberta   nurse
2         Roberta   chef
3         Steve     guard
4         Thelma    actor
5         Thelma    police_officer
6         Roberta   chef
7         _ ...
+-+-+-+-+-+-+-+-+-+-+-+- BACKTRACKING jobs el ->  (6):FULL = rec(value:(Roberta|->chef),full:{(Roberta|->nurse),(Roberta|->chef),(Steve|->guard),(Thelma|->actor),(Thelma|->police_officer),(Roberta|->chef),...})
+-+-+-+-+-+-+-+-+-+-+-+-  1 ms (walltime; total 5924 ms)
[hash 890058770056899694] % time_out_for_node(root,unspeci


*/

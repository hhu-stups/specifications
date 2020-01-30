MACHINE SlotToolSolver_Inconsistency
/* check that ProB quickly finds inconsistency; depends on correctly expanding universal
 quantifiers before full enumeration of GroupChoice has occured */
DEFINITIONS
 ANIMATION_FUNCTION_DEFAULT == {r,c,i| r=0 & c:DAYS & c=i};
 ANIMATION_FUNCTION == {r,c,i| r:ran(time) & c:DAYS & TimeTable~[{mk_slot(c,r)}]=i}
SETS
    COURSES = {angef,angkf,geref,gerkf,gesef,geskf,infef,japef,japkf,jidef,judef,judkf,komef,linef,polef,romef,romkf,sozef};
    SLOTS = {a1,a2,a3,a4,a5, b1,b2,b3,b4,b5, c1,c2,c3,c4,c5, d1,d2,d3,d4,d5, e1,e2,e3,e4,e5, f1,f2,f3,f4,f5,  unknown};
    DAYS = {Mon,Tue,Wed,Thu,Fri}
CONSTANTS KF, EF, KF_EF_Combinations, day, time, mk_slot,
          Data, SemData, Units, Modules,
          course_units, course_modules, Module_Units, module_max_group, module_min_group,
          cur_semester, choice_modules, module_group_units,
          TimeTable, GroupChoice
PROPERTIES
    KF = {angkf, gerkf, geskf, japkf, judkf, romkf} & /* Die Kernfaecher */
    EF = {angkf |-> angef, gerkf |-> geref, geskf |-> gesef, japkf |-> japef, judkf |-> judef, romkf |-> romef} & /* direkte Ergaenzungsfaecher */
    

    KF_EF_Combinations = {kf,ef | kf:KF & ef: COURSES & ef /: (KF \/ {EF(kf)}) } 

   
   & day = {a1 |-> Mon, b1|->Mon, c1|->Mon, d1|->Mon, e1|->Mon, f1|->Mon,
            a2 |-> Tue, b2|->Tue, c2|->Tue, d2|->Tue, e2|->Tue, f2|->Tue,
            a3 |-> Wed, b3|->Wed, c3|->Wed, d3|->Wed, e3|->Wed, f3|->Wed,
            a4 |-> Thu, b4|->Thu, c4|->Thu, d4|->Thu, e4|->Thu, f4|->Thu,
            a5 |-> Fri, b5|->Fri, c5|->Fri, d5|->Fri, e5|->Fri, f5|->Fri }
   & time = {a1 |-> 1, b1|->2, c1|->3, d1|->4, e1|->5, f1|->6,
             a2 |-> 1, b2|->2, c2|->3, d2|->4, e2|->5, f2|->6,
             a3 |-> 1, b3|->2, c3|->3, d3|->4, e3|->5, f3|->6,
             a4 |-> 1, b4|->2, c4|->3, d4|->4, e4|->5, f4|->6,
             a5 |-> 1, b5|->2, c5|->3, d5|->4, e5|->5, f5|->6 }
   &
    mk_slot = {d,t,s|d:DAYS & t:ran(time) & s:SLOTS & day(s)=d & time(s)=t}
   &
   /* The Data: should only include entries for the kf units; the ef field indicates whether the course has to be taken for the ef course */
   Data = [
     rec(course:japkf,semester:1,slot:a1,module:1,group:1, info:"Japanisch I", ef:TRUE),
     rec(course:japkf,semester:1,slot:a2,module:1,group:1, info:"Japanisch I", ef:TRUE),
     rec(course:japkf,semester:1,slot:a4,module:2,group:0, info:"Einfuehrung", ef:FALSE), /* if we set a5 to a4 then some enumeration seems to take place before universal quantifier expanded !! */
     rec(course:japkf,semester:1,slot:a3,module:1,group:2, info:"Japanisch I", ef:TRUE),
     rec(course:japkf,semester:1,slot:b2,module:1,group:2, info:"Japanisch I", ef:TRUE),
     
     rec(course:geskf,semester:1,slot:a4,module:3,group:0, info:"Test", ef:TRUE)
     ]
     &
     cur_semester = 1 /* the semester for which we do the analysis */
     &
     /* now just the Data for the current semester */

     SemData = { i,m  | (i,m):Data & m'semester = cur_semester}

     
     &
     Units = dom(SemData)
     &
     Modules = {i | #u.(u:Units & Data(u)'module=i & Data(u)'semester = cur_semester) }
     &
     Module_Units = {m,u | m:Modules & u:Units & SemData(u)'module=m}
     
     /* mapping COURSES to its Units: */
     & course_units = {c,u | c:COURSES & u:Units & SemData(u)'course = c}
     /* mapping COURSES to its Modules: */
     & course_modules = {c,m | c:KF & m:Modules & #u.(u:course_units[{c}] & SemData(u)'module = m)} \/
                        {c,m | c:ran(EF) & m:Modules & #u.(u:course_units[{EF~(c)}] & SemData(u)'module = m & SemData(u)'ef=TRUE)}
     
     & module_min_group = {m,g | m:Modules & g = min({gg| #u.(u:Module_Units[{m}] & SemData(u)'group=gg) }) }
     & module_max_group = {m,g | m:Modules & g = max({gg| #u.(u:Module_Units[{m}] & SemData(u)'group=gg) }) }
     
     & module_group_units = {m,g,u | m:Modules & u: Units & SemData(u)'group=g & SemData(u)'module=m}
     
     &
     /* The time table: assignment of modules to time slots */
     TimeTable : Units --> SLOTS \ {unknown} &
     
     /* if a slot is provided in the data, then use it : */
     !m.(m:Units & Data(m)'slot /= unknown => TimeTable(m)=Data(m)'slot)
     
    
    &
    /* given kf,ef: for which modules do we have to make choices */
    choice_modules = {kf,ef,md | kf|->ef : KF_EF_Combinations & md : course_modules[{kf,ef}]}
    
    & /* given a particular allowed KF,EF combination : find a choice for the groups */
    GroupChoice : choice_modules --> INTEGER  &
    !(kf,ef,md).( (kf,ef,md):choice_modules
       =>
         (GroupChoice((kf,ef,md)) >= module_min_group(md) &  
          GroupChoice((kf,ef,md)) <= module_max_group(md) )
      ) 
      
     & /* within a module and group: there should be no conflicts */
    !(m,g). (m : Modules &  g : module_min_group(m)..module_max_group(m)
                => 
                    !(u_1,u_2). (u_1: module_group_units[{(m,g)}] &
                                 u_2: module_group_units[{(m,g)}] & 
                                /*  SemData(u_1)'course = SemData(u_2)'course & */
                                 u_1 < u_2
                      =>  
                               TimeTable(u_1) /= TimeTable(u_2)
                    )
             )

    & /* for every combination of kf,ef: there must be no conflict of modules */
    !(kf,ef). ( kf|->ef : KF_EF_Combinations & kf=japkf & ef = gesef
       =>
             !(m1,m2). (m1 : course_modules[{kf,ef}] &  
                        m2 : course_modules[{kf,ef}] & m1<m2
                =>
                    !(u1,u2). (u1: module_group_units[{(m1,GroupChoice((kf,ef,m1)))}] & 
                               u2: module_group_units[{(m2,GroupChoice((kf,ef,m2)))}] & u1<u2
                      =>
                       TimeTable(u1) /= TimeTable(u2)
                    )
             )
       
    )
    & 
    1=1
END
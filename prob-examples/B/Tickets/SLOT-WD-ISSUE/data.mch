/* vim: set syntax=B : */
/* Machine generated: 2016-09-01T09:31:59.763+02:00
/* Model generator version: 4.0.0-SNAPSHOT */
/* Database information: */
/* schema_version: v6.0 */
/* generator: mincer-2.0.0-SNAPSHOT */
/* name: Philosophische Fakultät der Heinrich-Heine-Universität */
/* short-name: test */

MACHINE data
DEFINITIONS
  "LibraryIO.def";
  "LibraryStrings.mch";
  XML_ELement_Type == struct(
                        recId: NATURAL1,
                        pId:NATURAL,
                        element:STRING,
                        attributes: STRING +-> STRING,
                        meta: STRING +-> STRING);
  EXTERNAL_FUNCTION_READ_XML == (STRING * STRING) --> seq(XML_ELement_Type);
  READ_XML(file, encoding) == {};
SETS
    TYPES={m,e};
    DAYS = {mon, tue, wed, thu, fri, sat, sun};
    SLOTS = {
        slot1,slot2,slot3,slot4,slot5,slot6,slot7,slot8};
    SEMESTERS = {
        sem1,sem2,sem3,sem4,sem5,sem6};
    ABSTRACT_UNITS = {
        au1,au2,au3,au4,au5,au6,au7};
    UNITS = {
        unit1,unit2,unit3,unit4,unit5,unit6,unit7};
    GROUPS = {
        group1,group2,group3,group4,group5,group6,group7};
    SESSIONS = {
        session1,session2,session3,session4,session5,session6,session7};
    MODULES = {
        mod1,mod2,mod3,mod4,mod5,mod6}
CONSTANTS
    abstract_units,
    abstract_unit_unit,
    courses,
    course_names,
    course_modules,
    course_module_combinations,
    sessions,
    groups,
    units,
    meta_data,
    modules,
    module_abstract_unit_semester,
    module_abstract_unit_type,
    course_module_combination_data
PROPERTIES
    meta_data = { 
        ("schema_version", "v6.0"),
        ("generator", "mincer-2.0.0-SNAPSHOT"),
        ("name", "Philosophische Fakultät der Heinrich-Heine-Universität"),
        ("short-name", "test")
    }
    &
    modules : POW(MODULES * struct(idx:NATURAL1, name:STRING, key:STRING, credit_points:NATURAL \/ {-1}, title:STRING, pordnr:NATURAL, elective_units:NATURAL, mandatory:BOOL))
    &
    modules = { 
        (mod1 |-> rec(idx:1, name:"Mod 1", key:"M-1", credit_points:-1, title:"Unit Testing", pordnr:1, elective_units:0,  mandatory:FALSE)),
        (mod2 |-> rec(idx:2, name:"Mod 2", key:"M-2", credit_points:-1, title:"Integration Testing", pordnr:2, elective_units:0,  mandatory:FALSE)),
        (mod3 |-> rec(idx:3, name:"Mod 3", key:"M-3", credit_points:-1, title:"M3", pordnr:3, elective_units:0,  mandatory:FALSE)),
        (mod4 |-> rec(idx:4, name:"Mod 4", key:"M-4", credit_points:-1, title:"M4", pordnr:4, elective_units:0,  mandatory:FALSE)),
        (mod5 |-> rec(idx:5, name:"Mod 6", key:"M-6", credit_points:-1, title:"M6", pordnr:6, elective_units:0,  mandatory:FALSE)),
        (mod6 |-> rec(idx:6, name:"Mod 5", key:"M-5", credit_points:-1, title:"M5", pordnr:5, elective_units:0,  mandatory:FALSE))
    }
    &
    courses : POW(STRING * struct(idx:NATURAL1, name:STRING, long_name:STRING, degree:STRING, credit_points:NATURAL \/ {-1}, po:NATURAL1, kzfa:STRING))
    &
    courses = { 
        ("BK-TEST-H-2015" |-> rec(idx: 1, name: "BK-TEST-H-2015", long_name:"Testing Studies (bk h) PO:2015", credit_points:-1, degree:"bk", kzfa:"h", po:2015)),
        ("BK-TEST-N-2015" |-> rec(idx: 2, name: "BK-TEST-N-2015", long_name:"Testing Studies (Minor) (bk n) PO:2015", credit_points:-1, degree:"bk", kzfa:"n", po:2015)),
        ("BA-TEST-H-2015" |-> rec(idx: 3, name: "BA-TEST-H-2015", long_name:"Standalone (ba h) PO:2015", credit_points:-1, degree:"ba", kzfa:"h", po:2015)),
        ("BA-TEST-H-2014" |-> rec(idx: 4, name: "BA-TEST-H-2014", long_name:"Standalone (2014) (ba h) PO:2014", credit_points:-1, degree:"ba", kzfa:"h", po:2014))
    }
    &
    course_names : POW(dom(courses))
    &
    course_names = dom(courses)
    &
    course_module_combination_data = READ_XML("test-data.xml", "UTF-8") &  course_module_combination_data : seq(XML_ELement_Type)
    &
    course_module_combinations : course_names --> POW(POW(MODULES))
    &
    course_module_combinations =
      LET helper BE
        helper = UNION(x, y).((x,y) : course_module_combination_data & y'pId /= 0 |
        LET
            attrs
        BE
            attrs = y'attributes
        IN
            LET
                mods
            BE
                mods = ran(STRING_SPLIT(attrs("value"), ","))
            IN
                {(attrs("course") |-> UNION(n).(n : mods | {STRING_TO_ENUM(n)}))}
            END
        END)
      IN
        %(x).(x : course_names | helper[{x}])
      END
    &
    sessions : POW(SESSIONS * struct(duration:INTEGER, rhythm:INTEGER, dow:DAYS, slot:SLOTS))
    &
    sessions = { 
        (session1, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session2, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session3, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session4, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session5, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session6, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session7, rec(dow:mon, slot:slot3, rhythm:0, duration:2))
    }
    &
    groups : POW(GROUPS * struct(half_semester:0..2, sessions:POW(SESSIONS)))
    &
    groups = { 
        (group1, rec(half_semester:0,
                 sessions:{ session1 })),
        (group2, rec(half_semester:0,
                 sessions:{ session2 })),
        (group3, rec(half_semester:0,
                 sessions:{ session3 })),
        (group4, rec(half_semester:0,
                 sessions:{ session4 })),
        (group5, rec(half_semester:0,
                 sessions:{ session5 })),
        (group6, rec(half_semester:0,
                 sessions:{ session6 })),
        (group7, rec(half_semester:0,
                 sessions:{ session7 }))
    }
    &
    sessions = { 
        (session1, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session2, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session3, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session4, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session5, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session6, rec(dow:thu, slot:slot3, rhythm:0, duration:2)),
        (session7, rec(dow:mon, slot:slot3, rhythm:0, duration:2))
    }
    &
    abstract_units : POW(ABSTRACT_UNITS * struct(idx:NATURAL, title:STRING, key:STRING))
    &
    abstract_units = { 
        (au1, rec(idx:1, title:"Integration Testing 101", key:"AU-1")),
        (au2, rec(idx:2, title:"Integration Testing 101", key:"AU-2")),
        (au3, rec(idx:3, title:"AU3", key:"AU-3")),
        (au4, rec(idx:4, title:"AU4", key:"AU-4")),
        (au5, rec(idx:5, title:"AU7", key:"AU-7")),
        (au6, rec(idx:6, title:"AU5", key:"AU-5")),
        (au7, rec(idx:7, title:"AU6", key:"AU-6"))
    }
    &
    module_abstract_unit_semester : POW((MODULES * ABSTRACT_UNITS) * SEMESTERS)
    &
    module_abstract_unit_semester = { 
        (mod1, au1, sem1),
        (mod2, au2, sem1),
        (mod3, au3, sem2),
        (mod4, au4, sem2),
        (mod5, au5, sem2),
        (mod6, au6, sem2),
        (mod6, au7, sem2)
    }
    &
    module_abstract_unit_type : ((MODULES*ABSTRACT_UNITS)<->TYPES)
    &
    module_abstract_unit_type = { 
        (mod1, au1, m),
        (mod2, au2, m),
        (mod3, au3, m),
        (mod4, au4, m),
        (mod5, au5, m),
        (mod6, au6, m),
        (mod6, au7, m)
    }
    &
    units :  POW(UNITS * struct(idx:NATURAL1, key:STRING, semesters: POW(SEMESTERS), groups:POW(GROUPS), title:STRING))
    &
    units = { 
        (unit1, rec(idx:1, title:"Unit 1", key:"1", semesters:{ sem1 },
            groups:{ group1 })),
        (unit2, rec(idx:2, title:"Unit 2", key:"2", semesters:{ sem1 },
            groups:{ group2 })),
        (unit3, rec(idx:3, title:"Unit 3", key:"3", semesters:{ sem2 },
            groups:{ group3 })),
        (unit4, rec(idx:4, title:"Unit 4", key:"4", semesters:{ sem2 },
            groups:{ group4 })),
        (unit5, rec(idx:5, title:"Unit 5", key:"5", semesters:{ sem2 },
            groups:{ group5 })),
        (unit6, rec(idx:6, title:"Unit 6", key:"6", semesters:{ sem2 },
            groups:{ group6 })),
        (unit7, rec(idx:7, title:"Unit 7", key:"7", semesters:{ sem2 },
            groups:{ group7 }))
    }
    &
    abstract_unit_unit : POW(ABSTRACT_UNITS * UNITS)
    &
    abstract_unit_unit = { 
        (au1, unit1),
        (au2, unit2),
        (au3, unit3),
        (au4, unit4),
        (au5, unit7),
        (au6, unit5),
        (au7, unit6)
    }
    &
    course_modules : course_names --> POW(MODULES)
    &
    course_modules = { 
        ("BK-TEST-H-2015", { mod1 }),
        ("BK-TEST-N-2015", { mod2 }),
        ("BA-TEST-H-2015", { mod3,mod5,mod4 }),
        ("BA-TEST-H-2014", { mod6 })
    }
ASSERTIONS
  course_names = dom(course_module_combinations)
END

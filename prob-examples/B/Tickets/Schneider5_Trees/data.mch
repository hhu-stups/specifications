/* Machine generated: Wed Nov 18 11:08:30 CET 2015 */
/* Database information: */
/*  schema_version: v3.0 */
/*  generator: mincer-0.1.0-SNAPSHOT */


MACHINE data
/* TODO:
 * Decide how to select courses for checking (major and minor pairs, major only courses and/or major and focus area)
 *  - Build all pairs ahead of time
 *  - Choose to options
 *  - Provide a faculty configuration which things can be selected by the user
 * Add an assertion that all levels with modules are leaves
 * Generate docs along with data
 */
DEFINITIONS
 "LibraryIO.def";
 SEMESTERS==1..6;
SETS
    TYPES={m,e};
    DAYS = {mon, tue, wed, thu, fri, sat, sun}
CONSTANTS
    abstract_units,
    abstract_unit_unit_semester,
    courses,
    course_names,
    course_levels,
    course_modules,
    course_tree_leaves,
    LEVELS,
    level_modules,
    sessions,
    units,
    modules,
    module_abstract_unit_semester
PROPERTIES
    modules : POW(NATURAL1 * struct(idx:NATURAL1, name:STRING, title:STRING, pordnr:NATURAL, elective_units:NATURAL, mandatory:BOOL))
    &
    modules = {
        (1 |-> rec(idx:1, name:"Logik I", title:"Philosophische Propädeutik: Basismodul Logik 1", pordnr:34510, elective_units:0,  mandatory:TRUE)),
        (2 |-> rec(idx:2, name:"Grundlagen", title:"Philosophische Propädeutik: Basismodul Grundlagen", pordnr:34509, elective_units:0,  mandatory:FALSE)),
        (3 |-> rec(idx:3, name:"Erkenntnistheorie", title:"Theoretische Philosophie: Basismodul Erkenntnistheorie", pordnr:34513, elective_units:0,  mandatory:FALSE)),
        (4 |-> rec(idx:4, name:"Ontologie/Methaphysik", title:"Theoretische Philosophie: Basismodul Ontologie/Metaphysik", pordnr:34514, elective_units:0,  mandatory:FALSE)),
        (5 |-> rec(idx:5, name:"Ethik", title:"Praktische Philosophie: Basismodul Ethik", pordnr:34517, elective_units:0,  mandatory:FALSE)),
        (6 |-> rec(idx:6, name:"Politische Philosophie", title:"Praktische Philosophie: Basismodul Politische Philosophie", pordnr:34518, elective_units:0,  mandatory:FALSE)),
        (7 |-> rec(idx:7, name:"Antike", title:"Geschichte der Philosophie: Basismodul Antike", pordnr:34521, elective_units:0,  mandatory:FALSE)),
        (8 |-> rec(idx:8, name:"Mittelalter", title:"Geschichte der Philosophie: Basismodul Mittelalter", pordnr:34522, elective_units:0,  mandatory:FALSE)),
        (9 |-> rec(idx:9, name:"Neuzeit", title:"Geschichte der Philosophie: Basismodul Neuzeit", pordnr:34523, elective_units:0,  mandatory:FALSE)),
        (10 |-> rec(idx:10, name:"Gegenwart", title:"Geschichte der Philosophie: Basismodul Gegenwart", pordnr:34524, elective_units:0,  mandatory:FALSE)),
        (11 |-> rec(idx:11, name:"Logik II", title:"Philosophische Propädeutik: Basismodul Logik 2", pordnr:34511, elective_units:0,  mandatory:FALSE)),
        (12 |-> rec(idx:12, name:"Argumentation", title:"Philosophische Propädeutik: Basismodul Argumentation", pordnr:34512, elective_units:0,  mandatory:FALSE)),
        (13 |-> rec(idx:13, name:"Wissenschaftstheorie", title:"Theoretische Philosophie: Basismodul Wissenschaftstheorie", pordnr:34515, elective_units:0,  mandatory:FALSE)),
        (14 |-> rec(idx:14, name:"Sprachphilosophie", title:"Theoretische Philosophie: Basismodul Sprachphilosophie", pordnr:34516, elective_units:0,  mandatory:FALSE)),
        (15 |-> rec(idx:15, name:"Anthropologie/Kulturphilosophie", title:"Praktische Philosophie: Basismodul Anthropologie/Kulturphilosophie", pordnr:34519, elective_units:0,  mandatory:FALSE)),
        (16 |-> rec(idx:16, name:"Sozialphilosophie/Rechtsphilosophie", title:"Praktische Philosophie: Basismodul Sozialphilosophie/Rechtsphilosophie", pordnr:34520, elective_units:0,  mandatory:FALSE)),
        (17 |-> rec(idx:17, name:"Logik/Metalogik", title:"Aufbaumodul Logik/Metalogik", pordnr:34525, elective_units:0,  mandatory:FALSE)),
        (18 |-> rec(idx:18, name:"Ontologie/Metaphysik/Sprachphilosophie", title:"Aufbaumodul Ontologie/Metaphysik/Sprachphilosophie", pordnr:34526, elective_units:0,  mandatory:FALSE)),
        (19 |-> rec(idx:19, name:"Erkenntnistheorie/Wissenschaftstheorie", title:"Aufbaumodul Erkenntnistheorie/Wissenschaftstheorie", pordnr:34527, elective_units:0,  mandatory:FALSE)),
        (20 |-> rec(idx:20, name:"Anthropologie/Philosophie des Geistes", title:"Aufbaumodul Anthropologie/Philosophie des Geistes", pordnr:34528, elective_units:0,  mandatory:FALSE)),
        (21 |-> rec(idx:21, name:"Ethik", title:"Aufbaumodul Ethik", pordnr:34529, elective_units:0,  mandatory:FALSE)),
        (22 |-> rec(idx:22, name:"Kulturphilosophie/Sozialphilosophie", title:"Aufbaumodul Kulturphilosophie/Sozialphilosophie", pordnr:34530, elective_units:0,  mandatory:FALSE)),
        (23 |-> rec(idx:23, name:"Politische Philosophie/Rechtsphilosophie", title:"Aufbaumodul Politische Philosophie/Rechtsphilosophie", pordnr:34531, elective_units:0,  mandatory:FALSE))
    }
    &
    courses : POW(STRING*struct(idx:NATURAL1, name:STRING, long_name:STRING, degree:STRING, po:NATURAL1, kzfa:STRING))
    &
    courses = {
        ("bk-phi-H-2011" |-> rec(idx: 1, name: "bk-phi-H-2011", long_name:"Kernfach Philosophie (bk H) PO:2011", degree:"bk", kzfa:"H", po:2011)),
        ("bk-phi-H-2013" |-> rec(idx: 2, name: "bk-phi-H-2013", long_name:"Kernfach Philosophie (bk H) PO:2013", degree:"bk", kzfa:"H", po:2013)),
        ("bk-phi-N-2011" |-> rec(idx: 3, name: "bk-phi-N-2011", long_name:"Ergänzungsfach Philosophie (bk N) PO:2011", degree:"bk", kzfa:"N", po:2011)),
        ("bk-phi-N-2013" |-> rec(idx: 4, name: "bk-phi-N-2013", long_name:"Ergänzungsfach Philosophie (bk N) PO:2013", degree:"bk", kzfa:"N", po:2013)),
        ("ba-smp-H-2013" |-> rec(idx: 5, name: "ba-smp-H-2013", long_name:"Bachelor Sozialwissenschaften – Medien, Politik, Gesellschaft (ba H) PO:2013", degree:"ba", kzfa:"H", po:2013)),
        ("ba-smp-H-2011" |-> rec(idx: 6, name: "ba-smp-H-2011", long_name:"Bachelor Sozialwissenschaften – Medien, Politik, Gesellschaft (ba H) PO:2011", degree:"ba", kzfa:"H", po:2011)),
        ("bk-kom-N-2013" |-> rec(idx: 7, name: "bk-kom-N-2013", long_name:"Ergänzungsfach Kommunikations- und Medienwissenschaft (bk N) PO:2013", degree:"bk", kzfa:"N", po:2013)),
        ("bk-kom-N-2011" |-> rec(idx: 8, name: "bk-kom-N-2011", long_name:"Ergänzungsfach Kommunikations- und Medienwissenschaft (bk N) PO:2011", degree:"bk", kzfa:"N", po:2011))
    }
    &
    course_names : POW(STRING)
    &
    course_names = dom(courses)
    &
    sessions : POW(NATURAL1 * struct(duration:INTEGER, rhythm:INTEGER, dow:DAYS, slot:NATURAL1))
    &
    sessions = {
        (1, rec(dow:tue, slot:2, rhythm:0, duration:2)),
        (2, rec(dow:fri, slot:4, rhythm:0, duration:2)),
        (3, rec(dow:mon, slot:5, rhythm:0, duration:2)),
        (4, rec(dow:fri, slot:2, rhythm:0, duration:2)),
        (5, rec(dow:tue, slot:5, rhythm:0, duration:2)),
        (6, rec(dow:tue, slot:4, rhythm:0, duration:2)),
        (7, rec(dow:mon, slot:4, rhythm:0, duration:2)),
        (8, rec(dow:tue, slot:4, rhythm:0, duration:2)),
        (9, rec(dow:tue, slot:6, rhythm:0, duration:2)),
        (10, rec(dow:mon, slot:3, rhythm:0, duration:2)),
        (11, rec(dow:thu, slot:4, rhythm:0, duration:2)),
        (12, rec(dow:tue, slot:2, rhythm:0, duration:2)),
        (13, rec(dow:wed, slot:4, rhythm:0, duration:2)),
        (14, rec(dow:fri, slot:3, rhythm:0, duration:2)),
        (15, rec(dow:thu, slot:3, rhythm:0, duration:2)),
        (16, rec(dow:fri, slot:4, rhythm:0, duration:2)),
        (17, rec(dow:wed, slot:2, rhythm:0, duration:2)),
        (18, rec(dow:wed, slot:5, rhythm:0, duration:2)),
        (19, rec(dow:mon, slot:6, rhythm:0, duration:2)),
        (20, rec(dow:mon, slot:6, rhythm:0, duration:2)),
        (21, rec(dow:mon, slot:2, rhythm:0, duration:2)),
        (22, rec(dow:mon, slot:4, rhythm:0, duration:2)),
        (23, rec(dow:thu, slot:1, rhythm:0, duration:2)),
        (24, rec(dow:fri, slot:3, rhythm:0, duration:2)),
        (25, rec(dow:thu, slot:5, rhythm:0, duration:2)),
        (26, rec(dow:mon, slot:3, rhythm:0, duration:6)),
        (27, rec(dow:thu, slot:6, rhythm:0, duration:6)),
        (28, rec(dow:tue, slot:5, rhythm:0, duration:6)),
        (29, rec(dow:thu, slot:4, rhythm:0, duration:6)),
        (30, rec(dow:wed, slot:4, rhythm:0, duration:6)),
        (31, rec(dow:thu, slot:2, rhythm:0, duration:6)),
        (32, rec(dow:fri, slot:4, rhythm:0, duration:6)),
        (33, rec(dow:wed, slot:2, rhythm:0, duration:6)),
        (34, rec(dow:thu, slot:3, rhythm:0, duration:6)),
        (35, rec(dow:tue, slot:5, rhythm:0, duration:2)),
        (36, rec(dow:fri, slot:2, rhythm:0, duration:2)),
        (37, rec(dow:mon, slot:2, rhythm:0, duration:2)),
        (38, rec(dow:tue, slot:2, rhythm:0, duration:2)),
        (39, rec(dow:mon, slot:3, rhythm:0, duration:2)),
        (40, rec(dow:mon, slot:3, rhythm:0, duration:2)),
        (41, rec(dow:thu, slot:4, rhythm:0, duration:2)),
        (42, rec(dow:tue, slot:4, rhythm:0, duration:2)),
        (43, rec(dow:tue, slot:1, rhythm:0, duration:2)),
        (44, rec(dow:tue, slot:4, rhythm:0, duration:2)),
        (45, rec(dow:mon, slot:5, rhythm:0, duration:2))
    }
    &
    abstract_units : POW(NATURAL1 * struct(idx:NATURAL, title:STRING, key:STRING, type: TYPES))
    &
    abstract_units = {
        (1, rec(idx:1, title:"Logik I (Basisseminar)", key:"P-PHIL-L-BPPL1A", type:m)),
        (2, rec(idx:2, title:"Logik I (Übung)", key:"P-PHIL-L-BPPL1B", type:m)),
        (3, rec(idx:3, title:"Grundprobleme und Methoden der Philosophie (Basisseminar)", key:"P-PHIL-L-BPPGA", type:m)),
        (4, rec(idx:4, title:"Wissenschaftliche Arbeitstechniken (Übung)", key:"P-PHIL-L-BPPGB", type:m)),
        (5, rec(idx:5, title:"Erkenntnistheorie (Vorlesung)", key:"P-PHIL-L-BTPEA", type:e)),
        (6, rec(idx:6, title:"Erkenntnistheorie (Basisseminar)", key:"P-PHIL-L-BTPEB", type:e)),
        (7, rec(idx:7, title:"Ontologie/Metaphysik (Vorlesung)", key:"P-PHIL-L-BTPOMA", type:e)),
        (8, rec(idx:8, title:"Ontologie/Metaphysik (Basisseminar)", key:"P-PHIL-L-BTPOMB", type:e)),
        (9, rec(idx:9, title:"Ethik (Vorlesung)", key:"P-PHIL-L-BPPBEA", type:e)),
        (10, rec(idx:10, title:"Ethik (Basisseminar)", key:"P-PHIL-L-BPPBEB", type:e)),
        (11, rec(idx:11, title:"Politische Philosophie (Vorlesung)", key:"P-PHIL-L-BPPANA", type:e)),
        (12, rec(idx:12, title:"Politische Philosophie (Basisseminar)", key:"P-PHIL-L-BPPANB", type:e)),
        (13, rec(idx:13, title:"Antike (Vorlesung)", key:"P-PHIL-L-BGPAA", type:e)),
        (14, rec(idx:14, title:"Antike (Basisseminar)", key:"P-PHIL-L-BGPAB", type:e)),
        (15, rec(idx:15, title:"Mittelalter (Vorlesung)", key:"P-PHIL-L-BGPMA", type:e)),
        (16, rec(idx:16, title:"Mittelalter (Basisseminar)", key:"P-PHIL-L-BGPMB", type:e)),
        (17, rec(idx:17, title:"Neuzeit (Vorlesung)", key:"P-PHIL-L-BGPNA", type:e)),
        (18, rec(idx:18, title:"Neuzeit (Basisseminar)", key:"P-PHIL-L-BGPNB", type:e)),
        (19, rec(idx:19, title:"Gegenwart (Vorlesung)", key:"P-PHIL-L-BGPGA", type:e)),
        (20, rec(idx:20, title:"Gegenwart (Basisseminar)", key:"P-PHIL-L-BGPGB", type:e)),
        (21, rec(idx:21, title:"Logik II (Basisseminar)", key:"P-PHIL-L-BPPL2A", type:m)),
        (22, rec(idx:22, title:"Logik II (Übung)", key:"P-PHIL-L-BPPL2B", type:m)),
        (23, rec(idx:23, title:"Theorie des Argumentierens (Basisseminar)", key:"P-PHIL-L-BPPARA", type:m)),
        (24, rec(idx:24, title:"Praxis des Argumentierens (Übung)", key:"P-PHIL-L-BPPARB", type:m)),
        (25, rec(idx:25, title:"Wissenschaftstheorie (Vorlesung)", key:"P-PHIL-L-BTPWA", type:e)),
        (26, rec(idx:26, title:"Wissenschaftstheorie (Basisseminar)", key:"P-PHIL-L-BTPWB", type:e)),
        (27, rec(idx:27, title:"Sprachphilosophie (Vorlesung)", key:"P-PHIL-L-BTPSA", type:e)),
        (28, rec(idx:28, title:"Sprachphilosophie (Basisseminar)", key:"P-PHIL-L-BTPSB", type:e)),
        (29, rec(idx:29, title:"Anthropologie/Kulturphilosophie (Vorlesung)", key:"P-PHIL-L-BPPKA", type:e)),
        (30, rec(idx:30, title:"Anthropologie/Kulturphilosophie (Basisseminar)", key:"P-PHIL-L-BPPKB", type:e)),
        (31, rec(idx:31, title:"Sozialphilosophie/Rechtsphilosophie (Vorlesung)", key:"P-PHIL-L-BPPSA", type:e)),
        (32, rec(idx:32, title:"Sozialphilosophie/Rechtsphilosophie (Basisseminar)", key:"P-PHIL-L-BPPSB", type:e)),
        (33, rec(idx:33, title:"Logik (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BALMA", type:e)),
        (34, rec(idx:34, title:"Metalogik (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BALMB", type:e)),
        (35, rec(idx:35, title:"Ontologie/Metaphysik (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAOMSA", type:e)),
        (36, rec(idx:36, title:"Sprachphilosophie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAOMSB", type:e)),
        (37, rec(idx:37, title:"Erkenntnistheorie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAEWA", type:e)),
        (38, rec(idx:38, title:"Wissenschaftstheorie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAEWB", type:e)),
        (39, rec(idx:39, title:"Anthropologie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAAPGA", type:e)),
        (40, rec(idx:40, title:"Philosophie des Geistes (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAAPGB", type:e)),
        (41, rec(idx:41, title:"Ethik (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAEPA", type:e)),
        (42, rec(idx:42, title:"Ethik (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAEPB", type:e)),
        (43, rec(idx:43, title:"Kulturphilosophie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAKSA", type:e)),
        (44, rec(idx:44, title:"Sozialphilosophie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BAKSB", type:e)),
        (45, rec(idx:45, title:"Politische Philosophie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BATPA", type:e)),
        (46, rec(idx:46, title:"Rechtsphilosophie (Aufbauseminar oder Vorlesung)", key:"P-PHIL-L-BATPB", type:e))
    }
    &
    module_abstract_unit_semester : POW((dom(modules) * dom(abstract_units)) * SEMESTERS)
    &
    module_abstract_unit_semester = {
        (5, 10, 2),
        (14, 27, 4),
        (5, 9, 4),
        (3, 5, 1),
        (11, 22, 4),
        (22, 43, 5),
        (20, 40, 6),
        (6, 11, 3),
        (13, 25, 2),
        (5, 10, 4),
        (7, 13, 3),
        (15, 30, 3),
        (3, 6, 3),
        (16, 31, 3),
        (12, 24, 1),
        (11, 21, 1),
        (18, 35, 6),
        (5, 9, 1),
        (15, 29, 3),
        (3, 6, 2),
        (3, 6, 4),
        (14, 27, 1),
        (14, 28, 1),
        (17, 33, 5),
        (22, 44, 5),
        (3, 5, 3),
        (6, 11, 1),
        (6, 11, 4),
        (16, 32, 1),
        (10, 20, 4),
        (8, 16, 2),
        (13, 25, 3),
        (2, 3, 3),
        (9, 17, 3),
        (11, 22, 3),
        (10, 20, 2),
        (1, 1, 3),
        (3, 6, 1),
        (9, 18, 4),
        (2, 3, 1),
        (21, 42, 5),
        (15, 30, 1),
        (1, 1, 1),
        (6, 12, 3),
        (21, 42, 6),
        (6, 11, 2),
        (7, 13, 2),
        (4, 7, 3),
        (11, 21, 3),
        (8, 16, 4),
        (10, 19, 1),
        (20, 40, 5),
        (9, 18, 1),
        (15, 30, 4),
        (2, 4, 4),
        (16, 31, 2),
        (8, 15, 4),
        (16, 32, 2),
        (1, 2, 3),
        (13, 26, 4),
        (9, 17, 1),
        (18, 36, 5),
        (13, 25, 1),
        (4, 8, 2),
        (11, 22, 1),
        (13, 25, 4),
        (10, 20, 3),
        (3, 5, 4),
        (7, 14, 4),
        (6, 12, 1),
        (14, 28, 2),
        (15, 30, 2),
        (16, 32, 4),
        (16, 31, 4),
        (7, 13, 1),
        (15, 29, 1),
        (14, 27, 3),
        (17, 34, 5),
        (12, 24, 3),
        (2, 4, 3),
        (2, 3, 2),
        (5, 10, 3),
        (9, 18, 2),
        (13, 26, 3),
        (2, 4, 2),
        (17, 33, 6),
        (8, 16, 1),
        (15, 29, 2),
        (4, 8, 1),
        (19, 37, 5),
        (21, 41, 5),
        (22, 44, 6),
        (4, 7, 2),
        (8, 15, 2),
        (9, 18, 3),
        (1, 1, 4),
        (21, 41, 6),
        (1, 2, 1),
        (14, 28, 3),
        (8, 15, 1),
        (1, 2, 4),
        (4, 7, 4),
        (5, 9, 3),
        (13, 26, 1),
        (5, 9, 2),
        (4, 7, 1),
        (8, 15, 3),
        (7, 14, 2),
        (19, 37, 6),
        (5, 10, 1),
        (4, 8, 4),
        (20, 39, 5),
        (7, 13, 4),
        (12, 23, 2),
        (7, 14, 1),
        (3, 5, 2),
        (10, 19, 2),
        (12, 24, 2),
        (12, 23, 1),
        (13, 26, 2),
        (9, 17, 2),
        (14, 28, 4),
        (1, 1, 2),
        (2, 3, 4),
        (9, 17, 4),
        (12, 23, 4),
        (12, 24, 4),
        (17, 34, 6),
        (10, 20, 1),
        (23, 46, 6),
        (12, 23, 3),
        (11, 22, 2),
        (16, 31, 1),
        (22, 43, 6),
        (1, 2, 2),
        (16, 32, 3),
        (23, 45, 6),
        (4, 8, 3),
        (11, 21, 2),
        (10, 19, 3),
        (6, 12, 2),
        (23, 46, 5),
        (18, 36, 6),
        (23, 45, 5),
        (6, 12, 4),
        (10, 19, 4),
        (2, 4, 1),
        (7, 14, 3),
        (15, 29, 4),
        (11, 21, 4),
        (20, 39, 6),
        (19, 38, 5),
        (8, 16, 3),
        (18, 35, 5),
        (19, 38, 6),
        (14, 27, 2)
    }
    &
    units :  POW(NATURAL1 * struct(idx:NATURAL1, key:STRING, groups:POW(INTEGER*struct(sessions:POW(INTEGER))), title:STRING))
    &
    units = {
        (1, rec(idx:1, title:"Aristoteles: Politik (Basisseminar)", key:"120281", groups:{(1, rec(sessions:{1}))})),
        (2, rec(idx:2, title:"Boethius: Der Trost der Philosophie (Basisseminar)", key:"120323", groups:{(2, rec(sessions:{2}))})),
        (3, rec(idx:3, title:"Das Konzept des Menschen im Wandel der Epochen (Basisseminar)", key:"120256", groups:{(3, rec(sessions:{3}))})),
        (4, rec(idx:4, title:"Das Leib-Seele-Problem (Basisseminar)", key:"121690", groups:{(4, rec(sessions:{4}))})),
        (5, rec(idx:5, title:"Das moderne Geldwesen als Schlüsselphänomen neuzeitlicher Kultur (Basisseminar)", key:"120254", groups:{(5, rec(sessions:{5}))})),
        (6, rec(idx:6, title:"Die Philosophie des Nikolaus von Kues (Basisseminar)", key:"120386", groups:{(6, rec(sessions:{6}))})),
        (7, rec(idx:7, title:"Einführung in die hellenistische Philosophie (Basisseminar)", key:"120347", groups:{(7, rec(sessions:{7}))})),
        (8, rec(idx:8, title:"Einführung in die Metaethik (Basisseminar)", key:"121318", groups:{(8, rec(sessions:{8}))})),
        (9, rec(idx:9, title:"Existenz: unableitbares Sein des Menschen oder Subjektivität? (Basisseminar)", key:"120253", groups:{(9, rec(sessions:{9}))})),
        (10, rec(idx:10, title:"Ficino: Über die Liebe (Basisseminar)", key:"121855", groups:{(10, rec(sessions:{10}))})),
        (11, rec(idx:11, title:"Freiheit der Forschung (Basisseminar)", key:"120394", groups:{(11, rec(sessions:{11}))})),
        (12, rec(idx:12, title:"Freundschaft (Basisseminar)", key:"121213", groups:{(12, rec(sessions:{12}))})),
        (13, rec(idx:13, title:"Gemeinschaft und Gesellschaft: Grundpositionen der Sozialphilosophie (Basisseminar)", key:"120289", groups:{(13, rec(sessions:{13}))})),
        (14, rec(idx:14, title:"Grundprobleme der Philosophie (Basisseminar)", key:"120328", groups:{(14, rec(sessions:{14}))})),
        (15, rec(idx:15, title:"Grundprobleme der Philosophie (Basisseminar)", key:"121221", groups:{(15, rec(sessions:{15}))})),
        (16, rec(idx:16, title:"Imannuel Kant: Grundlegung zur Metaphysik der Sitten (Basisseminar)", key:"120258", groups:{(16, rec(sessions:{16}))})),
        (17, rec(idx:17, title:"Kant: Kritik der reinen Vernunft. Transzendentale Analytik (Basisseminar)", key:"121746", groups:{(17, rec(sessions:{17}))})),
        (18, rec(idx:18, title:"Klassiker der analytischen Philosophie (Basisseminar)", key:"121216", groups:{(18, rec(sessions:{18}))})),
        (19, rec(idx:19, title:"Leben als letzter Grund - eine Einführung in Lebensphilosophie (Basisseminar)", key:"120252", groups:{(19, rec(sessions:{19}))})),
        (20, rec(idx:20, title:"Logik I (Basisseminar)", key:"118423", groups:{(20, rec(sessions:{20}))})),
        (21, rec(idx:21, title:"Logik II (Basisseminar)", key:"120326", groups:{(21, rec(sessions:{21}))})),
        (22, rec(idx:22, title:"Nozick: Anarchie, Staat, Utopie (Basisseminar)", key:"120282", groups:{(22, rec(sessions:{22}))})),
        (23, rec(idx:23, title:"Philosophie der normalen Sprache (Basisseminar)", key:"120379", groups:{(23, rec(sessions:{23}))})),
        (24, rec(idx:24, title:"Platons Seelenlehre (Basisseminar)", key:"121856", groups:{(24, rec(sessions:{24}))})),
        (25, rec(idx:25, title:"Prozessmetaphysik (Basisseminar)", key:"120387", groups:{(25, rec(sessions:{25}))})),
        (26, rec(idx:26, title:"Sprachphilosophie und Logik im Mittelalter (Basisseminar)", key:"122845", groups:{(26, rec(sessions:{26}))})),
        (27, rec(idx:27, title:"Theorie des Argumentierens (Basisseminar)", key:"118437", groups:{(27, rec(sessions:{27}))})),
        (28, rec(idx:28, title:"Theorie der Kausalität (Basisseminar)", key:"120728", groups:{(28, rec(sessions:{28}))})),
        (29, rec(idx:29, title:"Vom Behaviorismus zur Kognitiven Wende (Basisseminar)", key:"121741", groups:{(29, rec(sessions:{29}))})),
        (30, rec(idx:30, title:"Was ist analytische Philosophie (Basisseminar)", key:"121215", groups:{(30, rec(sessions:{30}))})),
        (31, rec(idx:31, title:"Übung zu Logik I (Übung)", key:"121192", groups:{(31, rec(sessions:{31}))})),
        (32, rec(idx:32, title:"Übung zu Logik I (Übung)", key:"120820", groups:{(32, rec(sessions:{32}))})),
        (33, rec(idx:33, title:"Übung zu Logik I (Übung)", key:"125755", groups:{(33, rec(sessions:{33}))})),
        (34, rec(idx:34, title:"Übung zu Logik I (Übung)", key:"121193", groups:{(34, rec(sessions:{34}))})),
        (35, rec(idx:35, title:"Wissenschaftliche Arbeitstechniken (Übung)", key:"121214", groups:{(35, rec(sessions:{35}))})),
        (36, rec(idx:36, title:"Wissenschaftliche Arbeitstechniken (Übung)", key:"118135", groups:{(36, rec(sessions:{36}))})),
        (37, rec(idx:37, title:"Einführung in die Ethik (Vorlesung)", key:"120285", groups:{(37, rec(sessions:{37}))})),
        (38, rec(idx:38, title:"Erkenntnistheorie (Vorlesung)", key:"120290", groups:{(38, rec(sessions:{38}))})),
        (39, rec(idx:39, title:"Kulturphilosophie (Vorlesung)", key:"120390", groups:{(39, rec(sessions:{39}))})),
        (40, rec(idx:40, title:"Philosophie der Antike (Vorlesung)", key:"120348", groups:{(40, rec(sessions:{40}))})),
        (41, rec(idx:41, title:"Selbsterkenntnis und Selbstgewissheit (Vorlesung)", key:"120321", groups:{(41, rec(sessions:{41}))})),
        (42, rec(idx:42, title:"Sprachphilosophie (Vorlesung)", key:"120725", groups:{(42, rec(sessions:{42}))})),
        (43, rec(idx:43, title:"Tierethik (Vorlesung)", key:"120381", groups:{(43, rec(sessions:{43}))})),
        (44, rec(idx:44, title:"Grundprobleme und Methoden der Philosophie (Basisseminar)", key:"124523", groups:{(44, rec(sessions:{44}))})),
        (45, rec(idx:45, title:"Grundprobleme und Methoden der Philosophie (Basisseminar)", key:"124178", groups:{(45, rec(sessions:{45}))}))
    }
    &
    abstract_unit_unit_semester : POW((dom(abstract_units) * dom(units)) * SEMESTERS)
    &
    abstract_unit_unit_semester = {
        (14, 26, 5),
        (2, 32, 3),
        (2, 33, 1),
        (18, 4, 3),
        (18, 16, 1),
        (30, 29, 1),
        (13, 40, 3),
        (3, 15, 5),
        (8, 28, 5),
        (14, 3, 1),
        (8, 17, 3),
        (8, 25, 5),
        (20, 30, 5),
        (32, 12, 5),
        (6, 18, 5),
        (39, 43, 1),
        (28, 23, 5),
        (8, 25, 1),
        (8, 24, 5),
        (14, 26, 3),
        (20, 30, 3),
        (28, 30, 5),
        (20, 9, 1),
        (10, 16, 1),
        (46, 43, 1),
        (30, 3, 3),
        (6, 17, 3),
        (2, 34, 5),
        (20, 3, 3),
        (10, 12, 1),
        (18, 28, 5),
        (6, 18, 3),
        (2, 33, 3),
        (16, 6, 1),
        (20, 29, 3),
        (14, 2, 1),
        (3, 14, 3),
        (20, 5, 3),
        (20, 23, 1),
        (39, 43, 5),
        (18, 3, 3),
        (20, 18, 1),
        (28, 30, 3),
        (10, 18, 3),
        (10, 18, 5),
        (20, 3, 1),
        (20, 9, 3),
        (3, 45, 6),
        (20, 9, 5),
        (4, 36, 3),
        (27, 42, 3),
        (10, 11, 1),
        (26, 29, 5),
        (20, 4, 1),
        (45, 43, 3),
        (23, 27, 5),
        (28, 26, 3),
        (16, 26, 3),
        (28, 26, 1),
        (2, 31, 5),
        (20, 30, 1),
        (3, 18, 3),
        (4, 35, 3),
        (10, 12, 3),
        (39, 41, 1),
        (14, 7, 3),
        (6, 17, 5),
        (4, 35, 1),
        (28, 30, 1),
        (39, 41, 5),
        (42, 43, 5),
        (3, 45, 4),
        (1, 20, 1),
        (26, 29, 3),
        (8, 2, 3),
        (13, 40, 1),
        (8, 6, 3),
        (10, 12, 5),
        (8, 6, 1),
        (3, 18, 5),
        (3, 15, 1),
        (30, 24, 3),
        (30, 19, 1),
        (8, 4, 1),
        (30, 24, 1),
        (10, 11, 5),
        (8, 17, 1),
        (3, 44, 4),
        (20, 25, 1),
        (20, 5, 5),
        (10, 7, 3),
        (6, 10, 3),
        (18, 16, 3),
        (12, 22, 1),
        (16, 3, 3),
        (32, 5, 5),
        (32, 22, 1),
        (6, 24, 5),
        (6, 30, 5),
        (38, 41, 1),
        (30, 3, 5),
        (20, 4, 3),
        (16, 10, 5),
        (18, 17, 1),
        (30, 4, 3),
        (12, 1, 3),
        (10, 11, 3),
        (10, 16, 5),
        (20, 19, 1),
        (32, 12, 3),
        (18, 3, 1),
        (2, 34, 1),
        (3, 44, 6),
        (26, 11, 1),
        (16, 6, 5),
        (20, 22, 1),
        (29, 39, 1),
        (2, 33, 5),
        (28, 23, 1),
        (6, 17, 1),
        (41, 43, 1),
        (32, 12, 1),
        (8, 2, 1),
        (30, 4, 1),
        (30, 9, 3),
        (20, 29, 5),
        (14, 7, 5),
        (20, 18, 3),
        (30, 10, 3),
        (32, 5, 1),
        (1, 21, 3),
        (28, 23, 3),
        (8, 10, 3),
        (16, 26, 1),
        (30, 2, 5),
        (1, 20, 5),
        (20, 25, 3),
        (18, 3, 5),
        (20, 22, 5),
        (6, 24, 3),
        (4, 35, 5),
        (30, 29, 5),
        (2, 34, 3),
        (32, 13, 1),
        (10, 8, 3),
        (30, 10, 5),
        (3, 18, 1),
        (10, 18, 1),
        (10, 10, 5),
        (6, 6, 3),
        (42, 43, 1),
        (26, 11, 3),
        (30, 19, 3),
        (30, 4, 5),
        (3, 44, 2),
        (20, 23, 3),
        (38, 41, 3),
        (30, 9, 5),
        (30, 24, 5),
        (16, 3, 5),
        (8, 4, 5),
        (20, 18, 5),
        (2, 32, 1),
        (1, 21, 1),
        (6, 30, 1),
        (30, 5, 1),
        (8, 28, 3),
        (27, 42, 5),
        (10, 7, 5),
        (3, 15, 3),
        (38, 41, 5),
        (20, 29, 1),
        (42, 43, 3),
        (45, 43, 1),
        (30, 5, 5),
        (14, 3, 5),
        (1, 21, 5),
        (10, 16, 3),
        (18, 28, 3),
        (6, 24, 1),
        (20, 19, 5),
        (20, 23, 5),
        (18, 16, 5),
        (32, 13, 3),
        (30, 5, 3),
        (12, 22, 5),
        (6, 6, 1),
        (23, 27, 1),
        (30, 29, 3),
        (20, 4, 5),
        (10, 10, 1),
        (8, 6, 5),
        (30, 1, 3),
        (10, 7, 1),
        (12, 1, 1),
        (14, 2, 3),
        (32, 22, 5),
        (20, 22, 3),
        (8, 4, 3),
        (8, 28, 1),
        (3, 45, 2),
        (3, 14, 1),
        (30, 1, 1),
        (3, 14, 5),
        (46, 43, 3),
        (8, 24, 1),
        (14, 1, 3),
        (2, 32, 5),
        (30, 2, 3),
        (6, 30, 3),
        (4, 36, 5),
        (8, 10, 1),
        (8, 10, 5),
        (5, 38, 5),
        (6, 18, 1),
        (14, 24, 5),
        (26, 18, 3),
        (16, 3, 1),
        (18, 17, 5),
        (14, 2, 5),
        (41, 43, 3),
        (23, 27, 3),
        (27, 42, 1),
        (10, 8, 5),
        (14, 1, 1),
        (2, 31, 3),
        (16, 6, 3),
        (18, 28, 1),
        (5, 38, 3),
        (45, 43, 5),
        (12, 22, 3),
        (37, 41, 1),
        (6, 10, 1),
        (29, 39, 5),
        (12, 1, 5),
        (30, 3, 1),
        (14, 3, 3),
        (6, 6, 5),
        (26, 29, 1),
        (29, 39, 3),
        (14, 24, 3),
        (30, 2, 1),
        (20, 19, 3),
        (28, 26, 5),
        (39, 43, 3),
        (30, 1, 5),
        (14, 26, 1),
        (37, 41, 5),
        (30, 9, 1),
        (39, 41, 3),
        (32, 5, 3),
        (16, 26, 5),
        (5, 38, 1),
        (13, 40, 5),
        (8, 2, 5),
        (41, 43, 5),
        (8, 17, 5),
        (30, 10, 1),
        (16, 10, 3),
        (8, 25, 3),
        (46, 43, 5),
        (4, 36, 1),
        (6, 10, 5),
        (20, 5, 1),
        (2, 31, 1),
        (20, 25, 5),
        (18, 4, 5),
        (20, 3, 5),
        (32, 13, 5),
        (26, 11, 5),
        (30, 19, 5),
        (26, 18, 5),
        (8, 24, 3),
        (10, 8, 1),
        (32, 22, 3),
        (16, 10, 1),
        (18, 4, 1),
        (14, 24, 1),
        (37, 41, 3),
        (14, 1, 5),
        (1, 20, 3),
        (14, 7, 1),
        (10, 10, 3),
        (18, 17, 3),
        (26, 18, 1)
    }
    &
    LEVELS = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211}
    &
    course_levels : dom(courses) <-> tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
    &
    #(level_1, level_2, level_3, level_4, level_5, level_6, level_7, level_8, level_9, level_10,
        level_11, level_12, level_13, level_14, level_15, level_16, level_17, level_18, level_19, level_20,
        level_21, level_22, level_23, level_24, level_25, level_26, level_27, level_28, level_29, level_30,
        level_31, level_32, level_33, level_34, level_35, level_36, level_37, level_38, level_39, level_40,
        level_41, level_42, level_43, level_44, level_45, level_46, level_47, level_48, level_49, level_50,
        level_51, level_52, level_53, level_54, level_55, level_56, level_57, level_58, level_59, level_60,
        level_61, level_62, level_63, level_64, level_65, level_66, level_67, level_68, level_69, level_70,
        level_71, level_72, level_73, level_74, level_75, level_76, level_77, level_78, level_79, level_80,
        level_81, level_82, level_83, level_84, level_85, level_86, level_87, level_88, level_89, level_90,
        level_91, level_92, level_93, level_94, level_95, level_96, level_97, level_98, level_99, level_100,
        level_101, level_102, level_103, level_104, level_105, level_106, level_107, level_108, level_109, level_110,
        level_111, level_112, level_113, level_114, level_115, level_116, level_117, level_118, level_119, level_120,
        level_121, level_122, level_123, level_124, level_125, level_126, level_127, level_128, level_129, level_130,
        level_131, level_132, level_133, level_134, level_135, level_136, level_137, level_138, level_139, level_140,
        level_141, level_142, level_143, level_144, level_145, level_146, level_147, level_148, level_149, level_150,
        level_151, level_152, level_153, level_154, level_155, level_156, level_157, level_158, level_159, level_160,
        level_161, level_162, level_163, level_164, level_165, level_166, level_167, level_168, level_169, level_170,
        level_171, level_172, level_173, level_174, level_175, level_176, level_177, level_178, level_179, level_180,
        level_181, level_182, level_183, level_184, level_185, level_186, level_187, level_188, level_189, level_190,
        level_191, level_192, level_193, level_194, level_195, level_196, level_197, level_198, level_199, level_200,
        level_201, level_202, level_203, level_204, level_205, level_206, level_207, level_208, level_209, level_210,
        level_211).(
    
        level_1 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_1 = 
            const(rec(idx:1, art:"null", name:"Basismodule", tm:"null", from:7, to:7), [level_2, level_4, level_8]) & 
        level_2 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_2 = 
            const(rec(idx:2, art:"null", name:"Basispflichtmodule", tm:"null", from:1, to:2), [level_3]) & 
        level_3 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_3 = 
            bin(rec(idx:3, art:"null", name:"Philosophische Propädeutik", tm:"null", from:1, to:2))
         & 
        level_4 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_4 = 
            const(rec(idx:4, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:4, to:6), [level_5, level_7, level_6]) & 
        level_5 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_5 = 
            bin(rec(idx:5, art:"null", name:"Theoretische Philosophie", tm:"null", from:1, to:2))
         & 
        level_6 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_6 = 
            bin(rec(idx:6, art:"null", name:"Praktische Philosophie", tm:"null", from:1, to:2))
         & 
        level_7 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_7 = 
            bin(rec(idx:7, art:"null", name:"Geschichte der Philosophie", tm:"null", from:2, to:4))
         & 
        level_8 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_8 = 
            const(rec(idx:8, art:"null", name:"Basiswahlmodule", tm:"null", from:0, to:2), [level_10, level_11, level_9]) & 
        level_9 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_9 = 
            bin(rec(idx:9, art:"null", name:"Philosophische Propädeutik", tm:"null", from:0, to:2))
         & 
        level_10 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_10 = 
            bin(rec(idx:10, art:"null", name:"Theoretische Philosophie", tm:"null", from:0, to:2))
         & 
        level_11 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_11 = 
            bin(rec(idx:11, art:"null", name:"Praktische Philosophie", tm:"null", from:0, to:2))
         & 
        level_12 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_12 = 
            bin(rec(idx:12, art:"null", name:"Aufbaumodule", tm:"null", from:2, to:2))
         & 
        level_13 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_13 = 
            const(rec(idx:13, art:"null", name:"Basismodule", tm:"null", from:7, to:7), [level_20, level_14, level_16]) & 
        level_14 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_14 = 
            const(rec(idx:14, art:"null", name:"Basispflichtmodule", tm:"null", from:1, to:2), [level_15]) & 
        level_15 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_15 = 
            bin(rec(idx:15, art:"null", name:"Philosophische Propädeutik", tm:"null", from:1, to:2))
         & 
        level_16 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_16 = 
            const(rec(idx:16, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:4, to:6), [level_18, level_17, level_19]) & 
        level_17 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_17 = 
            bin(rec(idx:17, art:"null", name:"Theoretische Philosophie", tm:"null", from:1, to:2))
         & 
        level_18 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_18 = 
            bin(rec(idx:18, art:"null", name:"Praktische Philosophie", tm:"null", from:1, to:2))
         & 
        level_19 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_19 = 
            bin(rec(idx:19, art:"null", name:"Geschichte der Philosophie", tm:"null", from:2, to:4))
         & 
        level_20 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_20 = 
            const(rec(idx:20, art:"null", name:"Basiswahlmodule", tm:"null", from:0, to:2), [level_22, level_21, level_23]) & 
        level_21 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_21 = 
            bin(rec(idx:21, art:"null", name:"Philosophische Propädeutik", tm:"null", from:0, to:2))
         & 
        level_22 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_22 = 
            bin(rec(idx:22, art:"null", name:"Theoretische Philosophie", tm:"null", from:0, to:2))
         & 
        level_23 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_23 = 
            bin(rec(idx:23, art:"null", name:"Praktische Philosophie", tm:"null", from:0, to:2))
         & 
        level_24 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_24 = 
            bin(rec(idx:24, art:"null", name:"Aufbaumodule", tm:"null", from:2, to:2))
         & 
        level_25 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_25 = 
            const(rec(idx:25, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_26, level_27]) & 
        level_26 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_26 = 
            bin(rec(idx:26, art:"null", name:"Basispflichtmodul", tm:"null", from:1, to:1))
         & 
        level_27 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_27 = 
            const(rec(idx:27, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:2, to:2), [level_28, level_29]) & 
        level_28 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_28 = 
            bin(rec(idx:28, art:"null", name:"Theoretische Philosophie und Praktische Philosophie", tm:"null", from:1, to:1))
         & 
        level_29 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_29 = 
            bin(rec(idx:29, art:"null", name:"Geschichte der Philosophie", tm:"null", from:1, to:1))
         & 
        level_30 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_30 = 
            bin(rec(idx:30, art:"null", name:"Aufbaumodule", tm:"null", from:1, to:1))
         & 
        level_31 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_31 = 
            const(rec(idx:31, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_33, level_32]) & 
        level_32 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_32 = 
            bin(rec(idx:32, art:"null", name:"Basispflichtmodul", tm:"null", from:1, to:1))
         & 
        level_33 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_33 = 
            const(rec(idx:33, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:2, to:2), [level_35, level_34]) & 
        level_34 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_34 = 
            bin(rec(idx:34, art:"null", name:"Theoretische Philosophie und Praktische Philosophie", tm:"null", from:1, to:1))
         & 
        level_35 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_35 = 
            bin(rec(idx:35, art:"null", name:"Geschichte der Philosophie", tm:"null", from:1, to:1))
         & 
        level_36 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_36 = 
            bin(rec(idx:36, art:"null", name:"Aufbaumodule", tm:"null", from:1, to:1))
         & 
        level_37 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_37 = 
            const(rec(idx:37, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_39, level_40, level_38]) & 
        level_38 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_38 = 
            bin(rec(idx:38, art:"null", name:"Basismodul Soziologie", tm:"null", from:1, to:1))
         & 
        level_39 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_39 = 
            bin(rec(idx:39, art:"null", name:"Basismodul Politikwissenschaft", tm:"null", from:1, to:1))
         & 
        level_40 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_40 = 
            bin(rec(idx:40, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         & 
        level_41 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_41 = 
            const(rec(idx:41, art:"null", name:"Methodenmodule", tm:"null", from:5, to:5), [level_42, level_44, level_43]) & 
        level_42 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_42 = 
            bin(rec(idx:42, art:"null", name:"Erhebungsverfahren", tm:"null", from:2, to:2))
         & 
        level_43 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_43 = 
            bin(rec(idx:43, art:"null", name:"Analyseverfahren", tm:"null", from:2, to:2))
         & 
        level_44 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_44 = 
            bin(rec(idx:44, art:"null", name:"Lehrforschungsprojekt", tm:"null", from:1, to:1))
         & 
        level_45 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_45 = 
            const(rec(idx:45, art:"null", name:"Themenmodule", tm:"null", from:5, to:5), [level_60, level_101, level_46, level_88, level_74]) & 
        level_46 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_46 = 
            const(rec(idx:46, art:"null", name:"Individuum & Gesellschaft", tm:"IG", from:1, to:1), [level_50, level_47]) & 
        level_47 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_47 = 
            const(rec(idx:47, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"IG", from:-1, to:-1), [level_49, level_48]) & 
        level_48 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_48 = 
            bin(rec(idx:48, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_49 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_49 = 
            bin(rec(idx:49, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"IG", from:-1, to:-1))
         & 
        level_50 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_50 = 
            const(rec(idx:50, art:"VS", name:"Vertiefungsseminare ", tm:"IG", from:-1, to:-1), [level_51, level_54, level_57]) & 
        level_51 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_51 = 
            const(rec(idx:51, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_52, level_53]) & 
        level_52 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_52 = 
            bin(rec(idx:52, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_53 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_53 = 
            bin(rec(idx:53, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_54 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_54 = 
            const(rec(idx:54, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_55, level_56]) & 
        level_55 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_55 = 
            bin(rec(idx:55, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_56 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_56 = 
            bin(rec(idx:56, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_57 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_57 = 
            const(rec(idx:57, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_59, level_58]) & 
        level_58 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_58 = 
            bin(rec(idx:58, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_59 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_59 = 
            bin(rec(idx:59, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_60 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_60 = 
            const(rec(idx:60, art:"null", name:"Systeme & Strukturen", tm:"SS", from:1, to:1), [level_61, level_64]) & 
        level_61 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_61 = 
            const(rec(idx:61, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"SS", from:-1, to:-1), [level_63, level_62]) & 
        level_62 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_62 = 
            bin(rec(idx:62, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_63 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_63 = 
            bin(rec(idx:63, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"SS", from:-1, to:-1))
         & 
        level_64 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_64 = 
            const(rec(idx:64, art:"VS", name:"Vertiefungsseminare ", tm:"SS", from:-1, to:-1), [level_65, level_71, level_68]) & 
        level_65 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_65 = 
            const(rec(idx:65, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_67, level_66]) & 
        level_66 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_66 = 
            bin(rec(idx:66, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_67 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_67 = 
            bin(rec(idx:67, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_68 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_68 = 
            const(rec(idx:68, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_70, level_69]) & 
        level_69 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_69 = 
            bin(rec(idx:69, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_70 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_70 = 
            bin(rec(idx:70, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_71 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_71 = 
            const(rec(idx:71, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_73, level_72]) & 
        level_72 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_72 = 
            bin(rec(idx:72, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_73 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_73 = 
            bin(rec(idx:73, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_74 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_74 = 
            const(rec(idx:74, art:"null", name:"Bereiche & Prozesse", tm:"BP", from:1, to:1), [level_75, level_78]) & 
        level_75 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_75 = 
            const(rec(idx:75, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"BP", from:-1, to:-1), [level_76, level_77]) & 
        level_76 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_76 = 
            bin(rec(idx:76, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_77 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_77 = 
            bin(rec(idx:77, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"BP", from:-1, to:-1))
         & 
        level_78 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_78 = 
            const(rec(idx:78, art:"VS", name:"Vertiefungsseminare ", tm:"BP", from:-1, to:-1), [level_85, level_82, level_79]) & 
        level_79 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_79 = 
            const(rec(idx:79, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_80, level_81]) & 
        level_80 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_80 = 
            bin(rec(idx:80, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_81 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_81 = 
            bin(rec(idx:81, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_82 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_82 = 
            const(rec(idx:82, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_84, level_83]) & 
        level_83 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_83 = 
            bin(rec(idx:83, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_84 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_84 = 
            bin(rec(idx:84, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_85 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_85 = 
            const(rec(idx:85, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_86, level_87]) & 
        level_86 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_86 = 
            bin(rec(idx:86, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_87 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_87 = 
            bin(rec(idx:87, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_88 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_88 = 
            const(rec(idx:88, art:"null", name:"Medien & Kommunikation", tm:"MK", from:1, to:1), [level_89]) & 
        level_89 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_89 = 
            const(rec(idx:89, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MK", from:-1, to:-1), [level_95, level_91, level_92, level_98, level_90]) & 
        level_90 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_90 = 
            bin(rec(idx:90, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_91 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_91 = 
            bin(rec(idx:91, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"MK", from:-1, to:-1))
         & 
        level_92 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_92 = 
            const(rec(idx:92, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_93, level_94]) & 
        level_93 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_93 = 
            bin(rec(idx:93, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_94 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_94 = 
            bin(rec(idx:94, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_95 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_95 = 
            const(rec(idx:95, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_97, level_96]) & 
        level_96 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_96 = 
            bin(rec(idx:96, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_97 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_97 = 
            bin(rec(idx:97, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_98 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_98 = 
            const(rec(idx:98, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_99, level_100]) & 
        level_99 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_99 = 
            bin(rec(idx:99, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_100 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_100 = 
            bin(rec(idx:100, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_101 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_101 = 
            const(rec(idx:101, art:"null", name:"Europa & Internationale Studien", tm:"EI", from:1, to:1), [level_102, level_105]) & 
        level_102 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_102 = 
            const(rec(idx:102, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"EI", from:-1, to:-1), [level_104, level_103]) & 
        level_103 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_103 = 
            bin(rec(idx:103, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_104 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_104 = 
            bin(rec(idx:104, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"EI", from:-1, to:-1))
         & 
        level_105 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_105 = 
            const(rec(idx:105, art:"VS", name:"Vertiefungsseminare ", tm:"EI", from:-1, to:-1), [level_109, level_112, level_106]) & 
        level_106 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_106 = 
            const(rec(idx:106, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_107, level_108]) & 
        level_107 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_107 = 
            bin(rec(idx:107, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_108 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_108 = 
            bin(rec(idx:108, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_109 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_109 = 
            const(rec(idx:109, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_110, level_111]) & 
        level_110 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_110 = 
            bin(rec(idx:110, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_111 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_111 = 
            bin(rec(idx:111, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_112 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_112 = 
            const(rec(idx:112, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_114, level_113]) & 
        level_113 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_113 = 
            bin(rec(idx:113, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_114 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_114 = 
            bin(rec(idx:114, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_115 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_115 = 
            const(rec(idx:115, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_116, level_118, level_117]) & 
        level_116 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_116 = 
            bin(rec(idx:116, art:"null", name:"Basismodul Soziologie", tm:"null", from:1, to:1))
         & 
        level_117 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_117 = 
            bin(rec(idx:117, art:"null", name:"Basismodul Politikwissenschaft", tm:"null", from:1, to:1))
         & 
        level_118 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_118 = 
            bin(rec(idx:118, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         & 
        level_119 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_119 = 
            const(rec(idx:119, art:"null", name:"Methodenmodule", tm:"null", from:5, to:5), [level_121, level_120, level_122]) & 
        level_120 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_120 = 
            bin(rec(idx:120, art:"null", name:"Erhebungsverfahren", tm:"null", from:2, to:2))
         & 
        level_121 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_121 = 
            bin(rec(idx:121, art:"null", name:"Analyseverfahren", tm:"null", from:2, to:2))
         & 
        level_122 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_122 = 
            bin(rec(idx:122, art:"null", name:"Lehrforschungsprojekt", tm:"null", from:1, to:1))
         & 
        level_123 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_123 = 
            const(rec(idx:123, art:"null", name:"Themenmodule", tm:"null", from:5, to:5), [level_138, level_166, level_180, level_124, level_152]) & 
        level_124 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_124 = 
            const(rec(idx:124, art:"null", name:"Individuum & Gesellschaft", tm:"IG", from:1, to:1), [level_125, level_128]) & 
        level_125 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_125 = 
            const(rec(idx:125, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"IG", from:-1, to:-1), [level_127, level_126]) & 
        level_126 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_126 = 
            bin(rec(idx:126, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_127 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_127 = 
            bin(rec(idx:127, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"IG", from:-1, to:-1))
         & 
        level_128 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_128 = 
            const(rec(idx:128, art:"VS", name:"Vertiefungsseminare", tm:"IG", from:-1, to:-1), [level_132, level_135, level_129]) & 
        level_129 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_129 = 
            const(rec(idx:129, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_130, level_131]) & 
        level_130 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_130 = 
            bin(rec(idx:130, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_131 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_131 = 
            bin(rec(idx:131, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_132 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_132 = 
            const(rec(idx:132, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_134, level_133]) & 
        level_133 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_133 = 
            bin(rec(idx:133, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_134 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_134 = 
            bin(rec(idx:134, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_135 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_135 = 
            const(rec(idx:135, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_137, level_136]) & 
        level_136 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_136 = 
            bin(rec(idx:136, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         & 
        level_137 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_137 = 
            bin(rec(idx:137, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         & 
        level_138 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_138 = 
            const(rec(idx:138, art:"null", name:"Systeme & Strukturen", tm:"SS", from:1, to:1), [level_142, level_139]) & 
        level_139 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_139 = 
            const(rec(idx:139, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"SS", from:-1, to:-1), [level_140, level_141]) & 
        level_140 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_140 = 
            bin(rec(idx:140, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_141 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_141 = 
            bin(rec(idx:141, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"SS", from:-1, to:-1))
         & 
        level_142 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_142 = 
            const(rec(idx:142, art:"VS", name:"Vertiefungsseminare", tm:"SS", from:-1, to:-1), [level_143, level_149, level_146]) & 
        level_143 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_143 = 
            const(rec(idx:143, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_144, level_145]) & 
        level_144 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_144 = 
            bin(rec(idx:144, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_145 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_145 = 
            bin(rec(idx:145, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_146 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_146 = 
            const(rec(idx:146, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_147, level_148]) & 
        level_147 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_147 = 
            bin(rec(idx:147, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_148 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_148 = 
            bin(rec(idx:148, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_149 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_149 = 
            const(rec(idx:149, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_150, level_151]) & 
        level_150 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_150 = 
            bin(rec(idx:150, art:"VS", name:"Mündliche Prüfung", tm:"SS", from:-1, to:-1))
         & 
        level_151 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_151 = 
            bin(rec(idx:151, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         & 
        level_152 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_152 = 
            const(rec(idx:152, art:"null", name:"Bereiche & Prozesse", tm:"BP", from:1, to:1), [level_156, level_153]) & 
        level_153 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_153 = 
            const(rec(idx:153, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"BP", from:-1, to:-1), [level_154, level_155]) & 
        level_154 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_154 = 
            bin(rec(idx:154, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_155 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_155 = 
            bin(rec(idx:155, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"BP", from:-1, to:-1))
         & 
        level_156 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_156 = 
            const(rec(idx:156, art:"VS", name:"Vertiefungsseminare", tm:"BP", from:-1, to:-1), [level_160, level_163, level_157]) & 
        level_157 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_157 = 
            const(rec(idx:157, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_159, level_158]) & 
        level_158 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_158 = 
            bin(rec(idx:158, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_159 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_159 = 
            bin(rec(idx:159, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_160 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_160 = 
            const(rec(idx:160, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_162, level_161]) & 
        level_161 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_161 = 
            bin(rec(idx:161, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_162 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_162 = 
            bin(rec(idx:162, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_163 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_163 = 
            const(rec(idx:163, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_165, level_164]) & 
        level_164 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_164 = 
            bin(rec(idx:164, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         & 
        level_165 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_165 = 
            bin(rec(idx:165, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         & 
        level_166 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_166 = 
            const(rec(idx:166, art:"null", name:"Medien & Kommunikation", tm:"MK", from:1, to:1), [level_167, level_170]) & 
        level_167 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_167 = 
            const(rec(idx:167, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MK", from:-1, to:-1), [level_169, level_168]) & 
        level_168 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_168 = 
            bin(rec(idx:168, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_169 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_169 = 
            bin(rec(idx:169, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"MK", from:-1, to:-1))
         & 
        level_170 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_170 = 
            const(rec(idx:170, art:"VS", name:"Vertiefungsseminare ", tm:"MK", from:-1, to:-1), [level_177, level_171, level_174]) & 
        level_171 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_171 = 
            const(rec(idx:171, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_172, level_173]) & 
        level_172 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_172 = 
            bin(rec(idx:172, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_173 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_173 = 
            bin(rec(idx:173, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_174 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_174 = 
            const(rec(idx:174, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_176, level_175]) & 
        level_175 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_175 = 
            bin(rec(idx:175, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_176 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_176 = 
            bin(rec(idx:176, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_177 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_177 = 
            const(rec(idx:177, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_179, level_178]) & 
        level_178 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_178 = 
            bin(rec(idx:178, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         & 
        level_179 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_179 = 
            bin(rec(idx:179, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         & 
        level_180 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_180 = 
            const(rec(idx:180, art:"null", name:"Europa & Internationale Studien", tm:"EI", from:1, to:1), [level_181, level_184]) & 
        level_181 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_181 = 
            const(rec(idx:181, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"EI", from:-1, to:-1), [level_182, level_183]) & 
        level_182 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_182 = 
            bin(rec(idx:182, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_183 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_183 = 
            bin(rec(idx:183, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"EI", from:-1, to:-1))
         & 
        level_184 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_184 = 
            const(rec(idx:184, art:"VS", name:"Vertiefungsseminare", tm:"EI", from:-1, to:-1), [level_191, level_185, level_188]) & 
        level_185 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_185 = 
            const(rec(idx:185, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_186, level_187]) & 
        level_186 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_186 = 
            bin(rec(idx:186, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_187 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_187 = 
            bin(rec(idx:187, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_188 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_188 = 
            const(rec(idx:188, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_190, level_189]) & 
        level_189 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_189 = 
            bin(rec(idx:189, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_190 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_190 = 
            bin(rec(idx:190, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_191 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_191 = 
            const(rec(idx:191, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_192, level_193]) & 
        level_192 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_192 = 
            bin(rec(idx:192, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         & 
        level_193 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_193 = 
            bin(rec(idx:193, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         & 
        level_194 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_194 = 
            bin(rec(idx:194, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         & 
        level_195 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_195 = 
            bin(rec(idx:195, art:"null", name:"Modul Methoden der Sozialwissenschaften", tm:"null", from:1, to:1))
         & 
        level_196 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_196 = 
            const(rec(idx:196, art:"null", name:"Themenmodule", tm:"null", from:3, to:3), [level_197, level_199, level_198]) & 
        level_197 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_197 = 
            bin(rec(idx:197, art:"AS", name:"Medien & Individuum", tm:"MI", from:1, to:1))
         & 
        level_198 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_198 = 
            bin(rec(idx:198, art:"VS", name:"Medien & Gesellschaft", tm:"MG", from:1, to:1))
         & 
        level_199 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_199 = 
            bin(rec(idx:199, art:"VS", name:"Akteure  & Prozesse professioneller Kommunikation", tm:"AP", from:1, to:1))
         & 
        level_200 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_200 = 
            bin(rec(idx:200, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         & 
        level_201 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_201 = 
            bin(rec(idx:201, art:"null", name:"Modul Methoden der Sozialwissenschaften", tm:"null", from:1, to:1))
         & 
        level_202 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_202 = 
            const(rec(idx:202, art:"null", name:"Themenmodule", tm:"null", from:3, to:3), [level_206, level_209, level_203]) & 
        level_203 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_203 = 
            const(rec(idx:203, art:"null", name:"Medien & Individuum", tm:"MI", from:1, to:1), [level_204, level_205]) & 
        level_204 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_204 = 
            bin(rec(idx:204, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MI", from:-1, to:-1))
         & 
        level_205 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_205 = 
            bin(rec(idx:205, art:"VS", name:"Vertiefungsseminare", tm:"MI", from:-1, to:-1))
         & 
        level_206 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_206 = 
            const(rec(idx:206, art:"null", name:"Medien & Gesellschaft", tm:"MG", from:1, to:1), [level_207, level_208]) & 
        level_207 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_207 = 
            bin(rec(idx:207, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MG", from:-1, to:-1))
         & 
        level_208 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_208 = 
            bin(rec(idx:208, art:"VS", name:"Vertiefungsseminare", tm:"MI", from:-1, to:-1))
         & 
        level_209 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_209 = 
            const(rec(idx:209, art:"null", name:"Akteure & Prozesse professioneller Kommunikation", tm:"AP", from:1, to:1), [level_210, level_211]) & 
        level_210 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_210 = 
            bin(rec(idx:210, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"AP", from:-1, to:-1))
         & 
        level_211 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_211 = 
            bin(rec(idx:211, art:"VS", name:"Vertiefungsseminare", tm:"AP", from:-1, to:-1))
        
      &
      course_levels = {
        ("bk-phi-H-2011", level_12), ("bk-phi-H-2011", level_1),
        ("bk-phi-H-2013", level_13), ("bk-phi-H-2013", level_24),
        ("bk-phi-N-2011", level_30), ("bk-phi-N-2011", level_25),
        ("bk-phi-N-2013", level_31), ("bk-phi-N-2013", level_36),
        ("ba-smp-H-2013", level_41), ("ba-smp-H-2013", level_37), ("ba-smp-H-2013", level_45),
        ("ba-smp-H-2011", level_115), ("ba-smp-H-2011", level_119), ("ba-smp-H-2011", level_123),
        ("bk-kom-N-2013", level_196), ("bk-kom-N-2013", level_194), ("bk-kom-N-2013", level_195),
        ("bk-kom-N-2011", level_201), ("bk-kom-N-2011", level_202), ("bk-kom-N-2011", level_200)
      }
    )
    &
    course_tree_leaves : POW((dom(courses)*LEVELS)*POW(seq(INTEGER)))
    &
    !(cc, tt).( cc : dom(courses) & tt : course_levels[{cc}] =>
        course_tree_leaves(cc, top(tt)'idx) = {xx | xx : dom(tt) & sizet(subtree(tt, xx)) = 1}
    )
    &
    /*
     * Maps from level ID to the set of modules associated with that level (leaf)
     */
    level_modules : LEVELS <-> dom(modules)
    &
    level_modules = {
        (15 |-> 1), (15 |-> 2),
        (17 |-> 4), (17 |-> 3),
        (18 |-> 5), (18 |-> 6),
        (19 |-> 10), (19 |-> 7), (19 |-> 8), (19 |-> 9),
        (21 |-> 12), (21 |-> 11),
        (22 |-> 13), (22 |-> 14),
        (23 |-> 16), (23 |-> 15),
        (24 |-> 18), (24 |-> 19), (24 |-> 23), (24 |-> 21), (24 |-> 22), (24 |-> 17), (24 |-> 20)
    }
    &
    course_modules : dom(courses) --> POW(dom(modules))
    &
    course_modules = {
        
        ("bk-phi-H-2011", {}),
        ("bk-phi-H-2013", {19 ,16 ,7 ,12 ,13 ,23 ,4 ,14 ,21 ,22 ,3 ,17 ,6 ,8 ,11 ,2 ,15 ,20 ,18 ,5 ,10 ,1 ,9}),
        ("bk-phi-N-2011", {}),
        ("bk-phi-N-2013", {}),
        ("ba-smp-H-2013", {}),
        ("ba-smp-H-2011", {}),
        ("bk-kom-N-2013", {}),
        ("bk-kom-N-2011", {})
    }

END

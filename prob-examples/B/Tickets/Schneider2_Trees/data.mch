/* Machine generated: Mon Oct 19 17:19:33 CEST 2015 */
/* Database information: */
/*  generator: mincer-0.1.0-SNAPSHOT */
/*  schema_version: v3.0 */


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
CONSTANTS
    courses,
    course_names,
    course_levels,
    course_modules,
    course_tree_leaves,
    LEVELS,
    level_modules,
    modules
PROPERTIES
    modules : POW(NATURAL1 * struct(idx:NATURAL1, name:STRING, title:STRING, pordnr:NATURAL, mandatory:BOOL))
    &
    modules = {
        (1 |-> rec(idx:1, name:"Logik I", title:"Philosophische Propädeutik: Basismodul Logik 1", pordnr:34510, mandatory:TRUE)),
        (2 |-> rec(idx:2, name:"Grundlagen", title:"Philosophische Propädeutik: Basismodul Grundlagen", pordnr:34509, mandatory:FALSE)),
        (3 |-> rec(idx:3, name:"Erkenntnistheorie", title:"Theoretische Philosophie: Basismodul Erkenntnistheorie", pordnr:34513, mandatory:FALSE)),
        (4 |-> rec(idx:4, name:"Ontologie/Methaphysik", title:"Theoretische Philosophie: Basismodul Ontologie/Metaphysik", pordnr:34514, mandatory:FALSE)),
        (5 |-> rec(idx:5, name:"Ethik", title:"Praktische Philosophie: Basismodul Ethik", pordnr:34517, mandatory:FALSE)),
        (6 |-> rec(idx:6, name:"Politische Philosophie", title:"Praktische Philosophie: Basismodul Politische Philosophie", pordnr:34518, mandatory:FALSE)),
        (7 |-> rec(idx:7, name:"Antike", title:"Geschichte der Philosophie: Basismodul Antike", pordnr:34521, mandatory:FALSE)),
        (8 |-> rec(idx:8, name:"Mittelalter", title:"Geschichte der Philosophie: Basismodul Mittelalter", pordnr:34522, mandatory:FALSE)),
        (9 |-> rec(idx:9, name:"Neuzeit", title:"Geschichte der Philosophie: Basismodul Neuzeit", pordnr:34523, mandatory:FALSE)),
        (10 |-> rec(idx:10, name:"Gegenwart", title:"Geschichte der Philosophie: Basismodul Gegenwart", pordnr:34524, mandatory:FALSE)),
        (11 |-> rec(idx:11, name:"Logik II", title:"Philosophische Propädeutik: Basismodul Logik 2", pordnr:34511, mandatory:FALSE)),
        (12 |-> rec(idx:12, name:"Argumentation", title:"Philosophische Propädeutik: Basismodul Argumentation", pordnr:34512, mandatory:FALSE)),
        (13 |-> rec(idx:13, name:"Wissenschaftstheorie", title:"Theoretische Philosophie: Basismodul Wissenschaftstheorie", pordnr:34515, mandatory:FALSE)),
        (14 |-> rec(idx:14, name:"Sprachphilosophie", title:"Theoretische Philosophie: Basismodul Sprachphilosophie", pordnr:34516, mandatory:FALSE)),
        (15 |-> rec(idx:15, name:"Anthropologie/Kulturphilosophie", title:"Praktische Philosophie: Basismodul Anthropologie/Kulturphilosophie", pordnr:34519, mandatory:FALSE)),
        (17 |-> rec(idx:17, name:"Logik/Metalogik", title:"Aufbaumodul Logik/Metalogik", pordnr:34525, mandatory:FALSE)),
        (16 |-> rec(idx:16, name:"Sozialphilosophie/Rechtsphilosophie", title:"Praktische Philosophie: Basismodul Sozialphilosophie/Rechtsphilosophie", pordnr:34520, mandatory:FALSE)),
        (19 |-> rec(idx:19, name:"Erkenntnistheorie/Wissenschaftstheorie", title:"Aufbaumodul Erkenntnistheorie/Wissenschaftstheorie", pordnr:34527, mandatory:FALSE)),
        (18 |-> rec(idx:18, name:"Ontologie/Metaphysik/Sprachphilosophie", title:"Aufbaumodul Ontologie/Metaphysik/Sprachphilosophie", pordnr:34526, mandatory:FALSE)),
        (21 |-> rec(idx:21, name:"Ethik", title:"Aufbaumodul Ethik", pordnr:34529, mandatory:FALSE)),
        (20 |-> rec(idx:20, name:"Anthropologie/Philosophie des Geistes", title:"Aufbaumodul Anthropologie/Philosophie des Geistes", pordnr:34528, mandatory:FALSE)),
        (23 |-> rec(idx:23, name:"Politische Philosophie/Rechtsphilosophie", title:"Aufbaumodul Politische Philosophie/Rechtsphilosophie", pordnr:34531, mandatory:FALSE)),
        (22 |-> rec(idx:22, name:"Kulturphilosophie/Sozialphilosophie", title:"Aufbaumodul Kulturphilosophie/Sozialphilosophie", pordnr:34530, mandatory:FALSE))
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
    LEVELS = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 16, 19, 18, 21, 20, 23, 22, 25, 24, 27, 26, 29, 28, 31, 30, 34, 35, 32, 33, 38, 39, 36, 37, 42, 43, 40, 41, 46, 47, 44, 45, 51, 50, 49, 48, 55, 54, 53, 52, 59, 58, 57, 56, 63, 62, 61, 60, 68, 69, 70, 71, 64, 65, 66, 67, 76, 77, 78, 79, 72, 73, 74, 75, 85, 84, 87, 86, 81, 80, 83, 82, 93, 92, 95, 94, 89, 88, 91, 90, 102, 103, 100, 101, 98, 99, 96, 97, 110, 111, 108, 109, 106, 107, 104, 105, 119, 118, 117, 116, 115, 114, 113, 112, 127, 126, 125, 124, 123, 122, 121, 120, 137, 136, 139, 138, 141, 140, 143, 142, 129, 128, 131, 130, 133, 132, 135, 134, 152, 153, 154, 155, 156, 157, 158, 159, 144, 145, 146, 147, 148, 149, 150, 151, 171, 170, 169, 168, 175, 174, 173, 172, 163, 162, 161, 160, 167, 166, 165, 164, 186, 187, 184, 185, 190, 191, 188, 189, 178, 179, 176, 177, 182, 183, 180, 181, 205, 204, 207, 206, 201, 200, 203, 202, 197, 196, 199, 198, 193, 192, 195, 194, 208, 209, 210, 211}
    &
    course_levels : dom(courses) <-> tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
    &
    #(level_1, level_2, level_3, level_4, level_5, level_6, level_7, level_8, level_9, level_10,
        level_11, level_12, level_13, level_14, level_15, level_17, level_16, level_19, level_18, level_21,
        level_20, level_23, level_22, level_25, level_24, level_27, level_26, level_29, level_28, level_31,
        level_30, level_34, level_35, level_32, level_33, level_38, level_39, level_36, level_37, level_42,
        level_43, level_40, level_41, level_46, level_47, level_44, level_45, level_51, level_50, level_49,
        level_48, level_55, level_54, level_53, level_52, level_59, level_58, level_57, level_56, level_63,
        level_62, level_61, level_60, level_68, level_69, level_70, level_71, level_64, level_65, level_66,
        level_67, level_76, level_77, level_78, level_79, level_72, level_73, level_74, level_75, level_85,
        level_84, level_87, level_86, level_81, level_80, level_83, level_82, level_93, level_92, level_95,
        level_94, level_89, level_88, level_91, level_90, level_102, level_103, level_100, level_101, level_98,
        level_99, level_96, level_97, level_110, level_111, level_108, level_109, level_106, level_107, level_104,
        level_105, level_119, level_118, level_117, level_116, level_115, level_114, level_113, level_112, level_127,
        level_126, level_125, level_124, level_123, level_122, level_121, level_120, level_137, level_136, level_139,
        level_138, level_141, level_140, level_143, level_142, level_129, level_128, level_131, level_130, level_133,
        level_132, level_135, level_134, level_152, level_153, level_154, level_155, level_156, level_157, level_158,
        level_159, level_144, level_145, level_146, level_147, level_148, level_149, level_150, level_151, level_171,
        level_170, level_169, level_168, level_175, level_174, level_173, level_172, level_163, level_162, level_161,
        level_160, level_167, level_166, level_165, level_164, level_186, level_187, level_184, level_185, level_190,
        level_191, level_188, level_189, level_178, level_179, level_176, level_177, level_182, level_183, level_180,
        level_181, level_205, level_204, level_207, level_206, level_201, level_200, level_203, level_202, level_197,
        level_196, level_199, level_198, level_193, level_192, level_195, level_194, level_208, level_209, level_210,
        level_211).(

        level_1 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_1 =
            const(rec(idx:1, art:"null", name:"Basismodule", tm:"null", from:7, to:7), [level_2, level_8, level_4]) &
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
            const(rec(idx:4, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:4, to:6), [level_6, level_5, level_7]) &
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
            const(rec(idx:8, art:"null", name:"Basiswahlmodule", tm:"null", from:0, to:2), [level_11, level_9, level_10]) &
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
            /* const(rec(idx:13, art:"null", name:"Basismodule", tm:"null", from:7, to:7), [level_14, level_20, level_16]) & */
            const(rec(idx:13, art:"null", name:"Basismodule", tm:"null", from:4, to:4), [level_16]) &
        level_14 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_14 =
            const(rec(idx:14, art:"null", name:"Basispflichtmodule", tm:"null", from:1, to:2), [level_15]) &
        level_15 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_15 =
            bin(rec(idx:15, art:"null", name:"Philosophische Propädeutik", tm:"null", from:1, to:2))
         &
        level_17 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_17 =
            bin(rec(idx:17, art:"null", name:"Theoretische Philosophie", tm:"null", from:1, to:2))
         &
        level_16 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_16 =
            const(rec(idx:16, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:4, to:6), [level_17, level_19, level_18]) &
        level_19 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_19 =
            bin(rec(idx:19, art:"null", name:"Geschichte der Philosophie", tm:"null", from:2, to:4))
         &
        level_18 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_18 =
            bin(rec(idx:18, art:"null", name:"Praktische Philosophie", tm:"null", from:1, to:2))
         &
        level_21 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_21 =
            bin(rec(idx:21, art:"null", name:"Philosophische Propädeutik", tm:"null", from:0, to:2))
         &
        level_20 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_20 =
            const(rec(idx:20, art:"null", name:"Basiswahlmodule", tm:"null", from:0, to:2), [level_21, level_23, level_22]) &
        level_23 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_23 =
            bin(rec(idx:23, art:"null", name:"Praktische Philosophie", tm:"null", from:0, to:2))
         &
        level_22 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_22 =
            bin(rec(idx:22, art:"null", name:"Theoretische Philosophie", tm:"null", from:0, to:2))
         &
        level_25 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_25 =
            const(rec(idx:25, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_26, level_27]) &
        level_24 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_24 =
            bin(rec(idx:24, art:"null", name:"Aufbaumodule", tm:"null", from:2, to:2))
         &
        level_27 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_27 =
            const(rec(idx:27, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:2, to:2), [level_28, level_29]) &
        level_26 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_26 =
            bin(rec(idx:26, art:"null", name:"Basispflichtmodul", tm:"null", from:1, to:1))
         &
        level_29 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_29 =
            bin(rec(idx:29, art:"null", name:"Geschichte der Philosophie", tm:"null", from:1, to:1))
         &
        level_28 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_28 =
            bin(rec(idx:28, art:"null", name:"Theoretische Philosophie und Praktische Philosophie", tm:"null", from:1, to:1))
         &
        level_31 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_31 =
            const(rec(idx:31, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_33, level_32]) &
        level_30 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_30 =
            bin(rec(idx:30, art:"null", name:"Aufbaumodule", tm:"null", from:1, to:1))
         &
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
        level_32 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_32 =
            bin(rec(idx:32, art:"null", name:"Basispflichtmodul", tm:"null", from:1, to:1))
         &
        level_33 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_33 =
            const(rec(idx:33, art:"null", name:"Basiswahlpflichtmodule", tm:"null", from:2, to:2), [level_34, level_35]) &
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
        level_36 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_36 =
            bin(rec(idx:36, art:"null", name:"Aufbaumodule", tm:"null", from:1, to:1))
         &
        level_37 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_37 =
            const(rec(idx:37, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_40, level_39, level_38]) &
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
        level_40 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_40 =
            bin(rec(idx:40, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         &
        level_41 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_41 =
            const(rec(idx:41, art:"null", name:"Methodenmodule", tm:"null", from:5, to:5), [level_44, level_43, level_42]) &
        level_46 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_46 =
            const(rec(idx:46, art:"null", name:"Individuum & Gesellschaft", tm:"IG", from:1, to:1), [level_50, level_47]) &
        level_47 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_47 =
            const(rec(idx:47, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"IG", from:-1, to:-1), [level_49, level_48]) &
        level_44 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_44 =
            bin(rec(idx:44, art:"null", name:"Lehrforschungsprojekt", tm:"null", from:1, to:1))
         &
        level_45 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_45 =
            const(rec(idx:45, art:"null", name:"Themenmodule", tm:"null", from:5, to:5), [level_88, level_60, level_46, level_74, level_101]) &
        level_51 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_51 =
            const(rec(idx:51, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_52, level_53]) &
        level_50 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_50 =
            const(rec(idx:50, art:"VS", name:"Vertiefungsseminare ", tm:"IG", from:-1, to:-1), [level_57, level_51, level_54]) &
        level_49 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_49 =
            bin(rec(idx:49, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"IG", from:-1, to:-1))
         &
        level_48 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_48 =
            bin(rec(idx:48, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_55 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_55 =
            bin(rec(idx:55, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_54 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_54 =
            const(rec(idx:54, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_56, level_55]) &
        level_53 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_53 =
            bin(rec(idx:53, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_52 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_52 =
            bin(rec(idx:52, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_59 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_59 =
            bin(rec(idx:59, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_58 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_58 =
            bin(rec(idx:58, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_57 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_57 =
            const(rec(idx:57, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_59, level_58]) &
        level_56 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_56 =
            bin(rec(idx:56, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_63 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_63 =
            bin(rec(idx:63, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"SS", from:-1, to:-1))
         &
        level_62 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_62 =
            bin(rec(idx:62, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         &
        level_61 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_61 =
            const(rec(idx:61, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"SS", from:-1, to:-1), [level_63, level_62]) &
        level_60 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_60 =
            const(rec(idx:60, art:"null", name:"Systeme & Strukturen", tm:"SS", from:1, to:1), [level_61, level_64]) &
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
        level_64 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_64 =
            const(rec(idx:64, art:"VS", name:"Vertiefungsseminare ", tm:"SS", from:-1, to:-1), [level_68, level_65, level_71]) &
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
            const(rec(idx:74, art:"null", name:"Bereiche & Prozesse", tm:"BP", from:1, to:1), [level_78, level_75]) &
        level_75 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_75 =
            const(rec(idx:75, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"BP", from:-1, to:-1), [level_76, level_77]) &
        level_85 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_85 =
            const(rec(idx:85, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_86, level_87]) &
        level_84 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_84 =
            bin(rec(idx:84, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         &
        level_87 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_87 =
            bin(rec(idx:87, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         &
        level_86 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_86 =
            bin(rec(idx:86, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         &
        level_81 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_81 =
            bin(rec(idx:81, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         &
        level_80 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_80 =
            bin(rec(idx:80, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         &
        level_83 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_83 =
            bin(rec(idx:83, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         &
        level_82 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_82 =
            const(rec(idx:82, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_84, level_83]) &
        level_93 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_93 =
            bin(rec(idx:93, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         &
        level_92 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_92 =
            const(rec(idx:92, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_94, level_93]) &
        level_95 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_95 =
            const(rec(idx:95, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_96, level_97]) &
        level_94 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_94 =
            bin(rec(idx:94, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_89 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_89 =
            const(rec(idx:89, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MK", from:-1, to:-1), [level_95, level_92, level_91, level_90, level_98]) &
        level_88 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_88 =
            const(rec(idx:88, art:"null", name:"Medien & Kommunikation", tm:"MK", from:1, to:1), [level_89]) &
        level_91 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_91 =
            bin(rec(idx:91, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"MK", from:-1, to:-1))
         &
        level_90 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_90 =
            bin(rec(idx:90, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_102 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_102 =
            const(rec(idx:102, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"EI", from:-1, to:-1), [level_104, level_103]) &
        level_103 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_103 =
            bin(rec(idx:103, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         &
        level_100 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_100 =
            bin(rec(idx:100, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_101 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_101 =
            const(rec(idx:101, art:"null", name:"Europa & Internationale Studien", tm:"EI", from:1, to:1), [level_105, level_102]) &
        level_98 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_98 =
            const(rec(idx:98, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_100, level_99]) &
        level_99 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_99 =
            bin(rec(idx:99, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         &
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
        level_108 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_108 =
            bin(rec(idx:108, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         &
        level_109 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_109 =
            const(rec(idx:109, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_111, level_110]) &
        level_106 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_106 =
            const(rec(idx:106, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_107, level_108]) &
        level_107 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_107 =
            bin(rec(idx:107, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         &
        level_104 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_104 =
            bin(rec(idx:104, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"EI", from:-1, to:-1))
         &
        level_105 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_105 =
            const(rec(idx:105, art:"VS", name:"Vertiefungsseminare ", tm:"EI", from:-1, to:-1), [level_106, level_112, level_109]) &
        level_119 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_119 =
            const(rec(idx:119, art:"null", name:"Methodenmodule", tm:"null", from:5, to:5), [level_122, level_120, level_121]) &
        level_118 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_118 =
            bin(rec(idx:118, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         &
        level_117 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_117 =
            bin(rec(idx:117, art:"null", name:"Basismodul Politikwissenschaft", tm:"null", from:1, to:1))
         &
        level_116 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_116 =
            bin(rec(idx:116, art:"null", name:"Basismodul Soziologie", tm:"null", from:1, to:1))
         &
        level_115 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_115 =
            const(rec(idx:115, art:"null", name:"Basismodule", tm:"null", from:3, to:3), [level_118, level_116, level_117]) &
        level_114 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_114 =
            bin(rec(idx:114, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         &
        level_113 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_113 =
            bin(rec(idx:113, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         &
        level_112 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_112 =
            const(rec(idx:112, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_114, level_113]) &
        level_127 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_127 =
            bin(rec(idx:127, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"IG", from:-1, to:-1))
         &
        level_126 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_126 =
            bin(rec(idx:126, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_125 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_125 =
            const(rec(idx:125, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"IG", from:-1, to:-1), [level_127, level_126]) &
        level_124 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_124 =
            const(rec(idx:124, art:"null", name:"Individuum & Gesellschaft", tm:"IG", from:1, to:1), [level_128, level_125]) &
        level_123 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_123 =
            const(rec(idx:123, art:"null", name:"Themenmodule", tm:"null", from:5, to:5), [level_124, level_166, level_138, level_152, level_180]) &
        level_122 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_122 =
            bin(rec(idx:122, art:"null", name:"Lehrforschungsprojekt", tm:"null", from:1, to:1))
         &
        level_121 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_121 =
            bin(rec(idx:121, art:"null", name:"Analyseverfahren", tm:"null", from:2, to:2))
         &
        level_120 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_120 =
            bin(rec(idx:120, art:"null", name:"Erhebungsverfahren", tm:"null", from:2, to:2))
         &
        level_137 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_137 =
            bin(rec(idx:137, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_136 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_136 =
            bin(rec(idx:136, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_139 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_139 =
            const(rec(idx:139, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"SS", from:-1, to:-1), [level_140, level_141]) &
        level_138 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_138 =
            const(rec(idx:138, art:"null", name:"Systeme & Strukturen", tm:"SS", from:1, to:1), [level_142, level_139]) &
        level_141 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_141 =
            bin(rec(idx:141, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"SS", from:-1, to:-1))
         &
        level_140 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_140 =
            bin(rec(idx:140, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"SS", from:-1, to:-1))
         &
        level_143 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_143 =
            const(rec(idx:143, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_144, level_145]) &
        level_142 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_142 =
            const(rec(idx:142, art:"VS", name:"Vertiefungsseminare", tm:"SS", from:-1, to:-1), [level_149, level_146, level_143]) &
        level_129 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_129 =
            const(rec(idx:129, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_130, level_131]) &
        level_128 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_128 =
            const(rec(idx:128, art:"VS", name:"Vertiefungsseminare", tm:"IG", from:-1, to:-1), [level_132, level_135, level_129]) &
        level_131 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_131 =
            bin(rec(idx:131, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_130 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_130 =
            bin(rec(idx:130, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_133 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_133 =
            bin(rec(idx:133, art:"VS", name:"Mündliche Prüfung", tm:"IG", from:-1, to:-1))
         &
        level_132 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_132 =
            const(rec(idx:132, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_134, level_133]) &
        level_135 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_135 =
            const(rec(idx:135, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_137, level_136]) &
        level_134 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_134 =
            bin(rec(idx:134, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"IG", from:-1, to:-1))
         &
        level_152 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_152 =
            const(rec(idx:152, art:"null", name:"Bereiche & Prozesse", tm:"BP", from:1, to:1), [level_153, level_156]) &
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
            const(rec(idx:156, art:"VS", name:"Vertiefungsseminare", tm:"BP", from:-1, to:-1), [level_163, level_157, level_160]) &
        level_157 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_157 =
            const(rec(idx:157, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_158, level_159]) &
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
            const(rec(idx:146, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_148, level_147]) &
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
            const(rec(idx:149, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_151, level_150]) &
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
        level_171 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_171 =
            const(rec(idx:171, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_172, level_173]) &
        level_170 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_170 =
            const(rec(idx:170, art:"VS", name:"Vertiefungsseminare ", tm:"MK", from:-1, to:-1), [level_177, level_171, level_174]) &
        level_169 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_169 =
            bin(rec(idx:169, art:"AS", name:"Mündliche Prüfung oder Klausur ", tm:"MK", from:-1, to:-1))
         &
        level_168 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_168 =
            bin(rec(idx:168, art:"AS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_175 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_175 =
            bin(rec(idx:175, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         &
        level_174 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_174 =
            const(rec(idx:174, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_175, level_176]) &
        level_173 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_173 =
            bin(rec(idx:173, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_172 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_172 =
            bin(rec(idx:172, art:"VS", name:"Mündliche Prüfung", tm:"MK", from:-1, to:-1))
         &
        level_163 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_163 =
            const(rec(idx:163, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_165, level_164]) &
        level_162 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_162 =
            bin(rec(idx:162, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         &
        level_161 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_161 =
            bin(rec(idx:161, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         &
        level_160 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_160 =
            const(rec(idx:160, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_161, level_162]) &
        level_167 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_167 =
            const(rec(idx:167, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MK", from:-1, to:-1), [level_168, level_169]) &
        level_166 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_166 =
            const(rec(idx:166, art:"null", name:"Medien & Kommunikation", tm:"MK", from:1, to:1), [level_170, level_167]) &
        level_165 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_165 =
            bin(rec(idx:165, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"BP", from:-1, to:-1))
         &
        level_164 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_164 =
            bin(rec(idx:164, art:"VS", name:"Mündliche Prüfung", tm:"BP", from:-1, to:-1))
         &
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
        level_184 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_184 =
            const(rec(idx:184, art:"VS", name:"Vertiefungsseminare", tm:"EI", from:-1, to:-1), [level_191, level_188, level_185]) &
        level_185 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_185 =
            const(rec(idx:185, art:"null", name:"Soziologie", tm:"null", from:-1, to:-1), [level_186, level_187]) &
        level_190 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_190 =
            bin(rec(idx:190, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         &
        level_191 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_191 =
            const(rec(idx:191, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_193, level_192]) &
        level_188 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_188 =
            const(rec(idx:188, art:"null", name:"Politikwissenschaft", tm:"null", from:-1, to:-1), [level_190, level_189]) &
        level_189 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_189 =
            bin(rec(idx:189, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         &
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
        level_176 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_176 =
            bin(rec(idx:176, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"MK", from:-1, to:-1))
         &
        level_177 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_177 =
            const(rec(idx:177, art:"null", name:"Kommunikations- und Medienwissenschaft", tm:"null", from:-1, to:-1), [level_178, level_179]) &
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
        level_180 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_180 =
            const(rec(idx:180, art:"null", name:"Europa & Internationale Studien", tm:"EI", from:1, to:1), [level_184, level_181]) &
        level_181 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_181 =
            const(rec(idx:181, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"EI", from:-1, to:-1), [level_182, level_183]) &
        level_205 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_205 =
            bin(rec(idx:205, art:"VS", name:"Vertiefungsseminare", tm:"MI", from:-1, to:-1))
         &
        level_204 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_204 =
            bin(rec(idx:204, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MI", from:-1, to:-1))
         &
        level_207 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_207 =
            bin(rec(idx:207, art:"AS", name:"Aufbauseminare oder Vorlesungen", tm:"MG", from:-1, to:-1))
         &
        level_206 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_206 =
            const(rec(idx:206, art:"null", name:"Medien & Gesellschaft", tm:"MG", from:1, to:1), [level_208, level_207]) &
        level_201 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_201 =
            bin(rec(idx:201, art:"null", name:"Modul Methoden der Sozialwissenschaften", tm:"null", from:1, to:1))
         &
        level_200 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_200 =
            bin(rec(idx:200, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
         &
        level_203 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_203 =
            const(rec(idx:203, art:"null", name:"Medien & Individuum", tm:"MI", from:1, to:1), [level_205, level_204]) &
        level_202 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_202 =
            const(rec(idx:202, art:"null", name:"Themenmodule", tm:"null", from:3, to:3), [level_203, level_206, level_209]) &
        level_197 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_197 =
            bin(rec(idx:197, art:"AS", name:"Medien & Individuum", tm:"MI", from:1, to:1))
         &
        level_196 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_196 =
            const(rec(idx:196, art:"null", name:"Themenmodule", tm:"null", from:3, to:3), [level_198, level_199, level_197]) &
        level_199 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_199 =
            bin(rec(idx:199, art:"VS", name:"Akteure  & Prozesse professioneller Kommunikation", tm:"AP", from:1, to:1))
         &
        level_198 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_198 =
            bin(rec(idx:198, art:"VS", name:"Medien & Gesellschaft", tm:"MG", from:1, to:1))
         &
        level_193 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_193 =
            bin(rec(idx:193, art:"VS", name:"Studienarbeit, Hausarbeit oder Projektarbeit", tm:"EI", from:-1, to:-1))
         &
        level_192 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_192 =
            bin(rec(idx:192, art:"VS", name:"Mündliche Prüfung", tm:"EI", from:-1, to:-1))
         &
        level_195 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_195 =
            bin(rec(idx:195, art:"null", name:"Modul Methoden der Sozialwissenschaften", tm:"null", from:1, to:1))
         &
        level_194 : tree(struct(idx: LEVELS, art:STRING, name: STRING, tm: STRING, from: NATURAL \/ {-1}, to: NATURAL \/ {-1}))
        &
        level_194 =
            bin(rec(idx:194, art:"null", name:"Basismodul Kommunikations- und Medienwissenschaft", tm:"null", from:1, to:1))
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
        /* ("bk-phi-H-2013", level_24), */
        ("bk-phi-H-2013", level_16),
        ("bk-phi-N-2011", level_30), ("bk-phi-N-2011", level_25),
        ("bk-phi-N-2013", level_36), ("bk-phi-N-2013", level_31),
        ("ba-smp-H-2013", level_45), ("ba-smp-H-2013", level_41), ("ba-smp-H-2013", level_37),
        ("ba-smp-H-2011", level_123), ("ba-smp-H-2011", level_119), ("ba-smp-H-2011", level_115),
        ("bk-kom-N-2013", level_196), ("bk-kom-N-2013", level_194), ("bk-kom-N-2013", level_195),
        ("bk-kom-N-2011", level_201), ("bk-kom-N-2011", level_200), ("bk-kom-N-2011", level_202)
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
        (17 |-> 3), (17 |-> 4),
        (19 |-> 7), (19 |-> 8), (19 |-> 9), (19 |-> 10),
        (18 |-> 5), (18 |-> 6),
        (21 |-> 12), (21 |-> 11),
        (23 |-> 16), (23 |-> 15),
        (22 |-> 14), (22 |-> 13),
        (24 |-> 23), (24 |-> 21), (24 |-> 17), (24 |-> 22), (24 |-> 19), (24 |-> 18), (24 |-> 20)
    }
    &
    course_modules : dom(courses) --> POW(dom(modules))
    &
    course_modules = {

        ("bk-phi-H-2011", {}),
        ("bk-phi-H-2013", {7 ,16 ,21 ,22 ,19 ,9 ,15 ,6 ,1 ,10 ,20 ,2 ,4 ,14 ,3 ,12 ,23 ,8 ,17 ,5 ,18 ,11 ,13}),
        ("bk-phi-N-2011", {}),
        ("bk-phi-N-2013", {}),
        ("ba-smp-H-2013", {}),
        ("ba-smp-H-2011", {}),
        ("bk-kom-N-2013", {}),
        ("bk-kom-N-2011", {})
    }

END

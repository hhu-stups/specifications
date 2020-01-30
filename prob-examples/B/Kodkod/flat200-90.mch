MACHINE SAT
/* CNF Translated to B */
/* 600 Boolean variables , 2237 Clauses */
/* Takes ProB about 3 seconds for first 4 solutions with static ordering */
/* 3.27 seconds with ProB 1.3.3-beta10 on 3.06 GHz MacBook Pro; about 4 secs with tracing of components */
/* Howe& King solver takes 130 ms with static ordering; minisat <10ms */

CONSTANTS
   x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, 
   x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, 
   x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, 
   x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, 
   x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, 
   x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, 
   x61, x62, x63, x64, x65, x66, x67, x68, x69, x70, 
   x71, x72, x73, x74, x75, x76, x77, x78, x79, x80, 
   x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, 
   x91, x92, x93, x94, x95, x96, x97, x98, x99, x100, 
   x101, x102, x103, x104, x105, x106, x107, x108, x109, x110, 
   x111, x112, x113, x114, x115, x116, x117, x118, x119, x120, 
   x121, x122, x123, x124, x125, x126, x127, x128, x129, x130, 
   x131, x132, x133, x134, x135, x136, x137, x138, x139, x140, 
   x141, x142, x143, x144, x145, x146, x147, x148, x149, x150, 
   x151, x152, x153, x154, x155, x156, x157, x158, x159, x160, 
   x161, x162, x163, x164, x165, x166, x167, x168, x169, x170, 
   x171, x172, x173, x174, x175, x176, x177, x178, x179, x180, 
   x181, x182, x183, x184, x185, x186, x187, x188, x189, x190, 
   x191, x192, x193, x194, x195, x196, x197, x198, x199, x200, 
   x201, x202, x203, x204, x205, x206, x207, x208, x209, x210, 
   x211, x212, x213, x214, x215, x216, x217, x218, x219, x220, 
   x221, x222, x223, x224, x225, x226, x227, x228, x229, x230, 
   x231, x232, x233, x234, x235, x236, x237, x238, x239, x240, 
   x241, x242, x243, x244, x245, x246, x247, x248, x249, x250, 
   x251, x252, x253, x254, x255, x256, x257, x258, x259, x260, 
   x261, x262, x263, x264, x265, x266, x267, x268, x269, x270, 
   x271, x272, x273, x274, x275, x276, x277, x278, x279, x280, 
   x281, x282, x283, x284, x285, x286, x287, x288, x289, x290, 
   x291, x292, x293, x294, x295, x296, x297, x298, x299, x300, 
   x301, x302, x303, x304, x305, x306, x307, x308, x309, x310, 
   x311, x312, x313, x314, x315, x316, x317, x318, x319, x320, 
   x321, x322, x323, x324, x325, x326, x327, x328, x329, x330, 
   x331, x332, x333, x334, x335, x336, x337, x338, x339, x340, 
   x341, x342, x343, x344, x345, x346, x347, x348, x349, x350, 
   x351, x352, x353, x354, x355, x356, x357, x358, x359, x360, 
   x361, x362, x363, x364, x365, x366, x367, x368, x369, x370, 
   x371, x372, x373, x374, x375, x376, x377, x378, x379, x380, 
   x381, x382, x383, x384, x385, x386, x387, x388, x389, x390, 
   x391, x392, x393, x394, x395, x396, x397, x398, x399, x400, 
   x401, x402, x403, x404, x405, x406, x407, x408, x409, x410, 
   x411, x412, x413, x414, x415, x416, x417, x418, x419, x420, 
   x421, x422, x423, x424, x425, x426, x427, x428, x429, x430, 
   x431, x432, x433, x434, x435, x436, x437, x438, x439, x440, 
   x441, x442, x443, x444, x445, x446, x447, x448, x449, x450, 
   x451, x452, x453, x454, x455, x456, x457, x458, x459, x460, 
   x461, x462, x463, x464, x465, x466, x467, x468, x469, x470, 
   x471, x472, x473, x474, x475, x476, x477, x478, x479, x480, 
   x481, x482, x483, x484, x485, x486, x487, x488, x489, x490, 
   x491, x492, x493, x494, x495, x496, x497, x498, x499, x500, 
   x501, x502, x503, x504, x505, x506, x507, x508, x509, x510, 
   x511, x512, x513, x514, x515, x516, x517, x518, x519, x520, 
   x521, x522, x523, x524, x525, x526, x527, x528, x529, x530, 
   x531, x532, x533, x534, x535, x536, x537, x538, x539, x540, 
   x541, x542, x543, x544, x545, x546, x547, x548, x549, x550, 
   x551, x552, x553, x554, x555, x556, x557, x558, x559, x560, 
   x561, x562, x563, x564, x565, x566, x567, x568, x569, x570, 
   x571, x572, x573, x574, x575, x576, x577, x578, x579, x580, 
   x581, x582, x583, x584, x585, x586, x587, x588, x589, x590, 
   x591, x592, x593, x594, x595, x596, x597, x598, x599, x600
PROPERTIES
   x1:BOOL & x2:BOOL & x3:BOOL & x4:BOOL & x5:BOOL & 
   x6:BOOL & x7:BOOL & x8:BOOL & x9:BOOL & x10:BOOL & 
   x11:BOOL & x12:BOOL & x13:BOOL & x14:BOOL & x15:BOOL & 
   x16:BOOL & x17:BOOL & x18:BOOL & x19:BOOL & x20:BOOL & 
   x21:BOOL & x22:BOOL & x23:BOOL & x24:BOOL & x25:BOOL & 
   x26:BOOL & x27:BOOL & x28:BOOL & x29:BOOL & x30:BOOL & 
   x31:BOOL & x32:BOOL & x33:BOOL & x34:BOOL & x35:BOOL & 
   x36:BOOL & x37:BOOL & x38:BOOL & x39:BOOL & x40:BOOL & 
   x41:BOOL & x42:BOOL & x43:BOOL & x44:BOOL & x45:BOOL & 
   x46:BOOL & x47:BOOL & x48:BOOL & x49:BOOL & x50:BOOL & 
   x51:BOOL & x52:BOOL & x53:BOOL & x54:BOOL & x55:BOOL & 
   x56:BOOL & x57:BOOL & x58:BOOL & x59:BOOL & x60:BOOL & 
   x61:BOOL & x62:BOOL & x63:BOOL & x64:BOOL & x65:BOOL & 
   x66:BOOL & x67:BOOL & x68:BOOL & x69:BOOL & x70:BOOL & 
   x71:BOOL & x72:BOOL & x73:BOOL & x74:BOOL & x75:BOOL & 
   x76:BOOL & x77:BOOL & x78:BOOL & x79:BOOL & x80:BOOL & 
   x81:BOOL & x82:BOOL & x83:BOOL & x84:BOOL & x85:BOOL & 
   x86:BOOL & x87:BOOL & x88:BOOL & x89:BOOL & x90:BOOL & 
   x91:BOOL & x92:BOOL & x93:BOOL & x94:BOOL & x95:BOOL & 
   x96:BOOL & x97:BOOL & x98:BOOL & x99:BOOL & x100:BOOL & 
   x101:BOOL & x102:BOOL & x103:BOOL & x104:BOOL & x105:BOOL & 
   x106:BOOL & x107:BOOL & x108:BOOL & x109:BOOL & x110:BOOL & 
   x111:BOOL & x112:BOOL & x113:BOOL & x114:BOOL & x115:BOOL & 
   x116:BOOL & x117:BOOL & x118:BOOL & x119:BOOL & x120:BOOL & 
   x121:BOOL & x122:BOOL & x123:BOOL & x124:BOOL & x125:BOOL & 
   x126:BOOL & x127:BOOL & x128:BOOL & x129:BOOL & x130:BOOL & 
   x131:BOOL & x132:BOOL & x133:BOOL & x134:BOOL & x135:BOOL & 
   x136:BOOL & x137:BOOL & x138:BOOL & x139:BOOL & x140:BOOL & 
   x141:BOOL & x142:BOOL & x143:BOOL & x144:BOOL & x145:BOOL & 
   x146:BOOL & x147:BOOL & x148:BOOL & x149:BOOL & x150:BOOL & 
   x151:BOOL & x152:BOOL & x153:BOOL & x154:BOOL & x155:BOOL & 
   x156:BOOL & x157:BOOL & x158:BOOL & x159:BOOL & x160:BOOL & 
   x161:BOOL & x162:BOOL & x163:BOOL & x164:BOOL & x165:BOOL & 
   x166:BOOL & x167:BOOL & x168:BOOL & x169:BOOL & x170:BOOL & 
   x171:BOOL & x172:BOOL & x173:BOOL & x174:BOOL & x175:BOOL & 
   x176:BOOL & x177:BOOL & x178:BOOL & x179:BOOL & x180:BOOL & 
   x181:BOOL & x182:BOOL & x183:BOOL & x184:BOOL & x185:BOOL & 
   x186:BOOL & x187:BOOL & x188:BOOL & x189:BOOL & x190:BOOL & 
   x191:BOOL & x192:BOOL & x193:BOOL & x194:BOOL & x195:BOOL & 
   x196:BOOL & x197:BOOL & x198:BOOL & x199:BOOL & x200:BOOL & 
   x201:BOOL & x202:BOOL & x203:BOOL & x204:BOOL & x205:BOOL & 
   x206:BOOL & x207:BOOL & x208:BOOL & x209:BOOL & x210:BOOL & 
   x211:BOOL & x212:BOOL & x213:BOOL & x214:BOOL & x215:BOOL & 
   x216:BOOL & x217:BOOL & x218:BOOL & x219:BOOL & x220:BOOL & 
   x221:BOOL & x222:BOOL & x223:BOOL & x224:BOOL & x225:BOOL & 
   x226:BOOL & x227:BOOL & x228:BOOL & x229:BOOL & x230:BOOL & 
   x231:BOOL & x232:BOOL & x233:BOOL & x234:BOOL & x235:BOOL & 
   x236:BOOL & x237:BOOL & x238:BOOL & x239:BOOL & x240:BOOL & 
   x241:BOOL & x242:BOOL & x243:BOOL & x244:BOOL & x245:BOOL & 
   x246:BOOL & x247:BOOL & x248:BOOL & x249:BOOL & x250:BOOL & 
   x251:BOOL & x252:BOOL & x253:BOOL & x254:BOOL & x255:BOOL & 
   x256:BOOL & x257:BOOL & x258:BOOL & x259:BOOL & x260:BOOL & 
   x261:BOOL & x262:BOOL & x263:BOOL & x264:BOOL & x265:BOOL & 
   x266:BOOL & x267:BOOL & x268:BOOL & x269:BOOL & x270:BOOL & 
   x271:BOOL & x272:BOOL & x273:BOOL & x274:BOOL & x275:BOOL & 
   x276:BOOL & x277:BOOL & x278:BOOL & x279:BOOL & x280:BOOL & 
   x281:BOOL & x282:BOOL & x283:BOOL & x284:BOOL & x285:BOOL & 
   x286:BOOL & x287:BOOL & x288:BOOL & x289:BOOL & x290:BOOL & 
   x291:BOOL & x292:BOOL & x293:BOOL & x294:BOOL & x295:BOOL & 
   x296:BOOL & x297:BOOL & x298:BOOL & x299:BOOL & x300:BOOL & 
   x301:BOOL & x302:BOOL & x303:BOOL & x304:BOOL & x305:BOOL & 
   x306:BOOL & x307:BOOL & x308:BOOL & x309:BOOL & x310:BOOL & 
   x311:BOOL & x312:BOOL & x313:BOOL & x314:BOOL & x315:BOOL & 
   x316:BOOL & x317:BOOL & x318:BOOL & x319:BOOL & x320:BOOL & 
   x321:BOOL & x322:BOOL & x323:BOOL & x324:BOOL & x325:BOOL & 
   x326:BOOL & x327:BOOL & x328:BOOL & x329:BOOL & x330:BOOL & 
   x331:BOOL & x332:BOOL & x333:BOOL & x334:BOOL & x335:BOOL & 
   x336:BOOL & x337:BOOL & x338:BOOL & x339:BOOL & x340:BOOL & 
   x341:BOOL & x342:BOOL & x343:BOOL & x344:BOOL & x345:BOOL & 
   x346:BOOL & x347:BOOL & x348:BOOL & x349:BOOL & x350:BOOL & 
   x351:BOOL & x352:BOOL & x353:BOOL & x354:BOOL & x355:BOOL & 
   x356:BOOL & x357:BOOL & x358:BOOL & x359:BOOL & x360:BOOL & 
   x361:BOOL & x362:BOOL & x363:BOOL & x364:BOOL & x365:BOOL & 
   x366:BOOL & x367:BOOL & x368:BOOL & x369:BOOL & x370:BOOL & 
   x371:BOOL & x372:BOOL & x373:BOOL & x374:BOOL & x375:BOOL & 
   x376:BOOL & x377:BOOL & x378:BOOL & x379:BOOL & x380:BOOL & 
   x381:BOOL & x382:BOOL & x383:BOOL & x384:BOOL & x385:BOOL & 
   x386:BOOL & x387:BOOL & x388:BOOL & x389:BOOL & x390:BOOL & 
   x391:BOOL & x392:BOOL & x393:BOOL & x394:BOOL & x395:BOOL & 
   x396:BOOL & x397:BOOL & x398:BOOL & x399:BOOL & x400:BOOL & 
   x401:BOOL & x402:BOOL & x403:BOOL & x404:BOOL & x405:BOOL & 
   x406:BOOL & x407:BOOL & x408:BOOL & x409:BOOL & x410:BOOL & 
   x411:BOOL & x412:BOOL & x413:BOOL & x414:BOOL & x415:BOOL & 
   x416:BOOL & x417:BOOL & x418:BOOL & x419:BOOL & x420:BOOL & 
   x421:BOOL & x422:BOOL & x423:BOOL & x424:BOOL & x425:BOOL & 
   x426:BOOL & x427:BOOL & x428:BOOL & x429:BOOL & x430:BOOL & 
   x431:BOOL & x432:BOOL & x433:BOOL & x434:BOOL & x435:BOOL & 
   x436:BOOL & x437:BOOL & x438:BOOL & x439:BOOL & x440:BOOL & 
   x441:BOOL & x442:BOOL & x443:BOOL & x444:BOOL & x445:BOOL & 
   x446:BOOL & x447:BOOL & x448:BOOL & x449:BOOL & x450:BOOL & 
   x451:BOOL & x452:BOOL & x453:BOOL & x454:BOOL & x455:BOOL & 
   x456:BOOL & x457:BOOL & x458:BOOL & x459:BOOL & x460:BOOL & 
   x461:BOOL & x462:BOOL & x463:BOOL & x464:BOOL & x465:BOOL & 
   x466:BOOL & x467:BOOL & x468:BOOL & x469:BOOL & x470:BOOL & 
   x471:BOOL & x472:BOOL & x473:BOOL & x474:BOOL & x475:BOOL & 
   x476:BOOL & x477:BOOL & x478:BOOL & x479:BOOL & x480:BOOL & 
   x481:BOOL & x482:BOOL & x483:BOOL & x484:BOOL & x485:BOOL & 
   x486:BOOL & x487:BOOL & x488:BOOL & x489:BOOL & x490:BOOL & 
   x491:BOOL & x492:BOOL & x493:BOOL & x494:BOOL & x495:BOOL & 
   x496:BOOL & x497:BOOL & x498:BOOL & x499:BOOL & x500:BOOL & 
   x501:BOOL & x502:BOOL & x503:BOOL & x504:BOOL & x505:BOOL & 
   x506:BOOL & x507:BOOL & x508:BOOL & x509:BOOL & x510:BOOL & 
   x511:BOOL & x512:BOOL & x513:BOOL & x514:BOOL & x515:BOOL & 
   x516:BOOL & x517:BOOL & x518:BOOL & x519:BOOL & x520:BOOL & 
   x521:BOOL & x522:BOOL & x523:BOOL & x524:BOOL & x525:BOOL & 
   x526:BOOL & x527:BOOL & x528:BOOL & x529:BOOL & x530:BOOL & 
   x531:BOOL & x532:BOOL & x533:BOOL & x534:BOOL & x535:BOOL & 
   x536:BOOL & x537:BOOL & x538:BOOL & x539:BOOL & x540:BOOL & 
   x541:BOOL & x542:BOOL & x543:BOOL & x544:BOOL & x545:BOOL & 
   x546:BOOL & x547:BOOL & x548:BOOL & x549:BOOL & x550:BOOL & 
   x551:BOOL & x552:BOOL & x553:BOOL & x554:BOOL & x555:BOOL & 
   x556:BOOL & x557:BOOL & x558:BOOL & x559:BOOL & x560:BOOL & 
   x561:BOOL & x562:BOOL & x563:BOOL & x564:BOOL & x565:BOOL & 
   x566:BOOL & x567:BOOL & x568:BOOL & x569:BOOL & x570:BOOL & 
   x571:BOOL & x572:BOOL & x573:BOOL & x574:BOOL & x575:BOOL & 
   x576:BOOL & x577:BOOL & x578:BOOL & x579:BOOL & x580:BOOL & 
   x581:BOOL & x582:BOOL & x583:BOOL & x584:BOOL & x585:BOOL & 
   x586:BOOL & x587:BOOL & x588:BOOL & x589:BOOL & x590:BOOL & 
   x591:BOOL & x592:BOOL & x593:BOOL & x594:BOOL & x595:BOOL & 
   x596:BOOL & x597:BOOL & x598:BOOL & x599:BOOL & x600:BOOL & 
   
    (  x1=FALSE  or  x2=FALSE  ) &
   (  x1=FALSE  or  x3=FALSE  ) &
   (  x2=FALSE  or  x3=FALSE  ) &
   (  x1=TRUE  or  x2=TRUE  or  x3=TRUE  ) &
   (  x4=FALSE  or  x5=FALSE  ) &
   (  x4=FALSE  or  x6=FALSE  ) &
   (  x5=FALSE  or  x6=FALSE  ) &
   (  x4=TRUE  or  x5=TRUE  or  x6=TRUE  ) &
   (  x7=FALSE  or  x8=FALSE  ) &
   (  x7=FALSE  or  x9=FALSE  ) &
   (  x8=FALSE  or  x9=FALSE  ) &
   (  x7=TRUE  or  x8=TRUE  or  x9=TRUE  ) &
   (  x10=FALSE  or  x11=FALSE  ) &
   (  x10=FALSE  or  x12=FALSE  ) &
   (  x11=FALSE  or  x12=FALSE  ) &
   (  x10=TRUE  or  x11=TRUE  or  x12=TRUE  ) &
   (  x13=FALSE  or  x14=FALSE  ) &
   (  x13=FALSE  or  x15=FALSE  ) &
   (  x14=FALSE  or  x15=FALSE  ) &
   (  x13=TRUE  or  x14=TRUE  or  x15=TRUE  ) &
   (  x16=FALSE  or  x17=FALSE  ) &
   (  x16=FALSE  or  x18=FALSE  ) &
   (  x17=FALSE  or  x18=FALSE  ) &
   (  x16=TRUE  or  x17=TRUE  or  x18=TRUE  ) &
   (  x19=FALSE  or  x20=FALSE  ) &
   (  x19=FALSE  or  x21=FALSE  ) &
   (  x20=FALSE  or  x21=FALSE  ) &
   (  x19=TRUE  or  x20=TRUE  or  x21=TRUE  ) &
   (  x22=FALSE  or  x23=FALSE  ) &
   (  x22=FALSE  or  x24=FALSE  ) &
   (  x23=FALSE  or  x24=FALSE  ) &
   (  x22=TRUE  or  x23=TRUE  or  x24=TRUE  ) &
   (  x25=FALSE  or  x26=FALSE  ) &
   (  x25=FALSE  or  x27=FALSE  ) &
   (  x26=FALSE  or  x27=FALSE  ) &
   (  x25=TRUE  or  x26=TRUE  or  x27=TRUE  ) &
   (  x28=FALSE  or  x29=FALSE  ) &
   (  x28=FALSE  or  x30=FALSE  ) &
   (  x29=FALSE  or  x30=FALSE  ) &
   (  x28=TRUE  or  x29=TRUE  or  x30=TRUE  ) &
   (  x31=FALSE  or  x32=FALSE  ) &
   (  x31=FALSE  or  x33=FALSE  ) &
   (  x32=FALSE  or  x33=FALSE  ) &
   (  x31=TRUE  or  x32=TRUE  or  x33=TRUE  ) &
   (  x34=FALSE  or  x35=FALSE  ) &
   (  x34=FALSE  or  x36=FALSE  ) &
   (  x35=FALSE  or  x36=FALSE  ) &
   (  x34=TRUE  or  x35=TRUE  or  x36=TRUE  ) &
   (  x37=FALSE  or  x38=FALSE  ) &
   (  x37=FALSE  or  x39=FALSE  ) &
   (  x38=FALSE  or  x39=FALSE  ) &
   (  x37=TRUE  or  x38=TRUE  or  x39=TRUE  ) &
   (  x40=FALSE  or  x41=FALSE  ) &
   (  x40=FALSE  or  x42=FALSE  ) &
   (  x41=FALSE  or  x42=FALSE  ) &
   (  x40=TRUE  or  x41=TRUE  or  x42=TRUE  ) &
   (  x43=FALSE  or  x44=FALSE  ) &
   (  x43=FALSE  or  x45=FALSE  ) &
   (  x44=FALSE  or  x45=FALSE  ) &
   (  x43=TRUE  or  x44=TRUE  or  x45=TRUE  ) &
   (  x46=FALSE  or  x47=FALSE  ) &
   (  x46=FALSE  or  x48=FALSE  ) &
   (  x47=FALSE  or  x48=FALSE  ) &
   (  x46=TRUE  or  x47=TRUE  or  x48=TRUE  ) &
   (  x49=FALSE  or  x50=FALSE  ) &
   (  x49=FALSE  or  x51=FALSE  ) &
   (  x50=FALSE  or  x51=FALSE  ) &
   (  x49=TRUE  or  x50=TRUE  or  x51=TRUE  ) &
   (  x52=FALSE  or  x53=FALSE  ) &
   (  x52=FALSE  or  x54=FALSE  ) &
   (  x53=FALSE  or  x54=FALSE  ) &
   (  x52=TRUE  or  x53=TRUE  or  x54=TRUE  ) &
   (  x55=FALSE  or  x56=FALSE  ) &
   (  x55=FALSE  or  x57=FALSE  ) &
   (  x56=FALSE  or  x57=FALSE  ) &
   (  x55=TRUE  or  x56=TRUE  or  x57=TRUE  ) &
   (  x58=FALSE  or  x59=FALSE  ) &
   (  x58=FALSE  or  x60=FALSE  ) &
   (  x59=FALSE  or  x60=FALSE  ) &
   (  x58=TRUE  or  x59=TRUE  or  x60=TRUE  ) &
   (  x61=FALSE  or  x62=FALSE  ) &
   (  x61=FALSE  or  x63=FALSE  ) &
   (  x62=FALSE  or  x63=FALSE  ) &
   (  x61=TRUE  or  x62=TRUE  or  x63=TRUE  ) &
   (  x64=FALSE  or  x65=FALSE  ) &
   (  x64=FALSE  or  x66=FALSE  ) &
   (  x65=FALSE  or  x66=FALSE  ) &
   (  x64=TRUE  or  x65=TRUE  or  x66=TRUE  ) &
   (  x67=FALSE  or  x68=FALSE  ) &
   (  x67=FALSE  or  x69=FALSE  ) &
   (  x68=FALSE  or  x69=FALSE  ) &
   (  x67=TRUE  or  x68=TRUE  or  x69=TRUE  ) &
   (  x70=FALSE  or  x71=FALSE  ) &
   (  x70=FALSE  or  x72=FALSE  ) &
   (  x71=FALSE  or  x72=FALSE  ) &
   (  x70=TRUE  or  x71=TRUE  or  x72=TRUE  ) &
   (  x73=FALSE  or  x74=FALSE  ) &
   (  x73=FALSE  or  x75=FALSE  ) &
   (  x74=FALSE  or  x75=FALSE  ) &
   (  x73=TRUE  or  x74=TRUE  or  x75=TRUE  ) &
   (  x76=FALSE  or  x77=FALSE  ) &
   (  x76=FALSE  or  x78=FALSE  ) &
   (  x77=FALSE  or  x78=FALSE  ) &
   (  x76=TRUE  or  x77=TRUE  or  x78=TRUE  ) &
   (  x79=FALSE  or  x80=FALSE  ) &
   (  x79=FALSE  or  x81=FALSE  ) &
   (  x80=FALSE  or  x81=FALSE  ) &
   (  x79=TRUE  or  x80=TRUE  or  x81=TRUE  ) &
   (  x82=FALSE  or  x83=FALSE  ) &
   (  x82=FALSE  or  x84=FALSE  ) &
   (  x83=FALSE  or  x84=FALSE  ) &
   (  x82=TRUE  or  x83=TRUE  or  x84=TRUE  ) &
   (  x85=FALSE  or  x86=FALSE  ) &
   (  x85=FALSE  or  x87=FALSE  ) &
   (  x86=FALSE  or  x87=FALSE  ) &
   (  x85=TRUE  or  x86=TRUE  or  x87=TRUE  ) &
   (  x88=FALSE  or  x89=FALSE  ) &
   (  x88=FALSE  or  x90=FALSE  ) &
   (  x89=FALSE  or  x90=FALSE  ) &
   (  x88=TRUE  or  x89=TRUE  or  x90=TRUE  ) &
   (  x91=FALSE  or  x92=FALSE  ) &
   (  x91=FALSE  or  x93=FALSE  ) &
   (  x92=FALSE  or  x93=FALSE  ) &
   (  x91=TRUE  or  x92=TRUE  or  x93=TRUE  ) &
   (  x94=FALSE  or  x95=FALSE  ) &
   (  x94=FALSE  or  x96=FALSE  ) &
   (  x95=FALSE  or  x96=FALSE  ) &
   (  x94=TRUE  or  x95=TRUE  or  x96=TRUE  ) &
   (  x97=FALSE  or  x98=FALSE  ) &
   (  x97=FALSE  or  x99=FALSE  ) &
   (  x98=FALSE  or  x99=FALSE  ) &
   (  x97=TRUE  or  x98=TRUE  or  x99=TRUE  ) &
   (  x100=FALSE  or  x101=FALSE  ) &
   (  x100=FALSE  or  x102=FALSE  ) &
   (  x101=FALSE  or  x102=FALSE  ) &
   (  x100=TRUE  or  x101=TRUE  or  x102=TRUE  ) &
   (  x103=FALSE  or  x104=FALSE  ) &
   (  x103=FALSE  or  x105=FALSE  ) &
   (  x104=FALSE  or  x105=FALSE  ) &
   (  x103=TRUE  or  x104=TRUE  or  x105=TRUE  ) &
   (  x106=FALSE  or  x107=FALSE  ) &
   (  x106=FALSE  or  x108=FALSE  ) &
   (  x107=FALSE  or  x108=FALSE  ) &
   (  x106=TRUE  or  x107=TRUE  or  x108=TRUE  ) &
   (  x109=FALSE  or  x110=FALSE  ) &
   (  x109=FALSE  or  x111=FALSE  ) &
   (  x110=FALSE  or  x111=FALSE  ) &
   (  x109=TRUE  or  x110=TRUE  or  x111=TRUE  ) &
   (  x112=FALSE  or  x113=FALSE  ) &
   (  x112=FALSE  or  x114=FALSE  ) &
   (  x113=FALSE  or  x114=FALSE  ) &
   (  x112=TRUE  or  x113=TRUE  or  x114=TRUE  ) &
   (  x115=FALSE  or  x116=FALSE  ) &
   (  x115=FALSE  or  x117=FALSE  ) &
   (  x116=FALSE  or  x117=FALSE  ) &
   (  x115=TRUE  or  x116=TRUE  or  x117=TRUE  ) &
   (  x118=FALSE  or  x119=FALSE  ) &
   (  x118=FALSE  or  x120=FALSE  ) &
   (  x119=FALSE  or  x120=FALSE  ) &
   (  x118=TRUE  or  x119=TRUE  or  x120=TRUE  ) &
   (  x121=FALSE  or  x122=FALSE  ) &
   (  x121=FALSE  or  x123=FALSE  ) &
   (  x122=FALSE  or  x123=FALSE  ) &
   (  x121=TRUE  or  x122=TRUE  or  x123=TRUE  ) &
   (  x124=FALSE  or  x125=FALSE  ) &
   (  x124=FALSE  or  x126=FALSE  ) &
   (  x125=FALSE  or  x126=FALSE  ) &
   (  x124=TRUE  or  x125=TRUE  or  x126=TRUE  ) &
   (  x127=FALSE  or  x128=FALSE  ) &
   (  x127=FALSE  or  x129=FALSE  ) &
   (  x128=FALSE  or  x129=FALSE  ) &
   (  x127=TRUE  or  x128=TRUE  or  x129=TRUE  ) &
   (  x130=FALSE  or  x131=FALSE  ) &
   (  x130=FALSE  or  x132=FALSE  ) &
   (  x131=FALSE  or  x132=FALSE  ) &
   (  x130=TRUE  or  x131=TRUE  or  x132=TRUE  ) &
   (  x133=FALSE  or  x134=FALSE  ) &
   (  x133=FALSE  or  x135=FALSE  ) &
   (  x134=FALSE  or  x135=FALSE  ) &
   (  x133=TRUE  or  x134=TRUE  or  x135=TRUE  ) &
   (  x136=FALSE  or  x137=FALSE  ) &
   (  x136=FALSE  or  x138=FALSE  ) &
   (  x137=FALSE  or  x138=FALSE  ) &
   (  x136=TRUE  or  x137=TRUE  or  x138=TRUE  ) &
   (  x139=FALSE  or  x140=FALSE  ) &
   (  x139=FALSE  or  x141=FALSE  ) &
   (  x140=FALSE  or  x141=FALSE  ) &
   (  x139=TRUE  or  x140=TRUE  or  x141=TRUE  ) &
   (  x142=FALSE  or  x143=FALSE  ) &
   (  x142=FALSE  or  x144=FALSE  ) &
   (  x143=FALSE  or  x144=FALSE  ) &
   (  x142=TRUE  or  x143=TRUE  or  x144=TRUE  ) &
   (  x145=FALSE  or  x146=FALSE  ) &
   (  x145=FALSE  or  x147=FALSE  ) &
   (  x146=FALSE  or  x147=FALSE  ) &
   (  x145=TRUE  or  x146=TRUE  or  x147=TRUE  ) &
   (  x148=FALSE  or  x149=FALSE  ) &
   (  x148=FALSE  or  x150=FALSE  ) &
   (  x149=FALSE  or  x150=FALSE  ) &
   (  x148=TRUE  or  x149=TRUE  or  x150=TRUE  ) &
   (  x151=FALSE  or  x152=FALSE  ) &
   (  x151=FALSE  or  x153=FALSE  ) &
   (  x152=FALSE  or  x153=FALSE  ) &
   (  x151=TRUE  or  x152=TRUE  or  x153=TRUE  ) &
   (  x154=FALSE  or  x155=FALSE  ) &
   (  x154=FALSE  or  x156=FALSE  ) &
   (  x155=FALSE  or  x156=FALSE  ) &
   (  x154=TRUE  or  x155=TRUE  or  x156=TRUE  ) &
   (  x157=FALSE  or  x158=FALSE  ) &
   (  x157=FALSE  or  x159=FALSE  ) &
   (  x158=FALSE  or  x159=FALSE  ) &
   (  x157=TRUE  or  x158=TRUE  or  x159=TRUE  ) &
   (  x160=FALSE  or  x161=FALSE  ) &
   (  x160=FALSE  or  x162=FALSE  ) &
   (  x161=FALSE  or  x162=FALSE  ) &
   (  x160=TRUE  or  x161=TRUE  or  x162=TRUE  ) &
   (  x163=FALSE  or  x164=FALSE  ) &
   (  x163=FALSE  or  x165=FALSE  ) &
   (  x164=FALSE  or  x165=FALSE  ) &
   (  x163=TRUE  or  x164=TRUE  or  x165=TRUE  ) &
   (  x166=FALSE  or  x167=FALSE  ) &
   (  x166=FALSE  or  x168=FALSE  ) &
   (  x167=FALSE  or  x168=FALSE  ) &
   (  x166=TRUE  or  x167=TRUE  or  x168=TRUE  ) &
   (  x169=FALSE  or  x170=FALSE  ) &
   (  x169=FALSE  or  x171=FALSE  ) &
   (  x170=FALSE  or  x171=FALSE  ) &
   (  x169=TRUE  or  x170=TRUE  or  x171=TRUE  ) &
   (  x172=FALSE  or  x173=FALSE  ) &
   (  x172=FALSE  or  x174=FALSE  ) &
   (  x173=FALSE  or  x174=FALSE  ) &
   (  x172=TRUE  or  x173=TRUE  or  x174=TRUE  ) &
   (  x175=FALSE  or  x176=FALSE  ) &
   (  x175=FALSE  or  x177=FALSE  ) &
   (  x176=FALSE  or  x177=FALSE  ) &
   (  x175=TRUE  or  x176=TRUE  or  x177=TRUE  ) &
   (  x178=FALSE  or  x179=FALSE  ) &
   (  x178=FALSE  or  x180=FALSE  ) &
   (  x179=FALSE  or  x180=FALSE  ) &
   (  x178=TRUE  or  x179=TRUE  or  x180=TRUE  ) &
   (  x181=FALSE  or  x182=FALSE  ) &
   (  x181=FALSE  or  x183=FALSE  ) &
   (  x182=FALSE  or  x183=FALSE  ) &
   (  x181=TRUE  or  x182=TRUE  or  x183=TRUE  ) &
   (  x184=FALSE  or  x185=FALSE  ) &
   (  x184=FALSE  or  x186=FALSE  ) &
   (  x185=FALSE  or  x186=FALSE  ) &
   (  x184=TRUE  or  x185=TRUE  or  x186=TRUE  ) &
   (  x187=FALSE  or  x188=FALSE  ) &
   (  x187=FALSE  or  x189=FALSE  ) &
   (  x188=FALSE  or  x189=FALSE  ) &
   (  x187=TRUE  or  x188=TRUE  or  x189=TRUE  ) &
   (  x190=FALSE  or  x191=FALSE  ) &
   (  x190=FALSE  or  x192=FALSE  ) &
   (  x191=FALSE  or  x192=FALSE  ) &
   (  x190=TRUE  or  x191=TRUE  or  x192=TRUE  ) &
   (  x193=FALSE  or  x194=FALSE  ) &
   (  x193=FALSE  or  x195=FALSE  ) &
   (  x194=FALSE  or  x195=FALSE  ) &
   (  x193=TRUE  or  x194=TRUE  or  x195=TRUE  ) &
   (  x196=FALSE  or  x197=FALSE  ) &
   (  x196=FALSE  or  x198=FALSE  ) &
   (  x197=FALSE  or  x198=FALSE  ) &
   (  x196=TRUE  or  x197=TRUE  or  x198=TRUE  ) &
   (  x199=FALSE  or  x200=FALSE  ) &
   (  x199=FALSE  or  x201=FALSE  ) &
   (  x200=FALSE  or  x201=FALSE  ) &
   (  x199=TRUE  or  x200=TRUE  or  x201=TRUE  ) &
   (  x202=FALSE  or  x203=FALSE  ) &
   (  x202=FALSE  or  x204=FALSE  ) &
   (  x203=FALSE  or  x204=FALSE  ) &
   (  x202=TRUE  or  x203=TRUE  or  x204=TRUE  ) &
   (  x205=FALSE  or  x206=FALSE  ) &
   (  x205=FALSE  or  x207=FALSE  ) &
   (  x206=FALSE  or  x207=FALSE  ) &
   (  x205=TRUE  or  x206=TRUE  or  x207=TRUE  ) &
   (  x208=FALSE  or  x209=FALSE  ) &
   (  x208=FALSE  or  x210=FALSE  ) &
   (  x209=FALSE  or  x210=FALSE  ) &
   (  x208=TRUE  or  x209=TRUE  or  x210=TRUE  ) &
   (  x211=FALSE  or  x212=FALSE  ) &
   (  x211=FALSE  or  x213=FALSE  ) &
   (  x212=FALSE  or  x213=FALSE  ) &
   (  x211=TRUE  or  x212=TRUE  or  x213=TRUE  ) &
   (  x214=FALSE  or  x215=FALSE  ) &
   (  x214=FALSE  or  x216=FALSE  ) &
   (  x215=FALSE  or  x216=FALSE  ) &
   (  x214=TRUE  or  x215=TRUE  or  x216=TRUE  ) &
   (  x217=FALSE  or  x218=FALSE  ) &
   (  x217=FALSE  or  x219=FALSE  ) &
   (  x218=FALSE  or  x219=FALSE  ) &
   (  x217=TRUE  or  x218=TRUE  or  x219=TRUE  ) &
   (  x220=FALSE  or  x221=FALSE  ) &
   (  x220=FALSE  or  x222=FALSE  ) &
   (  x221=FALSE  or  x222=FALSE  ) &
   (  x220=TRUE  or  x221=TRUE  or  x222=TRUE  ) &
   (  x223=FALSE  or  x224=FALSE  ) &
   (  x223=FALSE  or  x225=FALSE  ) &
   (  x224=FALSE  or  x225=FALSE  ) &
   (  x223=TRUE  or  x224=TRUE  or  x225=TRUE  ) &
   (  x226=FALSE  or  x227=FALSE  ) &
   (  x226=FALSE  or  x228=FALSE  ) &
   (  x227=FALSE  or  x228=FALSE  ) &
   (  x226=TRUE  or  x227=TRUE  or  x228=TRUE  ) &
   (  x229=FALSE  or  x230=FALSE  ) &
   (  x229=FALSE  or  x231=FALSE  ) &
   (  x230=FALSE  or  x231=FALSE  ) &
   (  x229=TRUE  or  x230=TRUE  or  x231=TRUE  ) &
   (  x232=FALSE  or  x233=FALSE  ) &
   (  x232=FALSE  or  x234=FALSE  ) &
   (  x233=FALSE  or  x234=FALSE  ) &
   (  x232=TRUE  or  x233=TRUE  or  x234=TRUE  ) &
   (  x235=FALSE  or  x236=FALSE  ) &
   (  x235=FALSE  or  x237=FALSE  ) &
   (  x236=FALSE  or  x237=FALSE  ) &
   (  x235=TRUE  or  x236=TRUE  or  x237=TRUE  ) &
   (  x238=FALSE  or  x239=FALSE  ) &
   (  x238=FALSE  or  x240=FALSE  ) &
   (  x239=FALSE  or  x240=FALSE  ) &
   (  x238=TRUE  or  x239=TRUE  or  x240=TRUE  ) &
   (  x241=FALSE  or  x242=FALSE  ) &
   (  x241=FALSE  or  x243=FALSE  ) &
   (  x242=FALSE  or  x243=FALSE  ) &
   (  x241=TRUE  or  x242=TRUE  or  x243=TRUE  ) &
   (  x244=FALSE  or  x245=FALSE  ) &
   (  x244=FALSE  or  x246=FALSE  ) &
   (  x245=FALSE  or  x246=FALSE  ) &
   (  x244=TRUE  or  x245=TRUE  or  x246=TRUE  ) &
   (  x247=FALSE  or  x248=FALSE  ) &
   (  x247=FALSE  or  x249=FALSE  ) &
   (  x248=FALSE  or  x249=FALSE  ) &
   (  x247=TRUE  or  x248=TRUE  or  x249=TRUE  ) &
   (  x250=FALSE  or  x251=FALSE  ) &
   (  x250=FALSE  or  x252=FALSE  ) &
   (  x251=FALSE  or  x252=FALSE  ) &
   (  x250=TRUE  or  x251=TRUE  or  x252=TRUE  ) &
   (  x253=FALSE  or  x254=FALSE  ) &
   (  x253=FALSE  or  x255=FALSE  ) &
   (  x254=FALSE  or  x255=FALSE  ) &
   (  x253=TRUE  or  x254=TRUE  or  x255=TRUE  ) &
   (  x256=FALSE  or  x257=FALSE  ) &
   (  x256=FALSE  or  x258=FALSE  ) &
   (  x257=FALSE  or  x258=FALSE  ) &
   (  x256=TRUE  or  x257=TRUE  or  x258=TRUE  ) &
   (  x259=FALSE  or  x260=FALSE  ) &
   (  x259=FALSE  or  x261=FALSE  ) &
   (  x260=FALSE  or  x261=FALSE  ) &
   (  x259=TRUE  or  x260=TRUE  or  x261=TRUE  ) &
   (  x262=FALSE  or  x263=FALSE  ) &
   (  x262=FALSE  or  x264=FALSE  ) &
   (  x263=FALSE  or  x264=FALSE  ) &
   (  x262=TRUE  or  x263=TRUE  or  x264=TRUE  ) &
   (  x265=FALSE  or  x266=FALSE  ) &
   (  x265=FALSE  or  x267=FALSE  ) &
   (  x266=FALSE  or  x267=FALSE  ) &
   (  x265=TRUE  or  x266=TRUE  or  x267=TRUE  ) &
   (  x268=FALSE  or  x269=FALSE  ) &
   (  x268=FALSE  or  x270=FALSE  ) &
   (  x269=FALSE  or  x270=FALSE  ) &
   (  x268=TRUE  or  x269=TRUE  or  x270=TRUE  ) &
   (  x271=FALSE  or  x272=FALSE  ) &
   (  x271=FALSE  or  x273=FALSE  ) &
   (  x272=FALSE  or  x273=FALSE  ) &
   (  x271=TRUE  or  x272=TRUE  or  x273=TRUE  ) &
   (  x274=FALSE  or  x275=FALSE  ) &
   (  x274=FALSE  or  x276=FALSE  ) &
   (  x275=FALSE  or  x276=FALSE  ) &
   (  x274=TRUE  or  x275=TRUE  or  x276=TRUE  ) &
   (  x277=FALSE  or  x278=FALSE  ) &
   (  x277=FALSE  or  x279=FALSE  ) &
   (  x278=FALSE  or  x279=FALSE  ) &
   (  x277=TRUE  or  x278=TRUE  or  x279=TRUE  ) &
   (  x280=FALSE  or  x281=FALSE  ) &
   (  x280=FALSE  or  x282=FALSE  ) &
   (  x281=FALSE  or  x282=FALSE  ) &
   (  x280=TRUE  or  x281=TRUE  or  x282=TRUE  ) &
   (  x283=FALSE  or  x284=FALSE  ) &
   (  x283=FALSE  or  x285=FALSE  ) &
   (  x284=FALSE  or  x285=FALSE  ) &
   (  x283=TRUE  or  x284=TRUE  or  x285=TRUE  ) &
   (  x286=FALSE  or  x287=FALSE  ) &
   (  x286=FALSE  or  x288=FALSE  ) &
   (  x287=FALSE  or  x288=FALSE  ) &
   (  x286=TRUE  or  x287=TRUE  or  x288=TRUE  ) &
   (  x289=FALSE  or  x290=FALSE  ) &
   (  x289=FALSE  or  x291=FALSE  ) &
   (  x290=FALSE  or  x291=FALSE  ) &
   (  x289=TRUE  or  x290=TRUE  or  x291=TRUE  ) &
   (  x292=FALSE  or  x293=FALSE  ) &
   (  x292=FALSE  or  x294=FALSE  ) &
   (  x293=FALSE  or  x294=FALSE  ) &
   (  x292=TRUE  or  x293=TRUE  or  x294=TRUE  ) &
   (  x295=FALSE  or  x296=FALSE  ) &
   (  x295=FALSE  or  x297=FALSE  ) &
   (  x296=FALSE  or  x297=FALSE  ) &
   (  x295=TRUE  or  x296=TRUE  or  x297=TRUE  ) &
   (  x298=FALSE  or  x299=FALSE  ) &
   (  x298=FALSE  or  x300=FALSE  ) &
   (  x299=FALSE  or  x300=FALSE  ) &
   (  x298=TRUE  or  x299=TRUE  or  x300=TRUE  ) &
   (  x301=FALSE  or  x302=FALSE  ) &
   (  x301=FALSE  or  x303=FALSE  ) &
   (  x302=FALSE  or  x303=FALSE  ) &
   (  x301=TRUE  or  x302=TRUE  or  x303=TRUE  ) &
   (  x304=FALSE  or  x305=FALSE  ) &
   (  x304=FALSE  or  x306=FALSE  ) &
   (  x305=FALSE  or  x306=FALSE  ) &
   (  x304=TRUE  or  x305=TRUE  or  x306=TRUE  ) &
   (  x307=FALSE  or  x308=FALSE  ) &
   (  x307=FALSE  or  x309=FALSE  ) &
   (  x308=FALSE  or  x309=FALSE  ) &
   (  x307=TRUE  or  x308=TRUE  or  x309=TRUE  ) &
   (  x310=FALSE  or  x311=FALSE  ) &
   (  x310=FALSE  or  x312=FALSE  ) &
   (  x311=FALSE  or  x312=FALSE  ) &
   (  x310=TRUE  or  x311=TRUE  or  x312=TRUE  ) &
   (  x313=FALSE  or  x314=FALSE  ) &
   (  x313=FALSE  or  x315=FALSE  ) &
   (  x314=FALSE  or  x315=FALSE  ) &
   (  x313=TRUE  or  x314=TRUE  or  x315=TRUE  ) &
   (  x316=FALSE  or  x317=FALSE  ) &
   (  x316=FALSE  or  x318=FALSE  ) &
   (  x317=FALSE  or  x318=FALSE  ) &
   (  x316=TRUE  or  x317=TRUE  or  x318=TRUE  ) &
   (  x319=FALSE  or  x320=FALSE  ) &
   (  x319=FALSE  or  x321=FALSE  ) &
   (  x320=FALSE  or  x321=FALSE  ) &
   (  x319=TRUE  or  x320=TRUE  or  x321=TRUE  ) &
   (  x322=FALSE  or  x323=FALSE  ) &
   (  x322=FALSE  or  x324=FALSE  ) &
   (  x323=FALSE  or  x324=FALSE  ) &
   (  x322=TRUE  or  x323=TRUE  or  x324=TRUE  ) &
   (  x325=FALSE  or  x326=FALSE  ) &
   (  x325=FALSE  or  x327=FALSE  ) &
   (  x326=FALSE  or  x327=FALSE  ) &
   (  x325=TRUE  or  x326=TRUE  or  x327=TRUE  ) &
   (  x328=FALSE  or  x329=FALSE  ) &
   (  x328=FALSE  or  x330=FALSE  ) &
   (  x329=FALSE  or  x330=FALSE  ) &
   (  x328=TRUE  or  x329=TRUE  or  x330=TRUE  ) &
   (  x331=FALSE  or  x332=FALSE  ) &
   (  x331=FALSE  or  x333=FALSE  ) &
   (  x332=FALSE  or  x333=FALSE  ) &
   (  x331=TRUE  or  x332=TRUE  or  x333=TRUE  ) &
   (  x334=FALSE  or  x335=FALSE  ) &
   (  x334=FALSE  or  x336=FALSE  ) &
   (  x335=FALSE  or  x336=FALSE  ) &
   (  x334=TRUE  or  x335=TRUE  or  x336=TRUE  ) &
   (  x337=FALSE  or  x338=FALSE  ) &
   (  x337=FALSE  or  x339=FALSE  ) &
   (  x338=FALSE  or  x339=FALSE  ) &
   (  x337=TRUE  or  x338=TRUE  or  x339=TRUE  ) &
   (  x340=FALSE  or  x341=FALSE  ) &
   (  x340=FALSE  or  x342=FALSE  ) &
   (  x341=FALSE  or  x342=FALSE  ) &
   (  x340=TRUE  or  x341=TRUE  or  x342=TRUE  ) &
   (  x343=FALSE  or  x344=FALSE  ) &
   (  x343=FALSE  or  x345=FALSE  ) &
   (  x344=FALSE  or  x345=FALSE  ) &
   (  x343=TRUE  or  x344=TRUE  or  x345=TRUE  ) &
   (  x346=FALSE  or  x347=FALSE  ) &
   (  x346=FALSE  or  x348=FALSE  ) &
   (  x347=FALSE  or  x348=FALSE  ) &
   (  x346=TRUE  or  x347=TRUE  or  x348=TRUE  ) &
   (  x349=FALSE  or  x350=FALSE  ) &
   (  x349=FALSE  or  x351=FALSE  ) &
   (  x350=FALSE  or  x351=FALSE  ) &
   (  x349=TRUE  or  x350=TRUE  or  x351=TRUE  ) &
   (  x352=FALSE  or  x353=FALSE  ) &
   (  x352=FALSE  or  x354=FALSE  ) &
   (  x353=FALSE  or  x354=FALSE  ) &
   (  x352=TRUE  or  x353=TRUE  or  x354=TRUE  ) &
   (  x355=FALSE  or  x356=FALSE  ) &
   (  x355=FALSE  or  x357=FALSE  ) &
   (  x356=FALSE  or  x357=FALSE  ) &
   (  x355=TRUE  or  x356=TRUE  or  x357=TRUE  ) &
   (  x358=FALSE  or  x359=FALSE  ) &
   (  x358=FALSE  or  x360=FALSE  ) &
   (  x359=FALSE  or  x360=FALSE  ) &
   (  x358=TRUE  or  x359=TRUE  or  x360=TRUE  ) &
   (  x361=FALSE  or  x362=FALSE  ) &
   (  x361=FALSE  or  x363=FALSE  ) &
   (  x362=FALSE  or  x363=FALSE  ) &
   (  x361=TRUE  or  x362=TRUE  or  x363=TRUE  ) &
   (  x364=FALSE  or  x365=FALSE  ) &
   (  x364=FALSE  or  x366=FALSE  ) &
   (  x365=FALSE  or  x366=FALSE  ) &
   (  x364=TRUE  or  x365=TRUE  or  x366=TRUE  ) &
   (  x367=FALSE  or  x368=FALSE  ) &
   (  x367=FALSE  or  x369=FALSE  ) &
   (  x368=FALSE  or  x369=FALSE  ) &
   (  x367=TRUE  or  x368=TRUE  or  x369=TRUE  ) &
   (  x370=FALSE  or  x371=FALSE  ) &
   (  x370=FALSE  or  x372=FALSE  ) &
   (  x371=FALSE  or  x372=FALSE  ) &
   (  x370=TRUE  or  x371=TRUE  or  x372=TRUE  ) &
   (  x373=FALSE  or  x374=FALSE  ) &
   (  x373=FALSE  or  x375=FALSE  ) &
   (  x374=FALSE  or  x375=FALSE  ) &
   (  x373=TRUE  or  x374=TRUE  or  x375=TRUE  ) &
   (  x376=FALSE  or  x377=FALSE  ) &
   (  x376=FALSE  or  x378=FALSE  ) &
   (  x377=FALSE  or  x378=FALSE  ) &
   (  x376=TRUE  or  x377=TRUE  or  x378=TRUE  ) &
   (  x379=FALSE  or  x380=FALSE  ) &
   (  x379=FALSE  or  x381=FALSE  ) &
   (  x380=FALSE  or  x381=FALSE  ) &
   (  x379=TRUE  or  x380=TRUE  or  x381=TRUE  ) &
   (  x382=FALSE  or  x383=FALSE  ) &
   (  x382=FALSE  or  x384=FALSE  ) &
   (  x383=FALSE  or  x384=FALSE  ) &
   (  x382=TRUE  or  x383=TRUE  or  x384=TRUE  ) &
   (  x385=FALSE  or  x386=FALSE  ) &
   (  x385=FALSE  or  x387=FALSE  ) &
   (  x386=FALSE  or  x387=FALSE  ) &
   (  x385=TRUE  or  x386=TRUE  or  x387=TRUE  ) &
   (  x388=FALSE  or  x389=FALSE  ) &
   (  x388=FALSE  or  x390=FALSE  ) &
   (  x389=FALSE  or  x390=FALSE  ) &
   (  x388=TRUE  or  x389=TRUE  or  x390=TRUE  ) &
   (  x391=FALSE  or  x392=FALSE  ) &
   (  x391=FALSE  or  x393=FALSE  ) &
   (  x392=FALSE  or  x393=FALSE  ) &
   (  x391=TRUE  or  x392=TRUE  or  x393=TRUE  ) &
   (  x394=FALSE  or  x395=FALSE  ) &
   (  x394=FALSE  or  x396=FALSE  ) &
   (  x395=FALSE  or  x396=FALSE  ) &
   (  x394=TRUE  or  x395=TRUE  or  x396=TRUE  ) &
   (  x397=FALSE  or  x398=FALSE  ) &
   (  x397=FALSE  or  x399=FALSE  ) &
   (  x398=FALSE  or  x399=FALSE  ) &
   (  x397=TRUE  or  x398=TRUE  or  x399=TRUE  ) &
   (  x400=FALSE  or  x401=FALSE  ) &
   (  x400=FALSE  or  x402=FALSE  ) &
   (  x401=FALSE  or  x402=FALSE  ) &
   (  x400=TRUE  or  x401=TRUE  or  x402=TRUE  ) &
   (  x403=FALSE  or  x404=FALSE  ) &
   (  x403=FALSE  or  x405=FALSE  ) &
   (  x404=FALSE  or  x405=FALSE  ) &
   (  x403=TRUE  or  x404=TRUE  or  x405=TRUE  ) &
   (  x406=FALSE  or  x407=FALSE  ) &
   (  x406=FALSE  or  x408=FALSE  ) &
   (  x407=FALSE  or  x408=FALSE  ) &
   (  x406=TRUE  or  x407=TRUE  or  x408=TRUE  ) &
   (  x409=FALSE  or  x410=FALSE  ) &
   (  x409=FALSE  or  x411=FALSE  ) &
   (  x410=FALSE  or  x411=FALSE  ) &
   (  x409=TRUE  or  x410=TRUE  or  x411=TRUE  ) &
   (  x412=FALSE  or  x413=FALSE  ) &
   (  x412=FALSE  or  x414=FALSE  ) &
   (  x413=FALSE  or  x414=FALSE  ) &
   (  x412=TRUE  or  x413=TRUE  or  x414=TRUE  ) &
   (  x415=FALSE  or  x416=FALSE  ) &
   (  x415=FALSE  or  x417=FALSE  ) &
   (  x416=FALSE  or  x417=FALSE  ) &
   (  x415=TRUE  or  x416=TRUE  or  x417=TRUE  ) &
   (  x418=FALSE  or  x419=FALSE  ) &
   (  x418=FALSE  or  x420=FALSE  ) &
   (  x419=FALSE  or  x420=FALSE  ) &
   (  x418=TRUE  or  x419=TRUE  or  x420=TRUE  ) &
   (  x421=FALSE  or  x422=FALSE  ) &
   (  x421=FALSE  or  x423=FALSE  ) &
   (  x422=FALSE  or  x423=FALSE  ) &
   (  x421=TRUE  or  x422=TRUE  or  x423=TRUE  ) &
   (  x424=FALSE  or  x425=FALSE  ) &
   (  x424=FALSE  or  x426=FALSE  ) &
   (  x425=FALSE  or  x426=FALSE  ) &
   (  x424=TRUE  or  x425=TRUE  or  x426=TRUE  ) &
   (  x427=FALSE  or  x428=FALSE  ) &
   (  x427=FALSE  or  x429=FALSE  ) &
   (  x428=FALSE  or  x429=FALSE  ) &
   (  x427=TRUE  or  x428=TRUE  or  x429=TRUE  ) &
   (  x430=FALSE  or  x431=FALSE  ) &
   (  x430=FALSE  or  x432=FALSE  ) &
   (  x431=FALSE  or  x432=FALSE  ) &
   (  x430=TRUE  or  x431=TRUE  or  x432=TRUE  ) &
   (  x433=FALSE  or  x434=FALSE  ) &
   (  x433=FALSE  or  x435=FALSE  ) &
   (  x434=FALSE  or  x435=FALSE  ) &
   (  x433=TRUE  or  x434=TRUE  or  x435=TRUE  ) &
   (  x436=FALSE  or  x437=FALSE  ) &
   (  x436=FALSE  or  x438=FALSE  ) &
   (  x437=FALSE  or  x438=FALSE  ) &
   (  x436=TRUE  or  x437=TRUE  or  x438=TRUE  ) &
   (  x439=FALSE  or  x440=FALSE  ) &
   (  x439=FALSE  or  x441=FALSE  ) &
   (  x440=FALSE  or  x441=FALSE  ) &
   (  x439=TRUE  or  x440=TRUE  or  x441=TRUE  ) &
   (  x442=FALSE  or  x443=FALSE  ) &
   (  x442=FALSE  or  x444=FALSE  ) &
   (  x443=FALSE  or  x444=FALSE  ) &
   (  x442=TRUE  or  x443=TRUE  or  x444=TRUE  ) &
   (  x445=FALSE  or  x446=FALSE  ) &
   (  x445=FALSE  or  x447=FALSE  ) &
   (  x446=FALSE  or  x447=FALSE  ) &
   (  x445=TRUE  or  x446=TRUE  or  x447=TRUE  ) &
   (  x448=FALSE  or  x449=FALSE  ) &
   (  x448=FALSE  or  x450=FALSE  ) &
   (  x449=FALSE  or  x450=FALSE  ) &
   (  x448=TRUE  or  x449=TRUE  or  x450=TRUE  ) &
   (  x451=FALSE  or  x452=FALSE  ) &
   (  x451=FALSE  or  x453=FALSE  ) &
   (  x452=FALSE  or  x453=FALSE  ) &
   (  x451=TRUE  or  x452=TRUE  or  x453=TRUE  ) &
   (  x454=FALSE  or  x455=FALSE  ) &
   (  x454=FALSE  or  x456=FALSE  ) &
   (  x455=FALSE  or  x456=FALSE  ) &
   (  x454=TRUE  or  x455=TRUE  or  x456=TRUE  ) &
   (  x457=FALSE  or  x458=FALSE  ) &
   (  x457=FALSE  or  x459=FALSE  ) &
   (  x458=FALSE  or  x459=FALSE  ) &
   (  x457=TRUE  or  x458=TRUE  or  x459=TRUE  ) &
   (  x460=FALSE  or  x461=FALSE  ) &
   (  x460=FALSE  or  x462=FALSE  ) &
   (  x461=FALSE  or  x462=FALSE  ) &
   (  x460=TRUE  or  x461=TRUE  or  x462=TRUE  ) &
   (  x463=FALSE  or  x464=FALSE  ) &
   (  x463=FALSE  or  x465=FALSE  ) &
   (  x464=FALSE  or  x465=FALSE  ) &
   (  x463=TRUE  or  x464=TRUE  or  x465=TRUE  ) &
   (  x466=FALSE  or  x467=FALSE  ) &
   (  x466=FALSE  or  x468=FALSE  ) &
   (  x467=FALSE  or  x468=FALSE  ) &
   (  x466=TRUE  or  x467=TRUE  or  x468=TRUE  ) &
   (  x469=FALSE  or  x470=FALSE  ) &
   (  x469=FALSE  or  x471=FALSE  ) &
   (  x470=FALSE  or  x471=FALSE  ) &
   (  x469=TRUE  or  x470=TRUE  or  x471=TRUE  ) &
   (  x472=FALSE  or  x473=FALSE  ) &
   (  x472=FALSE  or  x474=FALSE  ) &
   (  x473=FALSE  or  x474=FALSE  ) &
   (  x472=TRUE  or  x473=TRUE  or  x474=TRUE  ) &
   (  x475=FALSE  or  x476=FALSE  ) &
   (  x475=FALSE  or  x477=FALSE  ) &
   (  x476=FALSE  or  x477=FALSE  ) &
   (  x475=TRUE  or  x476=TRUE  or  x477=TRUE  ) &
   (  x478=FALSE  or  x479=FALSE  ) &
   (  x478=FALSE  or  x480=FALSE  ) &
   (  x479=FALSE  or  x480=FALSE  ) &
   (  x478=TRUE  or  x479=TRUE  or  x480=TRUE  ) &
   (  x481=FALSE  or  x482=FALSE  ) &
   (  x481=FALSE  or  x483=FALSE  ) &
   (  x482=FALSE  or  x483=FALSE  ) &
   (  x481=TRUE  or  x482=TRUE  or  x483=TRUE  ) &
   (  x484=FALSE  or  x485=FALSE  ) &
   (  x484=FALSE  or  x486=FALSE  ) &
   (  x485=FALSE  or  x486=FALSE  ) &
   (  x484=TRUE  or  x485=TRUE  or  x486=TRUE  ) &
   (  x487=FALSE  or  x488=FALSE  ) &
   (  x487=FALSE  or  x489=FALSE  ) &
   (  x488=FALSE  or  x489=FALSE  ) &
   (  x487=TRUE  or  x488=TRUE  or  x489=TRUE  ) &
   (  x490=FALSE  or  x491=FALSE  ) &
   (  x490=FALSE  or  x492=FALSE  ) &
   (  x491=FALSE  or  x492=FALSE  ) &
   (  x490=TRUE  or  x491=TRUE  or  x492=TRUE  ) &
   (  x493=FALSE  or  x494=FALSE  ) &
   (  x493=FALSE  or  x495=FALSE  ) &
   (  x494=FALSE  or  x495=FALSE  ) &
   (  x493=TRUE  or  x494=TRUE  or  x495=TRUE  ) &
   (  x496=FALSE  or  x497=FALSE  ) &
   (  x496=FALSE  or  x498=FALSE  ) &
   (  x497=FALSE  or  x498=FALSE  ) &
   (  x496=TRUE  or  x497=TRUE  or  x498=TRUE  ) &
   (  x499=FALSE  or  x500=FALSE  ) &
   (  x499=FALSE  or  x501=FALSE  ) &
   (  x500=FALSE  or  x501=FALSE  ) &
   (  x499=TRUE  or  x500=TRUE  or  x501=TRUE  ) &
   (  x502=FALSE  or  x503=FALSE  ) &
   (  x502=FALSE  or  x504=FALSE  ) &
   (  x503=FALSE  or  x504=FALSE  ) &
   (  x502=TRUE  or  x503=TRUE  or  x504=TRUE  ) &
   (  x505=FALSE  or  x506=FALSE  ) &
   (  x505=FALSE  or  x507=FALSE  ) &
   (  x506=FALSE  or  x507=FALSE  ) &
   (  x505=TRUE  or  x506=TRUE  or  x507=TRUE  ) &
   (  x508=FALSE  or  x509=FALSE  ) &
   (  x508=FALSE  or  x510=FALSE  ) &
   (  x509=FALSE  or  x510=FALSE  ) &
   (  x508=TRUE  or  x509=TRUE  or  x510=TRUE  ) &
   (  x511=FALSE  or  x512=FALSE  ) &
   (  x511=FALSE  or  x513=FALSE  ) &
   (  x512=FALSE  or  x513=FALSE  ) &
   (  x511=TRUE  or  x512=TRUE  or  x513=TRUE  ) &
   (  x514=FALSE  or  x515=FALSE  ) &
   (  x514=FALSE  or  x516=FALSE  ) &
   (  x515=FALSE  or  x516=FALSE  ) &
   (  x514=TRUE  or  x515=TRUE  or  x516=TRUE  ) &
   (  x517=FALSE  or  x518=FALSE  ) &
   (  x517=FALSE  or  x519=FALSE  ) &
   (  x518=FALSE  or  x519=FALSE  ) &
   (  x517=TRUE  or  x518=TRUE  or  x519=TRUE  ) &
   (  x520=FALSE  or  x521=FALSE  ) &
   (  x520=FALSE  or  x522=FALSE  ) &
   (  x521=FALSE  or  x522=FALSE  ) &
   (  x520=TRUE  or  x521=TRUE  or  x522=TRUE  ) &
   (  x523=FALSE  or  x524=FALSE  ) &
   (  x523=FALSE  or  x525=FALSE  ) &
   (  x524=FALSE  or  x525=FALSE  ) &
   (  x523=TRUE  or  x524=TRUE  or  x525=TRUE  ) &
   (  x526=FALSE  or  x527=FALSE  ) &
   (  x526=FALSE  or  x528=FALSE  ) &
   (  x527=FALSE  or  x528=FALSE  ) &
   (  x526=TRUE  or  x527=TRUE  or  x528=TRUE  ) &
   (  x529=FALSE  or  x530=FALSE  ) &
   (  x529=FALSE  or  x531=FALSE  ) &
   (  x530=FALSE  or  x531=FALSE  ) &
   (  x529=TRUE  or  x530=TRUE  or  x531=TRUE  ) &
   (  x532=FALSE  or  x533=FALSE  ) &
   (  x532=FALSE  or  x534=FALSE  ) &
   (  x533=FALSE  or  x534=FALSE  ) &
   (  x532=TRUE  or  x533=TRUE  or  x534=TRUE  ) &
   (  x535=FALSE  or  x536=FALSE  ) &
   (  x535=FALSE  or  x537=FALSE  ) &
   (  x536=FALSE  or  x537=FALSE  ) &
   (  x535=TRUE  or  x536=TRUE  or  x537=TRUE  ) &
   (  x538=FALSE  or  x539=FALSE  ) &
   (  x538=FALSE  or  x540=FALSE  ) &
   (  x539=FALSE  or  x540=FALSE  ) &
   (  x538=TRUE  or  x539=TRUE  or  x540=TRUE  ) &
   (  x541=FALSE  or  x542=FALSE  ) &
   (  x541=FALSE  or  x543=FALSE  ) &
   (  x542=FALSE  or  x543=FALSE  ) &
   (  x541=TRUE  or  x542=TRUE  or  x543=TRUE  ) &
   (  x544=FALSE  or  x545=FALSE  ) &
   (  x544=FALSE  or  x546=FALSE  ) &
   (  x545=FALSE  or  x546=FALSE  ) &
   (  x544=TRUE  or  x545=TRUE  or  x546=TRUE  ) &
   (  x547=FALSE  or  x548=FALSE  ) &
   (  x547=FALSE  or  x549=FALSE  ) &
   (  x548=FALSE  or  x549=FALSE  ) &
   (  x547=TRUE  or  x548=TRUE  or  x549=TRUE  ) &
   (  x550=FALSE  or  x551=FALSE  ) &
   (  x550=FALSE  or  x552=FALSE  ) &
   (  x551=FALSE  or  x552=FALSE  ) &
   (  x550=TRUE  or  x551=TRUE  or  x552=TRUE  ) &
   (  x553=FALSE  or  x554=FALSE  ) &
   (  x553=FALSE  or  x555=FALSE  ) &
   (  x554=FALSE  or  x555=FALSE  ) &
   (  x553=TRUE  or  x554=TRUE  or  x555=TRUE  ) &
   (  x556=FALSE  or  x557=FALSE  ) &
   (  x556=FALSE  or  x558=FALSE  ) &
   (  x557=FALSE  or  x558=FALSE  ) &
   (  x556=TRUE  or  x557=TRUE  or  x558=TRUE  ) &
   (  x559=FALSE  or  x560=FALSE  ) &
   (  x559=FALSE  or  x561=FALSE  ) &
   (  x560=FALSE  or  x561=FALSE  ) &
   (  x559=TRUE  or  x560=TRUE  or  x561=TRUE  ) &
   (  x562=FALSE  or  x563=FALSE  ) &
   (  x562=FALSE  or  x564=FALSE  ) &
   (  x563=FALSE  or  x564=FALSE  ) &
   (  x562=TRUE  or  x563=TRUE  or  x564=TRUE  ) &
   (  x565=FALSE  or  x566=FALSE  ) &
   (  x565=FALSE  or  x567=FALSE  ) &
   (  x566=FALSE  or  x567=FALSE  ) &
   (  x565=TRUE  or  x566=TRUE  or  x567=TRUE  ) &
   (  x568=FALSE  or  x569=FALSE  ) &
   (  x568=FALSE  or  x570=FALSE  ) &
   (  x569=FALSE  or  x570=FALSE  ) &
   (  x568=TRUE  or  x569=TRUE  or  x570=TRUE  ) &
   (  x571=FALSE  or  x572=FALSE  ) &
   (  x571=FALSE  or  x573=FALSE  ) &
   (  x572=FALSE  or  x573=FALSE  ) &
   (  x571=TRUE  or  x572=TRUE  or  x573=TRUE  ) &
   (  x574=FALSE  or  x575=FALSE  ) &
   (  x574=FALSE  or  x576=FALSE  ) &
   (  x575=FALSE  or  x576=FALSE  ) &
   (  x574=TRUE  or  x575=TRUE  or  x576=TRUE  ) &
   (  x577=FALSE  or  x578=FALSE  ) &
   (  x577=FALSE  or  x579=FALSE  ) &
   (  x578=FALSE  or  x579=FALSE  ) &
   (  x577=TRUE  or  x578=TRUE  or  x579=TRUE  ) &
   (  x580=FALSE  or  x581=FALSE  ) &
   (  x580=FALSE  or  x582=FALSE  ) &
   (  x581=FALSE  or  x582=FALSE  ) &
   (  x580=TRUE  or  x581=TRUE  or  x582=TRUE  ) &
   (  x583=FALSE  or  x584=FALSE  ) &
   (  x583=FALSE  or  x585=FALSE  ) &
   (  x584=FALSE  or  x585=FALSE  ) &
   (  x583=TRUE  or  x584=TRUE  or  x585=TRUE  ) &
   (  x586=FALSE  or  x587=FALSE  ) &
   (  x586=FALSE  or  x588=FALSE  ) &
   (  x587=FALSE  or  x588=FALSE  ) &
   (  x586=TRUE  or  x587=TRUE  or  x588=TRUE  ) &
   (  x589=FALSE  or  x590=FALSE  ) &
   (  x589=FALSE  or  x591=FALSE  ) &
   (  x590=FALSE  or  x591=FALSE  ) &
   (  x589=TRUE  or  x590=TRUE  or  x591=TRUE  ) &
   (  x592=FALSE  or  x593=FALSE  ) &
   (  x592=FALSE  or  x594=FALSE  ) &
   (  x593=FALSE  or  x594=FALSE  ) &
   (  x592=TRUE  or  x593=TRUE  or  x594=TRUE  ) &
   (  x595=FALSE  or  x596=FALSE  ) &
   (  x595=FALSE  or  x597=FALSE  ) &
   (  x596=FALSE  or  x597=FALSE  ) &
   (  x595=TRUE  or  x596=TRUE  or  x597=TRUE  ) &
   (  x598=FALSE  or  x599=FALSE  ) &
   (  x598=FALSE  or  x600=FALSE  ) &
   (  x599=FALSE  or  x600=FALSE  ) &
   (  x598=TRUE  or  x599=TRUE  or  x600=TRUE  ) &
   (  x274=FALSE  or  x1=FALSE  ) &
   (  x275=FALSE  or  x2=FALSE  ) &
   (  x276=FALSE  or  x3=FALSE  ) &
   (  x301=FALSE  or  x1=FALSE  ) &
   (  x302=FALSE  or  x2=FALSE  ) &
   (  x303=FALSE  or  x3=FALSE  ) &
   (  x505=FALSE  or  x1=FALSE  ) &
   (  x506=FALSE  or  x2=FALSE  ) &
   (  x507=FALSE  or  x3=FALSE  ) &
   (  x73=FALSE  or  x4=FALSE  ) &
   (  x74=FALSE  or  x5=FALSE  ) &
   (  x75=FALSE  or  x6=FALSE  ) &
   (  x268=FALSE  or  x4=FALSE  ) &
   (  x269=FALSE  or  x5=FALSE  ) &
   (  x270=FALSE  or  x6=FALSE  ) &
   (  x274=FALSE  or  x4=FALSE  ) &
   (  x275=FALSE  or  x5=FALSE  ) &
   (  x276=FALSE  or  x6=FALSE  ) &
   (  x277=FALSE  or  x4=FALSE  ) &
   (  x278=FALSE  or  x5=FALSE  ) &
   (  x279=FALSE  or  x6=FALSE  ) &
   (  x343=FALSE  or  x4=FALSE  ) &
   (  x344=FALSE  or  x5=FALSE  ) &
   (  x345=FALSE  or  x6=FALSE  ) &
   (  x556=FALSE  or  x4=FALSE  ) &
   (  x557=FALSE  or  x5=FALSE  ) &
   (  x558=FALSE  or  x6=FALSE  ) &
   (  x586=FALSE  or  x4=FALSE  ) &
   (  x587=FALSE  or  x5=FALSE  ) &
   (  x588=FALSE  or  x6=FALSE  ) &
   (  x598=FALSE  or  x4=FALSE  ) &
   (  x599=FALSE  or  x5=FALSE  ) &
   (  x600=FALSE  or  x6=FALSE  ) &
   (  x19=FALSE  or  x7=FALSE  ) &
   (  x20=FALSE  or  x8=FALSE  ) &
   (  x21=FALSE  or  x9=FALSE  ) &
   (  x136=FALSE  or  x7=FALSE  ) &
   (  x137=FALSE  or  x8=FALSE  ) &
   (  x138=FALSE  or  x9=FALSE  ) &
   (  x349=FALSE  or  x7=FALSE  ) &
   (  x350=FALSE  or  x8=FALSE  ) &
   (  x351=FALSE  or  x9=FALSE  ) &
   (  x463=FALSE  or  x7=FALSE  ) &
   (  x464=FALSE  or  x8=FALSE  ) &
   (  x465=FALSE  or  x9=FALSE  ) &
   (  x28=FALSE  or  x10=FALSE  ) &
   (  x29=FALSE  or  x11=FALSE  ) &
   (  x30=FALSE  or  x12=FALSE  ) &
   (  x61=FALSE  or  x10=FALSE  ) &
   (  x62=FALSE  or  x11=FALSE  ) &
   (  x63=FALSE  or  x12=FALSE  ) &
   (  x133=FALSE  or  x10=FALSE  ) &
   (  x134=FALSE  or  x11=FALSE  ) &
   (  x135=FALSE  or  x12=FALSE  ) &
   (  x184=FALSE  or  x10=FALSE  ) &
   (  x185=FALSE  or  x11=FALSE  ) &
   (  x186=FALSE  or  x12=FALSE  ) &
   (  x250=FALSE  or  x10=FALSE  ) &
   (  x251=FALSE  or  x11=FALSE  ) &
   (  x252=FALSE  or  x12=FALSE  ) &
   (  x463=FALSE  or  x10=FALSE  ) &
   (  x464=FALSE  or  x11=FALSE  ) &
   (  x465=FALSE  or  x12=FALSE  ) &
   (  x556=FALSE  or  x10=FALSE  ) &
   (  x557=FALSE  or  x11=FALSE  ) &
   (  x558=FALSE  or  x12=FALSE  ) &
   (  x73=FALSE  or  x13=FALSE  ) &
   (  x74=FALSE  or  x14=FALSE  ) &
   (  x75=FALSE  or  x15=FALSE  ) &
   (  x262=FALSE  or  x13=FALSE  ) &
   (  x263=FALSE  or  x14=FALSE  ) &
   (  x264=FALSE  or  x15=FALSE  ) &
   (  x304=FALSE  or  x13=FALSE  ) &
   (  x305=FALSE  or  x14=FALSE  ) &
   (  x306=FALSE  or  x15=FALSE  ) &
   (  x322=FALSE  or  x13=FALSE  ) &
   (  x323=FALSE  or  x14=FALSE  ) &
   (  x324=FALSE  or  x15=FALSE  ) &
   (  x70=FALSE  or  x16=FALSE  ) &
   (  x71=FALSE  or  x17=FALSE  ) &
   (  x72=FALSE  or  x18=FALSE  ) &
   (  x160=FALSE  or  x16=FALSE  ) &
   (  x161=FALSE  or  x17=FALSE  ) &
   (  x162=FALSE  or  x18=FALSE  ) &
   (  x376=FALSE  or  x16=FALSE  ) &
   (  x377=FALSE  or  x17=FALSE  ) &
   (  x378=FALSE  or  x18=FALSE  ) &
   (  x397=FALSE  or  x16=FALSE  ) &
   (  x398=FALSE  or  x17=FALSE  ) &
   (  x399=FALSE  or  x18=FALSE  ) &
   (  x415=FALSE  or  x16=FALSE  ) &
   (  x416=FALSE  or  x17=FALSE  ) &
   (  x417=FALSE  or  x18=FALSE  ) &
   (  x418=FALSE  or  x16=FALSE  ) &
   (  x419=FALSE  or  x17=FALSE  ) &
   (  x420=FALSE  or  x18=FALSE  ) &
   (  x469=FALSE  or  x16=FALSE  ) &
   (  x470=FALSE  or  x17=FALSE  ) &
   (  x471=FALSE  or  x18=FALSE  ) &
   (  x595=FALSE  or  x16=FALSE  ) &
   (  x596=FALSE  or  x17=FALSE  ) &
   (  x597=FALSE  or  x18=FALSE  ) &
   (  x58=FALSE  or  x19=FALSE  ) &
   (  x59=FALSE  or  x20=FALSE  ) &
   (  x60=FALSE  or  x21=FALSE  ) &
   (  x82=FALSE  or  x19=FALSE  ) &
   (  x83=FALSE  or  x20=FALSE  ) &
   (  x84=FALSE  or  x21=FALSE  ) &
   (  x208=FALSE  or  x19=FALSE  ) &
   (  x209=FALSE  or  x20=FALSE  ) &
   (  x210=FALSE  or  x21=FALSE  ) &
   (  x277=FALSE  or  x19=FALSE  ) &
   (  x278=FALSE  or  x20=FALSE  ) &
   (  x279=FALSE  or  x21=FALSE  ) &
   (  x310=FALSE  or  x19=FALSE  ) &
   (  x311=FALSE  or  x20=FALSE  ) &
   (  x312=FALSE  or  x21=FALSE  ) &
   (  x337=FALSE  or  x19=FALSE  ) &
   (  x338=FALSE  or  x20=FALSE  ) &
   (  x339=FALSE  or  x21=FALSE  ) &
   (  x451=FALSE  or  x19=FALSE  ) &
   (  x452=FALSE  or  x20=FALSE  ) &
   (  x453=FALSE  or  x21=FALSE  ) &
   (  x151=FALSE  or  x22=FALSE  ) &
   (  x152=FALSE  or  x23=FALSE  ) &
   (  x153=FALSE  or  x24=FALSE  ) &
   (  x235=FALSE  or  x22=FALSE  ) &
   (  x236=FALSE  or  x23=FALSE  ) &
   (  x237=FALSE  or  x24=FALSE  ) &
   (  x265=FALSE  or  x22=FALSE  ) &
   (  x266=FALSE  or  x23=FALSE  ) &
   (  x267=FALSE  or  x24=FALSE  ) &
   (  x124=FALSE  or  x25=FALSE  ) &
   (  x125=FALSE  or  x26=FALSE  ) &
   (  x126=FALSE  or  x27=FALSE  ) &
   (  x211=FALSE  or  x25=FALSE  ) &
   (  x212=FALSE  or  x26=FALSE  ) &
   (  x213=FALSE  or  x27=FALSE  ) &
   (  x289=FALSE  or  x25=FALSE  ) &
   (  x290=FALSE  or  x26=FALSE  ) &
   (  x291=FALSE  or  x27=FALSE  ) &
   (  x565=FALSE  or  x25=FALSE  ) &
   (  x566=FALSE  or  x26=FALSE  ) &
   (  x567=FALSE  or  x27=FALSE  ) &
   (  x175=FALSE  or  x28=FALSE  ) &
   (  x176=FALSE  or  x29=FALSE  ) &
   (  x177=FALSE  or  x30=FALSE  ) &
   (  x178=FALSE  or  x28=FALSE  ) &
   (  x179=FALSE  or  x29=FALSE  ) &
   (  x180=FALSE  or  x30=FALSE  ) &
   (  x247=FALSE  or  x28=FALSE  ) &
   (  x248=FALSE  or  x29=FALSE  ) &
   (  x249=FALSE  or  x30=FALSE  ) &
   (  x370=FALSE  or  x28=FALSE  ) &
   (  x371=FALSE  or  x29=FALSE  ) &
   (  x372=FALSE  or  x30=FALSE  ) &
   (  x436=FALSE  or  x28=FALSE  ) &
   (  x437=FALSE  or  x29=FALSE  ) &
   (  x438=FALSE  or  x30=FALSE  ) &
   (  x448=FALSE  or  x28=FALSE  ) &
   (  x449=FALSE  or  x29=FALSE  ) &
   (  x450=FALSE  or  x30=FALSE  ) &
   (  x43=FALSE  or  x31=FALSE  ) &
   (  x44=FALSE  or  x32=FALSE  ) &
   (  x45=FALSE  or  x33=FALSE  ) &
   (  x91=FALSE  or  x31=FALSE  ) &
   (  x92=FALSE  or  x32=FALSE  ) &
   (  x93=FALSE  or  x33=FALSE  ) &
   (  x160=FALSE  or  x31=FALSE  ) &
   (  x161=FALSE  or  x32=FALSE  ) &
   (  x162=FALSE  or  x33=FALSE  ) &
   (  x232=FALSE  or  x31=FALSE  ) &
   (  x233=FALSE  or  x32=FALSE  ) &
   (  x234=FALSE  or  x33=FALSE  ) &
   (  x286=FALSE  or  x31=FALSE  ) &
   (  x287=FALSE  or  x32=FALSE  ) &
   (  x288=FALSE  or  x33=FALSE  ) &
   (  x322=FALSE  or  x31=FALSE  ) &
   (  x323=FALSE  or  x32=FALSE  ) &
   (  x324=FALSE  or  x33=FALSE  ) &
   (  x577=FALSE  or  x31=FALSE  ) &
   (  x578=FALSE  or  x32=FALSE  ) &
   (  x579=FALSE  or  x33=FALSE  ) &
   (  x67=FALSE  or  x34=FALSE  ) &
   (  x68=FALSE  or  x35=FALSE  ) &
   (  x69=FALSE  or  x36=FALSE  ) &
   (  x169=FALSE  or  x34=FALSE  ) &
   (  x170=FALSE  or  x35=FALSE  ) &
   (  x171=FALSE  or  x36=FALSE  ) &
   (  x316=FALSE  or  x34=FALSE  ) &
   (  x317=FALSE  or  x35=FALSE  ) &
   (  x318=FALSE  or  x36=FALSE  ) &
   (  x439=FALSE  or  x34=FALSE  ) &
   (  x440=FALSE  or  x35=FALSE  ) &
   (  x441=FALSE  or  x36=FALSE  ) &
   (  x496=FALSE  or  x34=FALSE  ) &
   (  x497=FALSE  or  x35=FALSE  ) &
   (  x498=FALSE  or  x36=FALSE  ) &
   (  x79=FALSE  or  x37=FALSE  ) &
   (  x80=FALSE  or  x38=FALSE  ) &
   (  x81=FALSE  or  x39=FALSE  ) &
   (  x145=FALSE  or  x37=FALSE  ) &
   (  x146=FALSE  or  x38=FALSE  ) &
   (  x147=FALSE  or  x39=FALSE  ) &
   (  x463=FALSE  or  x37=FALSE  ) &
   (  x464=FALSE  or  x38=FALSE  ) &
   (  x465=FALSE  or  x39=FALSE  ) &
   (  x481=FALSE  or  x37=FALSE  ) &
   (  x482=FALSE  or  x38=FALSE  ) &
   (  x483=FALSE  or  x39=FALSE  ) &
   (  x124=FALSE  or  x40=FALSE  ) &
   (  x125=FALSE  or  x41=FALSE  ) &
   (  x126=FALSE  or  x42=FALSE  ) &
   (  x256=FALSE  or  x40=FALSE  ) &
   (  x257=FALSE  or  x41=FALSE  ) &
   (  x258=FALSE  or  x42=FALSE  ) &
   (  x262=FALSE  or  x40=FALSE  ) &
   (  x263=FALSE  or  x41=FALSE  ) &
   (  x264=FALSE  or  x42=FALSE  ) &
   (  x487=FALSE  or  x40=FALSE  ) &
   (  x488=FALSE  or  x41=FALSE  ) &
   (  x489=FALSE  or  x42=FALSE  ) &
   (  x547=FALSE  or  x40=FALSE  ) &
   (  x548=FALSE  or  x41=FALSE  ) &
   (  x549=FALSE  or  x42=FALSE  ) &
   (  x151=FALSE  or  x43=FALSE  ) &
   (  x152=FALSE  or  x44=FALSE  ) &
   (  x153=FALSE  or  x45=FALSE  ) &
   (  x301=FALSE  or  x43=FALSE  ) &
   (  x302=FALSE  or  x44=FALSE  ) &
   (  x303=FALSE  or  x45=FALSE  ) &
   (  x337=FALSE  or  x43=FALSE  ) &
   (  x338=FALSE  or  x44=FALSE  ) &
   (  x339=FALSE  or  x45=FALSE  ) &
   (  x340=FALSE  or  x43=FALSE  ) &
   (  x341=FALSE  or  x44=FALSE  ) &
   (  x342=FALSE  or  x45=FALSE  ) &
   (  x352=FALSE  or  x43=FALSE  ) &
   (  x353=FALSE  or  x44=FALSE  ) &
   (  x354=FALSE  or  x45=FALSE  ) &
   (  x382=FALSE  or  x43=FALSE  ) &
   (  x383=FALSE  or  x44=FALSE  ) &
   (  x384=FALSE  or  x45=FALSE  ) &
   (  x448=FALSE  or  x43=FALSE  ) &
   (  x449=FALSE  or  x44=FALSE  ) &
   (  x450=FALSE  or  x45=FALSE  ) &
   (  x79=FALSE  or  x46=FALSE  ) &
   (  x80=FALSE  or  x47=FALSE  ) &
   (  x81=FALSE  or  x48=FALSE  ) &
   (  x337=FALSE  or  x46=FALSE  ) &
   (  x338=FALSE  or  x47=FALSE  ) &
   (  x339=FALSE  or  x48=FALSE  ) &
   (  x280=FALSE  or  x49=FALSE  ) &
   (  x281=FALSE  or  x50=FALSE  ) &
   (  x282=FALSE  or  x51=FALSE  ) &
   (  x286=FALSE  or  x49=FALSE  ) &
   (  x287=FALSE  or  x50=FALSE  ) &
   (  x288=FALSE  or  x51=FALSE  ) &
   (  x319=FALSE  or  x49=FALSE  ) &
   (  x320=FALSE  or  x50=FALSE  ) &
   (  x321=FALSE  or  x51=FALSE  ) &
   (  x577=FALSE  or  x49=FALSE  ) &
   (  x578=FALSE  or  x50=FALSE  ) &
   (  x579=FALSE  or  x51=FALSE  ) &
   (  x58=FALSE  or  x52=FALSE  ) &
   (  x59=FALSE  or  x53=FALSE  ) &
   (  x60=FALSE  or  x54=FALSE  ) &
   (  x208=FALSE  or  x52=FALSE  ) &
   (  x209=FALSE  or  x53=FALSE  ) &
   (  x210=FALSE  or  x54=FALSE  ) &
   (  x367=FALSE  or  x52=FALSE  ) &
   (  x368=FALSE  or  x53=FALSE  ) &
   (  x369=FALSE  or  x54=FALSE  ) &
   (  x460=FALSE  or  x52=FALSE  ) &
   (  x461=FALSE  or  x53=FALSE  ) &
   (  x462=FALSE  or  x54=FALSE  ) &
   (  x598=FALSE  or  x52=FALSE  ) &
   (  x599=FALSE  or  x53=FALSE  ) &
   (  x600=FALSE  or  x54=FALSE  ) &
   (  x148=FALSE  or  x55=FALSE  ) &
   (  x149=FALSE  or  x56=FALSE  ) &
   (  x150=FALSE  or  x57=FALSE  ) &
   (  x349=FALSE  or  x55=FALSE  ) &
   (  x350=FALSE  or  x56=FALSE  ) &
   (  x351=FALSE  or  x57=FALSE  ) &
   (  x361=FALSE  or  x55=FALSE  ) &
   (  x362=FALSE  or  x56=FALSE  ) &
   (  x363=FALSE  or  x57=FALSE  ) &
   (  x502=FALSE  or  x55=FALSE  ) &
   (  x503=FALSE  or  x56=FALSE  ) &
   (  x504=FALSE  or  x57=FALSE  ) &
   (  x568=FALSE  or  x55=FALSE  ) &
   (  x569=FALSE  or  x56=FALSE  ) &
   (  x570=FALSE  or  x57=FALSE  ) &
   (  x154=FALSE  or  x58=FALSE  ) &
   (  x155=FALSE  or  x59=FALSE  ) &
   (  x156=FALSE  or  x60=FALSE  ) &
   (  x307=FALSE  or  x58=FALSE  ) &
   (  x308=FALSE  or  x59=FALSE  ) &
   (  x309=FALSE  or  x60=FALSE  ) &
   (  x349=FALSE  or  x58=FALSE  ) &
   (  x350=FALSE  or  x59=FALSE  ) &
   (  x351=FALSE  or  x60=FALSE  ) &
   (  x400=FALSE  or  x58=FALSE  ) &
   (  x401=FALSE  or  x59=FALSE  ) &
   (  x402=FALSE  or  x60=FALSE  ) &
   (  x391=FALSE  or  x61=FALSE  ) &
   (  x392=FALSE  or  x62=FALSE  ) &
   (  x393=FALSE  or  x63=FALSE  ) &
   (  x475=FALSE  or  x61=FALSE  ) &
   (  x476=FALSE  or  x62=FALSE  ) &
   (  x477=FALSE  or  x63=FALSE  ) &
   (  x514=FALSE  or  x61=FALSE  ) &
   (  x515=FALSE  or  x62=FALSE  ) &
   (  x516=FALSE  or  x63=FALSE  ) &
   (  x520=FALSE  or  x61=FALSE  ) &
   (  x521=FALSE  or  x62=FALSE  ) &
   (  x522=FALSE  or  x63=FALSE  ) &
   (  x556=FALSE  or  x61=FALSE  ) &
   (  x557=FALSE  or  x62=FALSE  ) &
   (  x558=FALSE  or  x63=FALSE  ) &
   (  x154=FALSE  or  x64=FALSE  ) &
   (  x155=FALSE  or  x65=FALSE  ) &
   (  x156=FALSE  or  x66=FALSE  ) &
   (  x379=FALSE  or  x64=FALSE  ) &
   (  x380=FALSE  or  x65=FALSE  ) &
   (  x381=FALSE  or  x66=FALSE  ) &
   (  x436=FALSE  or  x64=FALSE  ) &
   (  x437=FALSE  or  x65=FALSE  ) &
   (  x438=FALSE  or  x66=FALSE  ) &
   (  x469=FALSE  or  x64=FALSE  ) &
   (  x470=FALSE  or  x65=FALSE  ) &
   (  x471=FALSE  or  x66=FALSE  ) &
   (  x568=FALSE  or  x64=FALSE  ) &
   (  x569=FALSE  or  x65=FALSE  ) &
   (  x570=FALSE  or  x66=FALSE  ) &
   (  x91=FALSE  or  x67=FALSE  ) &
   (  x92=FALSE  or  x68=FALSE  ) &
   (  x93=FALSE  or  x69=FALSE  ) &
   (  x289=FALSE  or  x67=FALSE  ) &
   (  x290=FALSE  or  x68=FALSE  ) &
   (  x291=FALSE  or  x69=FALSE  ) &
   (  x403=FALSE  or  x67=FALSE  ) &
   (  x404=FALSE  or  x68=FALSE  ) &
   (  x405=FALSE  or  x69=FALSE  ) &
   (  x499=FALSE  or  x67=FALSE  ) &
   (  x500=FALSE  or  x68=FALSE  ) &
   (  x501=FALSE  or  x69=FALSE  ) &
   (  x220=FALSE  or  x70=FALSE  ) &
   (  x221=FALSE  or  x71=FALSE  ) &
   (  x222=FALSE  or  x72=FALSE  ) &
   (  x484=FALSE  or  x70=FALSE  ) &
   (  x485=FALSE  or  x71=FALSE  ) &
   (  x486=FALSE  or  x72=FALSE  ) &
   (  x241=FALSE  or  x73=FALSE  ) &
   (  x242=FALSE  or  x74=FALSE  ) &
   (  x243=FALSE  or  x75=FALSE  ) &
   (  x289=FALSE  or  x73=FALSE  ) &
   (  x290=FALSE  or  x74=FALSE  ) &
   (  x291=FALSE  or  x75=FALSE  ) &
   (  x439=FALSE  or  x73=FALSE  ) &
   (  x440=FALSE  or  x74=FALSE  ) &
   (  x441=FALSE  or  x75=FALSE  ) &
   (  x496=FALSE  or  x73=FALSE  ) &
   (  x497=FALSE  or  x74=FALSE  ) &
   (  x498=FALSE  or  x75=FALSE  ) &
   (  x103=FALSE  or  x76=FALSE  ) &
   (  x104=FALSE  or  x77=FALSE  ) &
   (  x105=FALSE  or  x78=FALSE  ) &
   (  x151=FALSE  or  x76=FALSE  ) &
   (  x152=FALSE  or  x77=FALSE  ) &
   (  x153=FALSE  or  x78=FALSE  ) &
   (  x187=FALSE  or  x76=FALSE  ) &
   (  x188=FALSE  or  x77=FALSE  ) &
   (  x189=FALSE  or  x78=FALSE  ) &
   (  x406=FALSE  or  x76=FALSE  ) &
   (  x407=FALSE  or  x77=FALSE  ) &
   (  x408=FALSE  or  x78=FALSE  ) &
   (  x154=FALSE  or  x79=FALSE  ) &
   (  x155=FALSE  or  x80=FALSE  ) &
   (  x156=FALSE  or  x81=FALSE  ) &
   (  x283=FALSE  or  x79=FALSE  ) &
   (  x284=FALSE  or  x80=FALSE  ) &
   (  x285=FALSE  or  x81=FALSE  ) &
   (  x133=FALSE  or  x82=FALSE  ) &
   (  x134=FALSE  or  x83=FALSE  ) &
   (  x135=FALSE  or  x84=FALSE  ) &
   (  x313=FALSE  or  x82=FALSE  ) &
   (  x314=FALSE  or  x83=FALSE  ) &
   (  x315=FALSE  or  x84=FALSE  ) &
   (  x481=FALSE  or  x82=FALSE  ) &
   (  x482=FALSE  or  x83=FALSE  ) &
   (  x483=FALSE  or  x84=FALSE  ) &
   (  x532=FALSE  or  x82=FALSE  ) &
   (  x533=FALSE  or  x83=FALSE  ) &
   (  x534=FALSE  or  x84=FALSE  ) &
   (  x241=FALSE  or  x85=FALSE  ) &
   (  x242=FALSE  or  x86=FALSE  ) &
   (  x243=FALSE  or  x87=FALSE  ) &
   (  x367=FALSE  or  x85=FALSE  ) &
   (  x368=FALSE  or  x86=FALSE  ) &
   (  x369=FALSE  or  x87=FALSE  ) &
   (  x508=FALSE  or  x85=FALSE  ) &
   (  x509=FALSE  or  x86=FALSE  ) &
   (  x510=FALSE  or  x87=FALSE  ) &
   (  x187=FALSE  or  x88=FALSE  ) &
   (  x188=FALSE  or  x89=FALSE  ) &
   (  x189=FALSE  or  x90=FALSE  ) &
   (  x223=FALSE  or  x88=FALSE  ) &
   (  x224=FALSE  or  x89=FALSE  ) &
   (  x225=FALSE  or  x90=FALSE  ) &
   (  x562=FALSE  or  x88=FALSE  ) &
   (  x563=FALSE  or  x89=FALSE  ) &
   (  x564=FALSE  or  x90=FALSE  ) &
   (  x580=FALSE  or  x88=FALSE  ) &
   (  x581=FALSE  or  x89=FALSE  ) &
   (  x582=FALSE  or  x90=FALSE  ) &
   (  x589=FALSE  or  x88=FALSE  ) &
   (  x590=FALSE  or  x89=FALSE  ) &
   (  x591=FALSE  or  x90=FALSE  ) &
   (  x169=FALSE  or  x91=FALSE  ) &
   (  x170=FALSE  or  x92=FALSE  ) &
   (  x171=FALSE  or  x93=FALSE  ) &
   (  x289=FALSE  or  x91=FALSE  ) &
   (  x290=FALSE  or  x92=FALSE  ) &
   (  x291=FALSE  or  x93=FALSE  ) &
   (  x316=FALSE  or  x91=FALSE  ) &
   (  x317=FALSE  or  x92=FALSE  ) &
   (  x318=FALSE  or  x93=FALSE  ) &
   (  x448=FALSE  or  x91=FALSE  ) &
   (  x449=FALSE  or  x92=FALSE  ) &
   (  x450=FALSE  or  x93=FALSE  ) &
   (  x436=FALSE  or  x94=FALSE  ) &
   (  x437=FALSE  or  x95=FALSE  ) &
   (  x438=FALSE  or  x96=FALSE  ) &
   (  x439=FALSE  or  x94=FALSE  ) &
   (  x440=FALSE  or  x95=FALSE  ) &
   (  x441=FALSE  or  x96=FALSE  ) &
   (  x532=FALSE  or  x94=FALSE  ) &
   (  x533=FALSE  or  x95=FALSE  ) &
   (  x534=FALSE  or  x96=FALSE  ) &
   (  x550=FALSE  or  x94=FALSE  ) &
   (  x551=FALSE  or  x95=FALSE  ) &
   (  x552=FALSE  or  x96=FALSE  ) &
   (  x577=FALSE  or  x94=FALSE  ) &
   (  x578=FALSE  or  x95=FALSE  ) &
   (  x579=FALSE  or  x96=FALSE  ) &
   (  x409=FALSE  or  x97=FALSE  ) &
   (  x410=FALSE  or  x98=FALSE  ) &
   (  x411=FALSE  or  x99=FALSE  ) &
   (  x439=FALSE  or  x97=FALSE  ) &
   (  x440=FALSE  or  x98=FALSE  ) &
   (  x441=FALSE  or  x99=FALSE  ) &
   (  x493=FALSE  or  x100=FALSE  ) &
   (  x494=FALSE  or  x101=FALSE  ) &
   (  x495=FALSE  or  x102=FALSE  ) &
   (  x121=FALSE  or  x103=FALSE  ) &
   (  x122=FALSE  or  x104=FALSE  ) &
   (  x123=FALSE  or  x105=FALSE  ) &
   (  x292=FALSE  or  x103=FALSE  ) &
   (  x293=FALSE  or  x104=FALSE  ) &
   (  x294=FALSE  or  x105=FALSE  ) &
   (  x514=FALSE  or  x103=FALSE  ) &
   (  x515=FALSE  or  x104=FALSE  ) &
   (  x516=FALSE  or  x105=FALSE  ) &
   (  x202=FALSE  or  x106=FALSE  ) &
   (  x203=FALSE  or  x107=FALSE  ) &
   (  x204=FALSE  or  x108=FALSE  ) &
   (  x229=FALSE  or  x106=FALSE  ) &
   (  x230=FALSE  or  x107=FALSE  ) &
   (  x231=FALSE  or  x108=FALSE  ) &
   (  x517=FALSE  or  x106=FALSE  ) &
   (  x518=FALSE  or  x107=FALSE  ) &
   (  x519=FALSE  or  x108=FALSE  ) &
   (  x244=FALSE  or  x109=FALSE  ) &
   (  x245=FALSE  or  x110=FALSE  ) &
   (  x246=FALSE  or  x111=FALSE  ) &
   (  x124=FALSE  or  x112=FALSE  ) &
   (  x125=FALSE  or  x113=FALSE  ) &
   (  x126=FALSE  or  x114=FALSE  ) &
   (  x391=FALSE  or  x112=FALSE  ) &
   (  x392=FALSE  or  x113=FALSE  ) &
   (  x393=FALSE  or  x114=FALSE  ) &
   (  x448=FALSE  or  x112=FALSE  ) &
   (  x449=FALSE  or  x113=FALSE  ) &
   (  x450=FALSE  or  x114=FALSE  ) &
   (  x469=FALSE  or  x112=FALSE  ) &
   (  x470=FALSE  or  x113=FALSE  ) &
   (  x471=FALSE  or  x114=FALSE  ) &
   (  x493=FALSE  or  x112=FALSE  ) &
   (  x494=FALSE  or  x113=FALSE  ) &
   (  x495=FALSE  or  x114=FALSE  ) &
   (  x580=FALSE  or  x112=FALSE  ) &
   (  x581=FALSE  or  x113=FALSE  ) &
   (  x582=FALSE  or  x114=FALSE  ) &
   (  x592=FALSE  or  x112=FALSE  ) &
   (  x593=FALSE  or  x113=FALSE  ) &
   (  x594=FALSE  or  x114=FALSE  ) &
   (  x238=FALSE  or  x115=FALSE  ) &
   (  x239=FALSE  or  x116=FALSE  ) &
   (  x240=FALSE  or  x117=FALSE  ) &
   (  x433=FALSE  or  x115=FALSE  ) &
   (  x434=FALSE  or  x116=FALSE  ) &
   (  x435=FALSE  or  x117=FALSE  ) &
   (  x517=FALSE  or  x115=FALSE  ) &
   (  x518=FALSE  or  x116=FALSE  ) &
   (  x519=FALSE  or  x117=FALSE  ) &
   (  x214=FALSE  or  x118=FALSE  ) &
   (  x215=FALSE  or  x119=FALSE  ) &
   (  x216=FALSE  or  x120=FALSE  ) &
   (  x244=FALSE  or  x118=FALSE  ) &
   (  x245=FALSE  or  x119=FALSE  ) &
   (  x246=FALSE  or  x120=FALSE  ) &
   (  x247=FALSE  or  x118=FALSE  ) &
   (  x248=FALSE  or  x119=FALSE  ) &
   (  x249=FALSE  or  x120=FALSE  ) &
   (  x358=FALSE  or  x118=FALSE  ) &
   (  x359=FALSE  or  x119=FALSE  ) &
   (  x360=FALSE  or  x120=FALSE  ) &
   (  x388=FALSE  or  x118=FALSE  ) &
   (  x389=FALSE  or  x119=FALSE  ) &
   (  x390=FALSE  or  x120=FALSE  ) &
   (  x400=FALSE  or  x118=FALSE  ) &
   (  x401=FALSE  or  x119=FALSE  ) &
   (  x402=FALSE  or  x120=FALSE  ) &
   (  x421=FALSE  or  x118=FALSE  ) &
   (  x422=FALSE  or  x119=FALSE  ) &
   (  x423=FALSE  or  x120=FALSE  ) &
   (  x130=FALSE  or  x121=FALSE  ) &
   (  x131=FALSE  or  x122=FALSE  ) &
   (  x132=FALSE  or  x123=FALSE  ) &
   (  x175=FALSE  or  x121=FALSE  ) &
   (  x176=FALSE  or  x122=FALSE  ) &
   (  x177=FALSE  or  x123=FALSE  ) &
   (  x226=FALSE  or  x121=FALSE  ) &
   (  x227=FALSE  or  x122=FALSE  ) &
   (  x228=FALSE  or  x123=FALSE  ) &
   (  x352=FALSE  or  x121=FALSE  ) &
   (  x353=FALSE  or  x122=FALSE  ) &
   (  x354=FALSE  or  x123=FALSE  ) &
   (  x427=FALSE  or  x121=FALSE  ) &
   (  x428=FALSE  or  x122=FALSE  ) &
   (  x429=FALSE  or  x123=FALSE  ) &
   (  x532=FALSE  or  x121=FALSE  ) &
   (  x533=FALSE  or  x122=FALSE  ) &
   (  x534=FALSE  or  x123=FALSE  ) &
   (  x535=FALSE  or  x121=FALSE  ) &
   (  x536=FALSE  or  x122=FALSE  ) &
   (  x537=FALSE  or  x123=FALSE  ) &
   (  x295=FALSE  or  x124=FALSE  ) &
   (  x296=FALSE  or  x125=FALSE  ) &
   (  x297=FALSE  or  x126=FALSE  ) &
   (  x526=FALSE  or  x124=FALSE  ) &
   (  x527=FALSE  or  x125=FALSE  ) &
   (  x528=FALSE  or  x126=FALSE  ) &
   (  x148=FALSE  or  x127=FALSE  ) &
   (  x149=FALSE  or  x128=FALSE  ) &
   (  x150=FALSE  or  x129=FALSE  ) &
   (  x226=FALSE  or  x130=FALSE  ) &
   (  x227=FALSE  or  x131=FALSE  ) &
   (  x228=FALSE  or  x132=FALSE  ) &
   (  x250=FALSE  or  x130=FALSE  ) &
   (  x251=FALSE  or  x131=FALSE  ) &
   (  x252=FALSE  or  x132=FALSE  ) &
   (  x487=FALSE  or  x130=FALSE  ) &
   (  x488=FALSE  or  x131=FALSE  ) &
   (  x489=FALSE  or  x132=FALSE  ) &
   (  x535=FALSE  or  x130=FALSE  ) &
   (  x536=FALSE  or  x131=FALSE  ) &
   (  x537=FALSE  or  x132=FALSE  ) &
   (  x211=FALSE  or  x133=FALSE  ) &
   (  x212=FALSE  or  x134=FALSE  ) &
   (  x213=FALSE  or  x135=FALSE  ) &
   (  x376=FALSE  or  x133=FALSE  ) &
   (  x377=FALSE  or  x134=FALSE  ) &
   (  x378=FALSE  or  x135=FALSE  ) &
   (  x388=FALSE  or  x133=FALSE  ) &
   (  x389=FALSE  or  x134=FALSE  ) &
   (  x390=FALSE  or  x135=FALSE  ) &
   (  x496=FALSE  or  x133=FALSE  ) &
   (  x497=FALSE  or  x134=FALSE  ) &
   (  x498=FALSE  or  x135=FALSE  ) &
   (  x559=FALSE  or  x133=FALSE  ) &
   (  x560=FALSE  or  x134=FALSE  ) &
   (  x561=FALSE  or  x135=FALSE  ) &
   (  x325=FALSE  or  x136=FALSE  ) &
   (  x326=FALSE  or  x137=FALSE  ) &
   (  x327=FALSE  or  x138=FALSE  ) &
   (  x352=FALSE  or  x136=FALSE  ) &
   (  x353=FALSE  or  x137=FALSE  ) &
   (  x354=FALSE  or  x138=FALSE  ) &
   (  x445=FALSE  or  x136=FALSE  ) &
   (  x446=FALSE  or  x137=FALSE  ) &
   (  x447=FALSE  or  x138=FALSE  ) &
   (  x496=FALSE  or  x136=FALSE  ) &
   (  x497=FALSE  or  x137=FALSE  ) &
   (  x498=FALSE  or  x138=FALSE  ) &
   (  x523=FALSE  or  x136=FALSE  ) &
   (  x524=FALSE  or  x137=FALSE  ) &
   (  x525=FALSE  or  x138=FALSE  ) &
   (  x565=FALSE  or  x139=FALSE  ) &
   (  x566=FALSE  or  x140=FALSE  ) &
   (  x567=FALSE  or  x141=FALSE  ) &
   (  x319=FALSE  or  x142=FALSE  ) &
   (  x320=FALSE  or  x143=FALSE  ) &
   (  x321=FALSE  or  x144=FALSE  ) &
   (  x379=FALSE  or  x142=FALSE  ) &
   (  x380=FALSE  or  x143=FALSE  ) &
   (  x381=FALSE  or  x144=FALSE  ) &
   (  x445=FALSE  or  x142=FALSE  ) &
   (  x446=FALSE  or  x143=FALSE  ) &
   (  x447=FALSE  or  x144=FALSE  ) &
   (  x466=FALSE  or  x142=FALSE  ) &
   (  x467=FALSE  or  x143=FALSE  ) &
   (  x468=FALSE  or  x144=FALSE  ) &
   (  x583=FALSE  or  x142=FALSE  ) &
   (  x584=FALSE  or  x143=FALSE  ) &
   (  x585=FALSE  or  x144=FALSE  ) &
   (  x160=FALSE  or  x145=FALSE  ) &
   (  x161=FALSE  or  x146=FALSE  ) &
   (  x162=FALSE  or  x147=FALSE  ) &
   (  x241=FALSE  or  x145=FALSE  ) &
   (  x242=FALSE  or  x146=FALSE  ) &
   (  x243=FALSE  or  x147=FALSE  ) &
   (  x289=FALSE  or  x145=FALSE  ) &
   (  x290=FALSE  or  x146=FALSE  ) &
   (  x291=FALSE  or  x147=FALSE  ) &
   (  x340=FALSE  or  x145=FALSE  ) &
   (  x341=FALSE  or  x146=FALSE  ) &
   (  x342=FALSE  or  x147=FALSE  ) &
   (  x157=FALSE  or  x148=FALSE  ) &
   (  x158=FALSE  or  x149=FALSE  ) &
   (  x159=FALSE  or  x150=FALSE  ) &
   (  x337=FALSE  or  x148=FALSE  ) &
   (  x338=FALSE  or  x149=FALSE  ) &
   (  x339=FALSE  or  x150=FALSE  ) &
   (  x352=FALSE  or  x148=FALSE  ) &
   (  x353=FALSE  or  x149=FALSE  ) &
   (  x354=FALSE  or  x150=FALSE  ) &
   (  x358=FALSE  or  x148=FALSE  ) &
   (  x359=FALSE  or  x149=FALSE  ) &
   (  x360=FALSE  or  x150=FALSE  ) &
   (  x169=FALSE  or  x151=FALSE  ) &
   (  x170=FALSE  or  x152=FALSE  ) &
   (  x171=FALSE  or  x153=FALSE  ) &
   (  x571=FALSE  or  x151=FALSE  ) &
   (  x572=FALSE  or  x152=FALSE  ) &
   (  x573=FALSE  or  x153=FALSE  ) &
   (  x592=FALSE  or  x151=FALSE  ) &
   (  x593=FALSE  or  x152=FALSE  ) &
   (  x594=FALSE  or  x153=FALSE  ) &
   (  x250=FALSE  or  x154=FALSE  ) &
   (  x251=FALSE  or  x155=FALSE  ) &
   (  x252=FALSE  or  x156=FALSE  ) &
   (  x280=FALSE  or  x154=FALSE  ) &
   (  x281=FALSE  or  x155=FALSE  ) &
   (  x282=FALSE  or  x156=FALSE  ) &
   (  x472=FALSE  or  x154=FALSE  ) &
   (  x473=FALSE  or  x155=FALSE  ) &
   (  x474=FALSE  or  x156=FALSE  ) &
   (  x571=FALSE  or  x154=FALSE  ) &
   (  x572=FALSE  or  x155=FALSE  ) &
   (  x573=FALSE  or  x156=FALSE  ) &
   (  x316=FALSE  or  x157=FALSE  ) &
   (  x317=FALSE  or  x158=FALSE  ) &
   (  x318=FALSE  or  x159=FALSE  ) &
   (  x523=FALSE  or  x157=FALSE  ) &
   (  x524=FALSE  or  x158=FALSE  ) &
   (  x525=FALSE  or  x159=FALSE  ) &
   (  x256=FALSE  or  x160=FALSE  ) &
   (  x257=FALSE  or  x161=FALSE  ) &
   (  x258=FALSE  or  x162=FALSE  ) &
   (  x421=FALSE  or  x160=FALSE  ) &
   (  x422=FALSE  or  x161=FALSE  ) &
   (  x423=FALSE  or  x162=FALSE  ) &
   (  x427=FALSE  or  x160=FALSE  ) &
   (  x428=FALSE  or  x161=FALSE  ) &
   (  x429=FALSE  or  x162=FALSE  ) &
   (  x505=FALSE  or  x160=FALSE  ) &
   (  x506=FALSE  or  x161=FALSE  ) &
   (  x507=FALSE  or  x162=FALSE  ) &
   (  x250=FALSE  or  x163=FALSE  ) &
   (  x251=FALSE  or  x164=FALSE  ) &
   (  x252=FALSE  or  x165=FALSE  ) &
   (  x277=FALSE  or  x163=FALSE  ) &
   (  x278=FALSE  or  x164=FALSE  ) &
   (  x279=FALSE  or  x165=FALSE  ) &
   (  x331=FALSE  or  x163=FALSE  ) &
   (  x332=FALSE  or  x164=FALSE  ) &
   (  x333=FALSE  or  x165=FALSE  ) &
   (  x370=FALSE  or  x163=FALSE  ) &
   (  x371=FALSE  or  x164=FALSE  ) &
   (  x372=FALSE  or  x165=FALSE  ) &
   (  x400=FALSE  or  x163=FALSE  ) &
   (  x401=FALSE  or  x164=FALSE  ) &
   (  x402=FALSE  or  x165=FALSE  ) &
   (  x421=FALSE  or  x163=FALSE  ) &
   (  x422=FALSE  or  x164=FALSE  ) &
   (  x423=FALSE  or  x165=FALSE  ) &
   (  x517=FALSE  or  x163=FALSE  ) &
   (  x518=FALSE  or  x164=FALSE  ) &
   (  x519=FALSE  or  x165=FALSE  ) &
   (  x538=FALSE  or  x163=FALSE  ) &
   (  x539=FALSE  or  x164=FALSE  ) &
   (  x540=FALSE  or  x165=FALSE  ) &
   (  x205=FALSE  or  x166=FALSE  ) &
   (  x206=FALSE  or  x167=FALSE  ) &
   (  x207=FALSE  or  x168=FALSE  ) &
   (  x244=FALSE  or  x166=FALSE  ) &
   (  x245=FALSE  or  x167=FALSE  ) &
   (  x246=FALSE  or  x168=FALSE  ) &
   (  x340=FALSE  or  x166=FALSE  ) &
   (  x341=FALSE  or  x167=FALSE  ) &
   (  x342=FALSE  or  x168=FALSE  ) &
   (  x397=FALSE  or  x166=FALSE  ) &
   (  x398=FALSE  or  x167=FALSE  ) &
   (  x399=FALSE  or  x168=FALSE  ) &
   (  x292=FALSE  or  x169=FALSE  ) &
   (  x293=FALSE  or  x170=FALSE  ) &
   (  x294=FALSE  or  x171=FALSE  ) &
   (  x436=FALSE  or  x169=FALSE  ) &
   (  x437=FALSE  or  x170=FALSE  ) &
   (  x438=FALSE  or  x171=FALSE  ) &
   (  x577=FALSE  or  x169=FALSE  ) &
   (  x578=FALSE  or  x170=FALSE  ) &
   (  x579=FALSE  or  x171=FALSE  ) &
   (  x262=FALSE  or  x172=FALSE  ) &
   (  x263=FALSE  or  x173=FALSE  ) &
   (  x264=FALSE  or  x174=FALSE  ) &
   (  x310=FALSE  or  x172=FALSE  ) &
   (  x311=FALSE  or  x173=FALSE  ) &
   (  x312=FALSE  or  x174=FALSE  ) &
   (  x403=FALSE  or  x172=FALSE  ) &
   (  x404=FALSE  or  x173=FALSE  ) &
   (  x405=FALSE  or  x174=FALSE  ) &
   (  x496=FALSE  or  x172=FALSE  ) &
   (  x497=FALSE  or  x173=FALSE  ) &
   (  x498=FALSE  or  x174=FALSE  ) &
   (  x202=FALSE  or  x175=FALSE  ) &
   (  x203=FALSE  or  x176=FALSE  ) &
   (  x204=FALSE  or  x177=FALSE  ) &
   (  x286=FALSE  or  x175=FALSE  ) &
   (  x287=FALSE  or  x176=FALSE  ) &
   (  x288=FALSE  or  x177=FALSE  ) &
   (  x295=FALSE  or  x175=FALSE  ) &
   (  x296=FALSE  or  x176=FALSE  ) &
   (  x297=FALSE  or  x177=FALSE  ) &
   (  x394=FALSE  or  x175=FALSE  ) &
   (  x395=FALSE  or  x176=FALSE  ) &
   (  x396=FALSE  or  x177=FALSE  ) &
   (  x562=FALSE  or  x175=FALSE  ) &
   (  x563=FALSE  or  x176=FALSE  ) &
   (  x564=FALSE  or  x177=FALSE  ) &
   (  x229=FALSE  or  x178=FALSE  ) &
   (  x230=FALSE  or  x179=FALSE  ) &
   (  x231=FALSE  or  x180=FALSE  ) &
   (  x316=FALSE  or  x178=FALSE  ) &
   (  x317=FALSE  or  x179=FALSE  ) &
   (  x318=FALSE  or  x180=FALSE  ) &
   (  x328=FALSE  or  x178=FALSE  ) &
   (  x329=FALSE  or  x179=FALSE  ) &
   (  x330=FALSE  or  x180=FALSE  ) &
   (  x484=FALSE  or  x178=FALSE  ) &
   (  x485=FALSE  or  x179=FALSE  ) &
   (  x486=FALSE  or  x180=FALSE  ) &
   (  x544=FALSE  or  x178=FALSE  ) &
   (  x545=FALSE  or  x179=FALSE  ) &
   (  x546=FALSE  or  x180=FALSE  ) &
   (  x196=FALSE  or  x181=FALSE  ) &
   (  x197=FALSE  or  x182=FALSE  ) &
   (  x198=FALSE  or  x183=FALSE  ) &
   (  x367=FALSE  or  x181=FALSE  ) &
   (  x368=FALSE  or  x182=FALSE  ) &
   (  x369=FALSE  or  x183=FALSE  ) &
   (  x388=FALSE  or  x181=FALSE  ) &
   (  x389=FALSE  or  x182=FALSE  ) &
   (  x390=FALSE  or  x183=FALSE  ) &
   (  x520=FALSE  or  x181=FALSE  ) &
   (  x521=FALSE  or  x182=FALSE  ) &
   (  x522=FALSE  or  x183=FALSE  ) &
   (  x541=FALSE  or  x181=FALSE  ) &
   (  x542=FALSE  or  x182=FALSE  ) &
   (  x543=FALSE  or  x183=FALSE  ) &
   (  x475=FALSE  or  x184=FALSE  ) &
   (  x476=FALSE  or  x185=FALSE  ) &
   (  x477=FALSE  or  x186=FALSE  ) &
   (  x202=FALSE  or  x187=FALSE  ) &
   (  x203=FALSE  or  x188=FALSE  ) &
   (  x204=FALSE  or  x189=FALSE  ) &
   (  x301=FALSE  or  x187=FALSE  ) &
   (  x302=FALSE  or  x188=FALSE  ) &
   (  x303=FALSE  or  x189=FALSE  ) &
   (  x355=FALSE  or  x187=FALSE  ) &
   (  x356=FALSE  or  x188=FALSE  ) &
   (  x357=FALSE  or  x189=FALSE  ) &
   (  x199=FALSE  or  x190=FALSE  ) &
   (  x200=FALSE  or  x191=FALSE  ) &
   (  x201=FALSE  or  x192=FALSE  ) &
   (  x280=FALSE  or  x190=FALSE  ) &
   (  x281=FALSE  or  x191=FALSE  ) &
   (  x282=FALSE  or  x192=FALSE  ) &
   (  x301=FALSE  or  x190=FALSE  ) &
   (  x302=FALSE  or  x191=FALSE  ) &
   (  x303=FALSE  or  x192=FALSE  ) &
   (  x490=FALSE  or  x190=FALSE  ) &
   (  x491=FALSE  or  x191=FALSE  ) &
   (  x492=FALSE  or  x192=FALSE  ) &
   (  x553=FALSE  or  x190=FALSE  ) &
   (  x554=FALSE  or  x191=FALSE  ) &
   (  x555=FALSE  or  x192=FALSE  ) &
   (  x244=FALSE  or  x193=FALSE  ) &
   (  x245=FALSE  or  x194=FALSE  ) &
   (  x246=FALSE  or  x195=FALSE  ) &
   (  x385=FALSE  or  x193=FALSE  ) &
   (  x386=FALSE  or  x194=FALSE  ) &
   (  x387=FALSE  or  x195=FALSE  ) &
   (  x415=FALSE  or  x193=FALSE  ) &
   (  x416=FALSE  or  x194=FALSE  ) &
   (  x417=FALSE  or  x195=FALSE  ) &
   (  x532=FALSE  or  x193=FALSE  ) &
   (  x533=FALSE  or  x194=FALSE  ) &
   (  x534=FALSE  or  x195=FALSE  ) &
   (  x229=FALSE  or  x196=FALSE  ) &
   (  x230=FALSE  or  x197=FALSE  ) &
   (  x231=FALSE  or  x198=FALSE  ) &
   (  x262=FALSE  or  x196=FALSE  ) &
   (  x263=FALSE  or  x197=FALSE  ) &
   (  x264=FALSE  or  x198=FALSE  ) &
   (  x328=FALSE  or  x196=FALSE  ) &
   (  x329=FALSE  or  x197=FALSE  ) &
   (  x330=FALSE  or  x198=FALSE  ) &
   (  x388=FALSE  or  x196=FALSE  ) &
   (  x389=FALSE  or  x197=FALSE  ) &
   (  x390=FALSE  or  x198=FALSE  ) &
   (  x427=FALSE  or  x199=FALSE  ) &
   (  x428=FALSE  or  x200=FALSE  ) &
   (  x429=FALSE  or  x201=FALSE  ) &
   (  x226=FALSE  or  x202=FALSE  ) &
   (  x227=FALSE  or  x203=FALSE  ) &
   (  x228=FALSE  or  x204=FALSE  ) &
   (  x238=FALSE  or  x202=FALSE  ) &
   (  x239=FALSE  or  x203=FALSE  ) &
   (  x240=FALSE  or  x204=FALSE  ) &
   (  x505=FALSE  or  x202=FALSE  ) &
   (  x506=FALSE  or  x203=FALSE  ) &
   (  x507=FALSE  or  x204=FALSE  ) &
   (  x550=FALSE  or  x202=FALSE  ) &
   (  x551=FALSE  or  x203=FALSE  ) &
   (  x552=FALSE  or  x204=FALSE  ) &
   (  x364=FALSE  or  x205=FALSE  ) &
   (  x365=FALSE  or  x206=FALSE  ) &
   (  x366=FALSE  or  x207=FALSE  ) &
   (  x493=FALSE  or  x205=FALSE  ) &
   (  x494=FALSE  or  x206=FALSE  ) &
   (  x495=FALSE  or  x207=FALSE  ) &
   (  x226=FALSE  or  x208=FALSE  ) &
   (  x227=FALSE  or  x209=FALSE  ) &
   (  x228=FALSE  or  x210=FALSE  ) &
   (  x496=FALSE  or  x208=FALSE  ) &
   (  x497=FALSE  or  x209=FALSE  ) &
   (  x498=FALSE  or  x210=FALSE  ) &
   (  x535=FALSE  or  x208=FALSE  ) &
   (  x536=FALSE  or  x209=FALSE  ) &
   (  x537=FALSE  or  x210=FALSE  ) &
   (  x226=FALSE  or  x211=FALSE  ) &
   (  x227=FALSE  or  x212=FALSE  ) &
   (  x228=FALSE  or  x213=FALSE  ) &
   (  x268=FALSE  or  x211=FALSE  ) &
   (  x269=FALSE  or  x212=FALSE  ) &
   (  x270=FALSE  or  x213=FALSE  ) &
   (  x289=FALSE  or  x211=FALSE  ) &
   (  x290=FALSE  or  x212=FALSE  ) &
   (  x291=FALSE  or  x213=FALSE  ) &
   (  x295=FALSE  or  x211=FALSE  ) &
   (  x296=FALSE  or  x212=FALSE  ) &
   (  x297=FALSE  or  x213=FALSE  ) &
   (  x316=FALSE  or  x211=FALSE  ) &
   (  x317=FALSE  or  x212=FALSE  ) &
   (  x318=FALSE  or  x213=FALSE  ) &
   (  x577=FALSE  or  x211=FALSE  ) &
   (  x578=FALSE  or  x212=FALSE  ) &
   (  x579=FALSE  or  x213=FALSE  ) &
   (  x517=FALSE  or  x214=FALSE  ) &
   (  x518=FALSE  or  x215=FALSE  ) &
   (  x519=FALSE  or  x216=FALSE  ) &
   (  x553=FALSE  or  x214=FALSE  ) &
   (  x554=FALSE  or  x215=FALSE  ) &
   (  x555=FALSE  or  x216=FALSE  ) &
   (  x268=FALSE  or  x217=FALSE  ) &
   (  x269=FALSE  or  x218=FALSE  ) &
   (  x270=FALSE  or  x219=FALSE  ) &
   (  x361=FALSE  or  x217=FALSE  ) &
   (  x362=FALSE  or  x218=FALSE  ) &
   (  x363=FALSE  or  x219=FALSE  ) &
   (  x430=FALSE  or  x217=FALSE  ) &
   (  x431=FALSE  or  x218=FALSE  ) &
   (  x432=FALSE  or  x219=FALSE  ) &
   (  x571=FALSE  or  x217=FALSE  ) &
   (  x572=FALSE  or  x218=FALSE  ) &
   (  x573=FALSE  or  x219=FALSE  ) &
   (  x226=FALSE  or  x220=FALSE  ) &
   (  x227=FALSE  or  x221=FALSE  ) &
   (  x228=FALSE  or  x222=FALSE  ) &
   (  x241=FALSE  or  x220=FALSE  ) &
   (  x242=FALSE  or  x221=FALSE  ) &
   (  x243=FALSE  or  x222=FALSE  ) &
   (  x301=FALSE  or  x220=FALSE  ) &
   (  x302=FALSE  or  x221=FALSE  ) &
   (  x303=FALSE  or  x222=FALSE  ) &
   (  x307=FALSE  or  x220=FALSE  ) &
   (  x308=FALSE  or  x221=FALSE  ) &
   (  x309=FALSE  or  x222=FALSE  ) &
   (  x310=FALSE  or  x220=FALSE  ) &
   (  x311=FALSE  or  x221=FALSE  ) &
   (  x312=FALSE  or  x222=FALSE  ) &
   (  x577=FALSE  or  x220=FALSE  ) &
   (  x578=FALSE  or  x221=FALSE  ) &
   (  x579=FALSE  or  x222=FALSE  ) &
   (  x244=FALSE  or  x223=FALSE  ) &
   (  x245=FALSE  or  x224=FALSE  ) &
   (  x246=FALSE  or  x225=FALSE  ) &
   (  x346=FALSE  or  x223=FALSE  ) &
   (  x347=FALSE  or  x224=FALSE  ) &
   (  x348=FALSE  or  x225=FALSE  ) &
   (  x415=FALSE  or  x223=FALSE  ) &
   (  x416=FALSE  or  x224=FALSE  ) &
   (  x417=FALSE  or  x225=FALSE  ) &
   (  x508=FALSE  or  x223=FALSE  ) &
   (  x509=FALSE  or  x224=FALSE  ) &
   (  x510=FALSE  or  x225=FALSE  ) &
   (  x586=FALSE  or  x223=FALSE  ) &
   (  x587=FALSE  or  x224=FALSE  ) &
   (  x588=FALSE  or  x225=FALSE  ) &
   (  x247=FALSE  or  x226=FALSE  ) &
   (  x248=FALSE  or  x227=FALSE  ) &
   (  x249=FALSE  or  x228=FALSE  ) &
   (  x466=FALSE  or  x229=FALSE  ) &
   (  x467=FALSE  or  x230=FALSE  ) &
   (  x468=FALSE  or  x231=FALSE  ) &
   (  x247=FALSE  or  x232=FALSE  ) &
   (  x248=FALSE  or  x233=FALSE  ) &
   (  x249=FALSE  or  x234=FALSE  ) &
   (  x274=FALSE  or  x232=FALSE  ) &
   (  x275=FALSE  or  x233=FALSE  ) &
   (  x276=FALSE  or  x234=FALSE  ) &
   (  x298=FALSE  or  x232=FALSE  ) &
   (  x299=FALSE  or  x233=FALSE  ) &
   (  x300=FALSE  or  x234=FALSE  ) &
   (  x490=FALSE  or  x232=FALSE  ) &
   (  x491=FALSE  or  x233=FALSE  ) &
   (  x492=FALSE  or  x234=FALSE  ) &
   (  x520=FALSE  or  x232=FALSE  ) &
   (  x521=FALSE  or  x233=FALSE  ) &
   (  x522=FALSE  or  x234=FALSE  ) &
   (  x238=FALSE  or  x235=FALSE  ) &
   (  x239=FALSE  or  x236=FALSE  ) &
   (  x240=FALSE  or  x237=FALSE  ) &
   (  x250=FALSE  or  x235=FALSE  ) &
   (  x251=FALSE  or  x236=FALSE  ) &
   (  x252=FALSE  or  x237=FALSE  ) &
   (  x301=FALSE  or  x235=FALSE  ) &
   (  x302=FALSE  or  x236=FALSE  ) &
   (  x303=FALSE  or  x237=FALSE  ) &
   (  x412=FALSE  or  x235=FALSE  ) &
   (  x413=FALSE  or  x236=FALSE  ) &
   (  x414=FALSE  or  x237=FALSE  ) &
   (  x415=FALSE  or  x235=FALSE  ) &
   (  x416=FALSE  or  x236=FALSE  ) &
   (  x417=FALSE  or  x237=FALSE  ) &
   (  x502=FALSE  or  x238=FALSE  ) &
   (  x503=FALSE  or  x239=FALSE  ) &
   (  x504=FALSE  or  x240=FALSE  ) &
   (  x574=FALSE  or  x241=FALSE  ) &
   (  x575=FALSE  or  x242=FALSE  ) &
   (  x576=FALSE  or  x243=FALSE  ) &
   (  x592=FALSE  or  x244=FALSE  ) &
   (  x593=FALSE  or  x245=FALSE  ) &
   (  x594=FALSE  or  x246=FALSE  ) &
   (  x373=FALSE  or  x247=FALSE  ) &
   (  x374=FALSE  or  x248=FALSE  ) &
   (  x375=FALSE  or  x249=FALSE  ) &
   (  x274=FALSE  or  x250=FALSE  ) &
   (  x275=FALSE  or  x251=FALSE  ) &
   (  x276=FALSE  or  x252=FALSE  ) &
   (  x304=FALSE  or  x250=FALSE  ) &
   (  x305=FALSE  or  x251=FALSE  ) &
   (  x306=FALSE  or  x252=FALSE  ) &
   (  x490=FALSE  or  x253=FALSE  ) &
   (  x491=FALSE  or  x254=FALSE  ) &
   (  x492=FALSE  or  x255=FALSE  ) &
   (  x571=FALSE  or  x253=FALSE  ) &
   (  x572=FALSE  or  x254=FALSE  ) &
   (  x573=FALSE  or  x255=FALSE  ) &
   (  x283=FALSE  or  x256=FALSE  ) &
   (  x284=FALSE  or  x257=FALSE  ) &
   (  x285=FALSE  or  x258=FALSE  ) &
   (  x310=FALSE  or  x256=FALSE  ) &
   (  x311=FALSE  or  x257=FALSE  ) &
   (  x312=FALSE  or  x258=FALSE  ) &
   (  x274=FALSE  or  x259=FALSE  ) &
   (  x275=FALSE  or  x260=FALSE  ) &
   (  x276=FALSE  or  x261=FALSE  ) &
   (  x319=FALSE  or  x259=FALSE  ) &
   (  x320=FALSE  or  x260=FALSE  ) &
   (  x321=FALSE  or  x261=FALSE  ) &
   (  x364=FALSE  or  x259=FALSE  ) &
   (  x365=FALSE  or  x260=FALSE  ) &
   (  x366=FALSE  or  x261=FALSE  ) &
   (  x430=FALSE  or  x259=FALSE  ) &
   (  x431=FALSE  or  x260=FALSE  ) &
   (  x432=FALSE  or  x261=FALSE  ) &
   (  x469=FALSE  or  x259=FALSE  ) &
   (  x470=FALSE  or  x260=FALSE  ) &
   (  x471=FALSE  or  x261=FALSE  ) &
   (  x442=FALSE  or  x262=FALSE  ) &
   (  x443=FALSE  or  x263=FALSE  ) &
   (  x444=FALSE  or  x264=FALSE  ) &
   (  x571=FALSE  or  x262=FALSE  ) &
   (  x572=FALSE  or  x263=FALSE  ) &
   (  x573=FALSE  or  x264=FALSE  ) &
   (  x466=FALSE  or  x265=FALSE  ) &
   (  x467=FALSE  or  x266=FALSE  ) &
   (  x468=FALSE  or  x267=FALSE  ) &
   (  x487=FALSE  or  x265=FALSE  ) &
   (  x488=FALSE  or  x266=FALSE  ) &
   (  x489=FALSE  or  x267=FALSE  ) &
   (  x328=FALSE  or  x268=FALSE  ) &
   (  x329=FALSE  or  x269=FALSE  ) &
   (  x330=FALSE  or  x270=FALSE  ) &
   (  x577=FALSE  or  x268=FALSE  ) &
   (  x578=FALSE  or  x269=FALSE  ) &
   (  x579=FALSE  or  x270=FALSE  ) &
   (  x385=FALSE  or  x271=FALSE  ) &
   (  x386=FALSE  or  x272=FALSE  ) &
   (  x387=FALSE  or  x273=FALSE  ) &
   (  x439=FALSE  or  x271=FALSE  ) &
   (  x440=FALSE  or  x272=FALSE  ) &
   (  x441=FALSE  or  x273=FALSE  ) &
   (  x496=FALSE  or  x271=FALSE  ) &
   (  x497=FALSE  or  x272=FALSE  ) &
   (  x498=FALSE  or  x273=FALSE  ) &
   (  x385=FALSE  or  x274=FALSE  ) &
   (  x386=FALSE  or  x275=FALSE  ) &
   (  x387=FALSE  or  x276=FALSE  ) &
   (  x352=FALSE  or  x277=FALSE  ) &
   (  x353=FALSE  or  x278=FALSE  ) &
   (  x354=FALSE  or  x279=FALSE  ) &
   (  x367=FALSE  or  x277=FALSE  ) &
   (  x368=FALSE  or  x278=FALSE  ) &
   (  x369=FALSE  or  x279=FALSE  ) &
   (  x508=FALSE  or  x277=FALSE  ) &
   (  x509=FALSE  or  x278=FALSE  ) &
   (  x510=FALSE  or  x279=FALSE  ) &
   (  x340=FALSE  or  x280=FALSE  ) &
   (  x341=FALSE  or  x281=FALSE  ) &
   (  x342=FALSE  or  x282=FALSE  ) &
   (  x391=FALSE  or  x280=FALSE  ) &
   (  x392=FALSE  or  x281=FALSE  ) &
   (  x393=FALSE  or  x282=FALSE  ) &
   (  x574=FALSE  or  x280=FALSE  ) &
   (  x575=FALSE  or  x281=FALSE  ) &
   (  x576=FALSE  or  x282=FALSE  ) &
   (  x331=FALSE  or  x283=FALSE  ) &
   (  x332=FALSE  or  x284=FALSE  ) &
   (  x333=FALSE  or  x285=FALSE  ) &
   (  x484=FALSE  or  x283=FALSE  ) &
   (  x485=FALSE  or  x284=FALSE  ) &
   (  x486=FALSE  or  x285=FALSE  ) &
   (  x523=FALSE  or  x283=FALSE  ) &
   (  x524=FALSE  or  x284=FALSE  ) &
   (  x525=FALSE  or  x285=FALSE  ) &
   (  x586=FALSE  or  x283=FALSE  ) &
   (  x587=FALSE  or  x284=FALSE  ) &
   (  x588=FALSE  or  x285=FALSE  ) &
   (  x589=FALSE  or  x286=FALSE  ) &
   (  x590=FALSE  or  x287=FALSE  ) &
   (  x591=FALSE  or  x288=FALSE  ) &
   (  x367=FALSE  or  x289=FALSE  ) &
   (  x368=FALSE  or  x290=FALSE  ) &
   (  x369=FALSE  or  x291=FALSE  ) &
   (  x481=FALSE  or  x289=FALSE  ) &
   (  x482=FALSE  or  x290=FALSE  ) &
   (  x483=FALSE  or  x291=FALSE  ) &
   (  x337=FALSE  or  x292=FALSE  ) &
   (  x338=FALSE  or  x293=FALSE  ) &
   (  x339=FALSE  or  x294=FALSE  ) &
   (  x370=FALSE  or  x292=FALSE  ) &
   (  x371=FALSE  or  x293=FALSE  ) &
   (  x372=FALSE  or  x294=FALSE  ) &
   (  x400=FALSE  or  x292=FALSE  ) &
   (  x401=FALSE  or  x293=FALSE  ) &
   (  x402=FALSE  or  x294=FALSE  ) &
   (  x460=FALSE  or  x292=FALSE  ) &
   (  x461=FALSE  or  x293=FALSE  ) &
   (  x462=FALSE  or  x294=FALSE  ) &
   (  x499=FALSE  or  x292=FALSE  ) &
   (  x500=FALSE  or  x293=FALSE  ) &
   (  x501=FALSE  or  x294=FALSE  ) &
   (  x544=FALSE  or  x292=FALSE  ) &
   (  x545=FALSE  or  x293=FALSE  ) &
   (  x546=FALSE  or  x294=FALSE  ) &
   (  x595=FALSE  or  x295=FALSE  ) &
   (  x596=FALSE  or  x296=FALSE  ) &
   (  x597=FALSE  or  x297=FALSE  ) &
   (  x490=FALSE  or  x298=FALSE  ) &
   (  x491=FALSE  or  x299=FALSE  ) &
   (  x492=FALSE  or  x300=FALSE  ) &
   (  x310=FALSE  or  x301=FALSE  ) &
   (  x311=FALSE  or  x302=FALSE  ) &
   (  x312=FALSE  or  x303=FALSE  ) &
   (  x313=FALSE  or  x304=FALSE  ) &
   (  x314=FALSE  or  x305=FALSE  ) &
   (  x315=FALSE  or  x306=FALSE  ) &
   (  x460=FALSE  or  x304=FALSE  ) &
   (  x461=FALSE  or  x305=FALSE  ) &
   (  x462=FALSE  or  x306=FALSE  ) &
   (  x469=FALSE  or  x304=FALSE  ) &
   (  x470=FALSE  or  x305=FALSE  ) &
   (  x471=FALSE  or  x306=FALSE  ) &
   (  x472=FALSE  or  x304=FALSE  ) &
   (  x473=FALSE  or  x305=FALSE  ) &
   (  x474=FALSE  or  x306=FALSE  ) &
   (  x397=FALSE  or  x307=FALSE  ) &
   (  x398=FALSE  or  x308=FALSE  ) &
   (  x399=FALSE  or  x309=FALSE  ) &
   (  x520=FALSE  or  x307=FALSE  ) &
   (  x521=FALSE  or  x308=FALSE  ) &
   (  x522=FALSE  or  x309=FALSE  ) &
   (  x361=FALSE  or  x310=FALSE  ) &
   (  x362=FALSE  or  x311=FALSE  ) &
   (  x363=FALSE  or  x312=FALSE  ) &
   (  x403=FALSE  or  x310=FALSE  ) &
   (  x404=FALSE  or  x311=FALSE  ) &
   (  x405=FALSE  or  x312=FALSE  ) &
   (  x517=FALSE  or  x310=FALSE  ) &
   (  x518=FALSE  or  x311=FALSE  ) &
   (  x519=FALSE  or  x312=FALSE  ) &
   (  x388=FALSE  or  x313=FALSE  ) &
   (  x389=FALSE  or  x314=FALSE  ) &
   (  x390=FALSE  or  x315=FALSE  ) &
   (  x550=FALSE  or  x313=FALSE  ) &
   (  x551=FALSE  or  x314=FALSE  ) &
   (  x552=FALSE  or  x315=FALSE  ) &
   (  x337=FALSE  or  x319=FALSE  ) &
   (  x338=FALSE  or  x320=FALSE  ) &
   (  x339=FALSE  or  x321=FALSE  ) &
   (  x424=FALSE  or  x319=FALSE  ) &
   (  x425=FALSE  or  x320=FALSE  ) &
   (  x426=FALSE  or  x321=FALSE  ) &
   (  x385=FALSE  or  x322=FALSE  ) &
   (  x386=FALSE  or  x323=FALSE  ) &
   (  x387=FALSE  or  x324=FALSE  ) &
   (  x502=FALSE  or  x322=FALSE  ) &
   (  x503=FALSE  or  x323=FALSE  ) &
   (  x504=FALSE  or  x324=FALSE  ) &
   (  x526=FALSE  or  x322=FALSE  ) &
   (  x527=FALSE  or  x323=FALSE  ) &
   (  x528=FALSE  or  x324=FALSE  ) &
   (  x328=FALSE  or  x325=FALSE  ) &
   (  x329=FALSE  or  x326=FALSE  ) &
   (  x330=FALSE  or  x327=FALSE  ) &
   (  x334=FALSE  or  x325=FALSE  ) &
   (  x335=FALSE  or  x326=FALSE  ) &
   (  x336=FALSE  or  x327=FALSE  ) &
   (  x475=FALSE  or  x325=FALSE  ) &
   (  x476=FALSE  or  x326=FALSE  ) &
   (  x477=FALSE  or  x327=FALSE  ) &
   (  x505=FALSE  or  x325=FALSE  ) &
   (  x506=FALSE  or  x326=FALSE  ) &
   (  x507=FALSE  or  x327=FALSE  ) &
   (  x367=FALSE  or  x328=FALSE  ) &
   (  x368=FALSE  or  x329=FALSE  ) &
   (  x369=FALSE  or  x330=FALSE  ) &
   (  x445=FALSE  or  x328=FALSE  ) &
   (  x446=FALSE  or  x329=FALSE  ) &
   (  x447=FALSE  or  x330=FALSE  ) &
   (  x379=FALSE  or  x331=FALSE  ) &
   (  x380=FALSE  or  x332=FALSE  ) &
   (  x381=FALSE  or  x333=FALSE  ) &
   (  x430=FALSE  or  x331=FALSE  ) &
   (  x431=FALSE  or  x332=FALSE  ) &
   (  x432=FALSE  or  x333=FALSE  ) &
   (  x349=FALSE  or  x337=FALSE  ) &
   (  x350=FALSE  or  x338=FALSE  ) &
   (  x351=FALSE  or  x339=FALSE  ) &
   (  x430=FALSE  or  x337=FALSE  ) &
   (  x431=FALSE  or  x338=FALSE  ) &
   (  x432=FALSE  or  x339=FALSE  ) &
   (  x370=FALSE  or  x340=FALSE  ) &
   (  x371=FALSE  or  x341=FALSE  ) &
   (  x372=FALSE  or  x342=FALSE  ) &
   (  x580=FALSE  or  x340=FALSE  ) &
   (  x581=FALSE  or  x341=FALSE  ) &
   (  x582=FALSE  or  x342=FALSE  ) &
   (  x445=FALSE  or  x343=FALSE  ) &
   (  x446=FALSE  or  x344=FALSE  ) &
   (  x447=FALSE  or  x345=FALSE  ) &
   (  x436=FALSE  or  x346=FALSE  ) &
   (  x437=FALSE  or  x347=FALSE  ) &
   (  x438=FALSE  or  x348=FALSE  ) &
   (  x535=FALSE  or  x346=FALSE  ) &
   (  x536=FALSE  or  x347=FALSE  ) &
   (  x537=FALSE  or  x348=FALSE  ) &
   (  x391=FALSE  or  x349=FALSE  ) &
   (  x392=FALSE  or  x350=FALSE  ) &
   (  x393=FALSE  or  x351=FALSE  ) &
   (  x454=FALSE  or  x349=FALSE  ) &
   (  x455=FALSE  or  x350=FALSE  ) &
   (  x456=FALSE  or  x351=FALSE  ) &
   (  x595=FALSE  or  x349=FALSE  ) &
   (  x596=FALSE  or  x350=FALSE  ) &
   (  x597=FALSE  or  x351=FALSE  ) &
   (  x433=FALSE  or  x355=FALSE  ) &
   (  x434=FALSE  or  x356=FALSE  ) &
   (  x435=FALSE  or  x357=FALSE  ) &
   (  x370=FALSE  or  x361=FALSE  ) &
   (  x371=FALSE  or  x362=FALSE  ) &
   (  x372=FALSE  or  x363=FALSE  ) &
   (  x391=FALSE  or  x364=FALSE  ) &
   (  x392=FALSE  or  x365=FALSE  ) &
   (  x393=FALSE  or  x366=FALSE  ) &
   (  x529=FALSE  or  x364=FALSE  ) &
   (  x530=FALSE  or  x365=FALSE  ) &
   (  x531=FALSE  or  x366=FALSE  ) &
   (  x391=FALSE  or  x367=FALSE  ) &
   (  x392=FALSE  or  x368=FALSE  ) &
   (  x393=FALSE  or  x369=FALSE  ) &
   (  x484=FALSE  or  x370=FALSE  ) &
   (  x485=FALSE  or  x371=FALSE  ) &
   (  x486=FALSE  or  x372=FALSE  ) &
   (  x529=FALSE  or  x370=FALSE  ) &
   (  x530=FALSE  or  x371=FALSE  ) &
   (  x531=FALSE  or  x372=FALSE  ) &
   (  x478=FALSE  or  x373=FALSE  ) &
   (  x479=FALSE  or  x374=FALSE  ) &
   (  x480=FALSE  or  x375=FALSE  ) &
   (  x499=FALSE  or  x373=FALSE  ) &
   (  x500=FALSE  or  x374=FALSE  ) &
   (  x501=FALSE  or  x375=FALSE  ) &
   (  x424=FALSE  or  x379=FALSE  ) &
   (  x425=FALSE  or  x380=FALSE  ) &
   (  x426=FALSE  or  x381=FALSE  ) &
   (  x436=FALSE  or  x379=FALSE  ) &
   (  x437=FALSE  or  x380=FALSE  ) &
   (  x438=FALSE  or  x381=FALSE  ) &
   (  x574=FALSE  or  x379=FALSE  ) &
   (  x575=FALSE  or  x380=FALSE  ) &
   (  x576=FALSE  or  x381=FALSE  ) &
   (  x418=FALSE  or  x382=FALSE  ) &
   (  x419=FALSE  or  x383=FALSE  ) &
   (  x420=FALSE  or  x384=FALSE  ) &
   (  x526=FALSE  or  x385=FALSE  ) &
   (  x527=FALSE  or  x386=FALSE  ) &
   (  x528=FALSE  or  x387=FALSE  ) &
   (  x400=FALSE  or  x388=FALSE  ) &
   (  x401=FALSE  or  x389=FALSE  ) &
   (  x402=FALSE  or  x390=FALSE  ) &
   (  x502=FALSE  or  x394=FALSE  ) &
   (  x503=FALSE  or  x395=FALSE  ) &
   (  x504=FALSE  or  x396=FALSE  ) &
   (  x460=FALSE  or  x397=FALSE  ) &
   (  x461=FALSE  or  x398=FALSE  ) &
   (  x462=FALSE  or  x399=FALSE  ) &
   (  x511=FALSE  or  x400=FALSE  ) &
   (  x512=FALSE  or  x401=FALSE  ) &
   (  x513=FALSE  or  x402=FALSE  ) &
   (  x445=FALSE  or  x403=FALSE  ) &
   (  x446=FALSE  or  x404=FALSE  ) &
   (  x447=FALSE  or  x405=FALSE  ) &
   (  x475=FALSE  or  x403=FALSE  ) &
   (  x476=FALSE  or  x404=FALSE  ) &
   (  x477=FALSE  or  x405=FALSE  ) &
   (  x412=FALSE  or  x406=FALSE  ) &
   (  x413=FALSE  or  x407=FALSE  ) &
   (  x414=FALSE  or  x408=FALSE  ) &
   (  x415=FALSE  or  x406=FALSE  ) &
   (  x416=FALSE  or  x407=FALSE  ) &
   (  x417=FALSE  or  x408=FALSE  ) &
   (  x460=FALSE  or  x406=FALSE  ) &
   (  x461=FALSE  or  x407=FALSE  ) &
   (  x462=FALSE  or  x408=FALSE  ) &
   (  x508=FALSE  or  x406=FALSE  ) &
   (  x509=FALSE  or  x407=FALSE  ) &
   (  x510=FALSE  or  x408=FALSE  ) &
   (  x547=FALSE  or  x406=FALSE  ) &
   (  x548=FALSE  or  x407=FALSE  ) &
   (  x549=FALSE  or  x408=FALSE  ) &
   (  x475=FALSE  or  x409=FALSE  ) &
   (  x476=FALSE  or  x410=FALSE  ) &
   (  x477=FALSE  or  x411=FALSE  ) &
   (  x568=FALSE  or  x409=FALSE  ) &
   (  x569=FALSE  or  x410=FALSE  ) &
   (  x570=FALSE  or  x411=FALSE  ) &
   (  x445=FALSE  or  x412=FALSE  ) &
   (  x446=FALSE  or  x413=FALSE  ) &
   (  x447=FALSE  or  x414=FALSE  ) &
   (  x457=FALSE  or  x415=FALSE  ) &
   (  x458=FALSE  or  x416=FALSE  ) &
   (  x459=FALSE  or  x417=FALSE  ) &
   (  x475=FALSE  or  x415=FALSE  ) &
   (  x476=FALSE  or  x416=FALSE  ) &
   (  x477=FALSE  or  x417=FALSE  ) &
   (  x598=FALSE  or  x415=FALSE  ) &
   (  x599=FALSE  or  x416=FALSE  ) &
   (  x600=FALSE  or  x417=FALSE  ) &
   (  x436=FALSE  or  x418=FALSE  ) &
   (  x437=FALSE  or  x419=FALSE  ) &
   (  x438=FALSE  or  x420=FALSE  ) &
   (  x568=FALSE  or  x418=FALSE  ) &
   (  x569=FALSE  or  x419=FALSE  ) &
   (  x570=FALSE  or  x420=FALSE  ) &
   (  x580=FALSE  or  x418=FALSE  ) &
   (  x581=FALSE  or  x419=FALSE  ) &
   (  x582=FALSE  or  x420=FALSE  ) &
   (  x475=FALSE  or  x424=FALSE  ) &
   (  x476=FALSE  or  x425=FALSE  ) &
   (  x477=FALSE  or  x426=FALSE  ) &
   (  x463=FALSE  or  x430=FALSE  ) &
   (  x464=FALSE  or  x431=FALSE  ) &
   (  x465=FALSE  or  x432=FALSE  ) &
   (  x529=FALSE  or  x430=FALSE  ) &
   (  x530=FALSE  or  x431=FALSE  ) &
   (  x531=FALSE  or  x432=FALSE  ) &
   (  x451=FALSE  or  x436=FALSE  ) &
   (  x452=FALSE  or  x437=FALSE  ) &
   (  x453=FALSE  or  x438=FALSE  ) &
   (  x490=FALSE  or  x445=FALSE  ) &
   (  x491=FALSE  or  x446=FALSE  ) &
   (  x492=FALSE  or  x447=FALSE  ) &
   (  x526=FALSE  or  x448=FALSE  ) &
   (  x527=FALSE  or  x449=FALSE  ) &
   (  x528=FALSE  or  x450=FALSE  ) &
   (  x535=FALSE  or  x448=FALSE  ) &
   (  x536=FALSE  or  x449=FALSE  ) &
   (  x537=FALSE  or  x450=FALSE  ) &
   (  x586=FALSE  or  x448=FALSE  ) &
   (  x587=FALSE  or  x449=FALSE  ) &
   (  x588=FALSE  or  x450=FALSE  ) &
   (  x487=FALSE  or  x451=FALSE  ) &
   (  x488=FALSE  or  x452=FALSE  ) &
   (  x489=FALSE  or  x453=FALSE  ) &
   (  x466=FALSE  or  x454=FALSE  ) &
   (  x467=FALSE  or  x455=FALSE  ) &
   (  x468=FALSE  or  x456=FALSE  ) &
   (  x532=FALSE  or  x454=FALSE  ) &
   (  x533=FALSE  or  x455=FALSE  ) &
   (  x534=FALSE  or  x456=FALSE  ) &
   (  x526=FALSE  or  x460=FALSE  ) &
   (  x527=FALSE  or  x461=FALSE  ) &
   (  x528=FALSE  or  x462=FALSE  ) &
   (  x547=FALSE  or  x460=FALSE  ) &
   (  x548=FALSE  or  x461=FALSE  ) &
   (  x549=FALSE  or  x462=FALSE  ) &
   (  x520=FALSE  or  x463=FALSE  ) &
   (  x521=FALSE  or  x464=FALSE  ) &
   (  x522=FALSE  or  x465=FALSE  ) &
   (  x583=FALSE  or  x472=FALSE  ) &
   (  x584=FALSE  or  x473=FALSE  ) &
   (  x585=FALSE  or  x474=FALSE  ) &
   (  x532=FALSE  or  x478=FALSE  ) &
   (  x533=FALSE  or  x479=FALSE  ) &
   (  x534=FALSE  or  x480=FALSE  ) &
   (  x586=FALSE  or  x478=FALSE  ) &
   (  x587=FALSE  or  x479=FALSE  ) &
   (  x588=FALSE  or  x480=FALSE  ) &
   (  x535=FALSE  or  x481=FALSE  ) &
   (  x536=FALSE  or  x482=FALSE  ) &
   (  x537=FALSE  or  x483=FALSE  ) &
   (  x502=FALSE  or  x484=FALSE  ) &
   (  x503=FALSE  or  x485=FALSE  ) &
   (  x504=FALSE  or  x486=FALSE  ) &
   (  x571=FALSE  or  x484=FALSE  ) &
   (  x572=FALSE  or  x485=FALSE  ) &
   (  x573=FALSE  or  x486=FALSE  ) &
   (  x505=FALSE  or  x493=FALSE  ) &
   (  x506=FALSE  or  x494=FALSE  ) &
   (  x507=FALSE  or  x495=FALSE  ) &
   (  x529=FALSE  or  x493=FALSE  ) &
   (  x530=FALSE  or  x494=FALSE  ) &
   (  x531=FALSE  or  x495=FALSE  ) &
   (  x532=FALSE  or  x499=FALSE  ) &
   (  x533=FALSE  or  x500=FALSE  ) &
   (  x534=FALSE  or  x501=FALSE  ) &
   (  x556=FALSE  or  x505=FALSE  ) &
   (  x557=FALSE  or  x506=FALSE  ) &
   (  x558=FALSE  or  x507=FALSE  ) &
   (  x598=FALSE  or  x505=FALSE  ) &
   (  x599=FALSE  or  x506=FALSE  ) &
   (  x600=FALSE  or  x507=FALSE  ) &
   (  x532=FALSE  or  x508=FALSE  ) &
   (  x533=FALSE  or  x509=FALSE  ) &
   (  x534=FALSE  or  x510=FALSE  ) &
   (  x529=FALSE  or  x520=FALSE  ) &
   (  x530=FALSE  or  x521=FALSE  ) &
   (  x531=FALSE  or  x522=FALSE  ) &
   (  x598=FALSE  or  x520=FALSE  ) &
   (  x599=FALSE  or  x521=FALSE  ) &
   (  x600=FALSE  or  x522=FALSE  ) &
   (  x592=FALSE  or  x523=FALSE  ) &
   (  x593=FALSE  or  x524=FALSE  ) &
   (  x594=FALSE  or  x525=FALSE  ) &
   (  x580=FALSE  or  x526=FALSE  ) &
   (  x581=FALSE  or  x527=FALSE  ) &
   (  x582=FALSE  or  x528=FALSE  ) &
   (  x547=FALSE  or  x535=FALSE  ) &
   (  x548=FALSE  or  x536=FALSE  ) &
   (  x549=FALSE  or  x537=FALSE  ) &
   (  x583=FALSE  or  x538=FALSE  ) &
   (  x584=FALSE  or  x539=FALSE  ) &
   (  x585=FALSE  or  x540=FALSE  ) &
   (  x553=FALSE  or  x541=FALSE  ) &
   (  x554=FALSE  or  x542=FALSE  ) &
   (  x555=FALSE  or  x543=FALSE  ) &
   (  x574=FALSE  or  x541=FALSE  ) &
   (  x575=FALSE  or  x542=FALSE  ) &
   (  x576=FALSE  or  x543=FALSE  ) &
   (  x583=FALSE  or  x541=FALSE  ) &
   (  x584=FALSE  or  x542=FALSE  ) &
   (  x585=FALSE  or  x543=FALSE  ) &
   (  x562=FALSE  or  x544=FALSE  ) &
   (  x563=FALSE  or  x545=FALSE  ) &
   (  x564=FALSE  or  x546=FALSE  ) &
   (  x592=FALSE  or  x544=FALSE  ) &
   (  x593=FALSE  or  x545=FALSE  ) &
   (  x594=FALSE  or  x546=FALSE  ) &
   (  x583=FALSE  or  x547=FALSE  ) &
   (  x584=FALSE  or  x548=FALSE  ) &
   (  x585=FALSE  or  x549=FALSE  ) &
   (  x562=FALSE  or  x559=FALSE  ) &
   (  x563=FALSE  or  x560=FALSE  ) &
   (  x564=FALSE  or  x561=FALSE  ) &
   (  x589=FALSE  or  x565=FALSE  ) &
   (  x590=FALSE  or  x566=FALSE  ) &
   (  x591=FALSE  or  x567=FALSE  ) &
   (  x598=FALSE  or  x595=FALSE  ) &
   (  x599=FALSE  or  x596=FALSE  ) &
   (  x600=FALSE  or  x597=FALSE  ) &
  
 1=1
END

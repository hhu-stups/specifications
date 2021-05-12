MACHINE AutoFlight_PT_03a
VARIABLES place5553, place5583, place5601, place5556, place5563, place5589, place5593, place5581, place5544, place5543, place5590, place5569, place5558, place5607, place5578, place5611, place5587, place5579, place5562, place5603, place5564, place5555, place5577, place5567, place5586, place5614, place5599, place5582, place5612, place5602, place5621, place5597, place5592, place5547, place5554, place5606, place5550, place5572, place5546, place5588, place5620, place5604, place5622, place5598, place5618, place5619, place5576, place5548, place5561, place5594, place5552, place5613, place5591, place5557, place5610, place5580, place5574, place5584, place5600, place5605, place5609, place5560, place5623, place5595, place5585, place5559, place5571, place5566, place5573, place5542, place5568, place5545, place5549, place5615, place5617, place5575, place5551, place5596, place5570, place5565, place5616, place5608
INVARIANT place5553+place5583+place5601+place5556+place5563+place5589+place5593+place5581+place5544+place5543+place5590+place5569+place5558+place5607+place5578+place5611+place5587+place5579+place5562+place5603+place5564+place5555+place5577+place5567+place5586+place5614+place5599+place5582+place5612+place5602+place5621+place5597+place5592+place5547+place5554+place5606+place5550+place5572+place5546+place5588+place5620+place5604+place5622+place5598+place5618+place5619+place5576+place5548+place5561+place5594+place5552+place5613+place5591+place5557+place5610+place5580+place5574+place5584+place5600+place5605+place5609+place5560+place5623+place5595+place5585+place5559+place5571+place5566+place5573+place5542+place5568+place5545+place5549+place5615+place5617+place5575+place5551+place5596+place5570+place5565+place5616+place5608<=21&place5553:NATURAL&place5583:NATURAL&place5601:NATURAL&place5556:NATURAL&place5563:NATURAL&place5589:NATURAL&place5593:NATURAL&place5581:NATURAL&place5544:NATURAL&place5543:NATURAL&place5590:NATURAL&place5569:NATURAL&place5558:NATURAL&place5607:NATURAL&place5578:NATURAL&place5611:NATURAL&place5587:NATURAL&place5579:NATURAL&place5562:NATURAL&place5603:NATURAL&place5564:NATURAL&place5555:NATURAL&place5577:NATURAL&place5567:NATURAL&place5586:NATURAL&place5614:NATURAL&place5599:NATURAL&place5582:NATURAL&place5612:NATURAL&place5602:NATURAL&place5621:NATURAL&place5597:NATURAL&place5592:NATURAL&place5547:NATURAL&place5554:NATURAL&place5606:NATURAL&place5550:NATURAL&place5572:NATURAL&place5546:NATURAL&place5588:NATURAL&place5620:NATURAL&place5604:NATURAL&place5622:NATURAL&place5598:NATURAL&place5618:NATURAL&place5619:NATURAL&place5576:NATURAL&place5548:NATURAL&place5561:NATURAL&place5594:NATURAL&place5552:NATURAL&place5613:NATURAL&place5591:NATURAL&place5557:NATURAL&place5610:NATURAL&place5580:NATURAL&place5574:NATURAL&place5584:NATURAL&place5600:NATURAL&place5605:NATURAL&place5609:NATURAL&place5560:NATURAL&place5623:NATURAL&place5595:NATURAL&place5585:NATURAL&place5559:NATURAL&place5571:NATURAL&place5566:NATURAL&place5573:NATURAL&place5542:NATURAL&place5568:NATURAL&place5545:NATURAL&place5549:NATURAL&place5615:NATURAL&place5617:NATURAL&place5575:NATURAL&place5551:NATURAL&place5596:NATURAL&place5570:NATURAL&place5565:NATURAL&place5616:NATURAL&place5608:NATURAL
INITIALISATION place5553,place5583,place5601,place5556,place5563,place5589,place5593,place5581,place5544,place5543,place5590,place5569,place5558,place5607,place5578,place5611,place5587,place5579,place5562,place5603,place5564,place5555,place5577,place5567,place5586,place5614,place5599,place5582,place5612,place5602,place5621,place5597,place5592,place5547,place5554,place5606,place5550,place5572,place5546,place5588,place5620,place5604,place5622,place5598,place5618,place5619,place5576,place5548,place5561,place5594,place5552,place5613,place5591,place5557,place5610,place5580,place5574,place5584,place5600,place5605,place5609,place5560,place5623,place5595,place5585,place5559,place5571,place5566,place5573,place5542,place5568,place5545,place5549,place5615,place5617,place5575,place5551,place5596,place5570,place5565,place5616,place5608:=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
OPERATIONS
no_deadlock = skip; // to ensure we never find a deadlock
transition5624 = PRE place5597>=1 THEN place5597,place5613:=place5597+-1,place5613+1 END ;
transition5625 = PRE place5619>=1 THEN place5619,place5558:=place5619+-1,place5558+1 END ;
transition5626 = PRE place5570>=1 THEN place5570,place5543:=place5570+-1,place5543+1 END ;
transition5627 = PRE place5591>=1 THEN place5591,place5578:=place5591+-1,place5578+1 END ;
transition5628 = PRE place5546>=1 THEN place5546,place5561:=place5546+-1,place5561+1 END ;
transition5629 = PRE place5556>=1 THEN place5556,place5582:=place5556+-1,place5582+1 END ;
transition5630 = PRE place5584>=1 THEN place5543,place5590,place5558,place5578,place5562,place5582,place5621,place5547,place5588,place5561,place5594,place5552,place5613,place5574,place5584,place5600,place5566,place5545,place5615,place5617,place5551,place5596:=place5543+1,place5590+1,place5558+1,place5578+1,place5562+1,place5582+1,place5621+1,place5547+1,place5588+1,place5561+1,place5594+1,place5552+1,place5613+1,place5574+1,place5584+-1,place5600+1,place5566+1,place5545+1,place5615+1,place5617+1,place5551+1,place5596+1 END ;
transition5631 = PRE place5574>=1 THEN place5574,place5581:=place5574+-1,place5581+1 END ;
transition5632 = PRE place5574>=1 THEN place5574,place5581:=place5574+-1,place5581+1 END ;
transition5633 = PRE place5566>=1 THEN place5566,place5618:=place5566+-1,place5618+1 END ;
transition5634 = PRE place5566>=1 THEN place5566,place5618:=place5566+-1,place5618+1 END ;
transition5635 = PRE place5547>=1 THEN place5547,place5601:=place5547+-1,place5601+1 END ;
transition5636 = PRE place5547>=1 THEN place5547,place5601:=place5547+-1,place5601+1 END ;
transition5637 = PRE place5556>=1 THEN place5556,place5582:=place5556+-1,place5582+1 END ;
transition5638 = PRE place5582>=1 THEN place5582,place5623:=place5582+-1,place5623+1 END ;
transition5639 = PRE place5582>=1 THEN place5582,place5623:=place5582+-1,place5623+1 END ;
transition5640 = PRE place5546>=1 THEN place5546,place5561:=place5546+-1,place5561+1 END ;
transition5641 = PRE place5561>=1 THEN place5561,place5560:=place5561+-1,place5560+1 END ;
transition5642 = PRE place5561>=1 THEN place5561,place5560:=place5561+-1,place5560+1 END ;
transition5643 = PRE place5591>=1 THEN place5591,place5578:=place5591+-1,place5578+1 END ;
transition5644 = PRE place5578>=1 THEN place5578,place5571:=place5578+-1,place5571+1 END ;
transition5645 = PRE place5578>=1 THEN place5578,place5571:=place5578+-1,place5571+1 END ;
transition5646 = PRE place5570>=1 THEN place5570,place5543:=place5570+-1,place5543+1 END ;
transition5647 = PRE place5543>=1 THEN place5543,place5611:=place5543+-1,place5611+1 END ;
transition5648 = PRE place5543>=1 THEN place5543,place5611:=place5543+-1,place5611+1 END ;
transition5649 = PRE place5619>=1 THEN place5619,place5558:=place5619+-1,place5558+1 END ;
transition5650 = PRE place5558>=1 THEN place5558,place5622:=place5558+-1,place5622+1 END ;
transition5651 = PRE place5558>=1 THEN place5558,place5622:=place5558+-1,place5622+1 END ;
transition5652 = PRE place5597>=1 THEN place5597,place5613:=place5597+-1,place5613+1 END ;
transition5653 = PRE place5613>=1 THEN place5613,place5604:=place5613+-1,place5604+1 END ;
transition5654 = PRE place5613>=1 THEN place5613,place5604:=place5613+-1,place5604+1 END ;
transition5655 = PRE place5594>=1&place5620>=1 THEN place5594,place5620,place5544:=place5594+0,place5620+-1,place5544+1 END ;
transition5656 = PRE place5618>=1&place5544>=1 THEN place5618,place5544,place5605,place5566:=place5618+-1,place5544+-1,place5605+1,place5566+1 END ;
transition5657 = PRE place5578>=1&place5605>=1 THEN place5578,place5605,place5591,place5614:=place5578+-1,place5605+-1,place5591+1,place5614+1 END ;
transition5658 = PRE place5543>=1&place5614>=1 THEN place5543,place5614,place5570,place5589:=place5543+-1,place5614+-1,place5570+1,place5589+1 END ;
transition5659 = PRE place5623>=1&place5564>=1 THEN place5623,place5564,place5610,place5582:=place5623+-1,place5564+-1,place5610+1,place5582+1 END ;
transition5660 = PRE place5571>=1&place5610>=1 THEN place5571,place5610,place5550,place5578:=place5571+-1,place5610+-1,place5550+1,place5578+1 END ;
transition5661 = PRE place5622>=1&place5550>=1 THEN place5622,place5550,place5548,place5558:=place5622+-1,place5550+-1,place5548+1,place5558+1 END ;
transition5662 = PRE place5551>=1&place5548>=1 THEN place5551,place5548,place5565:=place5551+0,place5548+-1,place5565+1 END ;
transition5663 = PRE place5590>=1&place5565>=1 THEN place5590,place5565,place5567:=place5590+0,place5565+-1,place5567+1 END ;
transition5664 = PRE place5562>=1&place5567>=1 THEN place5562,place5567,place5553:=place5562+0,place5567+-1,place5553+1 END ;
transition5665 = PRE place5551>=1&place5549>=1 THEN place5551,place5549,place5555:=place5551+0,place5549+-1,place5555+1 END ;
transition5666 = PRE place5590>=1&place5555>=1 THEN place5590,place5555,place5598:=place5590+0,place5555+-1,place5598+1 END ;
transition5667 = PRE place5562>=1&place5598>=1 THEN place5562,place5598,place5586:=place5562+0,place5598+-1,place5586+1 END ;
transition5668 = PRE place5560>=1&place5585>=1 THEN place5560,place5585,place5573,place5561:=place5560+-1,place5585+-1,place5573+1,place5561+1 END ;
transition5669 = PRE place5611>=1&place5573>=1 THEN place5611,place5573,place5579,place5543:=place5611+-1,place5573+-1,place5579+1,place5543+1 END ;
transition5670 = PRE place5604>=1&place5579>=1 THEN place5604,place5579,place5602,place5613:=place5604+-1,place5579+-1,place5602+1,place5613+1 END ;
transition5671 = PRE place5551>=1&place5602>=1 THEN place5551,place5602,place5577:=place5551+0,place5602+-1,place5577+1 END ;
transition5672 = PRE place5590>=1&place5577>=1 THEN place5590,place5577,place5599:=place5590+0,place5577+-1,place5599+1 END ;
transition5673 = PRE place5562>=1&place5599>=1 THEN place5562,place5599,place5612:=place5562+0,place5599+-1,place5612+1 END ;
transition5674 = PRE place5551>=1&place5554>=1 THEN place5551,place5554,place5616:=place5551+0,place5554+-1,place5616+1 END ;
transition5675 = PRE place5590>=1&place5616>=1 THEN place5590,place5616,place5572:=place5590+0,place5616+-1,place5572+1 END ;
transition5676 = PRE place5562>=1&place5572>=1 THEN place5562,place5572,place5580:=place5562+0,place5572+-1,place5580+1 END ;
transition5677 = PRE place5613>=1&place5603>=1 THEN place5613,place5603,place5597,place5608:=place5613+-1,place5603+-1,place5597+1,place5608+1 END ;
transition5678 = PRE place5558>=1&place5595>=1 THEN place5558,place5595,place5619,place5603:=place5558+-1,place5595+-1,place5619+1,place5603+1 END ;
transition5679 = PRE place5601>=1&place5576>=1 THEN place5601,place5576,place5595,place5547:=place5601+-1,place5576+-1,place5595+1,place5547+1 END ;
transition5680 = PRE place5615>=1&place5569>=1 THEN place5615,place5569,place5576:=place5615+0,place5569+-1,place5576+1 END ;
transition5681 = PRE place5561>=1&place5606>=1 THEN place5561,place5606,place5546,place5563:=place5561+-1,place5606+-1,place5546+1,place5563+1 END ;
transition5682 = PRE place5582>=1&place5607>=1 THEN place5582,place5607,place5556,place5606:=place5582+-1,place5607+-1,place5556+1,place5606+1 END ;
transition5683 = PRE place5581>=1&place5568>=1 THEN place5581,place5568,place5607,place5574:=place5581+-1,place5568+-1,place5607+1,place5574+1 END ;
transition5684 = PRE place5596>=1&place5542>=1 THEN place5596,place5542,place5568:=place5596+0,place5542+-1,place5568+1 END ;
transition5685 = PRE place5553>=1 THEN place5553,place5575:=place5553+-1,place5575+1 END ;
transition5686 = PRE place5575>=1 THEN place5575,place5592:=place5575+-1,place5592+1 END ;
transition5687 = PRE place5592>=1 THEN place5592,place5549:=place5592+-1,place5549+1 END ;
transition5688 = PRE place5612>=1 THEN place5612,place5609:=place5612+-1,place5609+1 END ;
transition5689 = PRE place5609>=1 THEN place5609,place5593:=place5609+-1,place5593+1 END ;
transition5690 = PRE place5593>=1 THEN place5593,place5583:=place5593+-1,place5583+1 END ;
transition5691 = PRE place5583>=1 THEN place5583,place5559:=place5583+-1,place5559+1 END ;
transition5692 = PRE place5559>=1 THEN place5559,place5557:=place5559+-1,place5557+1 END ;
transition5693 = PRE place5557>=1 THEN place5557,place5554:=place5557+-1,place5554+1 END ;
transition5694 = PRE place5563>=1&place5587>=1 THEN place5563,place5587,place5588,place5600:=place5563+-1,place5587+-1,place5588+1,place5600+1 END ;
transition5695 = PRE place5608>=1&place5587>=1 THEN place5608,place5587,place5588,place5617:=place5608+-1,place5587+-1,place5588+1,place5617+1 END ;
transition5696 = PRE place5580>=1&place5587>=1 THEN place5580,place5587,place5588,place5552:=place5580+-1,place5587+-1,place5588+1,place5552+1 END ;
transition5697 = PRE place5586>=1&place5587>=1 THEN place5586,place5587,place5588,place5545:=place5586+-1,place5587+-1,place5588+1,place5545+1 END ;
transition5698 = PRE place5589>=1&place5587>=1 THEN place5589,place5587,place5588,place5621:=place5589+-1,place5587+-1,place5588+1,place5621+1 END ;
transition5699 = PRE place5600>=1&place5588>=1 THEN place5600,place5588,place5542,place5587:=place5600+-1,place5588+-1,place5542+1,place5587+1 END ;
transition5700 = PRE place5617>=1&place5588>=1 THEN place5617,place5588,place5569,place5587:=place5617+-1,place5588+-1,place5569+1,place5587+1 END ;
transition5701 = PRE place5552>=1&place5588>=1 THEN place5552,place5588,place5585,place5587:=place5552+-1,place5588+-1,place5585+1,place5587+1 END ;
transition5702 = PRE place5545>=1&place5588>=1 THEN place5545,place5588,place5564,place5587:=place5545+-1,place5588+-1,place5564+1,place5587+1 END ;
transition5703 = PRE place5621>=1&place5588>=1 THEN place5621,place5588,place5620,place5587:=place5621+-1,place5588+-1,place5620+1,place5587+1 END 
END
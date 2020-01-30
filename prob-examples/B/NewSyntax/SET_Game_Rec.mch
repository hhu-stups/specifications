MACHINE SET_Game_Rec
CONSTANTS maxnrcards
PROPERTIES maxnrcards:NATURAL1 & maxnrcards=5
/*
b_expand_closure(closure([c],[global('SHAPE')],
        'And'('In'('ListExpression'(['Identifier'(c)]),value(global_set('SHAPE'))),'Exists'('Identifier'(x),'And'('And'(
        'In'('ListExpression'(['Identifier'(x)]),
          'SetOfRecords'(['Field'('Identifier'(col),value(global_set('COLOUR'))),
                'Field'('Identifier'(fill),value(global_set('FILL'))),'Field'('Identifier'(shape),value(global_set('SHAPE')))])),
		'In'('ListExpression'(['Identifier'(x)]),
		value([rec([field(col,fd(1,'COLOUR')),field(fill,fd(1,'FILL')),field(shape,fd(1,'SHAPE'))]),
		  
		  rec([field(col,fd(3,'COLOUR')),field(fill,fd(1,'FILL')),field(shape,fd(3,'SHAPE'))])]))),
		'EqualSet'('Identifier'(c),'AccessRecord'('Identifier'(x),'Identifier'(shape))))))),Res)
		
*/
SETS
  COLOUR = {red,blue,green};
  SHAPE = {bean, oval, rectangle};
  FILL = {none,solid,pattern}
DEFINITIONS
  SET_PREF_SYMBOLIC == FALSE;  /* otherwise trace checking with [[]] will not work */
  SET_PREF_MAX_OPERATIONS == 82;
  CARDI == 1..3;
  SETCARD == struct(cardinality:CARDI, col:COLOUR, fill:FILL, shape:SHAPE );
/*   SETCARD == Struct(col:COLOUR, shape:SHAPE, fill:FILL, cardinality:CARDI); */
  colours(ss) ==  {c|c:COLOUR & #x.(x:SETCARD & x:ss & c = x'col)} ;
  shapes(ss) ==  {c|c:SHAPE & #x.(x:SETCARD & x:ss & c = x'shape)} ;
  fills(ss) ==  {c|c:FILL & #x.(x:SETCARD & x:ss & c = x'fill)} ;
  cardis(ss) ==  {c|c:CARDI & #x.(x:SETCARD & x:ss & c = x'cardinality)};
  is_a_set(set) == (card(ss)=1 or card(ss)=3)
VARIABLES
  cards_on_table
INVARIANT
  cards_on_table : POW(SETCARD)
INITIALISATION
 /* cards_on_table : (cards_on_table:POW(SETCARD)
            & card(cards_on_table)>3 & card(cards_on_table)<6) */
  cards_on_table := {}
OPERATIONS
  AddCard(C,F,S,N) = PRE card(cards_on_table)<maxnrcards &
      C:COLOUR & F:FILL & S:SHAPE & N:CARDI &
      rec(col:C,fill:F,shape:S,cardinality:N) /: cards_on_table THEN
        cards_on_table := cards_on_table \/ {rec(col:C,fill:F,shape:S,cardinality:N)}
      END;
 Set(ss) = PRE ss<: cards_on_table & card(ss)=3 &
                (card(colours(ss))=3 or card(colours(ss))=1) &
                (card(shapes(ss))=3 or card(shapes(ss))=1) &
                (card(fills(ss))=3 or card(fills(ss))=1) &
                (card(cardis(ss))=3 or card(cardis(ss))=1) 
            THEN
                 ASSERT card(ss) = 3 THEN
                   skip
                 END
               END;   
  cs <-- GetShape(c) = PRE c:cards_on_table THEN cs:= c'shape END;
  cs <-- GetShape2(c) = PRE c:SETCARD & c:cards_on_table THEN cs:= c'shape END;
  cc <-- GetShapes = BEGIN cc:= shapes(cards_on_table) END;
  cf <-- GetFill(c) = PRE c:cards_on_table THEN cf:= c'shape END;
  cc <-- GetColours = BEGIN cc:= colours(cards_on_table) END;
  cc <-- GetFills = BEGIN cc:= fills(cards_on_table) END;
  cc <-- GetCardis = BEGIN cc:= cardis(cards_on_table) END 
END
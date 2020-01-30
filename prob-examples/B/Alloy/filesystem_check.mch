MACHINE filesystem
 // translated with Alloy2B
SETS Object

CONSTANTS Dir, Root, File, contents

PROPERTIES
	Dir <: Object &
	Root <: Dir &
	card(Root) = 1 &
	File <: Object &
	Dir /\ File = {} &
	Dir \/ File = Object &
	contents : Dir <-> Object &
	Object <: closure(contents)[Root]

ASSERTIONS
	!(f).(f : File => card(contents~[{f}]) >= 1);
	card({o | o : Object & Root <: contents[{o}]}) = 0;
	!(o).(o : Object - Root => card(contents~[{o}]) >= 1)
//OPERATIONS
//   Error = PRE not(card({o | o : Object & Root <: contents[{o}]}) = 0) THEN skip END
END

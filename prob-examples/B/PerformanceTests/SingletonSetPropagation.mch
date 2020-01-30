MACHINE SingletonSetPropagation
SETS
 ID={aa,bb}
CONSTANTS iv, x, y, v, w
PROPERTIES
 iv:ID &
 x : y & /* as y is a singleton set this should set x deterministically in WF0 phase already */
 y = { {aa|->1, bb|->2} } &
 ran(x) = v..w
END


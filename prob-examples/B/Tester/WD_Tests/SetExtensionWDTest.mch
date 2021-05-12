MACHINE SetExtensionWDTest
SETS C = {C_normal, C_reverse, C_unknown} ;
 t_point
CONSTANTS t_point_position, c_change_point_position
PROPERTIES
     t_point_position =
     {   C_normal
     ,   C_reverse
     }
 &
     c_change_point_position =
     %(p_point, p_point_position).
     (   p_point : t_point
     &   p_point_position : t_point_position
     |   (p_point |-> ({C_reverse |-> C_normal, C_normal |-> C_reverse}) (p_point_position))
     )

END

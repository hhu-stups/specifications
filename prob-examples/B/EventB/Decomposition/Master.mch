MACHINE Master
/* Experiment to try and re-create the first decomposition example by Abrial
   in the report "Event Model Decomposition", version 1.3 from April 2009
   written by Michael Leuschel, January 12th, 2021
*/
INCLUDES SharedVariables, N, P
PROMOTES in_a, out_c
OPERATIONS
  a2b_update = VAR nb,nr IN nb,nr <-- a2b ; Update_b_r(nb,nr) END;
  b2c_update = VAR ns IN ns <-- b2c ; Update_s(ns) END
END


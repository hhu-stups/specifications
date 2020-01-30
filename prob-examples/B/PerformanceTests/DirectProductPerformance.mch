MACHINE DirectProductPerformance
 /* extracted from srv_inv_as_typ */
DEFINITIONS 
  c_id_seg_init == 64;
  co_id_max_seg == 62143; /* originally 262143; */
  co_nb_max_seg_troncon == 64;
  co_id_max_troncon == 4095;
  SET_PREF_TIME_OUT == 12000

CONSTANTS cfg_seg_troncon_rg, cfg_seg_rg_tr, cfg_seg_troncon, t_id_seg, t_id_troncon, t_rg_seg_troncon

PROPERTIES

   t_id_seg            = c_id_seg_init .. co_id_max_seg &
   
   cfg_seg_troncon         = %seg.(seg : t_id_seg | seg / co_nb_max_seg_troncon)  &
   cfg_seg_rg_tr           = %seg.(seg : t_id_seg | seg mod co_nb_max_seg_troncon)  &
   
   t_id_troncon = 1 .. co_id_max_troncon &
   t_rg_seg_troncon = 0 .. co_nb_max_seg_troncon - 1 &

   /********** Extraction du troncon  ********************/
   cfg_seg_troncon_rg = cfg_seg_troncon >< cfg_seg_rg_tr  
ASSERTIONS
   cfg_seg_troncon    : t_id_seg -->> t_id_troncon      &
   cfg_seg_rg_tr      : t_id_seg -->  t_rg_seg_troncon  &
   cfg_seg_troncon_rg : t_id_seg >->> (t_id_troncon * t_rg_seg_troncon)  /* TAKES LONG */
   
END
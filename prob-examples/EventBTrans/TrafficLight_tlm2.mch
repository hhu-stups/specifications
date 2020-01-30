MACHINE TrafficLight_tlm_2
DEFINITIONS
  ASSERT_LTL_FUN_6_1 == "G({TL_Car_Color={green}} =>  ({TL_Car_Color={green}}  W {TL_Car_Color={yellow}}))";
  ASSERT_LTL_FUN_6_2 == "G({TL_Car_Color={yellow}} => ({TL_Car_Color={yellow}} W {TL_Car_Color={red}}   ))";
  ASSERT_LTL_FUN_6_3 == "G({TL_Car_Color={red}} =>    ({TL_Car_Color={red}}    W {TL_Car_Color={red,yellow}}))";
  ASSERT_LTL_FUN_6_4 == "G({TL_Car_Color={red,yellow}} => ({TL_Car_Color={red,yellow}} W {TL_Car_Color={green}}))";
  ASSERT_LTL_FUN_6_5 == "G({TL_Car_Color = {red,yellow} or card(TL_Car_Color) = 1})";

 /* ASSERT_LTL_FUN_8w == "G(({TL_Car_Color/={green}} & Y {TL_Car_Color={green}})=> Y ({TL_Car_Color={green}} S [requestPedLight]))"; */ /* violated */
  ASSERT_LTL_FUN_8 == "G(({TL_Car_Color/={green}} & Y {TL_Car_Color={green}})=> Y ({TL_Car_Color/={red}} S [requestPedLight]))";

  ASSERT_LTL_FUN_9 == "G( [requestPedLight] => (GF[requestPedLight] or F {TL_Ped_Color={green}}))"; /* violated without GF[requestPedLight]: infinite requestPedLight possible */

  ASSERT_LTL_FUN_10 == "G({TL_Car_Color={red}} => (GF[requestPedLight] or F {TL_Ped_Color={green}}))";  /* violated without GF[requestPedLight]: infinite requestPedLight possible */

  ASSERT_LTL_FUN_12 == "G( {TL_Ped_Color={red}} => (GF[requestPedLight] or F {TL_Car_Color={green}}))";
SETS
COLORS = {red, yellow, green};
TL_STATE = { stop, go}

VARIABLES
 TL_Car,
 TL_Ped,
 TL_Car_Color,
 TL_Ped_Color,
 CallButtonState

INVARIANT
 (TL_Car = go <=> TL_Car_Color /= { red }) &
 (TL_Ped = go <=> TL_Ped_Color /= { red }) &
 CallButtonState : BOOL &

 (TL_Car_Color = {red,yellow} or card(TL_Car_Color) = 1) /* ASSERT_LTL_FUN_6_5 as INVARIANT */
 &
 (TL_Ped_Color = {red}  or TL_Ped_Color = {green})  /* FUN-7 */

INITIALISATION
 TL_Car := stop ||
 TL_Ped := stop ||
 TL_Car_Color := { red } ||
 TL_Ped_Color := { red } ||
 CallButtonState := FALSE

OPERATIONS
 carRedToRedYellow =
 PRE
   TL_Ped_Color = { red } &
   TL_Car_Color = { red } &
   CallButtonState = FALSE
 THEN
   TL_Car_Color := { red, yellow } ||
   TL_Car := go
 END;

 carRedYellowToGreen =
 PRE
   TL_Ped_Color = { red } &
   TL_Car_Color = { red, yellow }
 THEN
   TL_Car_Color := { green }
 END;

 carGreenToYellow =
 PRE
   TL_Car_Color = { green } &
   CallButtonState = TRUE
 THEN
   TL_Car_Color := { yellow }
 END;

 pedRedToGreen =
 PRE
   TL_Car_Color = { red } &
   CallButtonState = TRUE
 THEN
   TL_Ped_Color := { green } ||
   TL_Ped := go ||
   CallButtonState := FALSE
 END;

 pedGreenToRed =
 PRE
   TL_Ped_Color = { green }
 THEN
   TL_Ped_Color := { red } ||
   TL_Ped := stop
 END;

 carYellowToRed =
 PRE
   TL_Car_Color = { yellow }
 THEN
   TL_Car_Color := { red } ||
   TL_Car := stop
 END;

 requestPedLight =
 PRE
   TL_Ped /= go
 THEN
   CallButtonState := TRUE
 END

END
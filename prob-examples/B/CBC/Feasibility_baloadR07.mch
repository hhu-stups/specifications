
MACHINE Feasibility_baload_R07  /* for operation from R08_ByteArray */
DEFINITIONS SET_PREF_SMT == TRUE; SET_PREF_CHR == FALSE; "LibraryIO.def"
SETS /* enumerated */
  TYPES={unknownType,uninitLocalVar,Top,primitiveTypes,boolean,numericTypes,byte,shart,returnAddress,referenceTypes,classTypes,Object,TestClassA,TestClassC,TestClassB,interfaceTypes,arrayTypes,booleanArray,byteArray,shartArray,referenceArray,classArray,ObjectArray,TestClassAArray,TestClassCArray,TestClassBArray,interfaceArray};
  ATYPES={T_BOOLEAN,T_BYTE,T_SHART,T_INT}
  
CONSTANTS MaxStackSize,stackSize,stackTypes
PROPERTIES
 // printf("MaxStackSize=~w~n",MaxStackSize) & printf("stackSize=~w~n",stackSize) &  observe(stackTypes) &
  /* @R02_StackSizeConstaints:axm1_R02  */ MaxStackSize : 0 .. 9
&
/* @R04_StackTypesModification:inv1  */ stackTypes : -4 .. MaxStackSize - 1 +-> TYPES
&
/* @R04_StackTypesModification:inv2  */ stackSize = card(dom(stackTypes)) - 4
&
/* @R02_StackSizeModification:inv1_R02  */ stackSize : 0 .. 255
&
/* @R02_StackSizeModification:inv2_R02  */ stackSize <= MaxStackSize
&
/* @R08_ByteArray:grd2_t  */ stackSize > 0
&
/* @R08_ByteArray:grd3_t  */ stackSize > 1
&
/* @R08_ByteArray:grd7  */ shart = stackTypes(stackSize - 1)
&
/* @R08_ByteArray:grd10_t  */  stackTypes(stackSize - 2) : {booleanArray,byteArray}
 // (stackTypes(stackSize - 2) = booleanArray or stackTypes(stackSize - 2) = byteArray)
&
#firstStackOutputType.(firstStackOutputType : TYPES & 
((/* @R08_ByteArray:grd11  */ stackTypes(stackSize - 2) = booleanArray => firstStackOutputType = boolean) &
 (/* @R08_ByteArray:grd12  */ stackTypes(stackSize - 2) = byteArray => firstStackOutputType = byte)))
END
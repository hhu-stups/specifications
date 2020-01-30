/* BasicTypes
 * Author: Anamaria
 * Creation date: Mon Aug 13 2012
 */
MACHINE
    BasicTypes

    /* Lua basic types: nil, boolean, number, string, function, userdata, thread, table */
SETS
    LUA_NIL = {nil};
    LUA_BOOLEAN = {false, true};
    LUA_STRING;
    LUA_FUNCTION;
    LUA_USERDATA;
    LUA_LIGHTUSERDATA;
    LUA_THREAD;
    LUA_TABLE;
    
    /* labels corresponding to the types */    
    LUA_TYPES = {LUA_TNIL, LUA_TNUMBER, LUA_TBOOLEAN, LUA_TSTRING, LUA_TTABLE, LUA_TFUNCTION, LUA_TUSERDATA, LUA_TTHREAD, LUA_TLIGHTUSERDATA, LUA_TNONE};
    
    LUA_OP_KEYS = {LUA_OPADD, LUA_OPSUB, LUA_OPMUL, LUA_OPDIV, LUA_OPMOD, LUA_OPPOW, LUA_OPUNM};
    
    LUA_CMP_KEYS = {LUA_OPEQ, LUA_OPLT, LUA_OPLE}

    
ABSTRACT_CONSTANTS
    LUA_NUMBER,
    LUA_VALUES,
    
    NIL_LUA_VALUES,
    BOOLEAN_LUA_VALUES,
    STRING_LUA_VALUES,
    FUNCTION_LUA_VALUES,
    USERDATA_LUA_VALUES,
    LIGHTUSERDATA_LUA_VALUES,
    THREAD_LUA_VALUES,
    TABLE_LUA_VALUES,
    NUMBER_LUA_VALUES,
    
    NOT_LUA_VALUES,
    
    VALUE_TUPLES,
    value_type,
    not_a_lua_value/*,
    null*/

 
PROPERTIES
    
    /* partial solution for Number - only integers */	
    LUA_NUMBER = INTEGER &
    
    VALUE_TUPLES =
    (
        LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA *
        LUA_LIGHTUSERDATA * 
        LUA_THREAD *
        LUA_TABLE
    ) &
    
    /* a Lua value is modeled by a record with the first field being the label which indicates where to find the value according to its type */
    LUA_VALUES =  LUA_TYPES * VALUE_TUPLES &
     
    value_type : LUA_VALUES <-> LUA_TYPES & /* was --> */      
    value_type = prj1(LUA_TYPES,VALUE_TUPLES) &

    NIL_LUA_VALUES <: LUA_VALUES &
    NIL_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TNIL} &    
    
    BOOLEAN_LUA_VALUES <: LUA_VALUES &
    BOOLEAN_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv)= LUA_TBOOLEAN} &
    
    STRING_LUA_VALUES <: LUA_VALUES &
    STRING_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TSTRING} &
    
    FUNCTION_LUA_VALUES <: LUA_VALUES &
    FUNCTION_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TFUNCTION} &
    
    USERDATA_LUA_VALUES <: LUA_VALUES &
    USERDATA_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TUSERDATA} &
    
    LIGHTUSERDATA_LUA_VALUES <: LUA_VALUES &
    LIGHTUSERDATA_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) =
                                                            LUA_TLIGHTUSERDATA} &
    
    THREAD_LUA_VALUES <: LUA_VALUES &
    THREAD_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TTHREAD} &
    
    TABLE_LUA_VALUES <: LUA_VALUES &
    TABLE_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TTABLE} &
    
    NUMBER_LUA_VALUES <: LUA_VALUES &
    NUMBER_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TNUMBER} &
    
    NOT_LUA_VALUES <: LUA_VALUES &
    NOT_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TNONE} &
    
    not_a_lua_value : NOT_LUA_VALUES /*&
    
    null : INT */
    
ASSERTIONS
    TABLE_LUA_VALUES /\ STRING_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ NIL_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ BOOLEAN_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ NUMBER_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ USERDATA_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ LIGHTUSERDATA_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ THREAD_LUA_VALUES = {} &
    TABLE_LUA_VALUES /\ NOT_LUA_VALUES = {} &
    
    USERDATA_LUA_VALUES /\ STRING_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ NIL_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ BOOLEAN_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ NUMBER_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ LIGHTUSERDATA_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ THREAD_LUA_VALUES = {} &
    USERDATA_LUA_VALUES /\ NOT_LUA_VALUES = {} &
    
    not(not_a_lua_value : TABLE_LUA_VALUES)&
    not(not_a_lua_value : USERDATA_LUA_VALUES)&
    not(not_a_lua_value : STRING_LUA_VALUES)&
    not(not_a_lua_value : NIL_LUA_VALUES)&
    not(not_a_lua_value : NUMBER_LUA_VALUES)&
    not(not_a_lua_value : LIGHTUSERDATA_LUA_VALUES)&
    not(not_a_lua_value : THREAD_LUA_VALUES)&
    not(not_a_lua_value : BOOLEAN_LUA_VALUES)&
    value_type(not_a_lua_value) = LUA_TNONE

DEFINITIONS
  GOAL1 == (BOOLEAN_LUA_VALUES = {vv|vv : LUA_VALUES & value_type(vv) = LUA_TBOOLEAN});
  GOAL == NUMBER_LUA_VALUES <: LUA_VALUES;
  SET_PREF_TIME_OUT == 8000
END


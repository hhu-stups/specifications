/* BasicTypeProjections
 * Author: Anamaria
 * Creation date: Mon Aug 13 2012
 */
MACHINE
    BasicTypeProjections
    
SEES
    BasicTypes
    
DEFINITIONS
    
    select_table_from_tuple == 
    prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA *
        LUA_LIGHTUSERDATA * 
        LUA_THREAD,
        LUA_TABLE);
    complement_of_table_from_tuple == 
    prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA *
        LUA_LIGHTUSERDATA * 
        LUA_THREAD,
        LUA_TABLE);
    
    select_thread_from_tuple == 
    (complement_of_table_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA *
        LUA_LIGHTUSERDATA,
        LUA_THREAD));
    complement_of_thread_from_tuple == 
    (complement_of_table_from_tuple ; 
     prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA *
        LUA_LIGHTUSERDATA,  
        LUA_THREAD));

    select_lightuserdata_from_tuple == 
    (complement_of_thread_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA, 
        LUA_LIGHTUSERDATA));
    complement_of_lightuserdata_from_tuple == 
    (complement_of_thread_from_tuple ; 
    	prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION * 
        LUA_USERDATA,
        LUA_LIGHTUSERDATA)); 

    select_userdata_from_tuple == 
    (complement_of_lightuserdata_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION,  
        LUA_USERDATA));
    complement_of_userdata_from_tuple == 
    (complement_of_lightuserdata_from_tuple ; 
    	prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING * 
        LUA_FUNCTION,  
        LUA_USERDATA));

    select_function_from_tuple == 
    (complement_of_userdata_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING,  
        LUA_FUNCTION));  
    complement_of_function_from_tuple == 
    (complement_of_userdata_from_tuple ; 
    	prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER *
        LUA_STRING,  
        LUA_FUNCTION));

    select_string_from_tuple == 
    (complement_of_function_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER,
        LUA_STRING));  
    complement_of_string_from_tuple == 
    (complement_of_function_from_tuple ; 
    	prj1(LUA_NIL * 
        LUA_BOOLEAN * 
        LUA_NUMBER,
        LUA_STRING));  

    select_number_from_tuple == 
    (complement_of_string_from_tuple ;
     prj2(LUA_NIL * 
        LUA_BOOLEAN, 
        LUA_NUMBER));
    complement_of_number_from_tuple == 
    (complement_of_string_from_tuple ; 
    	prj1(LUA_NIL * 
        LUA_BOOLEAN, 
        LUA_NUMBER));

    select_boolean_from_tuple == 
    (complement_of_number_from_tuple ;
     prj2(LUA_NIL, 
        LUA_BOOLEAN));
    select_nil_from_tuple == 
    (complement_of_number_from_tuple ; 
    	prj1(LUA_NIL,  
        LUA_BOOLEAN))
    
ABSTRACT_CONSTANTS
    value_tuple,
    select_table,
    select_thread,
    select_lightuserdata,
    select_userdata,
    select_function,
    select_string,
    select_number,
    select_boolean,
    select_nil
    
    
    
PROPERTIES
    value_tuple : LUA_VALUES <->  /* was --> */ VALUE_TUPLES &
    value_tuple =  prj2(LUA_TYPES,VALUE_TUPLES) &
    
    /* NOTE: all these functions are total on LUA_VALUES, but should only 
       be used on the corresponding subsets */
    
    select_table : LUA_VALUES <->  /* was --> */ LUA_TABLE &               
    select_table = (value_tuple ; select_table_from_tuple) &
    
    select_thread : LUA_VALUES <->  /* was --> */ LUA_THREAD &               
    select_thread = (value_tuple ; select_thread_from_tuple) &
    
    select_lightuserdata : LUA_VALUES <->  /* was --> */ LUA_LIGHTUSERDATA &               
    select_lightuserdata = (value_tuple ; select_lightuserdata_from_tuple) &

    select_userdata : LUA_VALUES <->  /* was --> */ LUA_USERDATA &               
    select_userdata = (value_tuple ; select_userdata_from_tuple) &
    
    select_function : LUA_VALUES <->  /* was --> */ LUA_FUNCTION &               
    select_function = (value_tuple ; select_function_from_tuple) &
    
    select_string : LUA_VALUES <->  /* was --> */ LUA_STRING &               
    select_string = (value_tuple ; select_string_from_tuple) &
    
    select_number : LUA_VALUES <->  /* was --> */ LUA_NUMBER &               
    select_number = (value_tuple ; select_number_from_tuple) &
    
    select_boolean : LUA_VALUES <->  /* was --> */ LUA_BOOLEAN &               
    select_boolean = (value_tuple ; select_boolean_from_tuple) &
    
    select_nil : LUA_VALUES <->  /* was --> */ LUA_NIL &               
    select_nil = (value_tuple ; select_nil_from_tuple) 

END

MODEL ABS_DISPLAY
/* 532058986 microseconds for breadth-first MC with symmetry hash and all cardinalities = 2  */
/*
NODES
deadlocked:0
invariant_violated:0
open:0
explored_but_not_all_transitions_computed:3
live:3391
total:3391
TOTAL_OPERATIONS
153571
COVERED_OPERATIONS
setup_constants:3
initialise_machine:6
VIEW_PAGE:2340
UPDATE_DATABASE:30492
SET_DATA_VALUE:27104
DISPLAY_PAGE:9652
DISMISS_PAGE:3544
ADD_PAGE:27104
RELEASE_PAGE:3982
RELEASE_PAGES_FROM_TRQ:8688
DELETE_PAGE:13552
ADD_PAGE_TO_TRQ:27104
UNCOVERED_OPERATIONS
*/
SETS Attr_id;Attr_value;Attrs;Disp_params;EDD_display;EDD_id;EDD_type;Page;Page_contents;Page_number
CONSTANTS Database,EDDs,EDIT,EDITORS,contents,disp_values,dp_data,dp_page,value
PROPERTIES (EDIT : EDD_type) & (EDDs : (EDD_id --> EDD_type)) & (EDITORS <: EDD_id) & (EDITORS = ((EDDs)~[{EDIT}])) & (contents : (Page --> Page_contents)) & (value : (Attrs --> Attr_value)) & (Attr_id /= {}) & (Attrs /= {}) & (Database = (Attr_id --> Attrs)) & (dp_data : (Disp_params --> Database)) & (dp_page : (Disp_params --> Page)) & (disp_values : (Disp_params --> EDD_display))
VARIABLES database,page_selections,pages,private_pages,trq
INVARIANT (database : (Attr_id --> Attrs)) & (pages : (Page_number +-> Page)) & (page_selections : (EDD_id +-> Page_number)) & (private_pages : (Page_number +-> Page)) & (trq : (Page_number +-> Page)) & (ran(page_selections) <: dom(pages))
ASSERTIONS ((Attr_id --> Attrs) /= {})

DEFINITIONS
SIMPLIFIED_INV_OP_ADD_PAGE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_SET_DATA_VALUE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_DELETE_PAGE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_UPDATE_DATABASE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_DISPLAY_PAGE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_RELEASE_PAGE == (TRUE=TRUE);
SIMPLIFIED_INV_OP_ADD_PAGE_TO_TRQ == (TRUE=TRUE);
SIMPLIFIED_INV_OP_RELEASE_PAGES_FROM_TRQ == (TRUE=TRUE);
SIMPLIFIED_INV_OP_INITIALISATION == (TRUE=TRUE);
SIMPLIFIED_INV_OP_DISMISS_PAGE == (TRUE=TRUE);
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION database :: (Attr_id --> Attrs) || pages := {} || page_selections := {} || private_pages := {} || trq := {}
OPERATIONS
 UPDATE_DATABASE = ANY ups WHERE (ups : (Attr_id +-> Attrs)) THEN database := (database <+ ups) END ;
 SET_DATA_VALUE = ANY a,ai,av,ei WHERE (ei : EDITORS) & (ai : Attr_id) & (a : Attrs) & (av : Attr_value) & (value(a) = av) THEN database := (database <+ {(ai |-> a)}) END ;
 DISPLAY_PAGE = ANY ei,no WHERE (ei : EDD_id) & (no : Page_number) & (no : dom(pages)) THEN page_selections := (page_selections <+ {(ei |-> no)}) END ;
 DISMISS_PAGE = ANY ei WHERE (ei : EDD_id) & (ei : dom(page_selections)) THEN page_selections := ({ei} <<| page_selections) END ;
 ADD_PAGE = ANY ei,no,p,pc WHERE (ei : EDD_id) & (no : Page_number) & (pc : Page_contents) & (ei : EDITORS) & (p : Page) & (contents(p) = pc) THEN private_pages := (private_pages <+ {(no |-> p)}) END ;
 RELEASE_PAGE = ANY no WHERE (no : Page_number) & (no : dom(private_pages)) THEN pages := (pages <+ {(no |-> private_pages(no))}) || private_pages := ({no} <<| private_pages) END ;
 RELEASE_PAGES_FROM_TRQ = ANY ss WHERE (ss <: trq) THEN pages := (pages <+ ss) || trq := (trq - ss) END ;
 DELETE_PAGE = ANY ei,no WHERE (ei : EDD_id) & (no : Page_number) & (ei : EDITORS) THEN pages := ({no} <<| pages) || private_pages := ({no} <<| private_pages) || trq := ({no} <<| trq) || page_selections := (page_selections |>> {no}) END ;
 ADD_PAGE_TO_TRQ = ANY ei,no,p,pc WHERE (ei : EDD_id) & (no : Page_number) & (pc : Page_contents) & (ei : EDITORS) & (p : Page) & (contents(p) = pc) THEN trq := (trq <+ {(no |-> p)}) END ;
 VIEW_PAGE = ANY dp,ed,ei WHERE (ei : dom(page_selections)) & (dp : Disp_params) & (ed : EDD_display) & (dp_data(dp) = database) & (dp_page(dp) = pages(page_selections(ei))) & (ed = disp_values(dp)) THEN skip END 
END
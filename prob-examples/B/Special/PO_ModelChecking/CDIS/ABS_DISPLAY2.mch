MODEL ABS_DISPLAY2
SETS Attr_id;Attr_value;Attrs;Disp_params;EDD_display;EDD_id;EDD_type;Page;Page_contents;Page_number;Date_time;Time_interval
CONSTANTS Database,EDDs,EDIT,EDITORS,contents,disp_values,dp_data,dp_page,value,Rel_Page,creation_date,dp_time,last_update,leq,release_date,time_interval
PROPERTIES (EDIT : EDD_type) & (EDDs : (EDD_id --> EDD_type)) & (EDITORS <: EDD_id) & (EDITORS = ((EDDs)~[{EDIT}])) & (contents : (Page --> Page_contents)) & (value : (Attrs --> Attr_value)) & (Attr_id /= {}) & (Attrs /= {}) & (Database = (Attr_id --> Attrs)) & (dp_data : (Disp_params --> Database)) & (dp_page : (Disp_params --> Page)) & (disp_values : (Disp_params --> EDD_display)) & (time_interval : ((Date_time * Date_time) --> Time_interval)) & (leq : (Date_time <-> Date_time)) & ! t.((t : Date_time) => ((t : Date_time) => ((t |-> t) : leq))) & ! (t1,t2).((t1 : Date_time & t2 : Date_time) => (((t1 : Date_time) & (t2 : Date_time) & ((t1 |-> t2) : leq) & ((t2 |-> t1) : leq)) => (t1 = t2))) & ! (t1,t2).((t1 : Date_time & t2 : Date_time) => (((t1 : Date_time) & (t2 : Date_time)) => (((t1 |-> t2) : leq) or ((t2 |-> t1) : leq)))) & ! (t1,t2,t3).((t1 : Date_time & t2 : Date_time & t3 : Date_time) => (((t1 : Date_time) & (t2 : Date_time) & (t3 : Date_time) & ((t1 |-> t2) : leq) & ((t2 |-> t3) : leq)) => ((t1 |-> t3) : leq))) & (last_update : (Attrs --> Date_time)) & (creation_date : (Page --> Date_time)) & (Rel_Page <: Page) & (release_date : (Rel_Page --> Date_time)) & (dp_time : (Disp_params --> Date_time))
VARIABLES database,page_selections,pages,previous_pages,private_pages,time_now,trq
INVARIANT (database : (Attr_id --> Attrs)) & (pages : (Page_number +-> Page)) & (page_selections : (EDD_id +-> Page_number)) & (private_pages : (Page_number +-> Page)) & (trq : (Page_number +-> Page)) & (ran(page_selections) <: dom(pages)) & (previous_pages : (Page_number +-> Page)) & (dom(previous_pages) <: dom(pages)) & (time_now : Date_time)
ASSERTIONS ((Attr_id --> Attrs) /= {})

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION page_selections := {} || database :: (Attr_id --> Attrs) || previous_pages := {} || private_pages := {} || pages := {} || trq := {} || time_now :: Date_time
OPERATIONS
 UPDATE_DATABASE = ANY ups WHERE (ups : (Attr_id +-> Attrs)) & ((ups ; last_update) = (dom(ups) * {time_now})) THEN database := (database <+ ups) END ;
 SET_DATA_VALUE = ANY a,ai,av,ei WHERE (ei : EDD_id) & (ai : Attr_id) & (av : Attr_value) & (ei : EDITORS) & (a : Attrs) & (value(a) = av) & (last_update(a) = time_now) THEN database := (database <+ {(ai |-> a)}) END ;
 DISPLAY_PAGE = ANY ei,no WHERE (ei : EDD_id) & (no : Page_number) & (no : dom(pages)) THEN page_selections := (page_selections <+ {(ei |-> no)}) END ;
 DISMISS_PAGE = ANY ei WHERE (ei : EDD_id) & (ei : dom(page_selections)) THEN page_selections := ({ei} <<| page_selections) END ;
 ADD_PAGE = ANY ei,no,p,pc WHERE (ei : EDD_id) & (no : Page_number) & (pc : Page_contents) & (ei : EDITORS) & (p : Page) & (contents(p) = pc) & (creation_date(p) = time_now) THEN private_pages := (private_pages <+ {(no |-> p)}) END ;
 RELEASE_PAGE = ANY no WHERE (no : Page_number) & (no : dom(private_pages)) & (no : dom(pages)) THEN pages := (pages <+ {(no |-> private_pages(no))}) || previous_pages := (previous_pages <+ {(no |-> pages(no))}) || private_pages := ({no} <<| private_pages) END ;
 RELEASE_PAGE_CURRENT = ANY no WHERE (no : Page_number) & (no : dom(private_pages)) & (no /: dom(pages)) THEN pages := (pages <+ {(no |-> private_pages(no))}) || private_pages := ({no} <<| private_pages) END ;
 RELEASE_PAGES_FROM_TRQ = ANY pn,pp,ss WHERE (ss : (Page_number +-> Page)) & (pp = yy) & (ss = (trq |> pp)) & (pn = dom(ss)) THEN pages := (pages <+ ss) || previous_pages := (previous_pages <+ (pn <| pages)) || trq := (trq - ss) END ;
 DELETE_PAGE = ANY ei,no WHERE (ei : EDD_id) & (no : Page_number) & (ei : EDITORS) THEN pages := ({no} <<| pages) || previous_pages := ({no} <<| previous_pages) || private_pages := ({no} <<| private_pages) || trq := ({no} <<| trq) || page_selections := (page_selections |>> {no}) END ;
 ADD_PAGE_TO_TRQ = ANY ei,no,p,pc WHERE (ei : EDD_id) & (no : Page_number) & (pc : Page_contents) & (ei : EDITORS) & (p : Rel_Page) & (contents(p) = pc) & (creation_date(p) = time_now) & ((time_now |-> release_date(p)) : leq) THEN trq := (trq <+ {(no |-> p)}) END ;
 CLOCK = ANY time_next WHERE (time_next : Date_time) & ((time_now |-> time_next) : leq) & (time_next /= time_now) THEN time_now := time_next END ;
 VIEW_PAGE = ANY dp,ed,ei WHERE (ei : dom(page_selections)) & (dp : Disp_params) & (ed : EDD_display) & (dp_data(dp) = database) & (dp_page(dp) = pages(page_selections(ei))) & (dp_time(dp) = time_now) & (ed = disp_values(dp)) THEN skip END 
END
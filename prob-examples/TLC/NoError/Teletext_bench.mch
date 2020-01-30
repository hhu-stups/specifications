MACHINE Teletext_bench
SETS
        COLOURS =   {red,white,lightgrey};
        STATUS  =   {DEFINED,UNDEFINED};
        PAGENAMES = {blank,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,
                           p13,p14,p15}


/**********************************************************************
 CONSTANTS
 	sel_colour,
        norm_colour,
 	Display_size,
        PAGENR, 
        blank, 
        titles 
 PROPERTIES
        sel_colour : COLOURS & sel_colour = lightgrey &
        norm_colour: COLOURS & norm_colour = red      &
        Display_size   : NAT1 & Display_size >= 3 &
        PAGENR     =  1..100 &
        blank      : PAGENAMES   &
        titles     : PAGENR --> PAGENAMES
*************** commented out by mal *********************************/
       
      
VARIABLES
	Plist_size,  /*" *C* Actual number of pagess to be displayed "*/
	DisColours,  /*" *C* Colour of slots from 1st position onwards in display column "*/
	DisPnames,   /*" *C* Page names from first position onwards in display column "*/
	Scroll,      /*" *C* No. of pages crolled above the display column "*/
	Selected,    /*" *C* Serial number of selected page in transmitted sequence "*/
        Status,      
        Display_size,  /*" *C* Size of the display column "*/
        titles     /*" *C* A total function assigning a page-name to a page number "*/
 
        
DEFINITIONS           /* added by mal */
    
        PAGENR == 1..15;
        sel_colour == lightgrey;  /*" *C* Colour of the display column slot at cursor position "*/
        norm_colour == red;       /*" *C* Usual colour of the slots of the display column "*/ 
        PageListRange0 == 0..15;
        PageListRange1 == 1..15;
        DisplaySizeRange0 == 0..10;
        DisplaySizeRange1 == 1..10;
        Max_Plist_size == 15;
        Max_Display_size == 10;

        SET_PREF_MAXINT == 4
 	
INVARIANT

        Display_size   :     DisplaySizeRange0&
        Status          :     STATUS          &
        Plist_size      :     PageListRange0 &
        Selected        :     PageListRange1   &
        Scroll          :     PageListRange0   &
        titles          :     PAGENR --> PAGENAMES &  
        DisPnames       :     1..Display_size --> PAGENAMES    &
        DisColours      :     1..Display_size --> COLOURS      &

	/*******************************************************
        (Display_size = 0 or Display_size > 0)                 &
        (Status = DEFINED   or Status = UNDEFINED)             &
        (Plist_size = 0 or Plist_size > 0)                     &
        (Selected   = 1 or Selected   > 1)                     &
        (Scroll = 0     or Scroll >0)                          &
        (titles = {}    or titles /= {})                       & 
        (DisPnames = {} or DisPnames /= {})                    &
        (DisColours = {} or DisColours /= {})                  &
	***************Tautologies******************************
	********moved to local operation preconditions**********
	********for efficiency reasons****mannu 12/9/03 ********/
 
        Scroll < Selected                                      &

        ( (Status = UNDEFINED)  =>
                 (  Plist_size = 0 &
                    DisPnames = {} &
                    DisColours = {} ) )  &
        
        ((Status = DEFINED)    =>
                (  Plist_size > 0 &
                   DisPnames /= {} &
                   DisColours /= {} &
                   DisColours(Selected - Scroll) = sel_colour & /*added20/6/03*/
		   (Scroll > 0  => Selected > 1)              & /*added 17/9/03*/
		   (Scroll = 0 =>  Selected < Display_size)   & /*added 17/9/03*/
                   Selected <= Plist_size                     &
                  ((Plist_size < Display_size)  => Scroll = 0)& 
		  (Plist_size  = Display_size => 
		                   (Scroll = 0 or Scroll =1)) & /*added 17/9/03 */
                  ((Plist_size > Display_size)   =>
                         Scroll <= Plist_size-Display_size+1) ) )
              

/*"**C** 
   Each location of the display column has a colour and it displays
   a page name. The sequence of page names will be stored in the sequence  
   DisPnames and the colours in the sequence DisColours. Location i of the 
   display column has colour DisColour(i) and  displays  DisPnames(i). "*/

/*"**C**
Scroll rcorresponds to how many positions down the Plist, pages are displayed in column.\
    -- if Plist = [P7,P3,P4,P5,P6], and display size is 4, then \\
          Scroll = 0 $=>$ display shows [P7,P3,P4,P5]\\
          Scroll = 1 $=>$ display shows [P3,P4,P5,P6]
          and so on.  "*/

INITIALISATION
        Display_size := 0 ||
        Plist_size   := 0 ||
        Status   := UNDEFINED ||
        Selected := 1 ||     
	Scroll := 0 ||       
	DisColours,DisPnames := {},{} ||
 	titles := { 1 |-> p1, 2 |-> p2, 3 |-> p3, 4 |-> p4, 5 |-> p5, 6 |-> p6,
                    7 |-> p7, 8 |-> p8, 9 |-> p9, 10 |-> p10, 11 |-> p11,
                    12 |-> p12, 13 |-> p13,14 |-> p14, 15 |-> p15}

/*" **C**Selected set to the very first page in the tranmission sequence. Scroll=0 
means  the very first page of the page sequence (if defined) is at position 1 
in the display column "*/

OPERATIONS


/*" The following 7 operations are {\em probing operations}. "*/

     pp <-- PageAtColumn1 = 
       PRE
           Status = DEFINED 
       THEN
         pp := DisPnames(1)
       END;
       
     cc <-- ColourAtColumn1 = 
       PRE
           Status = DEFINED 
       THEN
         cc := DisColours(1)
       END;
       
     pos <-- CurrentCursorPosition =
       PRE
           Status = DEFINED 
       THEN
         pos := Selected - Scroll
       END;
       
     pp <-- PageAtCurCursor = 
       PRE
           Status = DEFINED 
       THEN
         pp := DisPnames(Selected - Scroll)
       END;
       
     cc <-- ColourAtCurCursor = 
       PRE
           Status = DEFINED 
       THEN
         cc := DisColours(Selected - Scroll)
       END;

     pp <-- PageAtLastColumn = 
       PRE
           Status = DEFINED 
       THEN
         pp := DisPnames(Display_size)
       END;
       
     cc <-- ColourAtLastColumn = 
       PRE
           Status = DEFINED 
       THEN
         cc := DisColours(Display_size)
       END;
         

 
         /* The {\bf Define} operation defines what should be the size (number) of
            transmission pages and teh size of the display column */
          /* ****************
          ******* commented by mall******************** */

     define(trans_size,disp_size) =   
          PRE
              Status = UNDEFINED & 
              trans_size : PageListRange1 &
                 trans_size >5 & trans_size <7
                & disp_size > 3 & disp_size <5 &
              disp_size  : DisplaySizeRange1 &
	      ((trans_size < disp_size) or (trans_size >= disp_size)) 

          THEN
              Status := DEFINED ||
	        Plist_size := trans_size ||
                Display_size := disp_size ||
	        Selected := 1 ||
	        Scroll := 0 ||

              IF trans_size >=  disp_size 
              THEN
	         DisPnames :=  {nn,tt | (nn,tt) : (1 .. disp_size) * PAGENAMES &
                                 nn: 1..disp_size & tt : PAGENAMES &
                                     (tt = titles(nn))}
                                                  ||
	         DisColours := {nn,cc | (nn,cc) : (1..disp_size) * COLOURS &
                                 nn: 1..disp_size & cc : COLOURS &
                                     ((nn=1 & cc = sel_colour) or
                                      (nn /= 1 & cc=norm_colour))}
              ELSE  /* trans_size < disp_size */
                 
                 DisPnames :=  {nn,tt | (nn,tt) : (1..disp_size) * PAGENAMES &
                                 nn: 1..disp_size & tt : PAGENAMES &
                                (((1<=nn) & (nn<=trans_size) & (tt = titles(nn))) or
                                ((trans_size<nn) & (tt = blank)))}
                                                  ||
                 DisColours := {nn,cc | (nn,cc) : (1..disp_size) * COLOURS &
                                 nn: 1..disp_size & cc : COLOURS &
                                       (  (nn=1  & cc = sel_colour) or
                                          (2<=nn & nn <= trans_size& cc=norm_colour) or
                                          (trans_size<nn &  cc=white))}
                                  
             END
          END;

          undefine = 
          PRE
               Status = DEFINED
          THEN
               Status   := UNDEFINED ||
	       Selected := 1 ||
	       Scroll := 0   ||
               Plist_size := 0 ||
               Display_size := 0 ||
	       DisColours,DisPnames:= {},{}
          END;

          upCursor =
          PRE
             Status = DEFINED & 
             (Selected > 1 or Selected <= 1)                             &
             (Plist_size >= Display_size or Plist_size < Display_size)   &
             (Scroll > 0  or  Scroll <= 0)                               &
             (Selected = Scroll + 2   or  Selected /= Scroll +2)         &
             (Selected = 2  or Selected /= 2)                            &
             ((DisColours(Display_size) = white & 
               DisPnames(Display_size)  = blank) or
             (DisColours(Display_size) /= white or
              DisPnames(Display_size)  /= blank))                        &


        (Selected   = 1 or Selected   > 1)                     &
        (Scroll = 0     or Scroll >0)                          
	/*************
        (titles = {}    or titles /= {})                       & 
        (DisPnames = {} or DisPnames /= {})                    &
        (DisColours = {} or DisColours /= {})                  &
        (Status = DEFINED   or Status = UNDEFINED)             &
        (Plist_size = 0 or Plist_size > 0)                     &
	************** may be added later ***********/

          THEN
          IF Selected > 1 THEN        
                Selected := Selected - 1 ||
                IF (Plist_size >= Display_size)
                THEN
                   IF Scroll > 0 
                   THEN
                       IF Selected = Scroll + 2  
                       /*" **C**cursor at 2nd position in display column; Scroll up "*/
                       THEN                    

                        Scroll := Scroll-1 ||
  
	                  DisPnames :=  {nn,tt | (nn,tt) : (1..Display_size) * PAGENAMES &
                                 nn: 1..Display_size & tt : PAGENAMES &
                                        (tt = titles(Scroll-1+nn)) }
                                           ||
	                  DisColours :=  {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                         ((nn=2 & cc =sel_colour) or
                                         (nn/=2 & cc=norm_colour))}
                         /**** the 2nd position is highlighted ******************/


                       ELSE 
                     /*"**C**scroll unchanged but highlight next location in display column"*/
		          IF DisColours(Display_size) = white & DisPnames(Display_size) = blank
			  THEN 
	                  DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                        ((nn=Selected-1-Scroll & cc = sel_colour) or
                                         (((nn/=Selected-1-Scroll & cc = norm_colour) & nn < Display_size) or
                                            (nn = Display_size & cc = white)))}
			  ELSE

	                  DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                        ((nn=Selected-1-Scroll & cc = sel_colour) or
                                         (nn/=Selected-1-Scroll & cc = norm_colour))}
                          END
		       END
                  ELSE  /* Scroll = 0 */
                       IF Selected >= 2
                       THEN /* cursor should now move to 1st position; Selected already updated. */
	                  DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                        ((nn=Selected - 1 & cc = sel_colour) or
                                         (nn/=Selected - 1 & cc = norm_colour))}
                      END

		      /******* This is a bug; when cursor is at position > 2
		               then an upCursor operation violates the
			       invariant.
			       This bug was found by ProB Model Checker 24/9/03
			       ************************************************/
                  END
               ELSE  /*" ***C***  No. of pages less than display-size "*/
                   
                  DisColours :=  {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                              ((nn=Selected-1  & cc = sel_colour) or
                               (nn/=Selected-1 & nn <= Plist_size & cc = norm_colour) or
                               (nn>Plist_size & cc = white))}
               END                
        END
        END;
       
        

        downCursor =
        PRE
            Status = DEFINED                                     &
            (Selected < Plist_size or Selected >= Plist_size)    &
            (Plist_size >= Display_size or Plist_size < Display_size) &
            (Selected + 1  = Scroll + Display_size or
             Selected + 1 /= Scroll + Display_size)                   &
            (Scroll + Display_size < Plist_size    or
             Scroll + Display_size >= Plist_size)                     &
             ((DisColours(Display_size) = white & 
               DisPnames(Display_size)  = blank) or
              (DisColours(Display_size) /= white or
               DisPnames(Display_size)  /= blank))                    &


        (Selected   = 1 or Selected   > 1)                     &
        (Scroll = 0     or Scroll >0)                          
	/*************
        (titles = {}    or titles /= {})                       & 
        (DisPnames = {} or DisPnames /= {})                    &
        (DisColours = {} or DisColours /= {})                  &
        (Status = DEFINED   or Status = UNDEFINED)             &
        (Plist_size = 0 or Plist_size > 0)                     &
	************** may be added later ***********/
        THEN
        IF Selected < Plist_size THEN             /* Following pages can be selected */
                Selected:=Selected+1 ||
           IF Plist_size >= Display_size
           THEN
                IF Selected+1 = Scroll+Display_size 
                                 /*"**C**cursor at last but one position; Scroll down "*/
                THEN                          
                        Scroll := Scroll+1 ||
                        IF Scroll+Display_size < Plist_size /* scroll possible */
                        THEN /*normalscroll*/

                                DisPnames := {nn,tt | (nn,tt) : (1..Display_size) * PAGENAMES &
                                 nn: 1..Display_size & tt : PAGENAMES &
                                              (tt=titles(Scroll+1+nn))             }
                                           ||
	                        DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                ((nn=Display_size-1 & cc = sel_colour) or
                                 (nn/=Display_size-1 & cc = norm_colour))}

                        ELSE    /*"**C**overscroll --- no more pages left for scroling "*/
                               
                                DisPnames := {nn,tt | (nn,tt) : (1..Display_size) * PAGENAMES &
                                 nn: 1..Display_size & tt : PAGENAMES &
                                           ((nn=Display_size & tt=blank) or             
                                            (nn/=Display_size & tt= titles(Scroll+1+nn)))}
                                           ||
	                        DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                              (((nn= Display_size-1 & cc=sel_colour) or
                                                (nn< Display_size-1 & cc=norm_colour)) or
                                                (nn=Display_size & cc=white))}
                        END
                ELSE 
                        /*"**C**scroll unchanged but highlight next page"*/
		    IF DisColours(Display_size) = white & DisPnames(Display_size) = blank
		    THEN
                        DisPnames := {nn,tt | (nn,tt) : (1..Display_size) * PAGENAMES &
                                 nn: 1..Display_size & tt : PAGENAMES &
                                     (tt= titles(Scroll+nn))}
                                           ||
	                DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                      ( (nn= Selected+1-Scroll & cc=sel_colour) or
                                        (nn/=Selected+1-Scroll & nn<Display_size & cc=norm_colour) or
					(nn=Display_size & cc=white))}
                     ELSE
                        DisPnames := {nn,tt | (nn,tt) : (1..Display_size) * PAGENAMES &
                                 nn: 1..Display_size & tt : PAGENAMES &
                                     (tt= titles(Scroll+nn))}
                                           ||
	                DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                      ( (nn= Selected+1-Scroll & cc=sel_colour) or
                                        (nn/=Selected+1-Scroll & cc=norm_colour))}
		     END
                END
          ELSE  /*" ***C*** size of Plist is less than the display column "*/
                        
	                DisColours := {nn,cc | (nn,cc) : (1..Display_size) * COLOURS &
                                 nn: 1..Display_size & cc : COLOURS &
                                      ( (nn= Selected+1 & cc=sel_colour)   or
                                        (nn < Selected+1 & cc=norm_colour) or
                                        (nn > Selected+1 & nn <= Plist_size & cc= norm_colour) or
                                        (nn > Plist_size & cc = white))}
          END      
        END

     END  
END  /* End of Machine declaration */



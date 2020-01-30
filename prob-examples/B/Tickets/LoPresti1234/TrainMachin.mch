/* Machine TrainMachin.mch : Combination of  all Train specification */


MACHINE Tracksections 

SETS  	SECTION={s1,s2,s3}; PLATFORM={p1,p2}; TRAIN; STATE = {closed, free, blocked};  
	MSG = {go_to_platform, wait}


VARIABLES  sections, state_s, platforms, platsect, count, occupied, place, trains,queue 

INVARIANT  sections <: SECTION        &
	   state_s : sections --> STATE                      &
	   platforms <: PLATFORM          		&
	   platsect : platforms >-> sections                 &  /*  +-> why partial ? it should be total --> */
          count : NAT                                       & 
	   count = card({p|p:platforms & state_s(platsect(p)) = blocked}) &   
 	   occupied <: platforms                             &
   	   /* occupied = (state_s(platsect(platforms)) = blocked) &*/   /*state:sections-->state*/
          trains <: TRAIN                                   &
     	   place : trains >-> occupied                       &
 	   queue : seq(TRAIN)	                             &	
 	   ran(queue) /\ trains = {}                         &
 	   size(queue) = card(ran(queue))     

ASSERTIONS sections - ran(platsect) /= {} &
	   PLATFORM - platforms /={}


INITIALISATION sections := {} || state_s, state_p := {},{} || platforms := {} || platsect,count := {},0 || 
              occupied,place,trains,queue := {},{},{},{} 
	

OPERATIONS


	/* ---------------------------------------------------------------------------------- */



	pt <-- add_platform(s) = 
		PRE s : (sections - ran(platsect))
		THEN 
		ANY p WHERE p : (PLATFORM - platforms) 
	           THEN  platforms := platforms \/ {p} ||
			 platsect(p) := s ||
		 	 pt := p
                  END
		END
		END;

	arrival(ts) = 
      		PRE  ts : sections & state_s(ts) = free
		THEN state_s(ts) := blocked 
		END;

      departure(ts) = 
    		PRE ts : sections & state_s(ts) = blocked
	        THEN state_s(ts) :=  free 
		END;

      close(ts) =
		PRE ts : sections & state_s(ts) = free
		THEN state_s(ts) := closed 
		END;

      open(ts) = 
              	PRE ts : sections & state_s(ts) = closed
	      	THEN state_s(ts) := free 
		END;



      ts <-- newsection = 
              	ANY s WHERE s : (SECTION - sections)
             	  THEN  sections := sections \/ {s} ||
       	        state_s(s) := free ||
	                ts := s 
     		  END
		END;   

    	 /* ----------------------------------------------------------------------------- */


	train_arrives(p) = 
   		PRE  p : platforms & state_s(platsect(p)) = free
	      	THEN arrival(platsect(p)) || count := count+1 
		END;


	train_departs(p) = 
		PRE  p : platforms & state_s(platsect(p))= blocked
               THEN departure(platsect(p))  || count := count-1 
		END;


	q <-- train_arrives2  =   /* Alternative version of train_arrives that selects a free platform: */ 
	       	ANY p WHERE p : platforms & state_s(platsect(p)) = free
	      	      THEN arrival(platsect(p)) || count := count+1 || q := p 
 	     	      END  
		END;



	m, p1 <-- train_arrives(t) = 
		  PRE  t : TRAIN - (trains \/ ran(queue)) & occupied <: platforms
		  THEN
   		  ANY p WHERE p : platforms - occupied  
	                THEN  arrival(platsect(p))         || 
	          	      trains := trains \/ {t}      ||
	       	 	      place(t) := p                ||
       		      occupied := occupied \/ {p}  ||
	        	      m, p1 := go_to_platform, p
			END
		   END;


      m,p1 <-- train_arrives2(t) =
	   	  PRE  t : TRAIN - (trains \/ ran(queue)) & occupied =  platforms 
  	       	  THEN queue := queue^{t} ||  m := wait
	  	  END; 	


       train_depart(p) =
		  PRE p : occupied 
       	  THEN depart(platsect(p))            || 
	       	       trains := trains - (place~(p)) ||
	    	       place := (place~(p)) <<| place ||
 	               occupied := occupied - {p}
	          END;


	t1,p1 <-- next_train =
   	  	  PRE  queue /= {} & occupied <: platfroms 
	    	  THEN	
         	 	ANY  p,t WHERE p : platforms - occupied & t =  first(queue)
                	THEN arrival(platsect(p))        ||
	              	     trains :=  trains \/ {t}    ||
	     	  	     place(t) := p               ||
       	     	     occupied := occupied \/ {p} ||
                            queue := tail(queue)        ||
 	    		     t1,p1 := t,p
	      		END	
           	   END
MACHINE HelloWorld
SETS S = {a,b,c}
DEFINITIONS "LibraryIO.def";
  LOGF == "~/Desktop/ProB_log.txt"
ASSERTIONS
  fprintf(LOGF,"Starting Assertion Check: ~w~n",TIME("now"));
  vprintf("resultat: ~w~n",1+2) = 3;
  vprintf("ensemble: ~w~n",{vprintf("enum: ~w~n",a),b}) /<: {b,c};
  fprintf(LOGF,"S = ~w~n",S);
  fprintf(LOGF,"POW(S) = ~w~n",POW(S));
  fvprintf(LOGF,"ensemble: ~w~n",fvprintf(LOGF,"enum: ~w~n",{a,b})) /<: {b,c};
  !x.(x:{"year","month","day","hour","min","sec"} =>
   /* assertion could fail if time progresses sufficiently between two calls to TIME */
        TIMESTAMP_INFO(x,TIME("now")) = TIME(x));
  !n.(n=TIME("now") =>
     n = TIMESTAMP(TIMESTAMP_INFO("year",n),TIMESTAMP_INFO("month",n),TIMESTAMP_INFO("day",n),
                   TIMESTAMP_INFO("hour",n),TIMESTAMP_INFO("min",n),TIMESTAMP_INFO("sec",n)));
  fprintf(LOGF,"Finished Assertion Check~w~n",TIME("now"))
OPERATIONS
  hello = BEGIN PRINTF("hello ~w!~n","world") END
END
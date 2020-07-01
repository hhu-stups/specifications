## Well-Definedness Benchmark Suite

This suite accompanies the paper ``Fast and Effective Well-Definedness Checking``.


### Running the Benchmarks

To run the benchmarks for the Event-B models you have to type
```
  make -f WD_EventB_Makefile
```
This will generate a new version of the file ```wd_eventb_bench.csv```.
You may wish to edit the first line of the ``WD_EventB_Makefile`` to define the location of your probcli binary.

To run the well-definedness benchmarks for the classical B models you have to type:
```
  make -f WD_B_Makefile
```

This will generate a new version of the file ```wd_b_bench.csv```.
You may wish to edit the first line of the ``WD_B_Makefile`` to define the location of your probcli binary.


### Recreating the Makefiles

The Makefiles were created by hand from the text files created by the Clojure program ``find-parseable.clj`` in the script folder.
It can be run using
```
 clj find-parseable.clj
```
in the script folder of this repository. It will create two text files, containing the list of
parseable Event-B and classical B machines from this repository.


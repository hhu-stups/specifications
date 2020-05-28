CSVFILE=database_csv.csv
$(CSVFILE): Makefile db_tools.pl database.pl
	sicstus -l db_tools.pl --goal "print_csv('$(CSVFILE)'),halt."
prolog-test:
	sicstus -l tools_edn.pl --goal "read_edn('../meta-information/prob-examples/B/Abrial_BBook/BBook_Page80.mch.edn',X), print(X),nl."
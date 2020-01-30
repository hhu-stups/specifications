MACHINE BecomeSuchDollar0
/* Test the $0 suffix for becomes-such that */
VARIABLES level
INVARIANT
 level:NATURAL
INITIALISATION level:=100
OPERATIONS
 Dec = BEGIN level : (level>=0 & level> level$0-5 & level < level$0) END
END


MACHINE RuleGroup2
SEES RuleGroup1
CONSTANTS RuleGroup2__Rules
PROPERTIES RuleGroup2__Rules = {"Rule2"}
INCLUDES RG2.RulesTable, RuleContext
PROMOTES RG2.SelectRule
OPERATIONS
  RuleGroup2__Init = BEGIN RG2.Init(RuleGroup2__Rules) END;

  Rule2 = 
	SELECT
	  "Rule1" : RG1.satisfied_rules  // <--- here we get an error: in the ProB state this is RuleGroup1.RG1.satisfied_rules
	THEN
	  IF !(xx,pp).(xx : 1..10 & pp = xx-1 => xx <= 10 & pp < 10)
		/*@desc Rule1 is not correct for number xx: %xx% and pp: %pp% */
	  THEN  RG2.Success("Rule2")
	  ELSE  RG2.Fail("Rule2")
	  END 
	END
END

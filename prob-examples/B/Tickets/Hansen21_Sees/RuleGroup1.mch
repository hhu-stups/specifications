MACHINE RuleGroup1
CONSTANTS RuleGroup1__Rules
PROPERTIES RuleGroup1__Rules = {"Rule1"}
INCLUDES RG1.RulesTable
PROMOTES RG1.SelectRule
OPERATIONS

RuleGroup1__Init = BEGIN RG1.Init(RuleGroup1__Rules) END;

Rule1 =
  IF !(xx,pp).(xx : 1..10 & pp = xx-1 => xx <= 10 & pp < 10)
    /*@desc Rule1 is not correct for number x: %x% and p: %p% */
  THEN RG1.Success("Rule1")
  ELSE RG1.Fail("Rule1")
  END

ASSERTIONS RG1.satisfied_rules = {}
END

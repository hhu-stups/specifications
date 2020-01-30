MACHINE RulesTable
SEES RuleContext
VARIABLES rules, state, selected_rule, satisfied_rules
INVARIANT
 rules : STRING +-> RULE_STATE
 & state  : STATE
 & selected_rule : dom(rules) \/ {""}
 & satisfied_rules = rules~[{SUCCESS}]
INITIALISATION rules := {} || state := IDLE || selected_rule := "" || satisfied_rules := {}
OPERATIONS
  Init(ruleSet) = SELECT ruleSet : POW(STRING) & state = IDLE THEN state := ACTIVE || rules := ruleSet * {NOT_CHECKED} END;
  SelectRule(rule) = SELECT state = ACTIVE & selected_rule = "" & rule : rules~[{NOT_CHECKED}] THEN selected_rule := rule END;
  Finished = SELECT state = ACTIVE & NOT_CHECKED /: ran(rules) THEN state := FINISHED END;

  Success(ruleName) =
    SELECT
      ruleName : STRING
      & state = ACTIVE
      & rules(ruleName) = NOT_CHECKED
      & selected_rule = ruleName
      THEN
        rules(ruleName) := SUCCESS
        || satisfied_rules := satisfied_rules \/ {ruleName}
        || selected_rule := " "
        || IF NOT_CHECKED /: ran(rules) THEN state := FINISHED END
      END;

  Fail(ruleName) = SELECT ruleName : STRING & state = ACTIVE THEN rules(ruleName) := FAIL END;
  IsSatisfied(ruleName) = SELECT ruleName : STRING & ruleName |-> SUCCESS : rules THEN skip END
END

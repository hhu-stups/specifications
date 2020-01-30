MACHINE SimpleAccount
CONSTANTS minb,maxb
PROPERTIES
 minb < maxb &
 minb <= 0 &
 maxb >= 0 & maxb > 1000
VARIABLES balance
INVARIANT
 balance: minb..maxb
INITIALISATION balance:=0
OPERATIONS
  Deposit(s) = SELECT s>0 & balance+s<= maxb THEN balance := balance + s END;
  Withdraw(s) = SELECT s>0 & balance-s >= minb THEN balance := balance - s END;
  NoWithrawalPossible = SELECT balance = minb THEN skip END;
  NoDepositPossible = SELECT balance = maxb THEN skip END
END


MACHINE DefTestCapture
SETS SigmaN = {a,b,C}
DEFINITIONS
 OtherSigma == MySigma;
 Sigma == {a,b};
 MySigma == Sigma;
ASSERTIONS
  {a|a:Sigma} = Sigma; // is false
  !a.(a:MySigma => a:Sigma);
  !a.(a:OtherSigma => a:Sigma)
END

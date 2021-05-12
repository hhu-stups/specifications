MACHINE TestWD_Division_KO
CONSTANTS x, y
PROPERTIES
 /* @axm1 */ x∈ℕ ∧
 /* @axm2 */ y∈ℕ ∧
 /* @axm3 */ x ≠ 0 ∧
 /* @axm4 */ (x∗y)÷x = 10 ∧
 /* @axm5 */ x=0
 ASSERTIONS
  /*  @thm1 */ x∗y = 10∗x;
  /*  @thm2 */ y=10;
  /*  @ct */ 2=3
END

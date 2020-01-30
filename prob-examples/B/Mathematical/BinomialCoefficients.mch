MACHINE BinomialCoefficients
/* For n=30, k=15 it takes ProB 2.56 seconds to setup constants;
   the naive but natural Java solution below takes 7.194 seconds;
   For n=32, k=16 it takes ProB 3.08 seconds (CLPFD turned off; with CLPFD with 32-bit
   SICStus we get CLPFD overflows), Java takes 28.618 seconds.
   For n=34, k=17 ProB takes 3.90 seconds; Java takes 114.985 seconds
 */
DEFINITIONS SET_PREF_MAX_OPERATIONS == 60
CONSTANTS binom,n,k
PROPERTIES
 binom : ((0..n)*(0..k)) --> NATURAL &
 n=20 & k=10 &
 !i.(i:0..n => binom(i,0) = 1) &
 !j.(j:1..k => binom(0,j) = 0) &
 !(i,j).(i:1..n & j:1..k => binom(i,j) = binom(i-1,j-1) + binom(i-1,j))
OPERATIONS
  res <-- GetBinom(ii,jj) = PRE ii:0..n & jj:0..n THEN res:= binom(ii,jj) END;
  res <-- BinomNK = BEGIN res := binom(n,k) END
END

/*
public class SlowBinomial {

   // natural recursive implementation
   public static long binomial(long n, long k) {
      if (k == 0) return 1;
      if (n == 0) return 0;
      return binomial(n-1, k-1) + binomial(n-1, k);
   }
   
   public static void main(String[] args) {
      int N = Integer.parseInt(args[0]);
      int K = Integer.parseInt(args[1]);	
      Stopwatch s = new Stopwatch();
      StdOut.println(binomial(N, K));
      StdOut.println(s.elapsedTime() + " ms");
   }

}
*/
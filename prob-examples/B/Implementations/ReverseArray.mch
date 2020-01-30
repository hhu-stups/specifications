MACHINE ReverseArray(A)
/* A simple encoding of the procedure
   void rev(int a[], int p, int q) {
      while(p<q) swap(a, p++, q--);
   }
   from http://vanemden.wordpress.com/2010/10/05/in-defense-of-beautiful-code-2/
*/
DEFINITIONS
  swap(a,p,q) == BEGIN a := a <+ {p |-> a(q), q|-> a(p)} END;
  SET_PREF_CLPFD == TRUE
VARIABLES arr,n
INVARIANT
 arr:seq(A) & n = size(arr)
INITIALISATION arr,n : (arr: seq(A) & size(arr)=n & n:0..4)
OPERATIONS
  Reverse = VAR p,q IN
                p,q := 1,size(arr);
                WHILE p<q DO
                   swap(arr,p,q);
                   p := p+1;
                   q := q-1
                INVARIANT p:1..(1+size(arr)) & q:0..size(arr)
                VARIANT 1+q-p
                END
             END
END


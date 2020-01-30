MACHINE TestLibraryHash
DEFINITIONS
 "LibraryHash.def"
ASSERTIONS
  HASH(2+2) = HASH(4);
  SHA_HASH(2**10) = SHA_HASH(1024);
  SHA_HASH(2**10) /= SHA_HASH({1024});
  SHA_HASH({2,3,1,4,5}) = SHA_HASH(1..5);
  SHA_HASH({2,3,1,4,5}*{TRUE}) = SHA_HASH({x,y|x:1..5 & (y=TRUE <=> x<6)});
  SHA_HASH({2,3,1,4,5}) /= SHA_HASH({2,3,1,4});
  SHA_HASH_HEX({2,3,1,4,5}) = SHA_HASH_HEX(1..5);
  SHA_HASH_HEX({2,3,1,4,5}) /= SHA_HASH_HEX({2,3,1,4})
END


{-# LANGUAGE ViewPatterns #-}

main::IO()
main = print $  sum $ takeWhile (<2000000) primes

diff xl@(x:xs) yl@(y:ys) | x < y     = x:diff xs yl
                         | x > y     =   diff xl ys
                         | otherwise =   diff xs ys 

primes = 2 : sieve [[p*p, p*p+p..] | p <- primes] [3..] where
                sieve ((q:cs):r) (span (< q) -> (h,_:t)) = 
                        h ++ sieve r (diff t cs)
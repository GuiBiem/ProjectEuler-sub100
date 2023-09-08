{-# LANGUAGE ViewPatterns #-}
import Data.List


problemNum::Int
problemNum = 600851475143

intSqrt = round . sqrt . fromIntegral

sqrtNum = intSqrt problemNum

-- 6857 greatest prime divisor of the number less than its square root -- computation takes a few seconds
quotient = 600851475143 `div` 6857 --87625999
-- Now we test for the greatest prime divisor of 87625999. 
-- Turns out to be 1471 (computation takes ~2 minutes), so the greater number, 6857, is be the answer


main::IO ()
main = print ( largestPrimeFac 87625999  )

-- generates a lazy list of primes using the sieve of Erathostanes and postponing to squares O(n^1.5)
diff xl@(x:xs) yl@(y:ys) | x < y     = x:diff xs yl
                         | x > y     =   diff xl ys
                         | otherwise =   diff xs ys 

primes = 2 : sieve [[p*p, p*p+p..] | p <- primes] [3..] where
                sieve ((q:cs):r) (span (< q) -> (h,_:t)) = 
                        h ++ sieve r (diff t cs)
--------------------------------------------------------------------------------------------
-- Checks that a number is prime --- optimized by laziness and memoized results -- used in debugging
isPrime::Int -> Bool
isPrime p = p == head (dropWhile (< p) primes) 

--- Finds the greates prime factor of the problem number 600851475143 less than n
findGreatestPrimeFacLessThan n =  head $ dropWhile ((/=0) . (problemNum `mod` )) $ primesDesc n

--- Finds the greatest prime factor of a number O(n^1.5)
largestPrimeFac::Int->Int
largestPrimeFac n = head $ dropWhile ((/= 0) . (n `mod`))$ primesDesc n

--- Gives primes less than a number in descending order
primesDesc n = reverse $ takeWhile (<= n) primes
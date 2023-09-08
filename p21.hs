main::IO()
main = print $ sum [i| i<-[2..9999], (sumDiv . sumDiv) i == i, sumDiv i /= i]

sumDiv::Int->Int
sumDiv 1 = 0
sumDiv n = (sum . divisors) n
divisors::Int->[Int]
divisors n = 1:(concat [[ k, n `div` k]| k <- [2.. root-1], n `mod` k == 0]) ++ if root * root == n then [root] else []
                where root = intSqrt n
    
intSqrt::Int -> Int
intSqrt = ceiling . sqrt . fromIntegral

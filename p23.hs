main::IO()
main = print $ sum [i|i<-[1..28123], all (\n -> (not . abundant) (i - n) ) abundantNums]
        where abundantNums = [i| i<-[12..28123], abundant i]
    
    
perfect n = sumDiv n == n
abundant n = if n < 1 then False else sumDiv n > n

sumDiv::Int->Int
sumDiv 1 = 0
sumDiv n = (sum . divisors) n

divisors::Int->[Int]
divisors n = 1:(concat [[ k, n `div` k]| k <- [2.. root-1], n `mod` k == 0]) ++ if root * root == n then [root] else []
                where root = intSqrt n
    
intSqrt::Int -> Int
intSqrt = ceiling . sqrt . fromIntegral
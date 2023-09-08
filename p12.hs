

main::IO()
main = print (head $ dropWhile ((>=500) . snd)$ map (\x -> (x, numDivisors x)) triangular)

-- List of all triangular numbers using identity t_n = n*(n+1)/2
triangular = [n* (n + 1) `div` 2| n <-[1..]]

-- Counts the number of divisors of a number -- for each number d <= sqrt n of the number add two divisors (d and n/d)
-- unless n is a perfect square, in which case you double counted sqrt n so you subtract 1
numDivisors::Int->Int
numDivisors n = 2 * (length [k | k <- [1.. root], n `mod` k == 0]) + if root * root == n then (-1) else 0
                where root = intSqrt n

intSqrt::Int -> Int
intSqrt = ceiling . sqrt . fromIntegral

import Data.List
--- Notice that all 9-digit pandigital numbers are divisible by 3, because their sum of digits is divisible by 3. 
--- So are all 8-digit pandigital numbers. So the greatest prime must be 7 digits.
--- This algorithm goes from the largest 7-digit pandigital number down and returns the first prime.
main::IO()
main = print $  head $ filter (isPrime) [n| n<-[7654321,7654320..1], isPandigital n]
        where isPrime k = if k > 1 then null [ x | x <- [2..intSqrt k], k `mod` x == 0] else False
              intSqrt::Int -> Int
              intSqrt = ceiling . sqrt . fromIntegral



isPandigital::Int->Bool
isPandigital n = sort  (show n) == (take (numDigits n) ['1'..'9'])

numDigits = length . show 
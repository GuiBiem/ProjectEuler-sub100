{-# LANGUAGE ViewPatterns #-}
import Data.List

main::IO()
main = print $  filter (isPrime) [n| n<-[987654321,987654320..1], isPandigital n]
        where isPrime k = if k > 1 then null [ x | x <- [2..intSqrt k], k `mod` x == 0] else False
              intSqrt::Int -> Int
              intSqrt = ceiling . sqrt . fromIntegral



isPandigital::Int->Bool
isPandigital n = sort  (show n) == (take (numDigits n) ['1'..'9'])

numDigits = length . show 
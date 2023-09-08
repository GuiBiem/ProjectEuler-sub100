import Data.Function
import Data.List
import Text.Printf
import Control.Exception
import System.CPUTime

time :: IO t -> IO t
time a = do
    start <- getCPUTime
    v <- a
    end   <- getCPUTime
    let diff = (fromIntegral (end - start)) / (10^12)
    printf "Computation time: %0.3f sec\n" (diff :: Double)
    return v

main::IO()
main = do
        time $ print ( fst $ maximumBy (compare `on` (length. snd)) [(i, collatzSeq i) | i <- [1..999999]])
        --time $ print ( maximumBy (compare `on` (collatzLen!!)) [1..100000])
        --where collatzLen::[Int]
              --collatzLen = 1 : 1 : map (\n -> 1 + collatzLen !! collatz n) [2..]


collatz n = if even n then n `div` 2 else 3*n + 1

collatzSeq 1 = [1]
collatzSeq n = n : collatzSeq (collatz n)
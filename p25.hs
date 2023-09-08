
main::IO()
main = print $ head $ dropWhile ((<1000). numDigits. snd) [(i, fibs!!i) | i <- [1..]]
       where fibs::[Integer]
             fibs = 0:scanl (+) 1 fibs

numDigits::Integer->Int
numDigits = length . show

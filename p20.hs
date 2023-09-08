
main::IO()
main = print $ sumOfDigits (fac 100)

fac::Integer->Integer
fac 0 = 1
fac n = n * (fac (n - 1))
sumOfDigits::Integer -> Int
sumOfDigits n = sum [read [x] | x<-(show n)]
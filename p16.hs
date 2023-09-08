

main::IO()
main = print (sumOfDigits bigInteger)

bigInteger::Integer
bigInteger = 2^1000

sumOfDigits::Integer -> Int
sumOfDigits n = sum [read [x] | x<-(show n)]
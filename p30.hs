
main::IO()
main = print $ sum [n | n<-[2..200000], n == fifthPowerOfDig n]

fifthPowerOfDig n = sum[(read [d])^5|d<-(show n)]



main::IO()
main = print (evenFibb)

evenFibb = sum$takeWhile (<4000000)$ filter even fibs
fibs = 0:scanl (+) 1 fibs
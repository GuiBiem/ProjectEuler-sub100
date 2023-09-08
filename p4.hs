
main::IO()
main = print (maximum palindromeProds)


palindromeProds = [i * j| i <-[100..999], j<-[100..999], palindromeNum (j*i)]
isPalindrome::String -> Bool
isPalindrome s = s == reverse s

palindromeNum::Int->Bool
palindromeNum = isPalindrome . show
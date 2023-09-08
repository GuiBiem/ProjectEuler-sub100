import Data.List
main::IO()
main = print $ length $ nub terms

terms::[Integer]
terms = [a^b|a<-[2..100], b<-[2..100]]
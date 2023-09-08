import Data.List

main::IO()
main = print $ sum $ nub $  [c | a<-[1..999], b<-[1..999], let c = a*b, is9Pandigital (concatMap show [a,b,c])] ++
                            [c | a<-[1000..9999], b<-[1..9], let c = a*b, is9Pandigital (concatMap show [a,b,c])]

is9Pandigital::String->Bool
is9Pandigital n = sort  n ==  ['1'..'9']

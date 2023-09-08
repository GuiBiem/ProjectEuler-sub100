import Data.List
import Data.Function


myRead n = case n of
                "" -> 0
                otherwise -> read n

naiveSimplify::(Int, Int) -> (Int, Int)
naiveSimplify (a, b) = let (sa, sb) = cancel (toListofDigits a) (toListofDigits b) in (myRead $ concatMap show sa,myRead $ concatMap show sb)

toListofDigits::Int->[Int]
toListofDigits n = [read [d] | d <- show n]

main::IO()
main = print $ [((a,b), (sa,sb))|a<-[10..99], b<-[10..99], let (sa, sb) = naiveSimplify (a, b), a * sb == sa * b ]

mapPair1 f (a, b) = (f a, b)
mapPair2 f (a, b) = (a, f b)

cancel::[Int]->[Int]->([Int], [Int])
cancel xs ys = let (cxs, cys)  = cancelHelp (sort xs) (sort ys) ([], []) in
                (sortBy (compare `on` head . flip elemIndices xs) cxs, sortBy (compare `on` head . flip elemIndices ys) cys)
        where cancelHelp [] [] pair = pair
              cancelHelp [] (x:xs) pair = cancelHelp xs [] (mapPair1 (x:) pair)
              cancelHelp (y:ys) [] pair = cancelHelp [] ys (mapPair2 (y:) pair)
              cancelHelp (x:xs) (y:ys) pair = case signum (x - y) of
                                                            0 -> cancelHelp xs ys pair
                                                            -1 ->  cancelHelp xs (y:ys) (mapPair1 (x:) pair)
                                                            1 ->  cancelHelp (x:xs) ys (mapPair2 (y:) pair)


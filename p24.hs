import Data.List

main::IO()
--- Silly
main =print $ (sort $ permutations "0123456789")!!(1000000-1)

main::IO()

main = print $ binom 40 20

binom::Integer->Integer->Integer
binom n k = product [1+n-k..n] `div` product [1..k]
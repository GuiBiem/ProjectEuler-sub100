main::IO()
main = print $ sum numbers

-- You should realize that the top right corners are the odd squares. Each of the other corners 
-- are the square minus the number minus one, subtracted once more for each corner. For example, for the example given,
-- for the layer of number five, you start at 25, and then subtract 4 = 5-1 for each corner. 
numbers = 1:[4*i^2 -6*(i-1)|i<-[3,5..1001]]

-- Here is the square with the layer for seven for further example:
--     43 44 45 46 47 48 49
--     42 21 22 23 24 25 26
--     41 20  7  8  9 10 27
--     40 19  6  1  2 11 28
--     39 18  5  4  3 12 29
--     38 17 16 15 14 13 30
--     37 36 35 34 33 32 31
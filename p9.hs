main::IO()
main = print (head pytTrips)

pytTrips = [a*b*c|a<-[1..998], b<-[1..998], let c = 1000 - a - b ,a^2 + b^2 == c^2]
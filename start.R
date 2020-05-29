#create vector
x <- c(1,2,3,4,5,6,7,8,9)

#remove veraible
rm(x)

#create vector from strings
x <- c("vex","string","haloo")

#create sequence of numbers
1:10
#or
10:1

#work with vectors with vectorization
x <- 1:10
y <- 10:1

z <- x - y

z <- z/x

#what could happen when operate on different size of vectors
s = c(1,2)
#R keep rotate shorter vector to meet biger one as 
x <- x + s

#when make logical operation on vector it produce true and false vector
lv <- x <= 5

#create matrix is it nice
A <- matrix(1:10,nrow = 5)
B <- matrix(1:10,nrow = 2)
C <- B %*% A  
C <- A %*% B  
CT <- t(C)
U <- C %*% CT
class(U)

#working with array
theArray = array(1:12, dim = c(2,3,2))
theArray
theArray[1,,2]
theArray[,2,2]
class(theArray)

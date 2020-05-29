#function or not this is the question
#function in R is an object like the following
my_func <- function(name)
{
  print(name)
}
#no need for ; to end line like in C
#no need fo indentation like python
#last line normally used for return but it is not goo prectice better to use return

fun2<-function(x){
  return(x*2)
}

#you can use do.call function to call function with string name and pass the arguments
do.call("func2",args = list(x))

#start with control statement
#####
#there is normal if statement and switch statement
#let see something new in R which is ifelse which work in vectors
toTest <- c(1,1,0,1,0,1)
ifelse(toTest == 1, 5, 3)
toTest[2] <- NA
ifelse(is.na(toTest), 0, toTest)

#looping using for
for (i in 1:10) {
  print(i)
}

#group manipulation
theMatrix <- matrix(1:9,nrow = 3)
apply(theMatrix, 1, sum)
apply(theMatrix, 2, sum)
#aggregate
#aggregate functiuon suing simple formula x~y
# x (left side) variable wich will be calculate
# y (right side) the veriable that will used for grouping

aggregate(price~cut,diamonds,mean)

#adding additional grouping factors to the right side use +
aggregate(price~cut + color, diamonds, mean)

#to aggregate on two veriable in left side use cbind() function
aggregate(cbind(price,carat)~cut,diamonds,mean)

#using plyr package for aggregation is more convenient
#load library and data 
library(plyr)
head(baseball)

baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))
baseball$hbp[is.na(baseball$hbp)] <- 0

any(is.na(baseball$hbp))
baseball <- baseball[baseball$ab >= 50,]
baseball$OBP <- with(baseball, (h+bb+hbp)/(ab+bb+hbp+sf))
tail(baseball)

#make sample using uniform dist
x <- sample(x=1:100, size = 100, replace = TRUE)

mean(x)

grades <- c(95,72,87,66)
weightss <- c(1/2,1/4,1/8,1/8)
weighted.mean(x=grades, w = weightss)

var(x)
sqrt(var(x))
x%>%var%>%sqrt
sd(x)
median(x)
min(x)
x%>%summary

quantile(x,probs = c(.25,.75))
quantile(x,probs=c(.1,.9))

#correlation and covariance
library(ggplot2)
head(economics)
cor(economics$pce, economics$psavert)
#find correlation valure for many variable as follow
cor(economics[,c(2,4:6)])

GGally::ggpairs(economics[,c(2,4:6)])

#covaraubce
cov(economics[,c(2,4:6)])

#T-test
head(tips)
library(reshape2)

unique(tips$sex)
unique(tips$day)

t.test(tips$tip,alternative = "two.side", mu = 4)
#test if mean is greater than 2.5
t.test(tips$tip, alternative = "greater", mu = 4)

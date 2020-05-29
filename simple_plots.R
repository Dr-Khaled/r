#descovering plotting and graph

#to load loberary
library(ggplot2)

#to load data set use
data("diamonds")
head(diamonds)


#creat histogram using the default plot library
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")

#draw scatter plot (x-y plot)
plot(price~carat, data = diamonds)
#or
plot(diamonds$carat,diamonds$price)
#this could for variable from different data.frame

#plot box plot
boxplot(diamonds$carat)
#end of basic plot
#############

#we will use ggplot2 lib 
#starting alawys by initiate ggplot object and then add layer using +

ggplot(data = diamonds) + geom_histogram(aes(x = carat))

ggplot(data = diamonds) + geom_density(aes(x = carat))

#draw scatter plot (xy) using ggplot2
ggplot(data = diamonds, aes(x=carat, y= price)) + geom_point()
#save ggplot in veriable to be used for different plots
g <- ggplot(diamonds, aes(x=carat,y=price))

#reuse the above object with additional aes
g + geom_point(aes(color = color))

#using facet - multiple plot per factors and levels
g + geom_point(aes(color = color)) + facet_wrap(~color)

#using facit grid to have two dim grid
g + geom_point(aes(color= color)) + facet_grid(cut~clarity)

#using facet wrap with histogram
ggplot(data = diamonds, aes(x= carat)) + geom_histogram() + facet_wrap(~color)
#please note that carat is data and color is factor

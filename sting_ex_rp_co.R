#working with string
#using stringr library
#concatenante is paste ok
library(stringr)
paste("Besm","Allah")

paste("01","P","22",sep = "-")

#for spliting text use str_split with certain dilimit
#to trim use str_trim
#to extract according to certain pattern usr st_extract
#pattern here is reg_x
#find pattern use str_detect

#regular expressions 
#\\d to indicate digit
#\\d{4} four consequetive digits
#\\d{1,3} from 1 to 3 consequetive digits
# ^ start by
# $ end by

#fins and replace is str_replace or str_replace_all
# . search for any thing
?regex

str_extract(string = molp_crdata$`WO Work Group`, pattern = "\\D{3}$")
head(str_extract(string = molp_crdata$`Location Unit Code`, pattern = "\\d{4}"))

head(str_extract(string = molp_crdata$`Location Unit Code`, pattern = "-\\D{2}\\d{2}-"))

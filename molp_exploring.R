#library
library(tidyverse)
#select data and rename columns to be manageble by dplyr

pmolcr <- molp_crdata %>% select(site = "Location Site",
                                 unit = "Location Unit Code",
                                 unit_d = "Location Unit Code Description",
                                 loc = "Location",
                                 loc_d = "Location Description",
                                 wo = "WO Number",
                                 wo_d = "WO Description",
                                 wo_priority = "WO Priority",
                                 wo_act = "WO Activity Code",
                                 fail_class = "WO Failure Class",
                                 problem = "WO Problem Code",
                                 year = "Report Year",
                                 month = "Report MOnth",
                                 date = "WO Reported Date",
                                 desc = "des",
                                 mtbf_in = "Include in MTBF Calculations") %>% mutate(sub_site = str_extract(unit, pattern = "\\d{4}"))

#extract field id from unit code
pmolcr <- pmolcr %>% mutate(sub_site = str_extract(unit, pattern = "\\d{4}"))

#join site with sub site to be used for grouping more strieght forward
pmolcr$sub_site = (str_c(pmolcr$site, "-", pmolcr$sub_site)) 


#show comnponent failure againest maintenance desciplines
ggplot(pmolcr) + geom_count(aes(x=desc, y = fail_class))

#show utilize of maintenance desciplines in each site for failure component pump
ggplot(pmolcr[pmolcr$fail_class=="PU",]) + geom_count(aes(x=sub_site, y = desc))

#plot parito chart for number of cr wo per failure class
count_fail_class <- pmolcr %>% count(fail_class) %>% arrange(desc(n))
ggplot(count_fail_class) + geom_bar(aes(x=n , y=reorder(fail_class, -n)), stat = "identity")
                          
#plot parito chart for number of problem per fa ilure mode
count_FM <- pmolcr %>% count(problem) %>% arrange(desc(n))
ggplot(count_FM[count_FM$problem != "NA-PROBLEM",]) + geom_bar(aes(x = n, y = reorder(problem, -n)), stat = "identity")


ggplot(pmolcr[pmolcr$problem != "NA-PROBLEM",]) + geom_bar(aes(x = problem)) + facet_wrap(~sub_site, nrow = 11)

#plot unit against the site and number of records to explor valid units and records
ggplot(pmolcr) + geom_count(aes(x=sub_site, y=unit)) + theme(axis.text.x = element_text(angle = 45, hjust = 1))

#number of years
max(pmolcr$year)- min(pmolcr$year)

fm_site <- pmolcr %>% select(sub_site, problem) %>% filter(problem != "NA-PROBLEM" & problem != "OTH") %>% group_by(sub_site, problem) %>% summarise(count = n()) %>% arrange(sub_site,desc(count))
ggplot(fm_site) + geom_col(aes(y = count, x = reorder(problem, -count))) + facet_wrap(~sub_site, ncol = 1)

fm_site

fm_site <- pmolcr %>% select(sub_site, problem) %>% filter(problem != "NA-PROBLEM" & problem != "OTH" & sub_site != "JDA-3050") %>% group_by(sub_site, problem) %>% summarise(count = n()) %>% arrange(sub_site,desc(count))
ggplot(fm_site) + geom_col(aes(y = count, x = problem)) + facet_wrap(~sub_site, ncol = 1)

ggplot(fm_site) + geom_tile(aes(x=problem, y= sub_site, fill= count)) +  scale_fill_gradient2()

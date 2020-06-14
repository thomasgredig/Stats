d = read.csv('data/FacultyDiversity.csv', stringsAsFactors = FALSE)

names(d)[1] = 'Institution.Full'

d$Full.time.faculty = as.numeric(gsub(',','',d$Full.time.faculty))
m= strsplit(d$Institution.Full,'\\s+\\|\\s+')
d$State = factor(sapply(m,'[[',2))
d$Institution = sapply(m,'[[',1)
d$Type = NA
d$Type[grep("Master's",d$Institution)] = 'MS'
d$Type[grep("Associate",d$Institution)] = 'Associate'
d$Type[grep("Doctoral",d$Institution)] = 'PhD'
d$Type[grep("Baccalaureate",d$Institution)] = 'BS'
d$Type[grep("Special-Focus",d$Institution)] = 'Special-Focus'
d$Type = factor(d$Type)


percent2num <- function(x) { as.numeric(gsub('%','',x)) }
d[,3:13] = sapply(d[,3:13],percent2num)
levels(d$Type)

library(ggplot2)
library(dplyr)
library(ggthemes)
str(d)
names(d)

ggplot(d, aes(Full.time.faculty, Women, color=Type)) + 
  geom_point() + 
  scale_x_log10() +
  theme_economist()

ggplot(d, aes(Full.time.faculty, Hispanic, color=Type)) + 
  geom_point() + 
  scale_x_log10() +
  scale_y_log10() + 
  theme_economist()

ggplot(d, aes(Full.time.faculty, Asian, color=Type)) + 
  geom_point() + 
  scale_x_log10() +
  scale_y_log10() + 
  theme_economist()

d %>%
  filter(Full.time.faculty>200) %>%
  ggplot(aes(Full.time.faculty, Black, color=Type)) + 
  geom_point() + 
  scale_x_log10() +
  scale_y_log10() + 
  theme_economist()


ggplot(d, aes(Asian, Hispanic, color=Type)) + 
  geom_point() + 
  scale_x_log10() +
  scale_y_log10() + 
  theme_economist()

d %>%
  filter(Full.time.faculty>200) %>%
  filter(Type != 'Special-Focus') %>%
  ggplot(aes(Type, total.minority)) + 
  geom_boxplot() + 
  geom_point(data=d[136,], aes(col='red'), size=3) +
  theme_economist()


grep('Long Beach',d$Institution)


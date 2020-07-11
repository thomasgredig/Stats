timesData$numStudents = as.numeric(gsub(',','',timesData$num_students))

plot(timesData$numStudents, log='y')
timesData$numStudents[is.na(timesData$numStudents)] = 0
n = by(timesData$numStudents, factor(timesData$country), sum )

d2 = data.frame(
  country = names(n),
  no.students = as.numeric(n),
  
)

plot(timesData$income)
qq = which(timesData$country=='Switzerland')
points(qq, timesData$income[qq], col='red', pch=19)
qq = which(timesData$country=='United States of America')
points(qq, timesData$income[qq], col='blue', pch=19)

timesData$female_male_ratio = as.numeric(timesData$female_male_ratio)


str(timesData)
plot(timesData$female_male_ratio)

q = timesData$female_male_ratio
q1 = sapply(q, function(x) {
  if(nchar(x)>0) { as.numeric(strsplit(x,":")[[1]][1]) } else { 0 }
})
plot(q1)

timesData$female = q1

ggplot(subset(timesData, female>0 & female<100),
       aes(x = reorder(country, -female), female)) + 
  geom_boxplot() +
  geom_boxplot(data=subset(timesData, country=='United States of America'), fill='red') + 
  geom_boxplot(data=subset(timesData, country=='Switzerland'), fill='orange') +
  theme(axis.text = element_text(angle=90))


# loads the state data
loadData <- function(filename) {
  d = read.csv(filename, skip=7, header=FALSE)
  s1 = t(d[1,])
  s1[1:26*3+1] = s1[1:26*3]
  s1[1:26*3+2] = s1[1:26*3]
  s2 = t(d[2,])
  s = paste(s1, s2)
  d = read.csv(filename, skip=12, header=TRUE,stringsAsFactors = TRUE)
  v = as.vector(d[111,3:ncol(d)-3])
  s[1] = "Line"
  names(d) = s

  # convert comma-separated numbers into numbers
  d = sapply(d, function(x) { if(is.factor(x)) { as.character(levels(x)[x]) } else {x} })
  as.numeric(gsub(',','',d[,3]))
  d[,3:ncol(d)] = sapply(d[,3:ncol(d)], function(x) { as.numeric(gsub(',','',x))})
  d
}

d1 = loadData('data/17slsstab1a.csv')
d2 = loadData('data/17slsstab1b.csv')
d2[,-c(1,2)] -> d2
cbind(d1,d2) -> d

# make a graph
NUM = grep('71',d[,1])

d[NUM,2]
m = d[NUM,1:51*3+3]
q = data.frame(
  state = gsub('State & local','',names(m)),
  num = m,
  num2 = d[grep('94',d[,1]),1:51*3+3]
)
head(q)
q$num = as.numeric(levels(q$num)[q$num])
q$num2 = as.numeric(levels(q$num2)[q$num2])
q$state = as.character(levels(q$state)[q$state])
myLABEL = d[NUM,2]

library(ggplot2)
library(ggthemes)
q$num = q$num2 / q$num
ggplot(q, aes(x=reorder(state,num),y=num)) +
  geom_col(fill='red') + 
  coord_flip() + xlab('') + 
  ylab(myLABEL) +
  theme_economist()

head(q)

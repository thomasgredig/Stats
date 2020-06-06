library(ggplot2)
path.RAW = 'data/'
path.FIGS = 'images/'

du = read.csv(file.path(path.RAW, 'university-faculty.csv'))
head(du)
du$file = paste0('pub-zp',du$Zip,'-year.txt')
du$records.per.faculty = 0
i=1
for(i in 1:nrow(du)) {
  d = na.omit(read.csv(file.path(path.RAW, du$file[i]), sep='\t'))
  du$records.per.faculty[i]=d$records[which(d$Publication.Years==du$Year[i])[1]]/du$Faculty.Tenure[i]
}

head(du)
plot(du$records.per.faculty)
ggplot(du, aes(University, records.per.faculty, col=factor(Year))) + 
  geom_point(size=4) +
  theme_bw() +
  scale_y_continuous(limits=c(0,2.5))

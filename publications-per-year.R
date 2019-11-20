library(ggplot2)
path.RAW = 'data/'
path.FIGS = 'images/'

dir(path.RAW)

d = read.csv(file.path(path.RAW,'pub-zp90840-year.txt'),sep='\t')
d= na.omit(d)
head(d)
names(d)

ggplot(d, aes(Publication.Years, records)) + 
  geom_histogram(stat='identity', fill='orange', col='black') +
  xlab('year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file.path(path.FIGS,'CSULB-pubs.png'),
       width=6,height=5,dpi=150)

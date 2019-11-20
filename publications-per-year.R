library(ggplot2)
path.RAW = 'data/'
path.FIGS = 'images/'

dir(path.RAW)

## CSU Long Beach
d = read.csv(file.path(path.RAW,'pub-zp90840-year.txt'),sep='\t')
d= na.omit(d)
head(d)
names(d)

ggplot(d, aes(Publication.Years, records)) + 
  geom_histogram(stat='identity', fill='orange', col='black') +
  xlab('year') +
  theme_bw() +
  scale_y_continuous(limits=c(0,500)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file.path(path.FIGS,'CSULB-pubs.png'),
       width=6,height=5,dpi=150)

## CSU Los Angeles
d = read.csv(file.path(path.RAW,'pub-zp90032-year.txt'),sep='\t')
d= na.omit(d)
head(d)
names(d)

ggplot(d[-1,], aes(Publication.Years, records)) + 
  geom_histogram(stat='identity', fill='orange', col='black') +
  xlab('year') +
  scale_y_continuous(limits=c(0,500)) + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file.path(path.FIGS,'CSULA-pubs.png'),
       width=6,height=5,dpi=150)


## CSU Northridge
d = read.csv(file.path(path.RAW,'pub-zp91330-year.txt'),sep='\t')
d= na.omit(d)
head(d)
names(d)

ggplot(d, aes(Publication.Years, records)) + 
  geom_histogram(stat='identity', fill='orange', col='black') +
  xlab('year') +
  scale_y_continuous(limits=c(0,500)) + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file.path(path.FIGS,'CSUNorthridge-pubs.png'),
       width=6,height=5,dpi=150)


## UC Irvine
d = read.csv(file.path(path.RAW,'pub-zp92697-year.txt'),sep='\t')
d= na.omit(d)
head(d)
names(d)

ggplot(d[-1,], aes(Publication.Years, records)) + 
  geom_histogram(stat='identity', fill='orange', col='black') +
  xlab('year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave(file.path(path.FIGS,'UCIrvine-pubs.png'),
       width=6,height=5,dpi=150)




library(ggplot2)
path.RAW = 'data/'
path.FIGS = 'images/'

# save all the images
saveUniv <- function(m,name, longname) {
  ggplot(m, aes(year, records)) + 
    geom_histogram(stat='identity', fill='orange', col='black') +
    scale_x_continuous(limits=c(1995,2019)) + 
    #scale_y_continuous(limits=c(0,2000)) + 
    xlab('year') +
    ggtitle(longname) + 
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  ggsave(file.path(path.FIGS,paste0(name,'-pubs.png')),
         width=6,height=5,dpi=150) 
}


# load all the data
univ.list = read.csv('data/universityList.csv')
r = data.frame()
for(i in 1:nrow(univ.list)) {
  fname = file.path(path.RAW, paste0('pub-zp',univ.list$zipCode[i],'-year.txt'))
  print(fname)

  if (file.exists(fname)) {
    d = na.omit(read.csv(fname,sep='\t', stringsAsFactors = FALSE))
    names(d) = c('year','records','percentage')
    d$year = as.numeric(d$year)
    d$univ = univ.list$shortName[i]
    d$name = univ.list$longName[i]
    saveUniv(d, univ.list$shortName[i], univ.list$longName[i])
    rbind(r,d) -> r
  }
}






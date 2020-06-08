##  Endowments

d = read.csv('data/endowments.csv', stringsAsFactors = FALSE)
k1 = which(d$No.Students>0)
d[k1,]
d$X2019 = as.numeric(gsub('^\\$','',d$X2019))*1e9
d$Endow.Per.Student=NA
d$Endow.Per.Student[k1] = signif(d$X2019[k1]/d$No.Students[k1],3)
d$Endow.Per.Student

library(ggplot2)
library(ggthemes)
library(dplyr)

d %>%
  filter(Endow.Per.Student>0) %>%
  ggplot(aes(x=reorder(Name.Short, Endow.Per.Student), Endow.Per.Student)) + 
  geom_col(fill='red') + 
  coord_flip() +
  xlab('') +
  ylab('Endowment ($/student)') +
  scale_y_continuous(labels = scales::scientific)  +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE, big.mark=',')) +
  #scale_y_log10() + 
  ggtitle('Endowments per Student',subtitle = '@i7ed, selected Universities, Source: NACUBO') +
  theme_economist()
ggsave('images/Endowments2.png', width=6, height=4, dpi=300)

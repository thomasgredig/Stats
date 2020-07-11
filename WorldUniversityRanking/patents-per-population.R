# Patents Per Million Inhabitants
###
source('load-data.R')

n = by(cwurData$citations, cwurData$country, sum)

d2 = data.frame(
  country = names(n),
  pubs = as.numeric(n)
)
levels(d2$country)[levels(d2$country)=="USA"] <- "United States"

levels(d2$country)

d3 = merge(d2, d, by='country')
tail(d3)

d3$pubs.per.pop = d3$pubs/d3$p*1e6
names(d3)

ggplot(subset(d3,p>5e6 ), 
       aes(x = reorder(country, -pubs.per.pop), y = pubs.per.pop)) +
  geom_col() +
 # scale_y_log10() + 
  ylab('Patents Per Million') + xlab('') + 
  geom_col(data=subset(d3, country=='United States'), fill='red') + 
  geom_col(data=subset(d3, country=='Switzerland'), fill='orange') +
  theme(axis.text = element_text(angle=90))


ggsave(file.path(path.FIGS,'patents-per-population.png'),width=6,height=3,dpi=300)

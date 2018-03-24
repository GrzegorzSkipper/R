library(pscl)
library(caret)
library(ggplot2)

help(package=pscl)
?vote92
sapply(vote92, class)

table(vote92$female, vote92$vote)

plot_table <- function(x, y) {
  df <- as.data.frame(table(x, y))
  ggplot(df, aes(x = x, y = Freq, fill = y)) +
    geom_bar(stat = "identity")
}

plot_table(vote92$female, vote92$vote)
plot_table(vote92$rep, vote92$vote)
plot_table(vote92$dem, vote92$vote)
plot_table(vote92$persfinance, vote92$vote)
plot_table(vote92$natlecon, vote92$vote)

# distance variables are continuous
summary(vote92[,c('clintondis', 'bushdis', 'perotdis')])

#let's use cut to bin them up (make categorical)
vote92$clinton_segment <- cut(vote92$clintondis, seq(0, 20, by = 5))
vote92$bush_segment <- cut(vote92$bushdis, seq(0, 20, by = 5))
vote92$perot_segment <- cut(vote92$perotdis, seq(0, 20, by = 5))

plot_table(vote92$clinton_segment, vote92$vote)
plot_table(vote92$bush_segment, vote92$vote)
plot_table(vote92$perot_segment, vote92$vote)

# stratified split
index <- createDataPartition(vote92$vote, p = .7, list = FALSE)

summary(vote92[index, 'vote']) / length(index)

summary(vote92[-index, 'vote']) / 
  (length(vote92$vote) - length(index))

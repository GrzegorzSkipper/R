#install.packages('text2vec')
library(text2vec)

data("movie_review")
dim(movie_review)
colnames(movie_review)
head(movie_review[, 1:2])

movie_review[1,3]

movie_review$char_count <- 
  unlist(lapply(movie_review$review, nchar))
qplot(char_count, fill = factor(sentiment), data = movie_review, 
      geom = "histogram") +
  facet_grid(sentiment ~ .)

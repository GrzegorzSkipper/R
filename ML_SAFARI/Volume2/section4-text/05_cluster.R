library(text2vec)
library(tm)
library(caret)

data("movie_review")

movie_topics <- readRDS("movie_topics.rds")
dim(movie_topics)
X <- movie_topics[,1:200]

km <- kmeans(X, centers = 5)

km$cluster
table(km$cluster, movie_topics$sentiment)

cluster1 <- km$cluster == 1
head(movie_review[cluster1,]$review)

cluster4 <- km$cluster == 4
head(movie_review[cluster4,]$review)

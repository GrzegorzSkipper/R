library(text2vec)
library(tm)
library(caret)
#install.packages('lsa')
library(lsa)

data("movie_review")

movie_topics <- readRDS("movie_topics.rds")
dim(movie_topics)
X <- movie_topics[,1:200]

cos_sim <- cosine(t(as.matrix(X)))
saveRDS(cos_sim, "cos_sim.RDS")
# start here if running a second time
cos_sim <- readRDS("cos_sim.RDS")
dim(cos_sim)
results1 <- cos_sim[1,2:ncol(cos_sim)]
idx <- rev(order(results1))[1:10]
results1[idx]

qplot(y = results1, x = 1, geom="boxplot")
summary(results1)

movie_review[1,]$review
movie_review[idx[1],]$review
movie_review[idx[2],]$review
movie_review[idx[3],]$review

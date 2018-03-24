library(text2vec)
library(tm)
library(caret)
#install.packages('topicmodels')
library(topicmodels)

data("movie_review")

y <- factor(movie_review$sentiment, 
            labels = c('negative', 'positive'))

removeSpecialChars <- function(x) {
  return(gsub("[^a-zA-Z0-9 ]","",x))
}

corp <- VCorpus(VectorSource(movie_review$review)) %>%
     tm_map(content_transformer(removeSpecialChars)) %>%  
     tm_map(stripWhitespace) %>%
     tm_map(removePunctuation) %>%
     tm_map(content_transformer(tolower)) %>%
     tm_map(removeWords, stopwords('english'))

dtm <- DocumentTermMatrix(corp)
dim(dtm)
inspect(dtm[1:5, 100:105])
dtm <- removeSparseTerms(dtm, .99)
dim(dtm)

# use less docs for performance reasons
subset <- createDataPartition(y, p = .15, list = FALSE)
lda <- LDA(dtm[subset,], k = 200, 
           control = list(nstart = 5, verbose = 2))
X <- posterior(lda, dtm)$topics

movie_topics <- data.frame(X, sentiment = y)
saveRDS(movie_topics, "movie_topics.rds")

# start here if you've run this before
movie_topics <- readRDS("movie_topics.rds")
X <- movie_topics[,1:200]
y <- movie_topics$sentiment

idx <- createDataPartition(y, p = .7, list = FALSE)
X.train <- X[idx,]
X.test <- X[-idx,]
y.train <- y[idx]
y.test <- y[-idx]

model <- train(x = X.train, 
               y = y.train, 
               method = "glm")

y_pred <- predict(model, X.test)
confusionMatrix(y_pred, y.test)


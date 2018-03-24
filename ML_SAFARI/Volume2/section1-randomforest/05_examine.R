library(pscl)
library(caret)
source('Volume2/section1-randomforest/03_prepare.R')
set.seed(3)

df <- get_vote_df()

index <- createDataPartition(df$vote, p = .7, list = FALSE)

train <- df[index,]
test <- df[-index,]

trctl <- trainControl(method = "cv", 
                      number=10, 
                      savePredictions = TRUE)

model <- train(vote ~ female, 
               data = train,
               method = "rf",
               trControl = trctl)

test$pvote <- predict(model, test)
getTree(model$finalModel, labelVar = TRUE)
test[, c('female', 'vote', 'pvote')]
sum(test$vote == test$pvote) / nrow(test)

model <- train(vote ~ . ^ 2, 
               data = train,
               method = "rf",
               trControl = trctl)

test$pvote <- predict(model, test)
sum(test$vote == test$pvote) / nrow(test)
getTree(model$finalModel, labelVar = TRUE)

imp <- model$finalModel$importance
as.matrix(imp[order(imp[,1]),])

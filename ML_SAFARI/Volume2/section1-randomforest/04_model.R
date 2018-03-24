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
tg <- data.frame(mtry = 3)
model <- train(vote ~ ., 
               data = train,
               method = "rf",
               tuneGrid = tg,
               trControl = trctl)

test$pvote <- predict(model, test)
confusionMatrix(test$pvote, test$vote)


library(pscl)
library(caret)
source('Volume2/section1-randomforest/03_prepare.R')
set.seed(2)

df <- get_vote_df()

index <- createDataPartition(df$vote, p = .7, list = FALSE)

train <- df[index,]
test <- df[-index,]

tg <- data.frame(mtry = 8)
trctl <- trainControl(method = "cv", 
                      number=10, 
                      savePredictions = TRUE)
model <- train(vote ~ . * female + perotdis:bushdis,
               data = train,
               method = "cforest",
               tuneGrid = tg,
               trControl = trctl)

test$pvote <- predict(model, test)

summary(test$vote) / nrow(test)
summary(test$pvote) / nrow(test)

confusionMatrix(test$pvote, test$vote)

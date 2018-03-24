library(mlbench)
library(ggplot2)
data("Satellite")
idx <- createDataPartition(Satellite$classes, p = .7, 
                           list = FALSE)
train <- Satellite[idx,]
test <- Satellite[-idx,]

tg <- data.frame(k = 3:6)
model <- train(classes ~ ., 
               data = train, 
               tuneGrid = tg,
               method = "knn")

model$bestTune
test$pred <- predict(model, test)

cm <- confusionMatrix(test$pred, test$classes)
cm$overall
cm$byClass[,"F1"]

gpred <- qplot(x.1, x.2, color = pred, data = test) + 
  ggtitle("Predicted")
gtest <- qplot(x.1, x.2, color = classes, data = test) + 
  ggtitle("Test")

library(gridExtra)
grid.arrange(gpred, gtest, nrow = 2)


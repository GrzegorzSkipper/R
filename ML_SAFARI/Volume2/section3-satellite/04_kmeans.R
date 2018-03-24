library(mlbench)
library(ggplot2)

data("Satellite")

idx <- createDataPartition(Satellite$classes, p = .7, list = FALSE)

train <- Satellite[idx,]
test <- Satellite[-idx,]

model <- knn3(classes ~ ., data = train, k = 3)

test$pred <- predict(model, test, type = "class")

cm <- confusionMatrix(test$pred, test$classes)
cm$overall
cm$byClass[,"F1"]

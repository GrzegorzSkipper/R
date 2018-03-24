library(mlbench)
library(ggplot2)

data("Satellite")

# sub-sample data
limit <- createDataPartition(Satellite$classes, p = .5, list = FALSE)
X <- Satellite[limit, 1:2]
y <- Satellite$classes[limit]

View(X, "Limited Satellite Data")

idx <- createDataPartition(y, p = .7, list = FALSE)

X.train <- X[idx,]
X.test <- X[-idx,]
y.train <- y[idx]
y.test <- y[-idx]

head(X.train)

gtrain <- qplot(x.1, x.2, color = y.train, data = X.train) + 
      ggtitle("Train")
print(gtrain)

model <- knn3(x = X.train, y = y.train, k = 5)

y.test.pred <- predict(model, X.test, type = "class")

gpred <- qplot(x.1, x.2, color = y.test.pred, data = X.test) + 
  ggtitle("Predicted")
gtest <- qplot(x.1, x.2, color = y.test, data = X.test) + 
    ggtitle("Test")

library(gridExtra)
grid.arrange(gtrain, gpred, gtest, nrow = 3)

cm <- confusionMatrix(y.test.pred, y.test)
cm


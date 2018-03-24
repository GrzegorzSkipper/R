library(caret)
source('Volume2/section2-letter-recognition/02_download.R')

# speed
idx <- createDataPartition(mtrain$y, 
                           p = 1000 / length(mtrain$y), 
                           list = FALSE)
X <- mtrain$x[idx,]
y <- mtrain$y[idx]

pca <- princomp(X)
X <- predict(pca, X)[, 1:25]

(6:8)/4
tg <- data.frame(C = (6:8)/4, sigma = 0.0227)
model <- train(
  y = as.factor(y),
  x = X,
  method = "svmRadial",
  tuneGrid = tg
)

summary(model$finalModel)
model$bestTune

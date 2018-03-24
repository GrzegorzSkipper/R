library(caret)
source('Volume2/section2-letter-recognition/02_download.R')

# speed
idx <- createDataPartition(mtrain$y, 
                           p = 2000 / length(mtrain$y), 
                           list = FALSE)
X <- mtrain$x[idx,]
y <- mtrain$y[idx]

pca <- princomp(X)
X <- predict(pca, X)[, 1:25]

tg <- data.frame(C = 2, sigma = .025)
model <- train(
  y = as.factor(y),
  x = X,
  tuneGrid = tg,
  method = "svmRadial"
)

idx2 <- createDataPartition(mtest$y, 
                           p = 1000 / length(mtest$y), 
                           list = FALSE)
X_test <- predict(pca, mtest$x[idx2,])[, 1:25]
predicted <- predict(model, X_test)

cm <- confusionMatrix(predicted, mtest$y[idx2])
print(cm)
print(cm$byClass[, 'F1'])


cmf <- as.data.frame(cm$table)
cmg <- ggplot(cmf) + 
  geom_tile(aes(x=Prediction, y=Reference, fill=Freq)) + 
  scale_x_discrete(name="Reference (Actual) Cylinders") + 
  scale_y_discrete(name="Predicted Cylinders", limits = rev(levels(cmf$Prediction))) +
  geom_text(aes(x = Prediction, y = Reference, label = Freq), color = "white", size = 8)
print(cmg)


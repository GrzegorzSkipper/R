library(mlbench)
#install.packages('tsne')
library(tsne)
library(ggplot2)
library(caret)

data("Satellite")

dim(Satellite)

summary(Satellite$classes)
idx <- createDataPartition(Satellite$classes, p = .2, list = FALSE)
X <- Satellite[idx, -37]
y <- Satellite$classes[idx]
n_classes <- length(unique(y))

k_X <- kmeans(X, centers = n_classes)
k_y <- table(k_X$cluster, as.factor(y))
print(k_y)
ggplot(as.data.frame(k_y), aes(x = Var1, y = Freq, fill = Var2)) + 
  geom_bar(stat = "identity") +
  xlab('cluster') + ylab('frequency')

pca <- princomp(X)
X_t <- predict(pca, X)[,1:4]
dim(X_t)
tsne_results <- tsne(X_t)
data <- data.frame(tsne_results, 
                   y = as.factor(y), 
                   cluster = as.factor(k_X$cluster))
qplot(X1, X2, color = y, data = data, size = I(.5))

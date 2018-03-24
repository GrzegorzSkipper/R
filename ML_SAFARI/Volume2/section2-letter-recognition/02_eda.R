source('Volume2/section2-letter-recognition/02_download.R')
library(caret)
library(NMF)
library(tsne)
library(ggplot2)

names(mtrain)
mtrain$n
dim(mtrain$x)
mtrain$x[1,]
show_digit(mtrain$x[1,])

idx <- createDataPartition(mtrain$y, 
                           p = 1000 / length(mtrain$y), 
                           list = FALSE)
x <- mtrain$x[idx,]
y <- mtrain$y[idx]

# pca won't work on all 0 features
d1 <- dim(x)[1]
d2 <- dim(x)[2]
nsamples <- d1 * d2
noise <- matrix(runif(nsamples) / 10, nrow = d1, ncol = d2)
x <- x + noise

pca <- princomp(x)
x_t <- predict(pca, new_data = x)[,1:10]
tsne_res <- tsne(x_t)

data <- data.frame(tsne_res, digit = y)
qplot(x = X1, y = X2, color = as.factor(y), data = data)

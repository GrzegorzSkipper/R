install.packages("caret")
library("caret")
install.packages("randomForest")
library("randomForest")
set.seed(3)

mtcars$cyl <- factor(mtcars$cyl, labels = c('Four cyl', 
                                            'Six cyl', 
                                            'Eight cyl'))

idx <- createDataPartition(mtcars$cyl, p = .7, list = FALSE)

train <- mtcars[idx,]
test <- mtcars[-idx,]

model <- randomForest(cyl ~ hp + wt + disp + qsec, 
                      data = train)

test$pred <- predict(model, test)

confusionMatrix(test$pred, test$cyl)

install.packages("e1071")
library("e1071")

#Examine tree
see_by_cyl <- function(n_cyl) {
  return(test[test$cyl == n_cyl, c('cyl', 'hp', 'disp')])
}

summary(model)
getTree(model, labelVar = TRUE)
see_by_cyl('Four cyl')
see_by_cyl('Six cyl')
see_by_cyl('Eight cyl')

# examine votes
results <- predict(model, test, predict.all = TRUE)
test[1,]
results$individual[1,]
summary(as.factor(results$individual[1,]))
summary(as.factor(results$individual[1,])) / 
  dim(results$individual)[2]
model$forest$ntree
?getTree
getTree(model, 6, labelVar = TRUE)
model$importance
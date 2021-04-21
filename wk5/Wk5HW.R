library(data.table)
library(caret)
library(corrplot)
library(yardstick)  # used for plotting a confusion matrix
set.seed(42)

install.packages('e1071', dependencies=TRUE)

filepath <- './'
demo.data <- fread(paste0(filepath, 'demo_data.csv'))
colnames(demo.data) <- c('feature1', 'feature2', 'target')
fwrite(demo.data, paste0(filepath, 'demo_data.csv'))

# print first few rows
head(demo.data)

# look at the structure of the data.table
str(demo.data)

# look at a stats summary
summary(demo.data)

# get number of rows/cols
dim(demo.data)

ggplot(data = demo.data, mapping = aes(feature1, feature2)) + 
  geom_point(mapping = aes(color = factor(target)))

# you might use r-graph-gallery for more ideas of good-looking plots you can make:
# https://www.r-graph-gallery.com/histogram_several_group.html
ggplot(data = demo.data, mapping = aes(feature1, fill=factor(target))) +
  geom_histogram(alpha = 0.6, position = 'identity')

ggplot(data = demo.data, mapping = aes(feature2, fill=factor(target))) +
  geom_histogram(alpha = 0.6, position = 'identity')

corrplot(cor(demo.data), addCoef.col = "grey")

#Loan Data
loan.data <- fread(paste0(filepath, 'loan_data.csv'))
colnames(demo.data) <- c('LTV', 'PERFORM_CNS_SCORE', 'LOAN_DEFAULT')
fwrite(demo.data, paste0(filepath, 'loan_data.csv'))

# you might use r-graph-gallery for more ideas of good-looking plots you can make:
# https://www.r-graph-gallery.com/histogram_several_group.html
ggplot(data = loan.data, mapping = aes(LTV, fill=factor(LOAN_DEFAULT))) +
  geom_histogram(alpha = 0.6, position = 'identity')

ggplot(data = loan.data, mapping = aes(PERFORM_CNS_SCORE, fill=factor(LOAN_DEFAULT))) +
  geom_histogram(alpha = 0.6, position = 'identity')

corrplot(cor(loan.data), addCoef.col = "grey")

loan.data[, LOAN_DEFAULT:=as.factor(LOAN_DEFAULT)]
loan.data.for.model <- loan.data[, c('LTV', 'LOAN_DEFAULT')]
head(loan.data.for.model)

model <- train(LOAN_DEFAULT ~ ., 
               data = loan.data.for.model, 
               method = "rpart")

model 

plot(model$finalModel, margin = 0.2)
text(model$finalModel)

# select all columns but target and make predictions
predictions <- predict(model, loan.data.for.model[, !'LOAN_DEFAULT'])
# select target column as a data.table
prediction.dt <- loan.data.for.model[, c('LOAN_DEFAULT')]
# use in-line data.table assignment operator to make new column
prediction.dt <- prediction.dt[, predictions:=as.factor(predictions)]

cm <- conf_mat(data = prediction.dt, truth = LOAN_DEFAULT, estimate = predictions)

autoplot(cm, type = "heatmap") +
  scale_fill_gradient(low="#D6EAF8",high = "#2E86C1")


#TESTING PERFORM_CNS_SCORE
loan.data[, LOAN_DEFAULT:=as.factor(LOAN_DEFAULT)]
loan.data.for.model <- loan.data[, c('PERFORM_CNS_SCORE', 'LOAN_DEFAULT')]
head(loan.data.for.model)

model <- train(LOAN_DEFAULT ~ ., 
               data = loan.data.for.model, 
               method = "rpart")

model 

plot(model$finalModel, margin = 0.2)
text(model$finalModel)

# select all columns but target and make predictions
predictions <- predict(model, loan.data.for.model[, !'LOAN_DEFAULT'])
# select target column as a data.table
prediction.dt <- loan.data.for.model[, c('LOAN_DEFAULT')]
# use in-line data.table assignment operator to make new column
prediction.dt <- prediction.dt[, predictions:=as.factor(predictions)]

cm <- conf_mat(data = prediction.dt, truth = LOAN_DEFAULT, estimate = predictions)

autoplot(cm, type = "heatmap") +
  scale_fill_gradient(low="#D6EAF8",high = "#2E86C1")
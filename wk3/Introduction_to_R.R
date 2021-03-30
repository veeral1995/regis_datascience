#### Introduction to R ###

#### Basic Math ####
2+6
2*6
2**6
6/2
4 == 2+2
6 == 2+2

#### Let's explore the Iris Dataset ####

# Import data table
library(data.table)

# Import the Edgar Anderson Iris Data
df <- iris 

df = data.table(df) # convert to data table

df #Print the dataframe

head(df) # Shows the column names and first 6 rows of data

class(df) # tpye of object

str(df) # structure of object

df[1:5,] # show the first 5 rows and all columns

df[,4] # show all rows and the 4th column.

df[45:50,1:2] # Show rows 45 to 50 and columns 1 through 2.

tail(df) # show last 6 rows and all columns

tail(df[,5]) # show the last 6 rows and the 5th column

summary(df) # many useful statistics

#### Basic Statistical Operations ####

unique(df$Species) # find how many unique species there are in the datatable

min(df$Sepal.Length) # find the minimum septal length

max(df$Sepal.Length[df$Species == 'setosa']) # find the maximum of sepal length of species = setosa

mean(df$Sepal.Length) #average sepal length

median(df$Sepal.Length) # the median petal 

var(df$Sepal.Length) # find the variance

sd(df$Sepal.Length) # find the standard deviation of sepal length

hist(df$Sepal.Length, col='purple',main='Histogram of Iris Sepal Lenth', xlab = 'Sepal Length') # histogram of sepal lengths

boxplot(df$Sepal.Length, col='blue', main='Boxplot of Iris Sepal Lenth', xlab = 'Sepal Length', ylab = 'Sepal Length') #box plot of sepal length

boxplot(df) # Box plot of all data

plot(df) # plot all columns vs all columns

plot(df[,1:4], main = "Edgar Anderson's Iris Data", pch = 21, bg = c("red", "green3", "blue")[unclass(df$Species)])

##########################################################
#### Your Turn ####

# Show the first 3 rows of the data
df[3,]

# Show the first 10 rows if species = versicolor

# What is the stadard deviation of petal length of each species?

# What is the maximum petal width of each species?

# What is the average petal length of each species?

# What is the average petal width to average sepal width ratio for each species?

# Create a histrogram of petal length. Include a title and x-label

# Create a box of petal width. Include a title and x-label

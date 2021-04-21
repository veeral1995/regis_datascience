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
df[1:3,]

# Show the first 10 rows of species = versicolor

top10 <- df[df$Species=="versicolor"]
top10[1:10,]

# What is the standard deviation of petal length of each species?
versicolor <- df[df$Species=="versicolor"]
setosa <- df[df$Species=="setosa"]
virginica <- df[df$Species=="virginica"]

sd(versicolor$Petal.Length)
sd(setosa$Petal.Length)
sd(virginica$Petal.Length)

# What is the maximum petal width of each species?

max(versicolor$Petal.Width)
max(setosa$Petal.Width)
max(virginica$Petal.Width)

# What is the average petal length of each species?

mean(versicolor$Petal.Length)
mean(setosa$Petal.Length)
mean(virginica$Petal.Length)

# What is the average petal width to average sepal width ratio for each species?


verAvgWidth <- mean(versicolor$Petal.Width)
setAvgWidth <- mean(setosa$Petal.Width)
virAvgWidth <- mean(virginica$Petal.Width)


verSepAvgWidth <- mean(versicolor$Sepal.Width)
setSepAvgWidth <- mean(setosa$Sepal.Width)
virSepAvgWidth <- mean(virginica$Sepal.Width)

verAvgWidth/verSepAvgWidth
setAvgWidth/setSepAvgWidth
virAvgWidth/virSepAvgWidth

# Create a histrogram of petal length. Include a title and x-label

pLenHist <- df$Petal.Length
hist(pLenHist, main="Petal Length Histogram", xlab="Petal Length")

# Create a box of petal width. Include a title and x-label
pWidthBox <- df$Petal.Width
boxplot(pWidthBox, main="Box Plot by Petal Width", xlab="Petal Width")

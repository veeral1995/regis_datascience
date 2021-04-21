library(data.table)
library(ggplot2)
library(dplyr)


bi <- fread('./Binomial.csv')

summary(bi)

sd(bi$V1)

plot(bi$V1, xlab = 'bi Index', ylab = 'bi values', main = 'Scatter plot of the Binomial dataset')

hist(bi$V1, xlab = 'bi values', ylab = 'Frequency of bi values', main = 'Histogram of the Binomial dataset')

boxplot(bi, xlab = 'bi', ylab = 'bi values', main = 'Boxplot of the Binomial dataset')

# including mean, standard deviation, minimum, maximum, a histogram plot

#Baseball Teams
baseball <- fread('./Baseball Teams.csv')
group_by(baseball, teamID)

#Avg runs per team, with all the years combined = 682.4
mean(baseball$R)
#Min runs every in baseball datasheet = 24
min(baseball$R)
#Max runs every in baseball datasheet = 1220
max(baseball$R)
#Standard Deviation for baseball runs = 135.2
sd(baseball$R)
#Histogram of data
hist(baseball$R, xlab = 'baseball values', ylab = 'Frequency of bbaseball values', main = 'Histogram of the Baseball Teams dataset')


#BN1
BN1 <- fread('./BN1.csv')
hist(BN1$V1, xlab = 'V1 values', ylab = 'Frequency of V1 values', main = 'Histogram of the BN1 dataset')
#Avg V1 per datasheet = 10
mean(BN1$V1)
#Min V1 = 1.78
min(BN1$V1)
#Max V1 = 18.61
max(BN1$V1)
#Standard Deviation for V1 = 2
sd(BN1$V1)

#BN2
BN2 <- fread('./BN2.csv')
hist(BN2$V1, xlab = 'V1 values', ylab = 'Frequency of V1 values', main = 'Histogram of the BN2 dataset')
#Avg V1 per datasheet = 11
mean(BN2$V1)
#Min V1 = 6.64
min(BN2$V1)
#Max V1 = 15.16
max(BN2$V1)
#Standard Deviation for V1 = 1
sd(BN2$V1)

#BN1 + BN2 Scatter Plots
plot(BN1$V1, pch = 19, col = "black")
points(BN2$V1, col="red")

#BN1 + BN2 Box Plots
boxplot(BN1$V1, BN2$V1)

#ln
ln <- fread('./ln.csv')
hist(ln$V1, xlab = 'V1 values', ylab = 'Frequency of V1 values', main = 'Histogram of the ln dataset')
#Avg V1 per datasheet = 19
mean(ln$V1)
#Min V1 = 3
min(ln$V1)
#Max V1 = 43
max(ln$V1)
#Standard Deviation for V1 = 4.36
sd(ln$V1)

#N1
N1 <- fread('./N1.csv')
hist(N1$V1, xlab = 'V1 values', ylab = 'Frequency of V1 values', main = 'Histogram of the N1 dataset')
#Avg V1 per datasheet = 10.13
mean(N1$V1)
#Min V1 = 5
min(N1$V1)
#Max V1 = 15.77
max(N1$V1)
#Standard Deviation for V1 = 2
sd(N1$V1)

#N2
N2 <- fread('./N2.csv')
hist(N2$V1, xlab = 'V1 values', ylab = 'Frequency of V1 values', main = 'Histogram of the N2 dataset')
#Avg V1 per datasheet = 11.7
mean(N2$V1)
#Min V1 = .65
min(N2$V1)
#Max V1 = 22.63
max(N2$V1)
#Standard Deviation for V1 = 4.29
sd(N2$V1)

#N1 + N2 Scatter Plots
plot(N1$V1, pch = 19, col = "black")
points(N2$V1, col="red")

#BN1 + BN2 Box Plots
boxplot(N1$V1, N2$V1)
# Data set was downloaded from: http://www.seanlahman.com/baseball-archive/statistics/ 
# Data information can be found here: http://www.seanlahman.com/files/database/readme2017.txt

# load the data.table, dplyr, and ggplot2 libraries and the Baseball Teams.csv file

library(data.table)
library(ggplot2)
library(dplyr)
library(tidyverse)

filepath = "C:/Users/ksorauf/OneDrive - Regis University/MSDS 660/18FW1_MSDS_660/Week 2/Baseball Teams.csv" 
team <- read.csv(filepath, sep=',', header = TRUE)

# convert the data to a data table

team <- as.data.table(team)

# how many observations and columns are there?

dim(team)

# use str and summary to see how many missing values we have,
# and what the data looks like

str(team)
summary(team)

# select data from 1997 to 2016 (in 1997 MLB expanded to 30 teams - Go Rockies?)
# google 'data.table cheat sheet' for a quick
# summary of how to manipulate data.tables
# then select only numeric columns using select_if(dt, is.numeric)

dt <- team[team$yearID >= 1997]
dt <- select_if(dt, is.numeric)
dim(dt)
summary(dt)

# We want to try to correlate team wins with another variable.
# Let's look to see if there are any outliers in the Win column we need to remove
# Create a bokplot

boxplot(dt$W)

# Wow there is a team that did really poor. can you find which team that was?

team[team$W < 50 & team$yearID >= 1997]

# 2003 Detroit Tigers only had 43 wins that year!

# One outlier wont skew our results. So we will leave the 2003 Tigers in.

# Plot Wins (W) vs some variables of your choosing.
# What variables are posititvly correlated with wins and which variables are
# negativly correlated with wins? Which variables have no correlation? 
# use the lm() command to fit a linear model of Wins to
# some variables of your choosing.
# lm stands for 'linear model'

plot(dt$HR, dt$W) #Homeruns
fithr = lm(dt$HR ~ dt$W)
summary(fithr)

plot(dt$R, dt$W) #Runs scored
fitr = lm(dt$R ~ dt$W)
summary(fitr)

plot(dt$ERA, dt$W) #ERA
fitera = lm(dt$ERA ~ dt$W)
summary(fitera)

plot(dt$RA, dt$W) #Runs allowed
fitra = lm(dt$RA ~ dt$W)
summary(fitra)

plot(dt$attendance, dt$W) #attendance
fitatt = lm(dt$attendance ~ dt$W)
summary(fitatt)

plot(dt$HRA, dt$W) #homeruns allowed
fithra = lm(dt$HRA ~ dt$W)
summary(fithra)

# Create a new column that looks at run differential. 
# Subtract runs, (R), from runs against (RA) and create a new model and plot
# That correlates run differential with wins.

dt$RD <- dt$R - dt$RA
rdfit <- lm(dt$W ~ dt$RD)
summary(rdfit)
plot(dt$RD, dt$W)
abline(rdfit, col = 'red')


# R makes it very easy to plot the diagnostics of a fit
# here's a decent resources explaining the plots: 
# http://data.library.virginia.edu/diagnostic-plots/
# plot the fit diagnostics here
par(mfrow=c(2,2)) # Change the panel layout to 2 x 2

#plot the linear model fit
plot(fit)
plot(rdfit)

par(mfrow=c(1,1)) # Change back to 1 x 1

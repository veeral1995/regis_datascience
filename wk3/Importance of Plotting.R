# Dowload the importance_of_plotting data from the worldclass site under week 3

# These functions check to see if packages are installed and if not installs and loads them
if (!require(ggplot2)) install.packages('ggplot2') 
library(ggplot2)
if (!require(Rmisc)) install.packages('Rmisc')
library(Rmisc)
if (!require(stargazer)) install.packages('stargazer')
library(stargazer)
library(data.table)

# Import data set as dt and convert to a data frame
dt <- read.csv("file:///C:/Users/ksorauf/OneDrive - Regis University/MSDS 600/20S8W2/Week 3/Imporatance of plotting.csv")
# The data table is like the pandas libarary in python. It makes working with data very easy.
dt <- as.data.table(dt)

#There are 4 data sets x1:y1, x2:y2, x3:y3, x4:y4 
head(dt) # Shows the first 6 data points
summary(dt) # Gives nice summary statisitcs of the data


#Create a linear model for the for the 4 datasets
m1 <- lm(y1 ~ x1, data = dt)
m2 <- lm(y2 ~ x2, data = dt)
m3 <- lm(y3 ~ x3, data = dt)
m4 <- lm(y4 ~ x4, data = dt)

#View the summary statistics of the 4 linear models
#Stargazer is a wonder package that makes nice table of results
stargazer(m1, m2, m3, m4, type = 'text')


#View the correlation statistics of the 4 datasets
cor(dt$x1, dt$y1)
cor(dt$x2, dt$y2)
cor(dt$x3, dt$y3)
cor(dt$x4, dt$y4)


# Are we are done?  The 4 datasets show the same summary statistics and regression analysis.
# Can we be confident that the 4 datasets represent nearly the same data and therefore they are 
# all equally equivilent models.

# Let's plot the data just to be sure...

par(mfrow = c(2,2))
p1 <- ggplot(dt, aes(x = x1, y = y1)) + 
  geom_point(color = 'black') + 
  geom_smooth(formula = y ~ x, method = 'lm' , se = FALSE, data = dt) +
  ggtitle("Set 1")

p2 <- ggplot(dt, aes(x = x2, y = y2)) + 
  geom_point(color = 'black') + 
  geom_smooth(formula = y ~ x, method = 'lm' , se = FALSE, data = dt) +
  ggtitle("Set 2")

p3 <- ggplot(dt, aes(x = x3, y = y3)) + 
  geom_point(color = 'black') + 
  geom_smooth(formula = y ~ x, method = 'lm' , se = FALSE, data = dt) +
  ggtitle("Set 3")

p4 <- ggplot(dt, aes(x = x4, y = y4)) + 
  geom_point(color = 'black') + 
  geom_smooth(formula = y ~ x, method = 'lm' , se = FALSE, data = dt) +
  ggtitle("Set 4")

multiplot(p1, p3, p2, p4, cols = 2)

# Now let's plot the diagnostics of the models
par(mfrow = c(2,2))
plot(m1, main = "Model 1")
plot(m2, main = "Model 2")
plot(m3, main = "Model 3")
plot(m4, main = "Model 4")

#Anscombe's Quartet https://en.wikipedia.org/wiki/Anscombe%27s_quartet

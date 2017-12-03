#plotting
help(package = "graphics") #the default plotting library, it is already loaded
x <- rnorm(200)
y <- rnorm(200)
plot(x,y)

#plot() has a data parameter, but it is not as straightforward with dataframes
library(dplyr)
library(magrittr)
data(cars)
#this command won't work:
#!cars %>% plot(speed, dist, data = .) #cannot find speed object

#use this operator instead: %$% (from magrittr package)
cars %$% plot(speed, dist, main = "Cars data",
              xlab = "Speed", ylab = "Stopping distance")

#the data argument in plot() is used when the variables are specified as a formula
cars %>% plot(dist ~ speed, data = .)

#histograms
cars %>% plot(dist ~ speed, data = ., type = "h",
              main = "Cars data (with >)", xlab = "Speed", ylab = "Stopping distance")
cars %$% plot(speed, dist, data = ., type = "h",
              main = "Cars data (with $)", xlab = "Speed", ylab = "Stopping distance")
cars %$% hist(speed, breaks = 10)

#linear regression plotting - several plots are generated
cars %>% lm(dist ~ speed, data = .) %>% plot


#add lines or points to the current plot
data(longley)
#?longley
longley %>% plot(Unemployed ~ Year, data = ., type = 'l',
                 ylim = range(c(Unemployed, Armed.Forces)))
# %$% works the same
#longley %$% plot(Unemployed ~ Year, data = ., type = 'l',
#                 ylim = range(c(Unemployed, Armed.Forces)))
#longley %$% plot(Year, Unemployed, type = 'l',
#                 ylim = range(c(Unemployed, Armed.Forces)))
longley %>% lines(Armed.Forces ~ Year, data = ., col = "blue")

#abline with linear regression
cars %>% plot(dist ~ speed, data = .)
cars %>% lm(dist ~ speed, data = .) %>% abline(col = "red")


#map features to columns in iris dataset
shape_map <- c("setosa" = 1, "versicolor" = 2, "virginica" = 3)
iris %$% plot(Petal.Length ~ Petal.Width, pch = shape_map[Species])

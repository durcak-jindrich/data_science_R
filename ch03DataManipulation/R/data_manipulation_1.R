#load / install libraries
library(magrittr)
install.packages("ggplot2")
library(ggplot2)

# Distributed together with R is the package dataset. Load it and get info
library(datasets)
library(help = "datasets")

# To load an actual dataset into R’s memory, use the data() function
data(cars)
head(cars)
head(cars, n = 10)

#plotting possibilities
plot(cars) #default plot
cars %>% qplot(speed, dist, data = .) #from ggplot2

#load datasets for machine learning benchmarks
install.packages("mlbench")
library(mlbench)
library(help = "mlbench")

#quickly review data
cars %>% head(3)
cars %>% tail(3)
cars %>% summary

#another dataset
data(iris)
iris %>% summary
str(iris) #explore the dataframe - information of each column

#mean of positive values
x = rnorm(100)
summary(x)
hist(x, breaks = 20)

# Write a pipeline that takes samples from this function as input, removes
# the negative values, and computes the mean of the rest

remove_negatives <- function(x){
  x[x < 0] = NA
  return(x)
}

x = rnorm(1000)
x %>% remove_negatives %>% mean(na.rm = TRUE)

#Write a pipeline that computes RMSE from a data frame containing the t and y values
t = rnorm(1000)
y = t + rnorm(1000, sd = 0.3)
de = data.frame(t, y)
plot(y,t)

rmse = sqrt(1/length(de$t) * sum((de$t - de$y)**2))

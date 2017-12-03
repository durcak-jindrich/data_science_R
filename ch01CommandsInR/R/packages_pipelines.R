#isntall packages from console
install.packages("magrittr")

# Once you have installed a package, you have access to the functionality in it.
# You can get function f in package by writing package::f() or you can load all functions
# from a package into your global namespace to access them without using the package:: prefix
# Loading the functionality from the magrittr package is done like this:
library(magrittr)
#to unload a library:
# detach("package:magrittr", unload=TRUE)

#instead of using many variables in data analysis in R, there are two solutions
# 1) nested function calls - readability is tough
# 2) %>% operator - x %>% f Is equivalent to writing: f(x)

# writing: x %>% f %>% g %>% h
# Is equivalent to writing: h(g(f(x)))
# It simply takes whatever is computed on the left side of it and inserts it as
# the first argument to the function given on the right side, and it does this left to right
# x %>% f(y) becomes f(x,y)

# If you want to write functions that work well with pipelines, you should,
# therefore, make sure that the most likely parameter to come through a pipeline
# is the first parameter of your function. Write your functions so the first parameter
# is the data it operates on, and you have done most of the work

subsample_rows <- function(d,n){
  rows <- sample(nrow(d),n)
  d[rows,]
}
d = data.frame(x = rnorm(100), y = rnorm(100))
#plot(d$x,d$y)
d %>% subsample_rows(n = 3)


# So if you need the data to go as the second parameter, you
# put a . there, since x %>% f(y, .) is equivalent to f(y, x)
# The same goes when you need to provide the left side as a named parameter
# since x %>% f(y, z = .) is equivalent to f(y, z = x)

d = data.frame(x = rnorm(100), y = rnorm(100))
d %>% lm(y ~ x, data = .)

#You can use . more than once when calling a function and you can use
# it in expressions or in function calls
rnorm(4) %>% data.frame(x = ., y = abs(.))
rnorm(4) %>% data.frame(x = ., is_negative = . < 0)

#There is one caveat: If . only appears in function calls, it will still
# be given as the first expression to the function on the right side of %>%
rnorm(4) %>% data.frame(x = sin(.), y = cos(.))

#If you want to avoid this behavior, you can put curly brackets around the
# function call, since {f(g(.),h(.))} is equivalent to f(g(.),h(.))
rnorm(4) %>% {data.frame(x = sin(.), y = cos(.))}

#DEFINE FUNCTIONS WITH "."
#      . %>% f is equivalent to writing: function(.) f(.)
# f <- . %>% cos %>% sin is equivalent to f <- function(.) sin(cos(.))
# f <- function(x) {
#   y <- cos(x)
#   z <- sin(y)
#   z
# }

#ANONYMOUS FUNCTIONS = lambda expressions
# When you define a function in R, you actually always create an anonymous function.
# But we usually assign it to a variable

#clasicallu=y
plot_and_fit <- function(d) {
  plot(y ~ x, data = d)
  abline(lm(y ~ x, data = d))
}
x <- rnorm(20)
y <- x + rnorm(20)
data.frame(x,y) %>% plot_and_fit

#anonymously
data.frame(x,y) %>% (function(d){
  plot(y ~ x, data = d)
  abline(lm(y ~ x, data = d))
})

#OTHER PIPELINE OPERATORS - "%$%"
d = data.frame(x = rnorm(10), y = 4 + rnorm(10))
d %>% {data.frame(mean_x = mean(.$x), mean_y = mean(.$y))}
#this could be done instead
d %$% data.frame(mean_x = mean(x), mean_y = mean(y))

#OTHER PIPELINE OPERATORS - "%T>%"
# output or plot some intermediate result of a pipeline and also don't use that result
d <- data.frame(x = rnorm(10), y = rnorm(10))
d %T>% plot(y ~ x, data = .) %>% lm(y ~ x, data = .)
#plot(...) is not used as the next parameter - "d" id passed to lm

#OTHER PIPELINE OPERATORS - "%<>%"
# d <- read_my_data("/path/to/data")
# d %<>% clean_data is the same as d = clean_my_data(d)



if (3 > 2) "true"
if (3 < 2) "nothing happens"
if (3 < 2) "yes" else "no"

#more lines require brackets
if (2 > 3) {
  x <- "bar"
}

#if statement work as expressions
x <- if (2 > 3) "bar" else "baz"

#If you want a vectorized version of if statements, you can instead use the ifelse
x <- 1:5
ifelse (x > 3, "bar", "baz")

#If you want a vectorized function, you need to use ifelse(), or you can use the Vectorize()
maybe_square <- function(x) {
  ifelse (x %% 2 == 0, x ** 2, x)
}
maybe_square(1:5)

maybe_square <- function(x) {
  if (x %% 2 == 0) {
    x ** 2
  } else {
    x
  }
}
maybe_square <- Vectorize(maybe_square) #Vectorize is a factor
maybe_square(1:5)

#LOOPING
x <- 1:5
total = 0
for (element in x) total = total + element
total

#If you want the indices instead, you can use the seq_along() function
x = 1:4
total = 0
for (index in seq_along(x)) {
  element = x[index]
  total <- total + element
}
total

#while
x <- 1:5
total <- 0
index <- 1
while (index <= length(x)) {
  element <- x[index]
  index <- index + 1
  total <- total + element
}
total

#repeat - has to be ended by break
x <- 1:5
total <- 0
index <- 1
repeat {
  element <- x[index]
  total <- total + element
  index <- index + 1
  if (index > length(x)) break
}
#There is also a next statement that makes the loop jump to the next iteration
total

#as with matlab, it is recommended to use function instead of loop for better performance


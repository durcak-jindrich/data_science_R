#calling functions
#f(5, 10)
#f(x = 5, y = 10)
#If you specify the names of the parameters, the order doesn’t matter anymore,
# so another equivalent function call would be:
#f(y = 10, x = 5)

#You can combine the two ways of passing parameters to functions as
# long as you put all the positional parameters before the named ones.
#f(5, y = 10)

#get help
?length
help("sum")
#All infix operators, like + or %%, are also functions in R
?'+'

#Creating functions
square <- function(x) x ** 2
square(1:4)

square_and_substract <- function(x,y) {
  squared <- x ** 2
  squared - y
  #The result of a function—what it returns as its value when you
  #call it—is the last statement or expression

  #You can make the return value explicit, though, using the return() expression
  return(squared - y)
}
#As long as there is only a single expression in the function,
# we don’t need the curly brackets
square_and_substract(1:5, rev(1:5))
?rev


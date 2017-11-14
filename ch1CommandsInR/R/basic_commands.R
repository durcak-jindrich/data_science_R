#simple expressions
1+2
4/2
4/3 #when integers are divided, a floating point number is generated
class(3L) #to get specifically type integer, use 'L'
4L/3L #the result is still floating point number
4%/%3 #to get integer division
4 %% 3 #to get the remainder

#the following two expressions are the same
2^2
2**2

#strings
"hello"

#assignments
x <- 2
2 -> x
x = 2

#if you want the result to be printed in console, use ()
(y <- "visible")

#EVERYTHING IS A VECTOR
1:50
#lenght returns the size of a vector
length(c(1,2)) #c stands for concatenate
length("word") #the lenght is 1
nchar("word") #lenght of string

#INDEXING STARTS AT "1"
v <- 1:5
v[1]
v[1:3] #indexing by vector of indeces
v[c(TRUE,FALSE,TRUE,FALSE,TRUE)] #indexing by boolean values
v[c(T,F,F,T,T)]
v %% 2
v[v %% 2 == 0]
v[-(1:3)] #get the complement of indeces

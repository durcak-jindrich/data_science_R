# Factors are essentially just vectors, but of categorical values
f <- factor(c("small","small","large","small","medium","small","large"))
f
# The categories are called “levels”
# You can change this order by specifying the levels when you create the factor
levels(f)
ff <- factor(c("small","small","large","small","medium","small","large"),
            levels = c("small","medium","large"))
levels(ff)
# The order of factor levels mostly affects how summary information
#  is printed and how factors are plotted
summary(f)
summary(ff)

# If you want to specify that the levels are actually ordered, you can do that
#  using the ordered argument with the factor() function
of <- factor(c("small","small","large","small","medium","small","large"),
             levels = c("small","medium","large"),
             ordered = TRUE)
of
ordered(ff)
ordered(f, c("small","medium","large"))

# A factor is actually not stored as strings, even though we create it from
#  a vector of strings. It is stored as a vector of integers where the integers
#  are indices into the levels. This can bite you if you try to use a factor to index with
ff <- factor(LETTERS[1:4], levels = rev(LETTERS[1:4]))
v <- 1:4
names(v) = LETTERS[1:4]
v[ff] #we ciuld expect 1 2 3 4, but we get 4 3 2 1
#the numerical values that the categories are stored as are actually these
as.numeric(ff) #WATCH OUT FOR THAT

# The easiest way to deal with a factor as the actual labels it has
#  is to translate it into a vector of strings
as.vector(ff)
v[as.vector(ff)]
# Treating a factor as if it were a vector of strings, when in fact,
#  it is a vector of integers, only leads to tears and suffering in the long run

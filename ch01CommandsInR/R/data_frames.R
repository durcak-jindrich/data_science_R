# Table with a row per observation and a column per variable
# The data type for such tables in R is the data.frame
df = data.frame(a = 1:4, b = letters[1:4])
df

#indexing
df[1,1]
df[1,] #entire row
df[,1] #entire column
df[,"a"]
df[1,"a"]
df[,"a"][1] #strange, but work just like df[1,"a"]
df$b #using column names

# By default, a data frame will consider a character vector as a factor
#to change it:
df2 <- data.frame(a = 1:4, b = letters[1:4], stringsAsFactors = FALSE)
df2$b #just vector of strings

# You can combine two data frames row-wise or column-wise by using the rbind and cbind
df3 <- data.frame(a = 6:9, b = letters[6:9])
df4 <- data.frame(c = 5:8, d = letters[5:8])
rbind(df,df3)
cbind(df,df4)

# Missing data is represented in R by the special value NA
# You should always represent missing data as NA instead of some special number
NA + 5
NA == NA
NA != NA
#use is.na to find if value is NA
is.na(NA)

#Functions such as sum() will by default return NA if its input contains NA
v <- c(1,NA,2)
sum(v)
sum(v, na.rm = TRUE)

library(softImpute)
library(readr)
library("writexl")
require(softImpute)

x = read_csv("user_rating_input.csv")
x = data.matrix(x)
fits = softImpute(x,trace=TRUE,type="svd")
fits
y = complete(x,fits)
y[y>5|y<0] = mean(y)
y = as.data.frame(y)
write_csv(y,"/Users/stella/Downloads/Fall 2022/ISE 533/Project 1/user_rating_output.csv")



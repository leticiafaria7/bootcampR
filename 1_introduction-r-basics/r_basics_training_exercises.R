# r basics training exercise

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

# what is two to de power of five?

2^5
2**5

# create a vector called stock.prices with the following data points: 23, 27, 23, 21, 34

stock.prices <- c(23, 27, 23, 21, 34)
stock.prices

# assign names to the price data points relating to the day of the week, starting with mon, tue, wed, etc...

names(stock.prices) <- c('mon', 'tue', 'wed', 'thu', 'fri')
stock.prices

# what was the average (mean) stock price for the week?
mean(stock.prices)

# create a vector called over.23 consisting of logicals that correspond
# to the days where the stock price was more than $23

over.23 <- stock.prices > 23
over.23

# use the over.23 vector to filter out the stock.prices vector
# and only return the day and prices where the price was over $23

stock.prices[over.23]

# use a built-in function to find the day the price was the highest

max(stock.prices)



# r programming basics training exercises
# functions

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

library(tidyverse)

# 1. Create a function that will return the product of two integers.

prod <- function (int1, int2) {
  
  print(int1 * int2)
  
}

prod(3, 4)


# 2. Create a function that accepts two arguments, an integer and a vector of integers. 
# It returns TRUE if the integer is present in the vector, otherwise it returns FALSE. 
# Make sure you pay careful attention to your placement of the return(FALSE) line in your function!

num_check <- function (int, vec) {
  
  print(int %in% vec)
  
}

num_check(2, c(1, 3, 4))
num_check(2, c(1, 4, 5))

# 3.Create a function that accepts two arguments, an integer and a vector of integers. 
# It returns the count of the number of occurences of the integer in the input vector.

num_count <- function (int, vec) {
  
  df <- data.frame(col = vec) %>% 
    filter(col == int) %>% 
    count() %>% 
    select(n) %>% 
    pull()
  
  print(df)
  
}

num_count(2,c(1,1,2,2,3,3))
num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3))

# 4.We want to ship bars of aluminum. 
# We will create a function that accepts an integer representing the requested kilograms of aluminum 
# for the package to be shipped. To fullfill these order, we have small bars (1 kilogram each) and big bars 
# (5 kilograms each). Return the least number of bars needed.

# For example, a load of 6 kg requires a minimum of two bars (1 5kg bars and 1 1kg bars). 
# A load of 17 kg requires a minimum of 5 bars (3 5kg bars and 2 1kg bars).

bar_count <- function (num) {
  
  if (num >= 5) {
    
    print(round(num/5) + num%%5)
    
  }
  
  else {
    
    print(num)
    
  }
  
}

bar_count(4)


# 5. Create a function that accepts 3 integer values and returns their sum. 
# However, if an integer value is evenly divisible by 3, then it does not count towards the sum. 
# Return zero if all numbers are evenly divisible by 3. 
# Hint: You may want to use the append() function.

summer <- function (int1, int2, int3) {
  
  output <- c(0)
  
  if (int1 %% 3 != 0) {
    output <- append(int1, output)
  }
  
  if(int2 %% 3 != 0) {
    output <- append(int2, output)
  }
  
  if(int3 %% 3 != 0) {
    output <- append(int3, output)
  }
  
  return(sum(output))
  
}

summer(7,2,3)
summer(3,6,9)
summer(9,11,12)

# 6. Create a function that will return TRUE if an input integer is prime. Otherwise, return FALSE. 
# You may want to look into the any() function.

prime_check <- function (num) {
  
  vec <- c(1:num)
  
  output <- NULL
  
  for (i in vec) {
    
    output <- append(num %% i, output)
    
  }
  
  df <- data.frame(col = output) %>% 
    filter(col == 0) %>% 
    count() %>% 
    select(n) %>% 
    pull() %>% 
    as.numeric()
  
  df <= 2
  
}

prime_check(2)
prime_check(3)
prime_check(4)
prime_check(10)
prime_check(131)

  

# dplyr training exercises

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

library(tidyverse)

# data ----

head(mtcars)

# return rows that have an mpg value greater than 20 and 6 cylinders

mtcars %>% 
  filter(mpg > 20, cyl == 6)

# reorder the data frame by cyl first, then by descending wt

mtcars %>% 
  arrange(cyl, -wt) %>% 
  head()

# select the columns mpg and hp

mtcars %>% 
  select(mpg, hp) %>% 
  head()

# select the distinct values of he gear column

mtcars %>% 
  distinct(gear)

# create a new column called "performance" which is calculated by hp divided by wt

mtcars %>% 
  mutate(performance = hp/wt) %>% 
  head()

# find the mean mpg value using dplyr

mtcars %>% 
  summarise(avg_mpg = mean(mpg))

# use pipe operators to get the mean hp value for cars with 6 cylinders

mtcars %>% 
  filter(cyl == 6) %>% 
  summarise(std_hp = mean(hp))

# k nearest neighbors project

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/Data Science and Machine Learning Bootcamp with R/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")

rm(list = ls())

library(tidyverse)
library(ISLR)
library(caTools)
library(class)

# getting the data ----

iris <- iris

head(iris)
str(iris)

# standardize data ----

iris[1:4] <- scale(iris[1:4])

var(iris$Sepal.Length)

# train and test splits ----

set.seed(101)
sample <- sample.split(iris$Species, SplitRatio = 0.70)

train <- subset(iris, sample == T)
test <- subset(iris, sample == F)

# build a knn model ----

## use the knn function to predict species of the test set, using k = 1

predicted.species <- knn(train = train[1:4],
                         test = test[1:4],
                         train$Species,
                         k = 1)

predicted.species

## what was the misclassification rate?

mean(test$Species != predicted.species)

## choosing a K value

predicted.species <- NULL
error.rate <- NULL

for (i in 1:10) {
  
  set.seed(101)
  predicted.species <- knn(train = train[1:4],
                           test = test[1:4],
                           train$Species,
                           k = i)
  error.rate[i] <- mean(test$Species != predicted.species)
  
}

k.values <- 1:10
error.df <- data.frame(error.rate, k.values)

ggplot(error.df) +
  aes(x = k.values, y = error.rate) +
  geom_point() +
  geom_line(lty = 'dotted', color = 'red') +
  scale_x_continuous(breaks = seq(1, 10, by = 1)) +
  theme_bw()



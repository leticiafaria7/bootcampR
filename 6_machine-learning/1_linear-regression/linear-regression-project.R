# linear regression project

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/Data Science and Machine Learning Bootcamp with R/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")

rm(list = ls())

library(tidyverse)
library(corrplot)

# data ----

bike <- read.csv('bikeshare.csv') %>% 
  mutate(datetime = as.POSIXct(datetime, format = '%Y-%m-%d %H:%M:%S'))

# check the head of df

head(bike)

# exploratory data analysis

## scatter plot of count vs temp

ggplot(bike) +
  aes(x = temp, y = count, color = temp) +
  geom_point(alpha = 0.3) +
  theme_bw()

## plot count datetime as a scatterplot with a color gradient based on temperature

ggplot(bike) +
  aes(x = datetime, y = count, color = temp) +
  geom_point() +
  scale_color_gradient(low = 'green', high = 'orange') +
  theme_bw()

## what is the correlation between temp and count?

cor(bike %>% select(temp, count))

## boxplot with the y axis indicating count and the x axis begin a box for each season

ggplot(bike) +
  aes(x = season, y = count, color = factor(season)) +
  geom_boxplot() +
  theme_bw()

# feature engineering

bike <- bike %>% 
  mutate(hour = format(datetime, "%H"))

## create a scatterplot of count versus hour, with color scale based on temp

ggplot(bike) +
  aes(x = hour, y = count, color = temp) +
  geom_point(position = position_jitter(w = 1, h = 0)) +
  scale_color_gradientn(colors = c('blue', 'purple', 'green', 'yellow', 'orange', 'red')) +
  theme_bw()

## the same plot for non working days

ggplot(bike %>% filter(workingday == 0)) +
  aes(x = hour, y = count, color = temp) +
  geom_point(position = position_jitter(w = 1, h = 0)) +
  scale_color_gradientn(colors = c('blue', 'purple', 'green', 'yellow', 'orange', 'red')) +
  theme_bw()

# building the model

## use lm() to build a model that predicts count based solely on the temp feature, name it temp.model

temp.model <- lm(formula = count ~ temp, data = bike)
summary(temp.model)

## how many bike rentals would we predict if the temperature was 25 degrees celsius?

### using the values from the models

6.05 + (9.17 * 25)
predict(object = temp.model, data.frame(temp = c(25)))

## use sapply and as.numeric to change the hour column to a column of numeric values

bike$hour <- sapply(bike$hour, as.numeric)

## build a model that attempts to predict count based off of the following features

model <- lm(count ~ season + holiday + workingday + weather + temp + humidity + windspeed + hour,
            data = bike)
summary(model)



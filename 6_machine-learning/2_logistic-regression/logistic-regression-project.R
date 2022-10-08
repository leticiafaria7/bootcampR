# logistic regression project

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/Data Science and Machine Learning Bootcamp with R/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")

rm(list = ls())

library(tidyverse)
library(Amelia)
library(caTools)

# get the data ----

adult <- read.csv('adult_sal.csv') %>% 
  select(-X)

head(adult)
str(adult)
summary(adult)

# data cleaning ----

## type_employer column ----

table(adult$type_employer)

adult <- adult %>% 
  mutate(type_employer = ifelse(type_employer %in% c('Never-worked', 'Without-pay'), 'Unemployed', type_employer))

adult <- adult %>% 
  mutate(type_employer = case_when(type_employer %in% c("Local-gov", "State-gov") ~ "SL-gov",
                                   type_employer %in% c("Self-emp-inc", "Self-emp-not-inc") ~ "self-emp",
                                   T ~ type_employer))

## marital column ----

table(adult$marital)

adult <- adult %>% 
  mutate(marital = case_when(marital %in% c("Married-AF-spouse", "Married-civ-spouse", "Married-spouse-absent") ~ "Married",
                             marital %in% c("Divorced", "Separated", "Widowed") ~ "Not-married",
                             marital %in% c("Never-married") ~ "Never-married"))

## country column ----

table(adult$country)

adult_continent <- adult %>% 
  mutate(continent = case_when(country %in% c("India", "Philippines", "Cambodia", "Thailand", "Laos", "Taiwan", 
                                              "China", "Japan", "Vietnam", "Hong", "Iran") ~ "Asia",
                               country %in% c("England", "Germany", "Italy", "Poland", "Portugal", "France", "Scotland", "Greece",
                                              "Holand-Netherlands", "Yugoslavia", "Hungary", "Ireland") ~ "Europe",
                               country %in% c("Cuba", "Jamaica", "Mexico", "Honduras", "Columbia", "Ecuador", "Haiti",
                                              "Dominican-Republic", "El-Salvador", "Guatemala", "Peru", "Trinadad&Tobago",
                                              "Nicaragua", "Outlying-US(Guam-USVI-etc)") ~ "Latin.and.South.America",
                               country %in% c("United-States", "Puerto-Rico", "Canada") ~ "North.America",
                               country %in% c("?", "South") ~ "Other"))

table(adult_continent$continent)

adult_continent <- adult_continent %>% 
  mutate(type_employer = as.factor(type_employer),
         marital = as.factor(marital),
         continent = as.factor(continent))

str(adult_continent)

# missing data ----

## turn "?" cells to NA ----

adult_continent[adult_continent == "?"] <- NA

## missmap ----

missmap(adult_continent,
        y.at = c(1),
        y.labels = c(''),
        col = c('yellow', 'black'))

adult_continent <- adult_continent %>% 
  mutate(country = ifelse(is.na(country), continent, country))

## omit NA ----

adult_continent <- na.omit(adult_continent)

missmap(adult_continent,
        y.at = c(1),
        y.labels = c(''),
        col = c('yellow', 'black'))

# EDA ----

str(adult_continent)

## ages histogram by income ----

ggplot(adult_continent) +
  aes(x = age, fill = fct_rev(income)) +
  geom_histogram(color = 'black', binwidth = 1) +
  theme_bw()

## hours worked per week histogram ----

ggplot(adult_continent) +
  aes(x = hr_per_week) +
  geom_histogram() +
  theme_bw()

## barplot of continent, fill by income class ----

ggplot(adult_continent) +
  aes(x = continent, fill = fct_rev(income)) +
  geom_bar(color = 'black') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# building a model ----

head(adult_continent)

adult_continent$income <- as.factor(adult_continent$income)

## train test split ----

### set seed
set.seed(102)

### split sample
sample <- sample.split(adult_continent$income, SplitRatio = 0.70)

### training data
train <- subset(adult_continent, sample == T)

### testing data
test <- subset(adult_continent, sample == F)

## training the model ----

model <- glm(formula = income ~ .,
             family = binomial(logit),
             data = train)

summary(model)

## choose a model by AIC in a stepwise algorithm ----

new.model <- step(model)
summary(new.model)

## confusion matrix

test$predicted.income <- predict(model, newdata = test, type = 'response')
table(test$income, test$predicted.income > 0.5)

## what was the accuracy of the model?

test <- test %>% 
  mutate(predicted.income.fct = ifelse(test$predicted.income > 0.5, ">50K", "<=50K"),
         predicted.income.fct = as.factor(predicted.income.fct))

caret::confusionMatrix(factor(test$predicted.income.fct), factor(test$income))

### "na mão"

(6444 + 1406) / (6444 + 889 + 476 + 1406)




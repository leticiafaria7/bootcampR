# apply a function over a list or vector

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

v <- c(1, 2, 3, 4, 5)

add_rand <- function (x) {
  
  ran <- sample(1:100, 1)
  
  return(x + ran)
  
}

# retornar uma lista

result <- lapply(v, add_rand)
result

# retornar um vetor

result <- sapply(v, add_rand)
result

# anonymous functions

v <- 1:5

result <- sapply(v, function (num) {num * 2})
result

# funcao com mais de um parâmetro

add_choice <- function (num, choice) {
  
  return(num + choice)
  
}

sapply(v, add_choice, choice = 100)






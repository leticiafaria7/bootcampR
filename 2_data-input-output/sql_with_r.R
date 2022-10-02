# SQL with R

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

install.packages('RODBC')
install.packages('RPostgreSQL')

library(RODBC)
library(RPostgreSQL)

myconn <-odbcConnect("Database_Name", uid = "User_ID", pwd = "password")
dat <- sqlFetch(myconn, "Table_Name")
querydat <- sqlQuery(myconn, "SELECT * FROM table")
close(myconn)



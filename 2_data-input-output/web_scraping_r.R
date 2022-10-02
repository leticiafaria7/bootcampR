# web scraping with R

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

install.packages('rvest')

demo(package = 'rvest', topic = 'tripadvisor')

library(rvest)

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

lego_movie %>% 
  html_node("strong span") %>%
  html_text() %>%
  as.numeric()

lego_movie %>%
  html_nodes("#titleCast .itemprop span") %>%
  html_text()

lego_movie %>%
  html_nodes("table") %>%
  .[[3]] %>%
  html_table()


# matrices training exercise

# preparing environment ----

setwd("G:/Meu Drive/5. Cursos/Programacao/Curso R Udemy/bootcampR")

rm(list = ls())

# 1. Create 2 vectors A and B, where A is (1,2,3) and B is (4,5,6). 
# With these vectors, use the cbind() or rbind() function to create a 2 by 3 matrix from the vectors. 
# You'll need to figure out which of these binding functions is the correct choice.

A <- c(1, 2, 3)
B <- c(4, 5, 6)

rbind(A, B)

# 2. Create a 3 by 3 matrix consisting of the numbers 1-9. 
# Create this matrix using the shortcut 1:9 and by specifying the nrow argument in the matrix() function call. 
# Assign this matrix to the variable mat

mat <- matrix(data = c(1:9), nrow = 3, ncol = 3)

# 3. Confirm that mat is a matrix using is.matrix()

is.matrix(mat)


# 4. Create a 5 by 5 matrix consisting of the numbers 1-25 and assign it to the variable mat2. 
# The top row should be the numbers 1-5.

mat2 <- matrix(data = c(1:25), nrow = 5, ncol = 5, byrow = T)
mat2

# 5. Using indexing notation, grab a sub-section of mat2 from the previous exercise that looks like this:

mat2[2:3, 2:3]


# 6. Using indexing notation, grab a sub-section of mat2 from the previous exercise that looks like this:

mat2[4:5, 4:5]


# 7 .What is the sum of all the elements in mat2?

sum(mat2)

# 8. Find out how to use runif() to create a 4 by 5 matrix consisting of 20 random numbers (4*5=20).

matrix(data = runif(n = 20, min = 1, max = 100), 
       nrow = 4, 
       ncol = 5)






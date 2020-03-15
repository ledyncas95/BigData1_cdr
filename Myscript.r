library(class)
df <- data(iris) ##load data
sp <- sample(1:nrow(iris), 0.9 * nrow(iris)) 

##funcion de normalizacion
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Se normalizan las variables
iris_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)], nor))

##Crean las particiones train y test
iris_train <- iris_norm[sp ,] 
iris_test <- iris_norm[-sp ,] 
#Se extraen las clases
iris_target_category <- iris[sp ,5]
iris_test_category <- iris[-sp ,5]

#modelo
pr <- knn(iris_train,iris_test,cl=iris_target_category,k=13)

#Matriz de confusion
tab <- table(pr,iris_test_category)

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
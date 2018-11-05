install.packages("sqldf")
library("sqldf")
sqldf('select mtcars.mpg from mtcars')
results <- sqldf('select mtcars.mpg from mtcars')
str(results$mpg)
mean(results$mpg)
str(results)
sqldf('select count (mtcars.mpg) from mtcars where cyl=4')
sqldf('select AVG(mtcars.mpg) from mtcars where cyl=4')
tapply(mtcars$mpg, mtcars$cyl, mean)
sqldf('select AVG(mtcars.mpg) from mtcars group by cyl')
tapply(mtcars$mpg, mtcars$cyl==4, mean)
sqldf('select AVG(mtcars.mpg) from mtcars where cyl=4')
results<-tapply(mtcars$mpg, mtcars$cyl==4, mean)
str(results)
results [[1]]
results[[2]]
unlist(results)
newresults <-unlist(results)
newresults[1]
newresults[2]
goodMPGcar <- function(mpg) {
  if(mpg > 24)
    return (TRUE)
  return (FALSE)
  
}
sapply(mtcars$mpg, goodMPGcar)
sum(sapply(mtcars$mpg, goodMPGcar))
goodCars <- sapply(mtcars$mpg, goodMPGcar)
mtcars[goodCars,]

meanPlusSD <- function(v) {
  t<-mean(v) + sd(v)
  return(t)
}

tapply(mtcars$mpg, mtcars$cyl,meanPlusSD)
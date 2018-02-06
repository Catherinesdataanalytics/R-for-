#this is a practice with movies data analysis in R
#You can find the tutorials in the following website:
#https://www.datacamp.com/community/blog/r-correlation-tutorial
#Read the data
movies <- read.csv(url("http://s3.amazonaws.com/dcwoods2717/movies.csv"))
head(movies)
str(movies)
summary(movies)
#create new columns
#know about profit
profit<-movies$gross-movies$budget
summary(profit)
movies$profit<-movies$gross-movies$budget
#Feature analysis by analysis the correlation
#plot and see the relationship between profit and rating
help("plot")
plot(movies$profit,movies$rating)
abline(lm(movies$profit~movies$rating))#add line to this graph
#calculating correlation in R
cor(movies$profit,movies$rating)
cor(movies[,4:10])#correlation matrix
library(Hmisc)
rcorr(movies[,4:10])
#GGally and ggcorr()#show the correlation of the variables
library(GGally)
ggcorr(movies[,4:10])
#if you wanna label
ggcorr(movies[,4:10],label=TRUE)
ggcorr(movies[,4:10],label=TRUE,label_alpha = TRUE)
#STRONG correlation: Plotting votes vs reviews
library(ggplot2)
qplot(movies$profit,
      movies$year,
      data = movies,
      geom =c('point','smooth'),
      #smooth means that the trendline will be the familiar, 
      #straight regression line 
      method='lm',
      alpha=I(1/5))
library(GGally)
ggpairs(movies,
        columns = c('cast_facebook_likes','votes','reviews'),
        upper=list(continuous= wrap('cor',size=10)),
        lower = list(continuous ='smooth'))





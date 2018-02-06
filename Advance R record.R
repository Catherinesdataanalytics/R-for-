library(ggplot2)
flights<-read.csv('flights.csv')
head(flights)
library(tbl_df)
flights<-tbl_df(flights)
#aes defines x 
#here col is use "fill" 
g<-ggplot(data=flights,aes(x=Distance,fill=Origin))
#just on the platform
g+geom_histogram(bins=35)
#just side by side
g+geom_histogram(position="dodge")
#frequency plot
#here col is 'col'
g<-ggplot(data=flights,aes(x=Distance,col=Origin))
g+geom_freqpoly()
#class for type identification
class(flights$DayOfWeek)
#bar must have vector datatype
flights$DayOfWeek<-as.factor(flights$DayOfWeek)
g<-ggplot (data=flights,aes(x=DayOfWeek))
g+geom_bar()
#aes
flights$DayOfWeek<-as.factor(flights$DayOfWeek)
g<-ggplot (data=flights,aes(x=DayOfWeek),fill=Origin)
g+geom_bar(position="dodge")
#add line
#any plot : data, 
library(datasets)
head(mtcars)
mtcars$cyl<-as.factor(mtcars$cyl)
g<-ggplot(mtcars,aes(x=wt,y=mpg))
#linear 
g+geom_point() +geom_smooth(method=lm,se=FALSE)
#se means confidence interval if you do not need confidence interval false
g+geom_point() +geom_smooth(method=lm,se=FALSE)
#
mtcars$cyl<- as.factor(mtcars$cyl)
g<-ggplot(mtcars,aes(x=wt,y=mpg,col=cyl))
g+geom_point()+geom_smooth()


test<- mtcars %>% group_by(cyl) %>% summarize(mean_wt=mean(wt))
test$cyl<- as.factor(test$cyl)
test$gear<-as.factor(test$gear)
#draw several in one plot
mtcars$cyl<-as.factor(mtcars$cyl)
g<-ggplot(mtcars,aes(x=cyl,y=wt,fill=cyl))
g+geom_boxplot()+facet_wrap(~gear)




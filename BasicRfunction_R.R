titanic<-read.csv('Titanic-2.csv')
names(titanic)
dim(titanic)
str(titanic)
#change the pclass and survived to factor
titanic$Pclass<-as.factor(titanic$Pclass) 
titanic$Survived<-as.factor(titanic$Survived)
class(titanic$Pclass)
class(titanic$Survived)
str(titanic)
#deal with missing data
#num of people who survived#you can only sum numeric
sum(titanic$Survived,na.rm = TRUE)#error when trying to sum factor
titanic$Survived<-as.numeric(titanic$Survived)
class(titanic$Survived)
sum(titanic$Survived,na.rm = TRUE)
#group by survived and anlyze the temp table
temp<-group_by(titanic,Survived)
summarise(temp,num_of_passengers=n())#use n() to count the num of rows
#group by pclass
library(dplyr)
titanic$Pclass<-as.factor(titanic$Pclass)
temp1<-group_by(titanic,Pclass)
summarise(temp1,number_of_passenger=n())
#groupby+summarise#summarize only for groupby
#grouby: temp1<-group_by(titanic,Pclass)
#summarize: summarise(temp1,averageage=mean(Age,na.rm=TRUE))
summarise(temp1,averageage=mean(Age,na.rm=TRUE))#na.rm delete all the null values
#dataframe can be sliced
#Feature Engineering
#check na value: is.na()
test1<-c(5,20,34,NA,40)
is.na(test1)
sum(is.na(test1))#true means 1
#deal with missing value: delete value
# table$column <- NULL
# Use of median value or biggest value to make it up
titanic$Gender[is.na(titanic$Gender)]<-'Male'
#Missingvalue:Age
titanic$Age[is.na(titanic$Age)]<-median(titanic$Age,na.rm=TRUE)
#use of summary to check if there is missing values
#MissingValue:Survived
titanic$Survived[is.na(titanic$Survived)]<-0
#MissingValue:Embarked
titanic$Embarked[is.na(titanic$Embarked)]<-'S'
summary(titanic)
#summary min and max also show the outliers
#try to find the outlier by ploting it 
#remove or replace it with median
#outlier: used to define outlier 1.5*IQR 
#outliers: https://en.wikipedia.org/wiki/Interquartile_range
#deal with date format
x<-as.Date('2010-12-25',format='%Y-%m-%d')
x
y<-as.Date('20101225',format='%Y%m%d')
y
z<-as.Date('Jan 28,2012',format='%b %d,%y')
z
#by writing the format, you make computer understand which format to extract from it.
#Date format: https://www.statmethods.net/input/dates.html
library(lubridate)
month(x)
day(x)
year(x)
quarter(x)
week(x)
weekdays(x)
months(x)
#lubridate funtion makes it easy to extract date from date format
age<-c(13,34,56)
salary<-c(400,500,600)
df<-data.frame('Age'=age,'salary'=salary)
df
#how to change it the same scale
#Normalization 
#create funtion
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
dfNorm<-as.data.frame(lapply(df[,1:2],normalize))
dfNorm
#return need ()
#z-score standard#R packages
dfNormz<-as.data.frame(scale(df[,1:2]))
dfNormz
#Normality Check
word1<-rnorm(100)#normal
word2<-rt(100,df=3)#not normal
plot(density(word1))
plot(density(word2))
#to check if it is normally distributed
qqnorm(word1)
qqline(word1)

qqnorm(word2)
qqline(word2)
#convert numeric data to factor
library(arules)
data1<-sample(1:30,100,replace=T)
res<-discretize(data1,categories = 3)
#unsupervised learning to make categories: https://www.rdocumentation.org/packages/arules/versions/1.5-5/topics/discretize
data1
res 
table(res)
#if you wanna personlize it ,use if else funtion
#create dummy variables
df2<-data.frame(id=1:4,year = 2011:2014)
class(df2$id)
class(df2$year)
#in R,load is library()
library(dummies)
df<-cbind(df2,dummy(df2$year,sep='_'))
df
















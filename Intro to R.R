#
q<-c(1,2,3,4,5)
q[1:length(a)]

a<-c('female','male','female')
class(a)

a<-factor(a)
class(a)
#ordered factor
gpa<-c('A','B','C','D')
gpa_factor<-factor(gpa)
gpa_ordered_factor<-factor(gpa,ordered=TRUE,levels = 'D','C','B','A')#from lowest and highest
class(gpa_ordered_factor)
#change factor to character:as.character; as.numeric,as.factor/factor
gpa1=as.numeric(gpa_factor)
class(gpa1)
#DataFrame
#create our own table
name<-c("Tom","Hank","Jelly","Sam","Jessica","Jada")
sex<-c("Male","Male","Female","Male","Female","Female"))
sex_factor<-factor(sex)
age<-c(26,22, 24,29,21,26)
salary<-c(85000.00 ,72000.00 ,79000.00,105000.00 ,70000.00 ,85000.00 )
house<-factor(c(0,1,1,0,1,0))
house_factor<-factor(house)
#Casesensitive
test<-data.frame(Name=name,Gender=sex_factor,Age=age,Salary=salary,House=house_factor)
class(test)
test
#head and tail
head(test,5)
tail(test,5)
#dimention
dim(test)
nrow(test)
ncol(test)
#data type you have
str(test)
#slicing
test[1,1]#why problem?
test[1:2,1:2]
test[5:nrow(test),2:ncol(test)]
#use name to slice
test[,1:2]
#leave it blank means you wanna all
test[,c('Age','Salary')]
#only can filter rows,not columns
test[test$Age>25,]
test[test$Salary>50000,2:4]
test[test$Gender=='Female'&test$Salary>70000,2:4]
test$House<-as.factor(test$House)
test$Name<-as.character(test$House)
class(test$Name)
class(test$House)
test[test$Name=='Tom','Salary']<-10000
#select two names together
test[test$Name %in% c('Tom','Sam'),'Salary']<-10000
#add and delete columns
test$Age<-NULL
test
test$Age<-c(26,22, 24,29,21,26)
test
#combine two table:row combine: cbind(t1,t2),rowcombine: rbind(t1,t2)
#create new columbs based on given columns
test$sal2<-ifelse(test$Salary>75000,1,0)
test




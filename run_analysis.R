## read the features files and extract the second column
features<-read.table("features.txt", header = FALSE)
features<-features[,2]


## read the 6 files and modify the column name
train.subject<-read.table("train/subject_train.txt", header=FALSE)
colnames(train.subject)<-"subject"

train.activity<-read.table("train/y_train.txt", header=FALSE)
colnames(train.activity)<-"activity"

train.var<-read.table("train/X_train.txt", header=FALSE)
colnames(train.var)<-features

test.subject<-read.table("test/subject_test.txt", header=FALSE)
colnames(test.subject)<-"subject"

test.activity<-read.table("test/y_test.txt", header=FALSE)
colnames(test.activity)<-"activity"

test.var<-read.table("test/X_test.txt", header=FALSE)
colnames(test.var)<-features


## combine 3 files into train and test set
train<-cbind(train.subject,train.activity,train.var)
test<-cbind(test.subject,test.activity,test.var)

## combine these 2 files into 1 big file
bigfile<-rbind(train,test)

## rename columns by removing hyphens and brackets
names(bigfile)<-tolower(names(bigfile))
names(bigfile)<-gsub("\\(", "", names(bigfile))
names(bigfile)<-gsub("\\)", "", names(bigfile))
names(bigfile)<-gsub("\\-", "", names(bigfile))

## column indices of columns containing mean or stdev, but ignore meanfreq
indices<-grep("mean|std", names(bigfile))

## extract only these columns, but enter index 1 and 2 for activity and subject
bigfile<-bigfile[,c(c(1,2), indices)]

## transform into data table for easier grouping
library(data.table)
bigfiledt <- data.table(bigfile)

## take the mean for every group (subject and activity)
tidyset<-bigfiledt[,lapply(.SD, mean), by=list(subject, activity)]

## order the dataset
tidyset <- tidyset[order(subject, activity)]

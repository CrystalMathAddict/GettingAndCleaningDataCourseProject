#Merge training and test set to create one data set
#Extract only measurements on mean "%mean% and %std%

#Features has the labels for the data
library(dplyr)
ActLbl<- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                    col.names = c("ActNum", "ActLabel"))
DataLbl<- read.table("./data/UCI HAR Dataset/features.txt",
                    col.names=c("ColNum", "DataLabel"))

#Variables selects rows that have mean or std
Variables<-filter(DataLbl, grepl("mean", DataLabel))
Variables<-rbind(Variables, filter(DataLbl, grepl("std", DataLabel)))


#these are activity labels, subject labels, and the data itself
TrnAct<- read.table("./data/UCI HAR Dataset/train/y_train.txt",
                    col.names = "Activity")
TrnSub<-read.table('./data/UCI HAR Dataset/train/subject_train.txt',
                   col.names = "Subject")
Train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",
                  col.names = DataLbl$DataLabel)
Train<-cbind(TrnAct, TrnSub, Train)

#We only want to keep the mean and std columns
VarCol <- Variables$ColNum + 2 #adding 2 more cols
TrainData<-select(Train, c(1, 2, VarCol))

#At this point, TrainData has Activity #, Subject #, and the various 
#means and stds for each event.

TestAct <-read.table("./data/UCI HAR Dataset/test/y_test.txt",
                     col.names = "Activity")
TestSub<-read.table('./data/UCI HAR Dataset/test/subject_test.txt',
                   col.names = "Subject")
Test <-read.table("./data/UCI HAR Dataset/test/X_test.txt", 
                  col.names = DataLbl$DataLabel)
Test<-cbind( TestAct, TestSub, Test)
TestData<-select(Test, c(1, 2, VarCol))

#Combine Data
combine<-rbind(TrainData, TestData)


#Summarize data by activity and subjected
combine$Activity<-factor(combine$Activity, levels = ActLbl$ActNum,
                        labels = ActLbl$ActLabel)
combine$Subject<-as.factor(combine$Subject)

library(reshape2)
combine<-melt(combine, id=c("Subject", "Activity"))
TidyMean<- dcast(combine, Subject + Activity ~ variable, mean)

write.table(TidyMean, "tidy.txt", row.names = FALSE, quote = FALSE)

#Variable cleanup
rm(Train); rm(TrnAct); rm(TrnSub); rm(Variables)
rm(Test); rm(TestAct); rm(TestSub)
rm(TestData); rm(TrainData); rm(combine)
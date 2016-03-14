library(randomForest)
library(SPECIES)
traindata = read.csv("FinalTrain.csv")  
test = read.csv("TestInternshipStudent.csv")
#tr = read.csv("DemoTrain.csv")  
#te = read.csv("DemoTest.csv")
col1<-ncol(traindata)
traindata<-traindata[,c(3:col1)]
col<-ncol(traindata)
trainlabel <- traindata[,col]
traindata<- traindata[,c(1:col-1)]
trainlabel <- as.factor(trainlabel)
x <- cbind(traindata,trainlabel)
test <- test[,c(3:ncol(test))]
fit <- randomForest(trainlabel ~., data=x,ntree=100, keep.forest=TRUE, do.trace=100)
predicted <- predict(fit,test)
print(fit)
importance(fit)
write.table(predicted,file="RandomPredict1.csv")
#l <- list(predicted)
#le<-length(l[[1]])
#print(le)
#for (i in 1:le){
#	write(l[[1]][i],file="RandomPredict.csv",append=TRUE)						#write to a file
#}

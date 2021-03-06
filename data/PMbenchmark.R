###############################
#script for Profile Mean Benchmark

require("Matrix")

ratings = read.table("ratings.csv",header=TRUE,sep=",")
idmap = read.table("IDMap.csv",header=TRUE,sep=",")

rmat = sparseMatrix(i=ratings[,1],j=ratings[,2],x=ratings[,3])

Pnum = apply(rmat!=0,2,sum)
Psum = apply(rmat,2,sum)
Pmeans = Psum / Pnum

Pred = Pmeans[idmap[,2]]

PMbenchmark = cbind(idmap[,3],Pred)
colnames(PMbenchmark) = c("ID","Prediction")
write.table(PMbenchmark,file="PMbenchmark.csv",quote=FALSE,sep=",",row.names=FALSE,col.names=TRUE)

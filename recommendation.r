# Recommandation based on Manhatten and Euclidean distance in R

rm=(list=ls())

predata = read.csv("./bands.csv", header=TRUE)

find_dist <- function(arg1, arg2) {
data=data.frame(predata[1:dim(predata)[1],2:dim(predata)[2]],row.names=predata[,1])
mht=sum(abs(data[,arg1]-data[,arg2]),na.rm=TRUE)
euclidean=sqrt(sum((data[,arg1]-data[,arg2])^2,na.rm=TRUE))
#cat("Manhattan distance between", arg1, "and ", arg2)
#print(mht)
#cat("Euclidean distance between", arg1, "and ", arg2)
return(euclidean)
}

# find_dist("Dan","Hailey")

Distance= c()
for(i in 1:dim(data)[2]) {
  #if(colnames(data)[i]!= "Angelica")
  Distance[i] = find_dist("Angelica",i)
}

all_dist <- data.frame(colnames(data), Distance)
all_dist <- data.frame(all_dist,order(all_dist[2,]))
print(all_dist[order(all_dist$Distance),])

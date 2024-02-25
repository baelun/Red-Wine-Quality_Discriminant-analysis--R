library(MASS)
?lda
?cbind
file_url ="D:/����/�T�~��/�έp�ؼ�/archive/winequality-red.csv"
red <- read.table(file_url, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(red)
train = sample(1:1599,500)
sort(train)#�ƦC1~�j
table(red[train,]$quality)

z = lda(quality~.,data = red, subset = train)
z
est = predict(z, red[-train, ])
ls(est)
est$posterior   #�����v
est$x
est$class




library(MASS)
?lda
?cbind
file_url ="C:/Users/tina2/OneDrive - �����j��/�T�W/�έp�ؼ�/�ƾ�/���i/winequality-red.csv"
red <- read.table(file_url, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(red)

red2=red[,sapply(red,is.numeric)]
set.seed(123)
kmeans.result=kmeans(red2,3)
kmeans.result
table(red$quality,kmeans.result$cluster)
plot(red2,col=kmeans.result$cluster)

kmeans.result$centers
centers=kmeans.result$centers[kmeans.result$cluster,]
head(centers)
distances=sqrt(rowSums((red2-centers)^2))
outliers=order(distances,decreasing=T)[1:5]
outliers
red2[outliers,]
plot(red2[c("pH", "alcohol")], col=kmeans.result$cluster)
plot(red2[c("fixed.acidity", "citric.acid")], col=kmeans.result$cluster)
plot(red2[c("free.sulfur.dioxide", "total.sulfur.dioxide")], col=kmeans.result$cluster)
plot(red2[c("citric.acid", "residual.sugar")], col=kmeans.result$cluster)
plot(red2[c("density", "pH")], col=kmeans.result$cluster)
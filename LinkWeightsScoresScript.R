
#change data frame style from 'list of lists' to proper data frame because of error
portweights13 <- as.data.frame(lapply(weights13, function(X) unname(unlist(X))))
portnames13 <- as.data.frame(lapply(namepoints13, function(X) unname(unlist(X))))
#merge weights and points of people

merged13=merge(portweights13,portnames13,by.x="onlynames",by.y="onlynamesb", all=F)
#change weights and points from factor to numeric for data continuous plotting
merged13$onlyweights <- as.numeric(as.character(merged13$onlyweights))
merged13$onlyffpoints <- as.numeric(as.character(merged13$onlyffpoints))

#same steps for 2015 and 2014
portweights14 <- as.data.frame(lapply(weights14, function(X) unname(unlist(X))))
portnames14 <- as.data.frame(lapply(namepoints14, function(X) unname(unlist(X))))
merged14=merge(portweights14,portnames14,by.x="onlynames",by.y="onlynamesb", all=F)
merged14$onlyweights <- as.numeric(as.character(merged14$onlyweights))
merged14$onlyffpoints <- as.numeric(as.character(merged14$onlyffpoints))

portweights15 <- as.data.frame(lapply(weights15, function(X) unname(unlist(X))))
portnames15 <- as.data.frame(lapply(namepoints15, function(X) unname(unlist(X))))
merged15=merge(portweights15,portnames15,by.x="onlynames",by.y="onlynamesb", all=F)
merged15$onlyweights <- as.numeric(as.character(merged15$onlyweights))
merged15$onlyffpoints <- as.numeric(as.character(merged15$onlyffpoints))
#to use later to predict 2016 points
portweights16 <- as.data.frame(lapply(weights16, function(X) unname(unlist(X))))

#plot weight vs. points with linear regression for each separate year

par(mfrow=c(1,2))
#plot(merged13$onlyweights,merged13$onlyffpoints)
#plot(merged14$onlyweights,merged14$onlyffpoints)
#plot(merged15$onlyweights,merged15$onlyffpoints)

#make giant merged plot
giantmerge=merge(merged13,merged14,by.x="onlynames",by.y="onlynames", all=F)
giantmerge=merge(giantmerge,merged15,by.x="onlynames",by.y="onlynames", all=F)
#change column names to match year

names(giantmerge)[2]<-paste("weight13")
names(giantmerge)[3]<-paste("point13")
names(giantmerge)[4]<-paste("weight14")
names(giantmerge)[5]<-paste("point14")
names(giantmerge)[6]<-paste("weight15")
names(giantmerge)[7]<-paste("point15")

#add change in weight column
giantmerge$change14<-(giantmerge$weight14-giantmerge$weight13)
giantmerge$change15<-(giantmerge$weight15-giantmerge$weight14)


giantmerge$changepoint14<-(giantmerge$point14-giantmerge$point13)
giantmerge$changepoint15<-(giantmerge$point15-giantmerge$point14)



#plot(giantmerge$change14,giantmerge$changepoint14)
#plot(giantmerge$change15,giantmerge$changepoint15)

#saw that zero weight change is overpowering, remove 0 points

mergenozero<-giantmerge[!(giantmerge$change14==0 & giantmerge$change15==0),]

#mergenozero<-giantmerge[!giantmerge$change15==0,]

#linear regression for both, add to plot with abline

reg14<-lm(mergenozero$change14~mergenozero$changepoint14)

reg15<-lm(mergenozero$change15~mergenozero$changepoint15)

plot(mergenozero$change14,mergenozero$changepoint14,xlab="Change in Weight (lbs)", ylab="Change in FF Point Total",
     main="Change in FF Point Totals \nBetween 2013 and 2014 Seasons", cex.main=0.9, col="blue")
abline(reg14)
plot(mergenozero$change15,mergenozero$changepoint15,xlab="Change in Weight (lbs)", ylab="Change in FF Point Total",
     main="Change in FF Point Totals \nBetween 2014 and 2015 Seasons", cex.main=0.9, col="blue")
abline(reg15)






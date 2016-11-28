setwd("~/Desktop")
jilin<-read.csv('Jilin.csv',header=T)
RGDP<-100*(jilin[3,]/jilin[6,])
RGC<-100*(jilin[5,]/jilin[6,])
jilin<-rbind(jilin,RGDP)
jilin<-rbind(jilin,RGC)
png('nominal and real GDPad.png')
plot(2014:2000,jilin[3,],type='b',pch=15,main='nominal and real GDP',xlab='year',ylab='GDP')
lines(2014:2000,jilin[7,],type='b',pch=17,lty=1)
legend('topleft',inset=0.05,c('nominal','real'),pch=c(15,17))
dev.off()
gdp_gr<-vector(length=14)
for(i in 1:14){
  gdp_gr[i]<-(jilin[8,i]-jilin[8,i+1])/jilin[8,i+1]
}
mean(gdp_gr)
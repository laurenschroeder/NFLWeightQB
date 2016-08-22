library(XML)
#namesweights2015<-data.table(NA)

onlynames<-list()
onlyweights<-list()
nameweight2013<-list()
currenti<-list()
pages<-c(1:7)
for(i in pages) {
  #URL in 2015 for all seven pages
  
  
  urla<-paste0("http://www.foxsports.com/nfl/players?season=2013&page=",i,"&position=4")
  
  urlhtml<-htmlTreeParse(urla, useInternal=T, isURL=T)
  
  urlparse<-xmlRoot(urlhtml)
  
  #nake name and weight list
  onlynames<-xpathSApply(urlparse,"//div[@class='wisfb_fullPlayerStacked']",xmlValue)
  #clean up names
  onlynames<-gsub("\r","",onlynames)
  onlynames<-gsub("\n","",onlynames)
  onlynames<-gsub("\t","",onlynames)
  
  weights<-xpathSApply(urlparse,"//td[@class='wisfb_right']",xmlValue)
  
  onlyweights<-weights[seq(2,length(weights),3)]
  
  #make mini data table
  currenti<-cbind(onlynames,onlyweights)
  

  nameweight2013<-rbind(nameweight2013,currenti)


}

#nameweight2015data<-data.frame(nameweight2015)

  


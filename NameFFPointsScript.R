library(XML)
#namesweights2015<-data.table(NA)

onlynamesb<-list()
onlyffpoints<-list()
ffpoints<-list()
namepoint2015<-list()
namepoint2014<-list()
namepoint2013<-list()

currentib<-list()
pagesb<-c(0,1)
for(i in pagesb) {
  #URL in 2015 for all seven pages
  
  
  urlb<-paste0("http://www.fftoday.com/stats/playerstats.php?Season=2015&GameWeek=&PosID=10&LeagueID=1&order_by=FFPts&sort_order=DESC&cur_page=",i)
  
  urlhtmlb<-htmlTreeParse(urlb, useInternal=T, isURL=T)
  
  urlparseb<-xmlRoot(urlhtmlb)
  
  #nake name and weight list
  onlynamesb<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  onlynamesb<-onlynamesb[seq(1,length(onlynamesb),13)]
  #clean up names
  onlynamesb<-gsub(" ","",onlynamesb)
  onlynamesb<-gsub("Â","",onlynamesb)
  onlynamesb<-sub("[0-9.]+", "", onlynamesb )
  onlynamesb<-gsub("^\\s+|\\s+$","",onlynamesb)
  
  ffpoints<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  
  onlyffpoints<-ffpoints[seq(12,length(ffpoints),13)]
  
  #make mini data table
  currentib<-cbind(onlynamesb,onlyffpoints)
  
  
  namepoint2015<-rbind(namepoint2015,currentib)
  
  
}

#nameweight2015data<-data.frame(nameweight2015)

#and now for 2014
for(i in pagesb) {
  #URL in 2015 for all seven pages
  
  
  urlb<-paste0("http://www.fftoday.com/stats/playerstats.php?Season=2014&GameWeek=&PosID=10&LeagueID=1&order_by=FFPts&sort_order=DESC&cur_page=",i)
  
  urlhtmlb<-htmlTreeParse(urlb, useInternal=T, isURL=T)
  
  urlparseb<-xmlRoot(urlhtmlb)
  
  #nake name and weight list
  onlynamesb<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  onlynamesb<-onlynamesb[seq(1,length(onlynamesb),13)]
  #clean up names
  onlynamesb<-gsub(" ","",onlynamesb)
  onlynamesb<-gsub("Â","",onlynamesb)
  onlynamesb<-sub("[0-9.]+", "", onlynamesb )
  onlynamesb<-gsub("^\\s+|\\s+$","",onlynamesb)
  
  ffpoints<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  
  onlyffpoints<-ffpoints[seq(12,length(ffpoints),13)]
  
  #make mini data table
  currentib<-cbind(onlynamesb,onlyffpoints)
  
  
  namepoint2014<-rbind(namepoint2014,currentib)
  
  
}

#and now for 2013
for(i in pagesb) {
  #URL in 2015 for all seven pages
  
  
  urlb<-paste0("http://www.fftoday.com/stats/playerstats.php?Season=2013&GameWeek=&PosID=10&LeagueID=1&order_by=FFPts&sort_order=DESC&cur_page=",i)
  
  urlhtmlb<-htmlTreeParse(urlb, useInternal=T, isURL=T)
  
  urlparseb<-xmlRoot(urlhtmlb)
  
  #nake name and weight list
  onlynamesb<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  onlynamesb<-onlynamesb[seq(1,length(onlynamesb),13)]
  #clean up names
  onlynamesb<-gsub(" ","",onlynamesb)
  onlynamesb<-gsub("Â","",onlynamesb)
  onlynamesb<-sub("[0-9.]+", "", onlynamesb )
  onlynamesb<-gsub("^\\s+|\\s+$","",onlynamesb)
  
  ffpoints<-xpathSApply(urlparseb,"//td[@class='sort1']",xmlValue)
  
  onlyffpoints<-ffpoints[seq(12,length(ffpoints),13)]
  
  #make mini data table
  currentib<-cbind(onlynamesb,onlyffpoints)
  
  
  namepoint2013<-rbind(namepoint2013,currentib)
  
  
}

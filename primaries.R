library(jsonlite)
setwd("/primaries")

setwd("hackathon_json_facebook")
fbTemp = list.files(pattern="*.json")
FB = lapply(fbTemp, fromJSON)
FB$source.military = NULL

setwd("..")
setwd("hackathon_json_twitter")
TwtTemp = list.files(pattern="*.json")
Twitter = lapply(TwtTemp, fromJSON)

setwd("..")
setwd("hackathon_json_release")
PRTemp = list.files(pattern="*.json")
PR = lapply(PRTemp, fromJSON)


#merging all the facebook datasets
totalFacebook <- rbind(facebook01, facebook02, facebook03, facebook04, facebook05)
totaleFacebook02 <- rbind(facebook06, facebook07, facebook08, facebook09, facebook10, facebook11, facebook12, facebook13)
totaleFacebook02$source.military = NULL
totalFacebook <- rbind(totalFacebook, totaleFacebook02)
headers = colnames(totalFacebook)

#removing special characters
totalFacebook$date = gsub("\\)", "", gsub("/Date\\(","", totalFacebook$date))
totalFacebook$date = gsub("000/", "", totalFacebook$date )

#Converting dates to human readable!
totalFacebook$date = as.POSIXct(as.numeric(totalFacebook$date), origin="1970-01-01")

fb <- data.frame(lapply(totalFacebook, as.character), stringsAsFactors=FALSE)
write.table(my.df, file = "fb.csv")



#Twitter
Twitter <- list() 
filename <- c("201503","201504","201505", )

temp = list.files(pattern="*.json")
myfiles = lapply(temp, fromJSON)


TT1 <- rbind(T03, T04, T05)
TT2 <- rbind(T06, T07, T08, T09, T10, T11, T12, T13)
TT2$source.military = NULL
Twitter <- rbind(TT1, TT2)

Twitter$date = gsub("\\)", "", gsub("/Date\\(","", Twitter$date))
Twitter$date = gsub("000/", "", Twitter$date )

Twitter$date = as.POSIXct(as.numeric(Twitter$date), origin="1970-01-01")
Twitter <- data.frame(lapply(Twitter, as.character), stringsAsFactors=FALSE)
write.table(Twitter, file = "Twitter.csv")



#Press releases
PP1 <- rbind(P03, P04, P05)
PP2 <- rbind(P06, P07, P08, P09, P10, P11, P12, P13)
PP2$source.military = NULL
Press <- rbind(PP1, PP2)

Press$date = gsub("\\)", "", gsub("/Date\\(","", Press$date))
Press$date = gsub("000/", "", Press$date )

Press$date = as.POSIXct(as.numeric(Press$date), origin="1970-01-01")
Press <- data.frame(lapply(Press, as.character), stringsAsFactors=FALSE)
write.table(Press, file = "Press.csv")


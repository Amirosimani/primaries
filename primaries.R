library(jsonlite)
library(POSIXct)

facebook01 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201503.json", flatten=TRUE)
facebook02 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201503.json", flatten=TRUE)
facebook03 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201503.json", flatten=TRUE)
facebook04 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201504.json", flatten=TRUE)
facebook05 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201505.json", flatten=TRUE)
facebook06 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201506.json", flatten=TRUE)
facebook07 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201507.json", flatten=TRUE)
facebook08 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201508.json", flatten=TRUE)
facebook09 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201509.json", flatten=TRUE)
facebook10 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201510.json", flatten=TRUE)
facebook11 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201511.json", flatten=TRUE)
facebook12 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201512.json", flatten=TRUE)
facebook13 <- fromJSON("./hackathon_json_facebook/vox_Facebook_201601.json", flatten=TRUE)

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

T03 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201503.json", flatten=TRUE)
T04 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201504.json", flatten=TRUE)
T05 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201505.json", flatten=TRUE)
T06 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201506.json", flatten=TRUE)
T07 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201507.json", flatten=TRUE)
T08 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201508.json", flatten=TRUE)
T09 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201509.json", flatten=TRUE)
T10 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201510.json", flatten=TRUE)
T11 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201511.json", flatten=TRUE)
T12 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201512.json", flatten=TRUE)
T13 <- fromJSON("./hackathon_json_twitter/vox_Twitter_201601.json", flatten=TRUE)

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

P03 <- fromJSON("./hackathon_json_release/vox_Release_201503.json", flatten=TRUE)
P04 <- fromJSON("./hackathon_json_release/vox_Release_201504.json", flatten=TRUE)
P05 <- fromJSON("./hackathon_json_release/vox_Release_201505.json", flatten=TRUE)
P06 <- fromJSON("./hackathon_json_release/vox_Release_201506.json", flatten=TRUE)
P07 <- fromJSON("./hackathon_json_release/vox_Release_201507.json", flatten=TRUE)
P08 <- fromJSON("./hackathon_json_release/vox_Release_201508.json", flatten=TRUE)
P09 <- fromJSON("./hackathon_json_release/vox_Release_201509.json", flatten=TRUE)
P10 <- fromJSON("./hackathon_json_release/vox_Release_201510.json", flatten=TRUE)
P11 <- fromJSON("./hackathon_json_release/vox_Release_201511.json", flatten=TRUE)
P12 <- fromJSON("./hackathon_json_release/vox_Release_201512.json", flatten=TRUE)
P13 <- fromJSON("./hackathon_json_release/vox_Release_201601.json", flatten=TRUE)

PP1 <- rbind(P03, P04, P05)
PP2 <- rbind(P06, P07, P08, P09, P10, P11, P12, P13)
PP2$source.military = NULL
Press <- rbind(PP1, PP2)

Press$date = gsub("\\)", "", gsub("/Date\\(","", Press$date))
Press$date = gsub("000/", "", Press$date )

Press$date = as.POSIXct(as.numeric(Press$date), origin="1970-01-01")
Press <- data.frame(lapply(Press, as.character), stringsAsFactors=FALSE)
write.table(Press, file = "Press.csv")

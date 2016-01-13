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
totalFacebook$date = as.Date(as.POSIXct(as.numeric(totalFacebook$date), origin="1970-01-01"))

fb <- data.frame(lapply(totalFacebook, as.character), stringsAsFactors=FALSE)
write.table(my.df, file = "fb.csv")


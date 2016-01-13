library(NLP)
library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)



clean.corpus <- function(dataframe){
  corpus <- Corpus(VectorSource(df_trump$description))
  corpus <- tm_map(corpus, stemDocument)
  corpus <- tm_map(corpus, removeWords, c(stopwords("english"), stopwords("SMART"))) 
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, stripWhitespace)
  assign('corpus',corpus,envir=.GlobalEnv)
}

df_trump = totalFacebook[which(totalFacebook$source.sourceId == 18759), ]

trump_body = paste0(df_trump$description, sep="/n")


corpus <- clean.corpus(VectorSource(trump_body))
TDM <- TermDocumentMatrix(corpus,control = list(removePunctuation = TRUE,stopwords = TRUE))
inspect(TDM)
word.frequency(TDM)


# /*
#   unique(totalFacebook[, c(18, 19)]
#   source.sourceId                                                  source.name
# 1              18443              Sen. Cruz, Ted - (R – TX) Presidential Campaign
# 87             18573            Clinton, Hillary Rodham (D) Presidential Campaign
# 93             18575           Sen. Rubio, Marco - (R – FL) Presidential Campaign
# 179            18551             Sen. Paul, Rand - (R – KY) Presidential Campaign
# 268            18591      Sen. Sanders, Bernard - (I – VT) Presidential Campaign 
# 301            18595                    Fiorina, Carly (R) Presidential Campaign 
# 321            18597                    Huckabee, Mike (R) Presidential Campaign 
# 515            18593                       Carson, Ben (R) Presidential Campaign 
# 538            18733             (Fmr.) Chafee, Lincoln (D) Presidential Campaign
# 904            18723                     Santorum, Rick (R) Presidential Campaign
# 919            18721              (Fmr.) Pataki, George (R) Presidential Campaign
# 1008           18725                   O'Malley, Martin (D) Presidential Campaign
# 1081           18727 (Fmr.) Sen. Graham, Lindsey - (R – SC) Presidential Campaign
# 1205           18745                 (Fmr.) Perry, Rick (R) Presidential Campaign
# 1622           18755                          Bush, Jeb (R) Presidential Campaign
# 1679           18759                   Trump, Donald J. (R) Presidential Campaign
# 2016           18799               (Fmr.) Jindal, Bobby (R) Presidential Campaign
# 2319           18813                    Christie, Chris (R) Presidential Campaign
# 2510           18817                   (Fmr.) Webb, Jim (D) Presidential Campaign
# 3386           18853             (Fmr.) Walker, Scott (R) Presidential Campaign\t
# 3672           19117                       Kasich, John (R) Presidential Campaign
# */
# 

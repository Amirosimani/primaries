install.packages("pollstR")
install.packages("ggplot2")
library(pollstR)
library(ggplot2)

gop_primary = pollstr_chart("2016-national-gop-primary")
gop_primary
gop_primary_pollavg <- gop_primary$estimates_by_date
gop_primary_pollavg

write.csv(gop_primary_pollavg, "2016-gop-national-primary.csv")

dem_primary <- pollstr_chart("2016-national-democratic-primary")
dem_primary_pollavg <- dem_primary$estimates_by_date

write.csv(dem_primary_pollavg, "2016-dem-national-primary.csv")

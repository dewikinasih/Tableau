setwd("~/R")
df<-read.csv('monkeypox_df.csv')
View(df)
# Other variables has a lot of missing value, so we couldn't use them
# But, we could made an extra visualization with only 4 variables
library(dplyr)
data <- select(df, Status, Country,Date_confirmation)
View(data)
table(data$Status)
# In this case, We just need the confirmed case of monkeypox
data <- data[data$Status=='confirmed', ]
#Check if there are missing values for all variables in the dataset we've made
data$Status <- ifelse(data$Status=='',NA,data$Status)
data$Country <- ifelse(data$Country=='',NA,data$Country)
data$Date_confirmation <- ifelse(data$Date_confirmation=='',NA,data$Date_confirmation)
data <- na.omit(data)
row.names(data) <- 1:nrow(data)
write.csv(data, 'monkeypoxtoviz.csv')

library(tidyverse)
install.packages("janitor")
library(janitor)

# Read the csv file into varibale
gtd <- read.csv("D:\\CIT\\Semester 2\\Data Analytics and Visualisation\\Assignment 1\\globalterrorism.csv",na.strings = c("", "NA"))

View(gtd)

# Column names for the dataset
colnames(gtd)

# Select the columns which is important
gtd <- gtd[ c(1:4,8:19,26:28,30,36,38,39:40,42,59,65,83,85,99:100,107,109) ]

View(gtd)
# Column names after removing unnecessary columns from dataset
colnames(gtd)

# Missing/NA values in dataset
sum(is.na(gtd))

# Again remove the columns which is not important
gtd$multiple <- NULL
gtd$location <- NULL
gtd$summary <- NULL
gtd$motive <- NULL
gtd$nkill <- NULL
gtd$nkillus <- NULL
gtd$weapsubtype1_txt <- NULL
gtd$propextent_txt <- NULL
gtd$propcomment <- NULL

sum(is.na(gtd))

# Merge the Day, month, year columns into year columns
gtd$iyear <- as.Date(with(gtd, paste(iday, imonth, iyear,sep="-")), "%d-%m-%Y")

# Remove the month and day columns
gtd$imonth <- NULL
gtd$iday <- NULL

# Omit the NA values from data set
gtd = gtd %>% na.omit()
View(gtd)
sum(is.na(gtd))

# Summarise the data
summary(gtd$region_txt)

# Write or save a cleaned file to local system 
write.table(gtd, file = " gtd.csv", sep = ",")




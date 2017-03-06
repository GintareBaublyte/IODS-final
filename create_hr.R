#Gintare Baublyte
#06.03.2017
#The data set is related to human resources analytics that tries to examine the reason of employees leaving workplace prematurely.
#It can be accessed here: https://www.kaggle.com/ludobenistant/hr-analytics


#load library
library(dplyr)

#read data
setwd("C:/Users/Severi/Documents/GitHub/IODS-final")
hr <- read.csv(file = "HR.csv", header = TRUE, sep = ",")

#structure of dataset
str(hr)

#dimensions of dataset
dim(hr)

#summary of "sales" variable
summary(hr$sales)

#majority of employees are from the sales department, so my analysis will focus only on this department
#I will now filter out only the data related the sales department

hr_sales <- filter(hr, hr$sales == "sales")

#let's check how many observations we have left
dim(hr_sales)
str(hr_sales)

#now there is no point in keeping the sales variable, so I will just remove it
hr_sales <- select(hr_sales, -sales)
dim(hr_sales)

#to better visualize the satisfaction and relate it to other variables, I have decided to create a new logical column satisfaction
#which is TRUE for employees for which satisfaction level is higher than the average
#and FALSE otherwise
summary(hr_sales$satisfaction_level) #it seems that the mean satisfaction level is 0.6144
hr_sales <- mutate(hr_sales, satisfied = hr_sales$satisfaction_level > 0.6144)

dim(hr_sales)

#let's save the wrangled data
setwd("C:/Users/Severi/Documents/GitHub/IODS-final")

write.table(hr_sales, file = "hr_sales.txt", sep = ";")

#check that it works
read.table("hr_sales.txt", header = T, sep = ";")

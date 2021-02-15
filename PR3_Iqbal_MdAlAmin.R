install.packages("summarytools")
library("readxl")
library(summarytools)  # for summarytools
library(car)  # for recode & scatterplot
library(PerformanceAnalytics) # for chart.Correlation
library(pwr)  # for power: pwr.f2.test
library(stargazer) # for regression table outputs
data <- read_excel(file.choose())
model <- lm(data$NA_Sales ~ data$EU_Sales + data$JP_Sales + data$Other_Sales + data$Global_Sales, data = data)
summary(model)

str(data[, c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales", "Global_Sales")])

summarytools::descr(data[, c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales", "Global_Sales")])   

install.packages("stargazer") #Use this to install it, do this only once
library(stargazer)
stargazer(model, type = "text",
          dep.var.labels= "North America Sales",
          covariate.labels= "Europe Sales","Japan Sales", "Other Sales", "Global Sales", out="models.txt")
par(mfrow = c(2, 2))
plot(model)

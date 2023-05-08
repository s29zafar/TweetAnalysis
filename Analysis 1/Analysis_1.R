# Importing the data
library(readr)
mydata <- read_csv("Desktop/Stat 231/A1/stat231dataset20888160.csv")
# Selecting the personal and organizational accounts [Q1(a)]
user1 <- subset(mydata, subset = (username == "@theJagmeetSingh"))
user2 <- subset(mydata, subset = (username == "@UWaterloo"))
# Q1(b)
# Table for Individual
table(factor(user1$day.of.week, levels = 
c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))

# Table for Organization
table(factor(user2$day.of.week, levels = 
               c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))
# Q1(c)
# plot for Individual
barplot(table(factor(user1$day.of.week, levels = 
    c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))),
    xlab = "Days of the Week", ylab = "Frequency", las = 1, 
    main = "Bar plot showing the number of tweets per day - Individual Account",
    col = "dodgerblue3", ylim = c(0,50))
# plot for Organization
barplot(table(factor(user2$day.of.week, levels = 
        c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))),
        xlab = "Days of the Week", ylab = "Frequency", las = 1, 
        main = "Bar plot showing the number of tweets per day - Organization Account",
        col = "dodgerblue3", ylim = c(0,50))
# Starting Q2b
# For this question we have to alter the initial mydata data set
mydata$time.of.day.hour <- mydata$time.of.day/3600
# We then make new subsets into user1 and user2
user1 <- subset(mydata, subset = (username == "@theJagmeetSingh"))
user2 <- subset(mydata, subset = (username == "@UWaterloo"))
# We use the summary and sd functions to know the mean median and atandard deviation of our data
summary(user1$time.of.day.hour)
sd(user1$time.of.day.hour)
summary(user2$time.of.day.hour)
sd(user2$time.of.day.hour)
# We create the skewness and kurtosis functions
skewness <- function(x) {(sum((x - mean(x))^3)/length(x))/(sum((x - mean(x))^2)/length(x))^(3/2)}
kurtosis <- function(x) {(sum((x - mean(x))^4)/length(x))/(sum((x - mean(x))^2)/length(x))^2}
# For Individual
skewness(user1$time.of.day.hour)
kurtosis(user1$time.of.day.hour)
# For Organization
skewness(user2$time.of.day.hour)
kurtosis(user2$time.of.day.hour)
# Q2 (C)
# Save Sd and Mean
time.of.day.hour.mean.user1 <- mean(user1$time.of.day.hour)
time.of.day.hour.sd.user1 <- sd(user1$time.of.day.hour)
library(MASS)
truehist(user1$time.of.day.hour, xlab = "time of day(hour)", 
         ylab = "Relative Frequency",main = "Relative Frequency of Individual User",
         ylim = c(0, 0.15), xlim = c(0,25) ,las = 1, col = "dodgerblue3", density = 25, angle = 45)
curve(dnorm(x, time.of.day.hour.mean.user1, time.of.day.hour.sd.user1), col = "red", add = TRUE, lwd = 2)
# For user2
time.of.day.hour.mean.user2 <- mean(user2$time.of.day.hour)
time.of.day.hour.sd.user2 <- sd(user2$time.of.day.hour)
library(MASS)
truehist(user2$time.of.day.hour, xlab = "time of day(hour)", 
         ylab = "Relative Frequency",main = "Relative Frequency of Organization User",
         ylim = c(0, 0.25), xlim = c(0,25) ,las = 1, col = "dodgerblue3", density = 25, angle = 45)
curve(dnorm(x, time.of.day.hour.mean.user2, time.of.day.hour.sd.user2), col = "red", add = TRUE, lwd = 2)
# Q2 (D) for user1
plot(ecdf(user1$time.of.day.hour), xlab = "time of day hour",
     main = "e.c.d.f. of time of day hour for Individual User",
     las = 1, lwd = 2, pch = NA)
curve(pnorm(x, time.of.day.hour.mean.user1, time.of.day.hour.sd.user1), col = "red", add = TRUE, lwd = 2)
# for User 2
plot(ecdf(user2$time.of.day.hour), xlab = "time of day hour",
     main = "e.c.d.f. of time of day hour for Organization User",
     las = 1, lwd = 2, pch = NA)
curve(pnorm(x, time.of.day.hour.mean.user2, time.of.day.hour.sd.user2), col = "red", add = TRUE, lwd = 2)
# For Q2(E) for User 1
quantile(user1$time.of.day.hour, probs = 0.1)
# for User 2
quantile(user2$time.of.day.hour, probs = 0.1)
# Start of Q3(b)
user2$likes.log <- log(user2$likes + 1)
boxplot(user2$likes.log[user2$time.of.day.hour < 12],
        user2$likes.log[user2$time.of.day.hour >= 12],
        col = c("dodgerblue1", "darkorchid4"),
        xlab = "Time of day hour", ylab = "Log value of Likes",
        names = c("Before Noon", "After Noon"),
        main = "@UWaterloo's Likes Log and Time of the Day")
# Q3(c)
boxplot(user2$likes.log[user2$time.of.day.hour < 12],
        user2$likes.log[user2$time.of.day.hour >= 12],
        col = c("dodgerblue1", "darkorchid4"),
        xlab = "Time of day hour", ylab = "Log value of Likes",
        names = c("Before Noon", "After Noon"),
        main = "@UWaterloo's Likes Log and Time of the Day")
# Q3(d)
boxplot(user2$likes.log[user2$day.of.week == "Monday" | user2$day.of.week == "Tuesday" |
                        user2$day.of.week == "Wednesday" | user2$day.of.week == "Thursday" |
                        user2$day.of.week == "Friday"],
        user2$likes.log[user2$day.of.week == "Saturday" | user2$day.of.week == "Sunday"],
        col = c("dodgerblue1", "darkorchid4"),
        xlab = "Days", ylab = "Log value of Likes",
        names = c("Weekdays", "Weekends"),
        main = "@UWaterloo's Likes Log vs Days")
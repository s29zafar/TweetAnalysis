# Importing the data
library(readr)
mydata <- read_csv("dataset.csv")
mydata$likes.log <- log(mydata$likes + 1)
mydata$length.long <- as.numeric(mydata$length >= median(mydata$length))

# User -> @CPHO_Canada
user <- subset(mydata, subset = (username == "@CPHO_Canada"))

# We create the skewness and kurtosis functions
skewness <- function(x) {(sum((x - mean(x))^3)/length(x))/(sum((x - mean(x))^2)/length(x))^(3/2)}
kurtosis <- function(x) {(sum((x - mean(x))^4)/length(x))/(sum((x - mean(x))^2)/length(x))^2}

# Q-QPlots
qqnorm(user$length, pch = 1, cex = 0.5, main ="Q-Q Plot of Length")
qqline(user$length, col = "red", lwd = 2, lty = 2)
skewness(user$length)
kurtosis(user$length)

plot(user$length, user$likes.log, xlab = "Length of tweet", ylab = "log of likes",
     main = "Length versus the log of likes", pch = 1, cex = 0.5, col = 1)

cor(user$length, user$likes.log)

boxplot(user$likes.log[user$length.long == 1],
        user$likes.log[user$length.long == 0],
        col = c("dodgerblue1", "darkorchid4"),
        xlab = "Length of tweets", ylab = "Log value of Likes",
        names = c("Long", "Short"),
        main = "@CPHO_Canada's likes.log for short tweets and long tweets")

mean(user$media)
median(user$media)
mode(user$media)
table(user$media)
sd(user$media)

PoisRLF <- function(theta, n, thetahat) {exp(n*thetahat*log(theta/thetahat) +
                                               n*(thetahat - theta))}
thetahat <- mean(user$media)
theta <- seq(0, 1.5, 0.001)
table(user$media)
n <-  dim(user)[1]

dpois(0, thetahat)

plot(theta, PoisRLF(theta, n, thetahat) ,
     xlab = expression(theta), ylab = expression(paste("R(",theta,")")),
     type = "l", lwd = 2, , main = "Poisson relative likelihood function", las = 1)

PoisRLF(4, n, thetahat)

expected <- dpois(0:4, thetahat)*n
expected <- round(expected, 3)
observed <- table(user$media)

cbind(observed)
cbind(expected)

barplot(rbind(observed, expected), beside = T, xlab = "Number of Tweets", ylab = "Number of media",
        col=c("dodgerblue3", "darkorchid"), density = 75, angle = c(45, 135),
        ylim = c(0, 200), las = 1)
legend('topright', legend = c("Observed", "Expected"), fill = c("dodgerblue3", "darkorchid"),
       density = 75, angle = c(45, 135))

mean(user$likes.log[user$media.binary == 1])
median(user$likes.log[user$media.binary == 1])
sd(user$likes.log[user$media.binary == 1])

mean(user$likes.log[user$media.binary == 0])
median(user$likes.log[user$media.binary == 0])
sd(user$likes.log[user$media.binary == 0])

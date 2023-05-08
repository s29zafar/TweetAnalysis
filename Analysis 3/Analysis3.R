# Importing the data
library(readr)
mydata <- read_csv("dataset.csv")
mydata$tweet.gap.hour <- mydata$tweet.gap/3600
tgh.first <- mydata$tweet.gap.hour[mydata$first.tweet == 1 & mydata$tweet.gap.hour <= 24]
tweetsetA <- mydata
tweetsetB <- subset(mydata, subset = ( first.tweet == 0))

summary(tweetsetA$tweet.gap.hour)
length(tweetsetA$tweet.gap.hour)
sd(tweetsetA$tweet.gap.hour)

summary(tweetsetB$tweet.gap.hour)
length(tweetsetB$tweet.gap.hour)
sd(tweetsetB$tweet.gap.hour)


library(MASS)
par(mfrow = c(2, 2))
# Tweet Set A
truehist(tweetsetA$tweet.gap.hour, main = "Relative frequency histogram of tweet gap hour for Tweet Set A",
         xlab = "Tweet Gap (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 100), ylim = c(0, 0.08), las = 1, col = "dodgerblue3",
         nbins = 50, cex.axis = 0.5, cex.main = 0.5, cex.lab = 0.75)
curve(dexp(x, 1/mean(tweetsetA$tweet.gap.hour)), col = "red", add = TRUE, lwd = 1.5)

plot(ecdf(tweetsetA$tweet.gap.hour), main = "ECDF of tweet gap hour for Tweet Set A",
     xlab = "Tweet Gap (in hours)", ylab = "Cumulative Probability",
     xlim = c(0, max(tweetsetA$tweet.gap.hour)), las = 1, col = "navy", lwd = 2, pch = NA,
     cex.axis = 0.5, cex.main = 0.5, cex.lab = 0.75)
curve(pexp(x, 1/mean(tweetsetA$tweet.gap.hour)), col = "red", add = TRUE, lwd = 2, lty = 2)
legend("bottomright", legend = c("ecdf", "CDF"), col = c("navy", "red"), lty = c(1, 2))
# Tweet Set B
truehist(tweetsetB$tweet.gap.hour, main = "Relative frequency histogram of tweet gap hour for Tweet Set B",
         xlab = "Tweet Gap (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 24), ylim = c(0, 0.7), las = 1, col = "dodgerblue3",
         nbins = 30, cex.axis = 0.5, cex.main = 0.5, cex.lab = 0.75)
curve(dexp(x, 1/mean(tweetsetB$tweet.gap.hour)), col = "red", add = TRUE, lwd = 1.5)

plot(ecdf(tweetsetB$tweet.gap.hour), main = "ECDF of tweet gap hour for Tweet Set B",
     xlab = "Tweet Gap (in hours)", ylab = "Cumulative Probability",
     xlim = c(0, max(tweetsetB$tweet.gap.hour)), las = 1, col = "navy", lwd = 2, pch = NA,
     cex.axis = 0.5, cex.main = 0.5, cex.lab = 0.75)
curve(pexp(x, 1/mean(tweetsetB$tweet.gap.hour)), col = "red", add = TRUE, lwd = 2, lty = 2)
legend("bottomright", legend = c("ecdf", "CDF"), col = c("navy", "red"), lty = c(1, 2))
par(mfrow = c(1, 1))
# Analysis on tweet set B
thetahat <- mean(tweetsetB$tweet.gap.hour)
ExpRLF <- function(theta, n, thetahat) {exp(n*log(thetahat/theta) + n*(1-thetahat/theta))}
n <- length(tweetsetB$tweet.gap.hour)
theta <-seq(from = 1.5, to = 2.5, by = 0.001)

plot(theta, ExpRLF(theta, n, thetahat), main = "Exponential relative likelihood function for tweet set B",
     xlab = expression(theta), ylab = expression(paste("R(",theta,")")), type = "l", lwd = 2, , las = 1)
abline(h = 0.15, col = "red", lwd = 2)

uniroot(function(x) ExpRLF(x, n, thetahat) - 0.15, lower = 1.6, upper = 2)$root
abline(v = 1.849534, col = "red", lwd = 2)
uniroot(function(x) ExpRLF(x, n, thetahat) - 0.15, lower = 2, upper = 2.2)$root
abline(v = 2.141427, col = "red", lwd = 2)


summary(tgh.first)
# Square Root
tf1 <- sqrt(max(tgh.first) - tgh.first + 1)
# Log
tf2 <- log(max(tgh.first) - tgh.first + 1)
# Reciprocal
tf3 <- 1/(max(tgh.first) - tgh.first + 1)

par(mfrow = c(2, 2))
truehist(tgh.first, main = "Relative frequency histogram of the Original",
         xlab = "time (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 30), ylim = c(0, 0.2), las = 1, col = "dodgerblue3",
         nbins = 30, cex.axis = 1)
curve(dnorm(x, mean(tgh.first), sd(tgh.first)), from = 0.001, col = "red", add = TRUE, lwd = 1) 
truehist(tf1, main = "Relative frequency histogram of the Square Root",
         xlab = "time (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 5), ylim = c(0, 1), las = 1, col = "dodgerblue3",
         nbins = 30, cex.axis = 1)
curve(dnorm(x, mean(tf1), sd(tf1)), from = 0.001, col = "red", add = TRUE, lwd = 1) 
truehist(tf2, main = "Relative frequency histogram of the Log",
         xlab = "time (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 4), ylim = c(0, 1), las = 1, col = "dodgerblue3",
         nbins = 30, cex.axis = 1)
curve(dnorm(x, mean(tf2), sd(tf2)), from = 0.001, col = "red", add = TRUE, lwd = 1) 
truehist(tf3, main = "Relative frequency histogram of the Reciprocal",
         xlab = "time (in hours)", ylab = "Relative Frequency",
         xlim = c(0, 1.2), ylim = c(0, 6), las = 1, col = "dodgerblue3",
         nbins = 30, cex.axis = 1)
curve(dnorm(x, mean(tf3), sd(tf3)), from = 0.001, col = "red", add = TRUE, lwd = 1) 

# We are using tf1 <- sqrt(max(tgh.first) - tgh.first + 1)

par(mfrow = c(1,1))
n <- length(tf1)
Y <- mean(tf1)
S <- sd(tf1)
b <- qt(0.975,292)
LL <- Y - b*S/sqrt(n)
UL <- Y + b*S/sqrt(n)
LL
UL

c <- qchisq((1-0.95)/2, n-1)
d <- qchisq((1+0.95)/2, n-1)
LL2 <- sqrt((n-1)*S*S/d)
UL2 <- sqrt((n-1)*S*S/c)
LL2
UL2
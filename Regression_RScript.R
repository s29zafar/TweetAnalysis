library(readr)
data_A4 <- read_csv("dataset.csv")
# Analysis 1 : Hashtags
# B
n <- length(data_A4$hashtags.binary)
head(data_A4)
summary(data_A4$hashtags.binary)
sum(data_A4$hashtags.binary)
n <- length(data_A4$hashtags.binary)
thetahat <- sum(data_A4$hashtags.binary)/length(data_A4$hashtags.binary)
theta0 <- 0.14
# Test A
lambdaA <- (thetahat-theta0)/(sqrt(theta0*(1-theta0)/n))
P_Value_A <- 2*(1-pnorm(lambdaA))
# Test B
lambdaB <- -2*log(((theta0/thetahat)^(n*thetahat))*(((1 - theta0)/(1 - thetahat))^(n - n*thetahat)))
lambdaB_sqrt = sqrt(lambdaB)
P_Value_B2 <- 2*(1-pchisq(lambdaB,df = 1))
P_Value_B <- 2*(1-pnorm(lambdaB_sqrt,1,0))

# Analysis 2: Time Between Tweets Revisited
data_A4$tweet.gap.hour <- data_A4$tweet.gap/3600
tgh.first <- data_A4$tweet.gap.hour[data_A4$first.tweet == 1  & data_A4$tweet.gap.hour <= 24]
summary(tgh.first)
# Square Root
tf1 <- sqrt(max(tgh.first) - tgh.first + 1)
# Log
tf2 <- log(max(tgh.first) - tgh.first + 1)
# Reciprocal
tf3 <- 1/(max(tgh.first) - tgh.first + 1)
# We are using tf1 <- sqrt(max(tgh.first) - tgh.first + 1)
library(MASS)
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
# B
MU0 <- sqrt(max(tgh.first) - 16 + 1)
par(mfrow = c(1,1))
n <- length(tf1)
Y <- mean(tf1)
S <- sd(tf1)
lambda <- abs(Y-MU0)/(S/sqrt(n))
p_value <-  2*(1-pt(lambda,n-1))

# Analysis 3: Length and Likes Revisited
# length as the explanatory variate, and likes.log as the response variate
par(mfrow = c(1, 1))
user <- subset(data_A4, subset = (username == "@CPHO_Canada"))
likes.log = log(user$likes + 1)
user$likes.log <- log(user$likes + 1)
length <- user$length
mod <- lm(likes.log ~ length)
modAlt <- lm(user$likes.log  ~ user$length)
summary(mod)
summary(modAlt)
summary(user$length)
confint(mod, level = 0.95)

sigma(mod)
# Q3(e)
plot(user$length, likes.log, xlab = "Length of tweet", ylab = "log of likes",
     main = "Scatterplot of Length versus the log of likes", pch = 1, cex = 0.5, col = 1)
abline(coef(mod), lwd = 2, lty = 2, col = "red")
# Q3(f)
stdres <- rstandard(mod)
mean(stdres)
sd(stdres)
plot(user$length, stdres,
     main = "Std residuals vs. length of tweet",
     xlab = "length of tweet", ylab = "Standardized Residuals",
     pch = 1, col = "navy", cex = 0.5, las = 1)
abline(h = 0, lty = 2, col = "red", lwd = 2)
# qqplot of standardized residual
qqnorm(stdres, main = "Q-Q plot of the standardized residuals",
       xlab = "G(0, 1) Quantiles", ylab = "Standardized Residuals",
       pch = 1, col = "navy", cex = 0.5)
qqline(stdres, lty = 2, col = "red", lwd = 2)
#Q3h
predictedValueB <- 3.2076781 + 0.0025046*200
predict(mod, newdata1234 = data.frame("length" = 200))


predict(mod, newdata = data.frame("length" = 200), interval = "prediction", level = 0.95)
summary(mod)
pvaluesQ3 <- 2*(1 - pt(0.0025046/0.0007296, 230))

# Analysis 4
data_A4$likes.log = log(data_A4$likes + 1)
userA4_0 <- subset(data_A4, subset = (username == "@CPHO_Canada" & media.binary == 0))
userA4_1 <- subset(data_A4, subset = (username == "@CPHO_Canada" & media.binary == 1))
n0 <- length(userA4_0$likes.log)
n1 <- length(userA4_1$likes.log)
mean1 <- mean(userA4_1$likes.log)
mean0 <- mean(userA4_0$likes.log)
sd1 <- sd(userA4_1$likes.log)
sd0 <- sd(userA4_0$likes.log)
t.test(userA4_0$likes.log, userA4_1$likes.log, var.equal = TRUE)
SP <- sqrt((56*(sd0^2) + 174*(sd1^2))/(57 + 175 - 2))
d <- abs(mean0 - mean1)/(SP*(sqrt(1/57+1/175)))
pvalueA4 <- 2*(1 - pt(d, 57 + 175 - 2))
t.test(userA4_0$likes.log, userA4_1$likes.log, var.equal = TRUE,conf.level = 0.95)$conf.int[1:2]

           
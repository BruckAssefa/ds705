#1a
fs <- HealthExam$Cholesterol[HealthExam$Sex == 'F']

#1b
summary(fs)
sd(fs)
#Right Skewed. The max is large at 920.0. Also, the mean is higher than the median, another indicator of skew. 

#1c
hist(fs, xlab='mg/dl', main='Female cholesterol level', prob=TRUE)
#The shape also indicates right-skew. The data does not appear to fit a normal distribution. The mound shape is missing the left side. 

#1d
boxplot(fs, ylab='mg/dl', main='Female cholesterol level')

#1e
quantile(fs, .75)[[1]] + 1.5 * IQR(fs)

#1f
(max(fs) - mean(fs)) / sd(fs)
#This is unusually large. The value of 3.651556 has a probability of `2*pnorm(-3.651556)` which in a population of 40 we would only expect to see `40 * 0.0002606562` that are at least that many standard deviations away from the mean.

#1g
qqnorm(fs, ylab='mg/dl')
qqline(fs)
#No. On the lower end, the points are above the line indicating the data is the the right of where it would be in a normal distribution. Towards the upper end, the points are significantly higher than would be expected indicating a longer than expected right side.
```{r }
# load the data and look at it
homes <- read.csv("homes.csv")
head(homes)

# summarize the PercentOwneds for each Year
summary(homes$PercentOwned[homes$Year=="year1985"])
summary(homes$PercentOwned[homes$Year=="year1996"])
summary(homes$PercentOwned[homes$Year=="year2002"])

# a more advanced version of this summary by Year would be to use tapply() to loop over the factors.
# uncomment the next line to try it
tapply(homes$PercentOwned, homes$Year, summary)

#  looks like the test PercentOwneds across all three Years range from 52 to 87, to make it easier to compare the distributions lets use the same bins for all three histograms
bins <- seq(35, 80, by=5)
```

```{r, fig.width=8, fig.height=3}
# set up R to expect an array of plots with 1 row and 3 columns
# the mar parameter adjust white space around the plot, notice that it has covered the axis labels which is OK here
par(mfrow=c(1,3),mar=c(3,3,2,1))
hist(homes$PercentOwned[homes$Year=="year1985"],main="Percent owned in 1985",breaks = bins,xlab="PercentOwned", prob=TRUE)
hist(homes$PercentOwned[homes$Year=="year1996"],main="Percent owned in 1996",breaks = bins,xlab="PercentOwned", prob=TRUE,ylab="")
hist(homes$PercentOwned[homes$Year=="year2002"],main="Percent owned in 2002",breaks = bins,xlab="PercentOwned", prob=TRUE)
# reset to one plot
par(mfrow=c(1,1))
```

```{r, fig.width=7, fig.height=7}
# make side-by-side boxplots to make comparisons easier
boxplot(homes$PercentOwned~homes$Year,names=c("1985","1996","2002"),ylab="PercentOwned",main="Homes")

```

#2b
All three distributions are skewed to the left. The overall trend is that homeownership is going up.

#3a
pnorm(250, 286, 16)

#3b
pnorm(280, 286, 16) - pnorm(260, 268, 16)

#3c
qnorm(.10, 286, 16)

#4a
d.csv('bodyFat.csv')
bfat <- df$bodyFat

#4b
hist(bfat, prob=TRUE)

Yes, the data appears to come from a normal distribution. 

#4c
qqnorm(bfat, ylab = 'Body Fat Percentage')
qqline(bfat)

The s shape tells us that the left side is shifted to the right and the right side is shifted to the left. In short, the distribution is normal shape but more "squished"

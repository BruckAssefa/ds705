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
#This is unusually large. This is over 3 SD deviations away which is in the almost 100 percentile

#1g
qqnorm(fs, ylab='mg/dl')
qqline(fs)
#No. Towards the upper end, the mg/dl is way higher than would be expected.

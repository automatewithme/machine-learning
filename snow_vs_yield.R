#load up and explore the data
library(alr3)
data(snake)
#changing coloumns name
names(snake)=c("content","yield")
plot(snake$content,snake$yield,xlab="water content of snow", ylab="water yield")
#fitting a univariate linear regression model
snake$yield.fit=lm(snake$yield~snake$content)
summary(yield.fit)
plot(snake$content, snake$yield)
abline(yield.fit,lwd=3,color=red)
par(mfrow=c(2,2))
plot(yield.fit)
qqPlot(yield.fit)

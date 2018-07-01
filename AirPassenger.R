require(tseries)
data("AirPassengers")
AP<-AirPassengers
AP
#Exploring the data set
class(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
summary(AirPassengers)
plot(AirPassengers)
abline(reg=lm(AirPassengers~time(AirPassengers)))
plot(aggregate(AirPassengers, FUN=mean) )
boxplot(AirPassengers~cycle(AirPassengers))
#checking for stationary
acf(AirPassengers)
pacf(AirPassengers)
kpss.test(AirPassengers)
#stationarize the time series
adf.test(diff(log(AirPassengers)), alternative = "stationary", k=0)
#finding optimal parameters
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))
dl<-diff(log(AirPassengers))
auto.arima(AP)
#Fitting the ARIMA Model
(fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))
#Predicting values
pred<-predict(fit, n.ahead=10*12)
ts.plot(AirPassengers, 2.718^pred$pred, log="y", lty=c(1,3))

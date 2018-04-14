###################
#Christian Gao Hw2#
###################

###########
#Problem 1#
###########
load("hw1.Rdata")

#a) Annual Plot, Seasonal Boxplot
chocolate<- read.delim("cbe.dat")[1]
choc.ts <- ts(chocolate, start = 1958, freq = 12)
par(mfrow=c(3,1))
plot(choc.ts, main = "Chocolate")
plot(aggregate(choc.ts), main = "Aggregated Annual Series")
boxplot(choc.ts ~ cycle(choc.ts),main = "Seasonal Boxplot")

#b) Seasonal Decomp Multiplicative

plot(decompose(choc.ts))

#c) ACF of decomposed elements

chocolate.decom = decompose(choc.ts, "multiplicative")
choc.trend.ts = chocolate.decom$trend
choc.seasonal.ts = chocolate.decom$seasonal
choc.random.ts = chocolate.decom$random

par(mfrow=c(2,2))
acf(choc.ts,  na.action = na.pass, main = "original acf")
acf(ts(choc.trend.ts),  na.action = na.pass, main = "trend acf")
acf(choc.seasonal.ts,  na.action = na.pass, main = "seasonal acf")
acf(choc.random.ts,  na.action = na.pass, main = "random acf")

#d)

###########
#Problem 2#
###########

#a.)
par(mfrow=c(2,1))
wine.ts.1 = ts(c(39, 35, 16, 18, 7, 22, 13, 18, 20, 9, -12, -11, -19, -9, -2, 16))
plot(wine.ts.1, ylab = "volume", main = "Serendipity Vineyard")

wine.ts.2 = ts(c(47, -26, 42, -10, 27, -8, 16, 6, -1, 25, 11, 1, 25, 7, -5, 3))
plot(wine.ts.2, ylab = "volume", main = "Cagey Vineyard")

#b.) lag plot
par(mfrow=c(1,1))
plot(wine.ts.1[-16], wine.ts.1[-1], main = "Wine 1 Lag 1 scatter", xlab = "x_t", ylab = "x_t+1")
plot(wine.ts.2[-16], wine.ts.2[-1], main = "Wine 2 Lag 1 scatter", xlab = "x_t", ylab = "x_t+1")

#c.)
acf(wine.ts.1,  na.action = na.pass, main = "wine 1 acf")
acf(wine.ts.2,  na.action = na.pass, main = "wine 2 acf")

#d.)
#I would trust Cagey Chardonnay. Cagey Chardonnay is decreasing in variation overtime and more predictable.

###########
#Problem 3#
###########

#a.) 
par(mfrow=c(1,1))
global<- read.delim("global.dat")
global.ts <- ts(global, start = 1856,fr = 12)
global.decomposed <- decompose(global.ts, "multiplicative")
plot(global.decomposed)

sd(global.ts - global.decomposed$trend, na.rm = TRUE)
sd(global.decomposed$random, na.rm = TRUE)

plot(global.decomposed$trend)

boxplot(global.ts ~ cycle(global.ts),main = "Seasonal Boxplot")

#Seasonal Adjustment effective

#b.)

acf(global.decomposed$random, na.action = na.pass, main = "Global")

#c.) 
global.diff = ts(global.ts[-1] - global.ts[-length(global.ts)],start = 1856,fr = 12)
global.decomposed.diff<-decompose(global.diff)
plot(global.decomposed.diff)

#Yes seems 
###########
#Problem 4#
###########

#a.) 
ksi.ts = ts(read.csv("ksi.txt"), start = c(1981, 1), end = c(1984, 12), fr = 12)
ksi.decomposed <- decompose(ksi.ts, "multiplicative")
plot(ksi.decomposed$trend, main = "KSI", ylab = "accidents")

#Yes seems like it helps

#b.)
ksi.ts.ds = read.csv("ksi2.txt")

###########
#Problem 6#
###########

#a.)
set.seed(123456)
y = arima.sim(n=100, list(ar=0.1),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))

#b.)
set.seed(123456)
y = arima.sim(n=100, list(ar=-0.4),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))

#c.)
set.seed(123456)
y = arima.sim(n=100, list(ar=0.4),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))

#d.)
set.seed(123456)
y = arima.sim(n=100, list(ar=0.9),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))

#e.)
set.seed(123456)
y = arima.sim(n=100,list(ar=0.4, ma=-0.3),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))

#f.)
set.seed(123456)
y = arima.sim(n=100, list(ar=c(0.3,-0.4),ma=c(-0.3,0.7)),innov=rnorm(100))
op=par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot.ts(y,ylab=" ", main="model formula")
acf(y,main="Autocorrelations",ylab="",ylim=c(-1,1))
pacf(y, main="Partial Autocorrelations",ylab="",ylim=c(-1,1))



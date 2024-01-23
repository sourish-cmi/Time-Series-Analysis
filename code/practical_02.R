## Practical 02

## Gaussian White Noise
set.seed(1382)
w<-rnorm(1000,mean=0,sd=0.1)
plot(ts(w),col="magenta",main="")
abline(h=mean(w),col="black",lwd=2)

hist(w,main="",col="magenta",prob=T)
lines(sort(w)
      ,dnorm(sort(w),mean=0,sd=0.1)
      ,lwd=2)

## Laplace White Noise
library(VGAM)
set.seed(1382)
wl<-rlaplace(1000,location=0,scale=0.1)
plot(ts(wl),col="magenta",main="")
abline(h=0,col="black",lwd=2)

hist(wl,main="",col="magenta",prob=T,ylim=c(0,5))
lines(sort(wl)
      ,dlaplace(sort(wl),location=0,scale=0.1)
      ,lwd=2)

## Moving Average

v=filter(w,sides = 2,rep(1,3)/3)
par(mfrow=c(2,1))
plot.ts(w)
plot.ts(v)


## Autoregressions
## x_t=1x_{t-1}-0.9x_{t-2}+w_t,
x = filter(w, filter=c(1,-.9), method="recursive")
plot.ts(x)
n=length(x)
df = cbind.data.frame(x=x[2:n],x_lag1=x[1:(n-1)])
head(df)

n=length(x)
par(mfrow=c(1,1))
plot.ts(df$x_lag1,df$x,pch=20,xlab=expression(x[t-1]),ylab=expression(x[t]),col="grey")
grid(col="skyblue",lwd=2)
abline(lm(x[2:n]~x[1:(n-1)]),col="red",lwd=2)


## Random Walk
x = cumsum(w)
wd = w +0.01;  xd = cumsum(wd)
plot.ts(xd,ylim=c(-5,20),col="magenta",lwd=2)
lines(x,col="blue",lwd=2)
lines(.01*(1:1000), lty="dashed")
text=c('delta = 0.01','delta = 0.00')
legend('topright',text,col=c("magenta","blue"),lwd=c(2,2))


## Signal in Noise
plot(AirPassengers)

AP=data.frame(cbind(AirPassengers=AirPassengers
                    ,t=time(AirPassengers)))
plot(AP$t,AP$AirPassengers,type="l",xlab='',ylab='Air Passengers')

fit = lm(AirPassengers~t+sin(2*pi*t+0.5*pi),data=AP)
sum=summary(fit)
set.seed(3695)
## w_t ~ N(0,16)
noise=rnorm(nrow(AP),mean=0,sd=1)*0.5*sum$sigma
lines(AP$t,predict(fit)+noise,col="red")

## w_t ~ N(0,32)
noise=rnorm(nrow(AP),mean=0,sd=1)*sum$sigma
lines(AP$t,predict(fit)+noise,col="blue")

## w_t ~ N(0,48)
noise=rnorm(nrow(AP),mean=0,sd=1)*1.5*sum$sigma
lines(AP$t,predict(fit)+noise,col="magenta")




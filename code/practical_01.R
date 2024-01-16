plot(AirPassengers,main = '',ylab='Number of Passengers')
grid()


plot(log(AirPassengers,base=10),main = '',ylab='log10(Number of Passengers)')
grid()

## following code will download TCS data from internet
## make sure you are connected to internet

library(tseries)
library(quantmod)
getSymbols("TCS.NS")
TCS=TCS.NS$TCS.NS.Adjusted;
plot(TCS)

plot(log(TCS))

## Quarterly Earnings per Johnson & Johnson Share
JohnsonJohnson
plot(JohnsonJohnson)
plot(log10(JohnsonJohnson),main = '')

##  Populations Recorded by the US Census

plot(uspop,main = '')
plot(log10(uspop),main = '')


##  Daily New Covid19 Cases in India
file_path='https://data.incovid19.org/csv/latest/states.csv'
state_wise=read.csv(file=file_path,header=TRUE,stringsAsFactors = F)
state_wise$Date=as.Date(state_wise$Date,format = "%Y-%m-%d")
cases=ts(diff(state_wise[state_wise$State=='India','Confirmed'])
         ,start = c(2020,01,30),frequency = 365)
plot(cases,ylab='New Cases')
plot(log10(cases),ylab='log10(New Cases)')

# Annual Canadian Lynx trappings
plot(lynx,main = '')

# Monthly Sunspot Data, from 1749
plot(sunspot.month,main = '')

# New York Air Quality Measurements
plot(ts(airquality$Ozone),main = '',ylab="Ozone")
grid()

# Flow of the River Nile at Asuan
plot(Nile,main = '')

#"Great" inventions and scientific 
# discoveries in each year from 1860 to 1959.
plot(discoveries,main = '')

## load tsa3.rda 
## change the folder path accordingly
load(file="/Users/sourishdas/Downloads/1_Teaching/Time_Series_Analysis/db/tsa3.rda")
plot(jj,type="o",pch=20,ylab="Quarterly Earnings per Share")
grid(col="red")

# Quarterly Earnings per Share in log-scale
plot(log(jj),type="o",pch=20,ylab="Quarterly Earnings per Share in log-scale")
grid(col="red")

## Global Temperature Deviations
plot(gtemp,type="o",pch=20,ylab="Global Temperature Deviations")
grid(col="red")

plot(speech)
grid(col="red")

## New York Stock Exchange
plot(nyse,ylab="NYSE Returns")
grid(col="red")

## El Nino and Fish Population
par(mfrow=c(2,1))
plot(soi,xlab='Southern Oscillation Index')
grid(col="skyblue")
plot(rec,xlab='New Fish')
grid(col="skyblue")
par(mfrow=c(1,1))

## Earthquakes and Explosions
par(mfrow=c(2,1))
plot(EQ5,xlab='Earthquakes')
grid(col="skyblue")
plot(EXP6,xlab='Explosions')
grid(col="skyblue")
par(mfrow=c(1,1))



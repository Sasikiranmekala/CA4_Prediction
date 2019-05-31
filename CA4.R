# Importing weather dataset
wdataset <- read.csv("IWBNetwork_6b6c_27b1_6573.csv", header = TRUE)

str(wdataset)

# Considering neccesary variables
# as we are predicting Air temperature based on AtmosphericPressure, 
#wind speed and wind direction we have included them in this new dataset called newdata


newdata<- wdataset[c(5,6,7,13)]

str(newdata)

# omitting null values is not a great idea though since we having loads of data
#im omitting null values

newdata<-na.omit(newdata)

str(newdata)

cor(newdata)

pairs(newdata)

# validation on dataset

fit1<-lm(AirTemperature ~ AtmosphericPressure + WindDirection + WindSpeed + station_id, data = wdataset)

summary(fit1)

predict(fit1, data.frame("AtmosphericPressure"=950,"WindDirection"=45, "WindSpeed"=20,  "station_id"= "M1"))

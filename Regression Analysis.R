library(readxl)
DB_House <- read_excel("Data for Forecasting.xlsx")

attach(DB_House) 

#PRICE
mean(PRICE) 
median(PRICE) 
var(PRICE) 
sd(PRICE) 
QR(PRICE) 
min(PRICE) 
max(PRICE) 
range(PRICE) 

#BEDS
mean(BEDS) 
median(BEDS) 
var(BEDS) 
sd(BEDS) 
IQR(BEDS) 
min(BEDS) 
max(BEDS) 
range(BEDS)

#BATH
mean(BATH) 
median(BATH) 
var(BATH) 
sd(BATH) 
IQR(BATH) 
min(BATH) 
max(BATH) 
range(BATH) 

#PROPERTYSQFT 
mean(PROPERTYSQFT) 
median(PROPERTYSQFT) 
var(PROPERTYSQFT) 
sd(PROPERTYSQFT) 
IQR(PROPERTYSQFT) 
min(PROPERTYSQFT) 
max(PROPERTYSQFT) 
range(PROPERTYSQFT) 

#TYPE 
table(TYPE) 
table(TYPE)/nrow(DB_House) 

#COUNTY 
table(COUNTY) 
table(COUNTY)/nrow(DB_House)*100 

#Create a scatter plot to examine the distribution of independent variables.
hist(PRICE) 
hist(BEDS) 
hist(BATH) 
hist(PROPERTYSQFT) 
barplot(table(COUNTY)) 
barplot(table(TYPE))

#Create a plot to examine the relationship between Y and X quantitatively.
plot(BEDS,PRICE,xlab = "Beds",ylab = "Price",col="blue",pch=20) 
plot(BATH,PRICE,xlab = "Bath",ylab = "Price",col="blue",pch=20) 
plot(PROPERTYSQFT,PRICE,xlab = "Propertysqft",ylab = "Price",col="blue",pch=20) 

--------------------------------------------------------------------------------

#Create model.
model = lm(PRICE ~ BEDS+BATH+PROPERTYSQFT+TYPE+COUNTY, data=DB_House) 
summary(model) 
anova(model) 

#Check assumptions.
#Check the linearity of the model and the homoscedasticity of residuals.
y.hat = fitted.values(model) 
res = resid(model) 
plot(y.hat, res, ylab="Residuals", xlab="Fitted Values",col="blue",pch=20) 

#Check the normal distribution of residuals.
library(nortest) 
ad.test(res) 
qqnorm(res,ylab="Residuals",xlab="Expected value",col="blue",pch=20 ) 

#Check the independence of residuals.
plot(i, res, ylab="Residual", xlab="Time Order",col="blue",pch=20) 
library(lmtest) 
dwtest(model) 

#Check the independence of the independent variables in the model.
library(car) 
model = lm(PRICE ~ BEDS+BATH+PROPERTYSQFT+TYPE+COUNTY, data=DB_House) 
vif(model) 

--------------------------------------------------------------------------------

#Create model.  
new.model = lm(log10(PRICE) ~ BEDS+BATH+PROPERTYSQFT+TYPE+COUNTY, data=DB_House) 
summary(new.model) 
anova(new.model) 

#Check assumptions.
#Check the linearity of the model and the homoscedasticity of residuals.
new.y.hat = fitted.values(new.model) 
new.res = resid(new.model) 
plot(new.y.hat, new.res, ylab="Residuals", xlab="Fitted Values",col="blue",pch=20) 

#Check the normal distribution of residuals.
library(nortest) 
ad.test(new.res) 
qqnorm(new.res,ylab="Residuals",xlab="Expected value",col="blue",pch=20 ) 

#Check the independence of residuals.
plot(i, new.res, ylab="Residual", xlab="Time Order",col="blue",pch=20) 
library(lmtest) 
dwtest(new.model)

#Check the independence of the independent variables in the model.
library(car) 
vif(new.model) 

--------------------------------------------------------------------------------

#Check for outliers.
new.rstandard = rstandard(new.model) 
write.csv(new.rstandard, file = "stdres") 
plot(new.y.hat, new.rstandard, ylab="Standardized Residual", xlab="Fitted 
Values",col="blue",pch=20)

#Check for influential values.
hatvalues = hatvalues(new.model) 
write.csv(hatvalues, file = "hatvalues") 
cooks = cooks.distance(new.model) 
write.csv(cooks, file = "cooks") 
diffits = dffits(new.model) 
write.csv(diffits, file = "diffits") 

--------------------------------------------------------------------------------

#Select the appropriate model.
#Forward model
model.start = lm(log10(PRICE)~1, data=DB_House) 
model.forw = step(model.start,scope = log10(PRICE) ~ 
                    BEDS+BATH+PROPERTYSQFT+TYPE+COUNTY, data=DB_House, direction = "forward") 
coef(model.forw)   

#Backward model.
model.back = step(new.model, direction = "backward") 
coef(model.back) 

#Stepwise.
model.step = step(model.start,scope = log10(PRICE) ~ 
                    BEDS+BATH+PROPERTYSQFT+TYPE+COUNTY, data=DB_House ,direction = "both") 
coef(model.step) 


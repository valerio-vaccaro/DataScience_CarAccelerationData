install.packages('weatherData')
library(weatherData)

mvweather <- getWeatherForDate("LIML","2015-4-1","2015-6-8")

summary(mvweather) 

mvweather



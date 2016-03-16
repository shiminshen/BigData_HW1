source('./readData.r')

files = list.files('./data', pattern='*.pdf')
setwd('./data')
data <- lapply(files, getWeatherData)
weatherData <- do.call(rbind, data)



library(tm)
library(tidyr)

# read pdf file to string.
readPDF2List <- function (fileName) {
  pdfReader <- readPDF(control=list(text='-layout'))
  return(pdfReader(elem=list(uri=fileName), language='en'))
}

getWeatherData <- function (fileName) {

  # get pdf file string
  pdfString <- readPDF2List(fileName)

  # capture weather string from pdf string
  dailyStringList <- pdfString[[1]][27:57]
  # split weather string into attributes
  splitedData <- strsplit(dailyStringList, '\\s+')
  # remove empty string and change type to numeric
  splitedData <- lapply(splitedData, function(x) as.numeric(x[-1]))

  weatherData <- data.frame(do.call(rbind, splitedData))
  names(weatherData) <- c('year', 'month', 'day', 'maxTemp', 'minTemp', 'rain', 'snow', 'wetGround')
  return(weatherData)
}

readTaxiData <- function (fileName) {
  # read file
  data <- read.csv(fileName)

  # separate pickdate to year, month, day, hour, minute and second
  data <- data %>% separate(tpep_pickup_datetime, c('pYear', 'pMonth', 'pDay', 'pHour', 'pMin', 'pSec'), '[: -]')
  return(data)

}

readTaxiData('./data/small_test.csv')

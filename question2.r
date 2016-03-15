targetFile = './data/yellow_tripdata_2015-07.csv'
# targetFile = './data/small_test.csv'

data <- read.csv(targetFile)

# change pickup time to factor type
data[,2] <- apply(data, 1, function(x){ as.factor(gsub(".*(\\d{2}):\\d{2}:\\d{2}", "\\1",as.character(x[2]))) })

print(table(data[,2]))
plot(table(data[,2]))

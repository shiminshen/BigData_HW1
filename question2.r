targetFile = './data/test.csv'
# targetFile = './data/small_test.csv'

data <- read.csv(targetFile)

# change pickup time to factor type
data[,2] <- apply(data, 1, function(x){ as.factor(gsub(".*(\\d{2}):\\d{2}:\\d{2}", "\\1",as.character(x[2]))) })

aggreResult <- aggregate(data$passenger_count, by=list(hour=data$tpep_pickup_datetime), FUN=sum)

print(aggreResult)
plot(aggreResult)

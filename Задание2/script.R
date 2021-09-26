#data
library("dplyr")
load("data.RData")

procData <- function(data) {
  ids <- Reduce(intersect, sapply(data, function(x) {x$id}))
  ids <- sort(ids)

  res <- rep(0, length(ids))

  for (i in seq(1, length(data))){
    data[[i]] <- data[[i]][data[[i]]$id %in% ids,]
    data[[i]] <- data[[i]][with(data, order(data[[i]]$id)), ]
    res <- res + data[[i]]$temp 
  }

  res <- res / length(data)

  df <- data.frame(ids, res)
  names(df) <- c("id", "temp_mean")
  return(df)
}


procData(data)
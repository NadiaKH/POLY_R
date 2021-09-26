library(stringr)

#setwd("home/nadia/Desktop/POLY_R")
list.files()


toNumeric <- function(obj) {
  return(tryCatch(as.numeric(obj), warning=function(cond){return(NA)}))
}

removeSpaces <- function(s) {
  return(str_replace_all(s, " ", ""))
}

transformCol <- function(x){
  y <- sapply(list(x), removeSpaces)
  num <- sapply(list(y), toNumeric)
  if(any(is.na(num)))
  {return(x)} 
  else 
  {return(num)}
}


fixDataFrame <- function(data) {
  for (i in colnames(data)) {
    data[[i]] <- transformCol(data[[i]])
  }
  return(data)
}


data <- read.csv("test_data_01.csv")
fixDataFrame(data)


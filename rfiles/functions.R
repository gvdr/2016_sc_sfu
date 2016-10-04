calcGDP <- function(data, year=NULL, country=NULL){
  if (!is.null(year)) {
    data <- data[data$year==year,]
  }
  if (!is.null(country)) {
    data <- data[data$country==country,]
  }
  gdp <- data$pop * data$gdpPercap / 1e9
  new <- cbind(data, gdp=gdp)
  return(new)
}

colourByEigenvectorCentrality <- function(graph) {
  eigenCent <- evcent(network)$vector   # vector of weights of all vertices
  bins <- unique(quantile(eigenCent, seq(0,1,length.out=30)))
  vals <- cut(eigenCent, bins, labels=FALSE, include.lowest=TRUE)
  colorVals <- rev(heat.colors(length(bins)))[vals]
  return(colorVals)
}

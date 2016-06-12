#' discovr() main code
#' @param x A data.frame or data.table
#' @param y Additional options
#' @return The calculation output
#' @export
disc <- function(x,y){
  option = as.character(y)
  input = as.data.frame(x)
  cols = length(input)
  d = welchTest(input)
  e = shapiroTest(input)
  f = corTest(input)
  return(e)
}

#' Welchs T.Test
#' @param input A data.frame or data.table
#' @return indicates whether parameter are from same population
welchTest <- function(input){
  output = t.test(input[[1]],input[[2]])
  return(output)
}

#' Shapiro Wilks Test
#' @param input A data.frame or data.table
#' @return indicates normal distribution
shapiroTest <- function(input){
  output = c(shapiro.test(input[[1]]),shapiro.test(input[[2]]))
  return(output)
}

#' Correlation Test
#' @param input A data.frame or data.table
#' @return indicates correlation between parameters
corTest <- function(input){
  output = cor(input[[1]],input[[2]])
  return(output)
}